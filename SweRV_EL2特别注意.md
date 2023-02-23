1.  During system boot, firmware must initialize the properties of each region based on the memory type present in that region. 
2.  All memory-mapped register writes must be followed by a fence instruction to enforce ordering and 
   synchronization.
3.  复位向量首地址必须放入ICCM区域
4.  One interrupt target ?
5.  在更改mtvec寄存或meicurpl和meipt前，中断必须关闭(mstatus中的mie位必须清零)，否则会发生不可预期的行为(详见Programmer's Reference Manual的6.5节)
6.  Firmware must clear  the IP flop while handling the interrupt.
7.  firmware should clear the IP flop before reenabling interrupts.
8.  While an interrupt is disabled, spurious changes of the interrupt source input may be captured in the IP flop.  To reduce the probability of reporting spurious interrupts, firmware should clear the IP flop before reenabling interrupts
9.  目前官方demo中没有对mie等寄存器的入栈操作，需根据需要添加
10.  在ISR中必须通过写寄存器阻止同优先级或高优先级中断打断当前中断
11.  if a region being updated is in the load/store space, a fence instruction is required.  Likewise, if a region being updated is in the instruction space, a fence.i instruction (which flushes the I-cache) is required. 
12.  If the DCCM is uninitialized, a load following a store to the same DCCM address may get incorrect data.  If firmware initializes the DCCM, aligned word-sized stores should be used (because they don’t check ECC), followed by a fence, before any load instructions to DCCM addresses are executed. 
13.  写mfdc寄存器，关闭不必要的功能
14.  采用哪种总线？AXI4 or AHB-Lite?
15.  DMA 写入的地址必须是4字节或8字节对齐的
16.  More specifically, DMA write accesses to the ICCM or DCCM must have a 32- or 64-bit access size and be aligned to 
     their respective size.  The only write byte enable values allowed for AXI4 are 0x0F, 0xF0, and 0xFF. 