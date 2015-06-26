Return-Path: <pawelo@king.net.pl>
Date: Fri, 26 Jun 2015 23:52:23 +0200 (CEST)
From: Paul Osmialowski <pawelo@king.net.pl>
To: Arnd Bergmann <arnd@arndb.de>
cc: Paul Osmialowski <pawelo@king.net.pl>,
        Nicolas Pitre <nicolas.pitre@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anson Huang <b20788@freescale.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@freescale.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Frank Li <Frank.Li@freescale.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>,
        Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Michael Turquette <mturquette@baylibre.com>,
        Nathan Lynch <nathan_lynch@mentor.com>,
        Maxime Coquelin stm32 <mcoquelin.stm32@gmail.com>,
        Olof Johansson <olof@lixom.net>, Paul Bolle <pebolle@tiscali.nl>,
        Rob Herring <r.herring@freescale.com>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@arm.linux.org.uk>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Stefan Agner <stefan@agner.ch>, Stephen Boyd <sboyd@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>,
        Pawel Moll <pawel.moll@arm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Yuri Tikhonov <yur@emcraft.com>,
        Sergei Poselenov <sposelenov@emcraft.com>,
        Dmitry Cherkassov <d_cherkasov@emcraft.com>,
        Alexander Potashev <aspotashev@emcraft.com>
Subject: Re: [PATCH 3/9] arm: add call to CPU idle quirks handler
In-Reply-To: <2139691.3OPR29uKdT@wuerfel>
Message-ID: <alpine.LNX.2.00.1506262324230.5744@localhost.localdomain>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl> <alpine.LFD.2.11.1506251237000.2617@knanqh.ubzr> <alpine.LNX.2.00.1506260715300.499@localhost.localdomain> <2139691.3OPR29uKdT@wuerfel>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On Fri, 26 Jun 2015, Arnd Bergmann wrote:

> I doubt that the Kinetis has a custom version of the CPU core. Are you
> sure that not all Cortex-M4 need this?

I'm not sure and I don't have any other Cortex-M SoC to verify that...
Without this hack, I'm experiencing following exception:

init started: BusyBox v1.17.0 (2015-03-27 08:16:34 CET)
~ # [    1.910000]
[    1.910000] Unhandled exception: IPSR = 00000006 LR = fffffff1
[    1.910000] CPU: 0 PID: 0 Comm: swapper Not tainted 
4.1.0-next-20150623-00007-gf22ea1d-dirty #1
[    1.910000] Hardware name: Freescale Kinetis
[    1.910000] task: 082666f8 ti: 08264000 task.ti: 08264000
[    1.910000] PC is at arch_cpu_idle+0x14/0x1c
[    1.910000] LR is at arch_cpu_idle+0x13/0x1c
[    1.910000] pc : [<0800a928>]    lr : [<0800a927>]    psr: 6100000b
[    1.910000] sp : 08265f98  ip : 08264020  fp : 00000001
[    1.910000] r10: 0827433d  r9 : 00000000  r8 : 08266070
[    1.910000] r7 : 08272a88  r6 : 08266068  r5 : 00000000  r4 : 08266068
[    1.910000] r3 : 00000000  r2 : 08265fa0  r1 : 08264020  r0 : 08264000
[    1.910000] xPSR: 6100000b
[    1.910000] CPU: 0 PID: 0 Comm: swapper Not tainted 
4.1.0-next-20150623-00007-gf22ea1d-dirty #1
[    1.910000] Hardware name: Freescale Kinetis
[    1.910000] [<0800c5cd>] (unwind_backtrace) from [<0800b8b3>] 
(show_stack+0xb/0xc)
[    1.910000] [<0800b8b3>] (show_stack) from [<0800bd8b>] 
(__invalid_entry+0x4b/0x4c)
[    1.910000] [<0800bd8b>] (__invalid_entry) from [<ffffffff>] 
(0xffffffff)

Funny, it does not occur when JTAG is connected.

>
> As long as the idle implementation depends only on the CPU core type,
> it's easy to just define multiple .proc.info.init entries in the
> same file, like we do in proc-v7.S.
>

I tried it and it works. This approach does not cause code duplication, 
but (comparing to arm_pm_idle-based approach) its long. Would something 
like this be accepted ever?

Note that contrary to proc-v7, there's no __v7m_proc macro, I had to 
define it in order to avoid another code duplication:

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8ccffee..da35b0b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -967,6 +967,7 @@ config ARCH_EFM32
  config ARCH_KINETIS
  	bool "Freescale Kinetis MCU"
  	depends on ARM_SINGLE_ARMV7M
+	select CPU_KINETIS
  	select ARMV7M_SYSTICK
  	select CLKSRC_KINETIS
  	select PINCTRL
diff --git a/arch/arm/include/asm/cputype.h 
b/arch/arm/include/asm/cputype.h
index 85e374f..79792e9 100644
--- a/arch/arm/include/asm/cputype.h
+++ b/arch/arm/include/asm/cputype.h
@@ -234,6 +234,12 @@ static inline int cpu_is_xsc3(void)
  #define	cpu_is_xscale()	1
  #endif

+#if !defined(CONFIG_CPU_KINETIS)
+#define	cpu_is_kinetis()	0
+#else
+#define	cpu_is_kinetis()	1
+#endif
+
  /*
   * Marvell's PJ4 and PJ4B cores are based on V7 version,
   * but require a specical sequence for enabling coprocessors.
diff --git a/arch/arm/include/asm/glue-proc.h 
b/arch/arm/include/asm/glue-proc.h
index 74be7c2..08583bb 100644
--- a/arch/arm/include/asm/glue-proc.h
+++ b/arch/arm/include/asm/glue-proc.h
@@ -230,6 +230,15 @@
  # endif
  #endif

+#ifdef CONFIG_CPU_KINETIS
+# ifdef CPU_NAME
+#  undef  MULTI_CPU
+#  define MULTI_CPU
+# else
+#  define CPU_NAME cpu_kinetis
+# endif
+#endif
+
  #ifdef CONFIG_CPU_PJ4B
  # ifdef CPU_NAME
  #  undef  MULTI_CPU
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 121b580..ef59407 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -356,6 +356,11 @@ config CPU_PJ4B
  	bool
  	select CPU_V7

+# Freescale Kinetis
+config CPU_KINETIS
+	bool
+	select CPU_V7M
+
  # ARMv6
  config CPU_V6
  	bool "Support ARM V6 processor" if (!ARCH_MULTIPLATFORM || 
ARCH_MULTI_V6) && (ARCH_INTEGRATOR || MACH_REALVIEW_EB || 
MACH_REALVIEW_PBX)
diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
index ded9504..671374f 100644
--- a/arch/arm/mm/proc-v7m.S
+++ b/arch/arm/mm/proc-v7m.S
@@ -73,6 +73,30 @@ ENTRY(cpu_v7m_do_resume)
  ENDPROC(cpu_v7m_do_resume)
  #endif

+#ifdef CONFIG_CPU_KINETIS
+	globl_equ	cpu_kinetis_switch_mm,	cpu_v7m_switch_mm
+	globl_equ	cpu_kinetis_proc_init,	cpu_v7m_proc_init
+	globl_equ	cpu_kinetis_proc_fin, 	cpu_v7m_proc_fin
+	globl_equ	cpu_kinetis_reset,	cpu_v7m_reset
+ENTRY(cpu_kinetis_do_idle)
+	dsb
+	wfi
+	movw	r3, #:lower16:0xe0082000
+	movt	r3, #:upper16:0xe0082000
+	ldr	r0, [r3, #0]
+	orr	r2, r0, #0x85000000
+	str	r2, [r3, #0]
+	ret	lr
+ENDPROC(cpu_kinetis_do_idle)
+	globl_equ	cpu_kinetis_dcache_clean_area, 
cpu_v7m_dcache_clean_area
+#ifdef CONFIG_ARM_CPU_SUSPEND
+	globl_equ	cpu_kinetis_do_suspend,	cpu_v7m_do_suspend
+	globl_equ	cpu_kinedis_do_resume,	cpu_v7m_do_resume
+#endif
+.globl	cpu_kinetis_suspend_size
+.equ	cpu_kinetis_suspend_size, cpu_v7m_suspend_size
+#endif
+
  	.section ".text.init", #alloc, #execinstr

  /*
@@ -140,6 +164,9 @@ __v7m_setup_stack:
  __v7m_setup_stack_top:

  	define_processor_functions v7m, dabort=nommu_early_abort, 
pabort=legacy_pabort, nommu=1
+#ifdef CONFIG_CPU_KINETIS
+	define_processor_functions kinetis, dabort=nommu_early_abort, 
pabort=legacy_pabort, nommu=1
+#endif

  	.section ".rodata"
  	string cpu_arch_name, "armv7m"
@@ -148,23 +175,35 @@ __v7m_setup_stack_top:

  	.section ".proc.info.init", #alloc

-	/*
-	 * Match any ARMv7-M processor core.
-	 */
-	.type	__v7m_proc_info, #object
-__v7m_proc_info:
-	.long	0x000f0000		@ Required ID value
-	.long	0x000f0000		@ Mask for ID
+.macro __v7m_proc name, initfunc, proc_fns = v7m_processor_functions
  	.long   0			@ 
proc_info_list.__cpu_mm_mmu_flags
  	.long   0			@ 
proc_info_list.__cpu_io_mmu_flags
-	initfn	__v7m_setup, __v7m_proc_info	@ 
proc_info_list.__cpu_flush
+	initfn	\initfunc, \name	@ proc_info_list.__cpu_flush
  	.long	cpu_arch_name
  	.long	cpu_elf_name
  	.long	HWCAP_HALF|HWCAP_THUMB|HWCAP_FAST_MULT
  	.long	cpu_v7m_name
-	.long	v7m_processor_functions	@ proc_info_list.proc
+	.long	\proc_fns		@ proc_info_list.proc
  	.long	0			@ proc_info_list.tlb
  	.long	0			@ proc_info_list.user
  	.long	nop_cache_fns		@ proc_info_list.cache
-	.size	__v7m_proc_info, . - __v7m_proc_info
+.endm
+
+#ifdef CONFIG_CPU_KINETIS
+	.type   __v7m_kinetis_proc_info, #object
+__v7m_kinetis_proc_info:
+	.long	0x410fc240
+	.long	0xff0ffff0
+	__v7m_proc __v7m_kinetis_proc_info, __v7m_setup, proc_fns = 
kinetis_processor_functions
+	.size	__v7m_kinetis_proc_info, . - __v7m_kinetis_proc_info
+#endif

+	/*
+	 * Match any ARMv7-M processor core.
+	 */
+	.type	__v7m_proc_info, #object
+__v7m_proc_info:
+	.long	0x000f0000		@ Required ID value
+	.long	0x000f0000		@ Mask for ID
+	__v7m_proc __v7m_proc_info, __v7m_setup
+	.size	__v7m_proc_info, . - __v7m_proc_info


Works with and without JTAG connected.

(gdb) c
Continuing.
^C
Program received signal SIGTRAP, Trace/breakpoint trap.
cpu_kinetis_do_idle () at ../arch/arm/mm/proc-v7m.S:84
84		movw	r3, #:lower16:0xe0082000
(gdb) bt
#0  cpu_kinetis_do_idle () at ../arch/arm/mm/proc-v7m.S:84
#1  0x0800a4b0 in arch_cpu_idle () at ../arch/arm/kernel/process.c:72
#2  0x0802542a in cpuidle_idle_call (state=<value optimized out>)
     at ../kernel/sched/idle.c:157
#3  cpu_idle_loop (state=<value optimized out>) at 
../kernel/sched/idle.c:253
#4  cpu_startup_entry (state=<value optimized out>) at 
../kernel/sched/idle.c:301
#5  0x081bf816 in start_kernel () at ../init/main.c:683
#6  0x08008024 in stext () at ../arch/arm/kernel/head-nommu.S:85
(gdb)

Note dsb before wfi - I'm experiencing another (different) exception 
without it.
