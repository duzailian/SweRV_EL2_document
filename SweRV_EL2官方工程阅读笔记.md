1. 仓库地址:git@github.com:chipsalliance/riscv-fw-infrastructure.git
2. whisper:
       软件模拟ISA的工具，暂时不用看
3. WD-Firmware\common:
       未包含有效代码，不用看
4. cti:
       COMRV Testing Infrastructure(ComRV测试组件，暂时不用看)
5. ComRV(riscv-overlay)：
       用于实现基于纯软件的运行时加载代码功能，可用小的内存运行大的image(暂时不用看)
6. WD-Firmware\rtos\rtosal：
       操作系统抽象层，我们不需要
7. psp( Processor Support Package):
       重点看
8. SConscript_bsp_nexys_a7_el2/SConscript_psp_el2:
       用于指定el2内核相关的编译选项、链接选项、参与编译的c/asm文件