# Checkpoint in FreeRTOS

執行一個簡易的程式，會一直輸出1,2,3.........

然後每輸出10個數字會執行一次的backup

=====================================================

## 如何實現checkpoint

我們需要依序的去backup下面的3個資料
 * ucHeap
 * SRAM (.bss, .data)
 * CPU Registers

### ucHeap (RW FRAM)
RW FRAM的部分只要backup **ucHeap** 即可

<img src="https://github.com/michael54856/FreeRTOS_Checkpoint/blob/main/images/ucHeap.png">

### SRAM
Kernel 變數/物件 都存在 **.data** 和 **.bss**，所以SRAM的部分只要backup這兩個區域即可，包含:
 * Ready task list, Delayed task list, Suspended task list
 * Timer list
 * pxCurrentTCB, uxTaskNumber

### Peripheral State (I/O State)
在這次的實驗中，我們的程式不涉及有狀態 I/O 操作

我們只需重新初始化Peripheral狀態，無需備份/恢復

### CPU Registers
用下方的Assembly Code來進行backup
<img src="https://github.com/michael54856/FreeRTOS_Checkpoint/blob/main/images/backup_registers.png">

我們不需要備份 R0，因為在Stack Frame中已有 backupReg 的返回地址（前提是任務堆疊已經恢復）

執行 ret_x 作為恢復的最後一步，程式會直接返回到 backupReg 的caller

### Memory Mapping

Linker Command File去查看Memory Mapping的方式
<img src="https://github.com/michael54856/FreeRTOS_Checkpoint/blob/main/images/linker_Command_File.png">

接下來看 Linker map file (.map) 來確認每個區塊對應到的起始位置與大小
<img src="https://github.com/michael54856/FreeRTOS_Checkpoint/blob/main/images/memory_Mapping_File.png">


=====================================================

## backup 和 restore

backup和restore我們都需要按照以下的順序進行
 * ucHeap
 * SRAM (.bss, .data)
 * CPU Registers
 
backup和restore我們是使用memcpy的方式進行，如果使用DMA的話效率會比較好
 
要預先知道每個section的起點與大小
 
<img src="https://github.com/michael54856/FreeRTOS_Checkpoint/blob/main/images/backup_restore.png">


=====================================================

## 如何進入LPM 4.5 休眠模式
使用以下的Assembly Code，main.c中 call **enterSleep()** 即可
<img src="https://github.com/michael54856/FreeRTOS_Checkpoint/blob/main/images/LPM4.5.png">


=====================================================


### main.c
* 會透過以下的兩種方式來去取得FRAM上的空間作為backup的buffer
  * 不需要初始化
    * #pragma NOINIT(ucHeap_backup_1)
    * uint8_t ucHeap_backup_1[ucHeap_SIZE];
  * 需要初始化
    * #pragma PERSISTENT(sleeping)
    * uint32_t sleeping = 0;
* sleeping 是用來偵測是否有進入 **LPM4.5**睡眠模式，如果被喚醒的話會重新設定亂數
* 備份的方式是透過**ping-pong buffer**來進行，因為可能備份到一半的時候電源斷掉，因此要確認備份完整才會restore這次的備份，不然還是會使用上一次的
  * 這邊是透過FRAM上的 **haveData** 變數來判斷要用哪個buffer

