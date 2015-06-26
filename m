Return-Path: <pawelo@king.net.pl>
Date: Fri, 26 Jun 2015 07:30:49 +0200 (CEST)
From: Paul Osmialowski <pawelo@king.net.pl>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
cc: Arnd Bergmann <arnd@arndb.de>, Paul Osmialowski <pawelo@king.net.pl>,
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
In-Reply-To: <alpine.LFD.2.11.1506251237000.2617@knanqh.ubzr>
Message-ID: <alpine.LNX.2.00.1506260715300.499@localhost.localdomain>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl> <1435094387-20146-4-git-send-email-pawelo@king.net.pl> <2235698.8UjxLOMCMb@wuerfel> <alpine.LFD.2.11.1506251237000.2617@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Nicolas,

Thanks for your proposal, however, I have some trouble with it.

That would look lovely:

#include <linux/linkage.h>
#include <asm/assembler.h>

/*
  *      cpu_kinetis_do_idle()
  *
  *      Idle the processor (wait for interrupt).
  *
  *      IRQs are already disabled.
  */
ENTRY(cpu_kinetis_do_idle)
         wfi
         movw    r3, #:lower16:0xe0082000
         movt    r3, #:upper16:0xe0082000
         ldr     r0, [r3, #0]
         orr     r2, r0, #0x85000000
         str     r2, [r3, #0]
         ret     lr
ENDPROC(cpu_kinetis_do_idle)

But... what about the rest of this hypothetical proc_kinetis.S file?

It would be a lot of code duplication with proc-v7m.S I think.

I could define CPU_KINETIS as such:

config CPU_KINETIS
 	bool
 	select CPU_V7M

But there's no such thing like customize_processor_functions that would be 
called after proc-v7m.S define_processor_functions specified things like 
idle routine.

Finally, while I was searching for suitable arm_pm_idle-based solution, I 
found idle.c in mach-gemini that encouraged me to write my own idle.c for 
Kinetis:

/*
  * arch/arm/mach-kinetis/idle.c
  */

#include <linux/init.h>
#include <linux/io.h>
#include <asm/system_misc.h>
#include <asm/proc-fns.h>

static void kinetis_idle(void)
{
         asm volatile ("wfi");

         /*
          * This is a dirty hack that invalidates the I/D bus cache
          * on Kinetis K70. This must be done after idle.
          */
         writel(readl(IOMEM(0xe0082000)) | 0x85000000, IOMEM(0xe0082000));
}

static int __init kinetis_idle_init(void)
{
         arm_pm_idle = kinetis_idle;
         return 0;
}

arch_initcall(kinetis_idle_init);

Et voila:

(gdb) c
Continuing.
^C
Program received signal SIGTRAP, Trace/breakpoint trap.
kinetis_idle () at ../arch/arm/mach-kinetis/idle.c:18
18		writel(readl(IOMEM(0xe0082000)) | 0x85000000, 
IOMEM(0xe0082000));
(gdb) bt
#0  kinetis_idle () at ../arch/arm/mach-kinetis/idle.c:18
#1  0x0800a91e in arch_cpu_idle () at ../arch/arm/kernel/process.c:70
#2  0x08025402 in cpuidle_idle_call (state=<value optimized out>)
     at ../kernel/sched/idle.c:157
#3  cpu_idle_loop (state=<value optimized out>) at 
../kernel/sched/idle.c:253
#4  cpu_startup_entry (state=<value optimized out>) at 
../kernel/sched/idle.c:301
#5  0x081bf816 in start_kernel () at ../init/main.c:683
#6  0x08008024 in stext () at ../arch/arm/kernel/head-nommu.S:85
(gdb)

On Thu, 25 Jun 2015, Nicolas Pitre wrote:

> On Tue, 23 Jun 2015, Arnd Bergmann wrote:
>
>> On Tuesday 23 June 2015 23:19:41 Paul Osmialowski wrote:
>>> Some SoCs need additional actions to be performed after arch idle,
>>> e.g. Kinetis requires invalidation of the I/D bus cache.
>>>
>>> Such handler could be held in provided <mach/idle.h> header file.
>>>
>>> Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
>>> ---
>>>  arch/arm/Kconfig          | 7 +++++++
>>>  arch/arm/kernel/process.c | 7 +++++++
>>>  2 files changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>>> index 8e3a833..8ef8f8f 100644
>>> --- a/arch/arm/Kconfig
>>> +++ b/arch/arm/Kconfig
>>> @@ -98,6 +98,13 @@ config ARM_HAS_SG_CHAIN
>>>  config NEED_SG_DMA_LENGTH
>>>  	bool
>>>
>>> +config NEED_MACH_IDLE_H
>>> +	bool
>>> +
>>> +config ARM_CPU_IDLE_QUIRKS
>>> +	bool
>>> +	select NEED_MACH_IDLE_H
>>> +
>>
>> We're not adding header files like this, please come up
>> with another solution. How about a cpuidle driver, or
>> possibly just overriding arm_pm_idle()?
>
> If the WFI instruction always requires I and D flushing, then it might
> be a better idea to provide a replacement for the corresponding
> cpu_*_do_idle function.  Plenty of examples exist for other cpu_*
> functions.
>
>
> Nicolas
>
