Return-Path: <grygorii.strashko@ti.com>
Subject: Re: [4.1.3-rt10][RFC PATCH] clk: use raw locks for locking
To: Michael Turquette <mturquette@baylibre.com>, <tglx@linutronix.de>,
        <linux@arm.linux.org.uk>, <linux-rt-users@vger.kernel.org>,
        <balbi@ti.com>
References: <1445374759-26785-1-git-send-email-grygorii.strashko@ti.com>
 <20151021092550.20687.52171@quantum>
CC: Sekhar Nori <nsekhar@ti.com>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <5628FC83.3020709@ti.com>
Date: Thu, 22 Oct 2015 18:10:59 +0300
MIME-Version: 1.0
In-Reply-To: <20151021092550.20687.52171@quantum>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On 10/21/2015 12:25 PM, Michael Turquette wrote:
> Quoting Grygorii Strashko (2015-10-20 13:59:19)
>> Hi Mike, All,
>>
>> [not for merge]
>>
>> As we discussed I've prepared patch which introduces config option
>> COMMON_CLK_USE_RAW_LOCKS which, once enabled, switches CCF to use raw locks
>> for locking​. This way it will be possible to call clk_enable()/clk_disable()
>> from atomic context on -RT [1].
>> Unfortunately (and as expected [2]), if COMMON_CLK_USE_RAW_LOCKS is enebled
>> it starts raising issues with TI's clock drivers (and this is like a avalanche):
>> - some TI drivers calls platform specific code which, in turn, uses spinlocks;
>> - one driver is implemented using MMIO regmap which uses spinlocks.
>>
>> As result, to get a complete solution I've had to make more patches:
>>   regmap: use raw locks for locking
>>   ARM: OMAP2+: powerdomain: use raw locks for locking
>>   clk: ti: drop locking code from mux/divider drivers
>>   clk: use raw locks for locking
>>
>> This solution requires the use of raw locks in many places of kernel,
>> and it's bad for the -RT. For example, regmap is used by only one TI's clock,
>> but after switching to use raw locks it will affect also on all drivers which
>> use 'syscon'.
> 
> Well that does sound like a clusterfuck. Out of curiosity, where do you
> need to call clk_enable/clk_disable from atomic context?

Yep :P omap_gpio_debounce as below. 

> 
> I wonder if the very idea of calling clk_enable/clk_disable from atomic
> context is valid for -rt... Clearly the clk.h api states that these
> functions are safe to call in irq context, which it seems is true for
> -rt, right?

This is game play with terminology :)

/**
 * clk_enable - inform the system when the clock source should be running.
 * @clk: clock source
 *
 * If the clock can not be enabled/disabled, this should return success.
 *
 * May be called from atomic contexts.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Looks like above has to be updated for -RT.
+ RT_FULL: clk_enable() should not be called from atomic contexts

 *
 * Returns success (0) or negative errno.
 */
int clk_enable(struct clk *clk);


"Atomic context" means the same as for -RT as for non-RT. 
HW interrupt context means the same as for -RT as for non-RT. 

-RT is just some changes in SW to reduce number and size of atomic sections,
and amount of code executed in HW interrupt context.
(preferably without interacting with people).

> 
> The problem is that you want to call them in a context whose meaning is
> different in the -rt world. So it would be helpful for me to get a
> better understanding of some examples of where things are going wrong
> for you.
> 
>>
>> So, it seems that in many cases it might be more simple to just move
>> clk_enable()/clk_disable() calls out of atomic context :)
>>
>> FYI: Complete set of patches (based on v4.1.10-rt10) can be found at:
>> - git@git.ti.com:~gragst/ti-linux-kernel/gragsts-ti-linux-kernel.git
>> - branch: linux-4.1.y-rt-10-clk-raw-lock
>>
>> [1] http://marc.info/?l=linux-rt-users&m=143937432529680&w=2
>> [2] http://marc.info/?l=linux-rt-users&m=144284086804316&w=2
>>
>> ---------------------------------------------------------------------
>> This patch optionally allows CCF core to use raw locks in clk_enable()/
>> clk_disable() path. Also, convert generic clock drivers in
>> the similar way (clk-divider, clk-fractional-divider,
>> clk-gate, clk-mux).
>>
>> This patch introduces Kconfig option COMMON_CLK_USE_RAW_LOCKS.
>> Once enabled, COMMON_CLK_USE_RAW_LOCKS will switch the common clock
>> framework to use raw locks for locking and, this way, makes it
>> possible to call clk_enable()/clk_disable() from atomic context.
>>
>> This fixes backtrace like:
>> BUG: sleeping function called from invalid context at kernel/locking/rtmutex.c:917
>> in_atomic(): 1, irqs_disabled(): 128, pid: 128, name: sh
>> 4 locks held by sh/128:
>>   #0:  (sb_writers#4){.+.+.+}, at: [<c019d44c>] vfs_write+0x13c/0x164
>>   #1:  (&of->mutex){+.+.+.}, at: [<c0214bbc>] kernfs_fop_write+0x48/0x19c
>>   #2:  (s_active#33){.+.+.+}, at: [<c0214bc4>] kernfs_fop_write+0x50/0x19c
>>   #3:  (&bank->lock){......}, at: [<c0405424>] omap_gpio_debounce+0x1c/0x120
>> irq event stamp: 3532
>> hardirqs last  enabled at (3531): [<c0186ffc>] kfree+0xf8/0x464
>> hardirqs last disabled at (3532): [<c06a0ef0>] _raw_spin_lock_irqsave+0x1c/0x54
>> softirqs last  enabled at (0): [<c004572c>] copy_process.part.54+0x3f4/0x1930
>> softirqs last disabled at (0): [<  (null)>]   (null)
>> Preemption disabled at:[<  (null)>]   (null)
>>
>> CPU: 1 PID: 128 Comm: sh Not tainted 4.1.9-rt8-01685-g0660ad10-dirty #39
>> Hardware name: Generic DRA74X (Flattened Device Tree)
>> [<c0019148>] (unwind_backtrace) from [<c00144b0>] (show_stack+0x10/0x14)
>> [<c00144b0>] (show_stack) from [<c069b4dc>] (dump_stack+0x7c/0x98)
>> [<c069b4dc>] (dump_stack) from [<c06a148c>] (rt_spin_lock+0x20/0x60)
>> [<c06a148c>] (rt_spin_lock) from [<c056cb6c>] (clk_enable_lock+0x14/0xb0)
>> [<c056cb6c>] (clk_enable_lock) from [<c056fed8>] (clk_enable+0xc/0x2c)
>> [<c056fed8>] (clk_enable) from [<c0405474>] (omap_gpio_debounce+0x6c/0x120)
>> [<c0405474>] (omap_gpio_debounce) from [<c0404034>] (export_store+0x70/0xfc)
>> [<c0404034>] (export_store) from [<c0214c2c>] (kernfs_fop_write+0xb8/0x19c)
>> [<c0214c2c>] (kernfs_fop_write) from [<c019cb00>] (__vfs_write+0x20/0xd8)
>> [<c019cb00>] (__vfs_write) from [<c019d3a0>] (vfs_write+0x90/0x164)
>> [<c019d3a0>] (vfs_write) from [<c019dbc4>] (SyS_write+0x44/0x9c)
>> [<c019dbc4>] (SyS_write) from [<c0010300>] (ret_fast_syscall+0x0/0x54)
>> EXT4-fs (mmcblk1p2): error count since last fsck: 2
>> EXT4-fs (mmcblk1p2): initial error at time 1437484540: ext4_put_super:789
>> EXT4-fs (mmcblk1p2): last error at time 1437484540: ext4_put_super:789
> 
> Right, so things go sideways here because omap_gpio_debounce uses
> raw_spin_lock_irqsave. Is this necessary? I notice that similar
> implementations of the same .set_debounce callback are using regmap or
> regular spinlocks (e.g. wm831x_gpio_set_debounce).

Yes. this is only one place I identified for now and I'll try to update
OMAP GPIO debounce code instead of trying to patch CCF
(especially taking into account that I'm the only one who is asking
 questions about CCF vs -RT). But we are not intensively testing PM
(suspend/cpufreq/cpuidle) now, so...
It's difficult to compare with other GPIO drivers simply because they may
belong to platforms which no one has tried to use with -RT.

> 
> Thanks for educating me on this. I never look at the -rt stuff so I'm
> sure to ask some dumb questions.
> 
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>   drivers/clk/Kconfig                  | 11 +++++++++++
>>   drivers/clk/clk-divider.c            | 10 +++++-----
>>   drivers/clk/clk-fractional-divider.c | 10 +++++-----
>>   drivers/clk/clk-gate.c               |  6 +++---
>>   drivers/clk/clk-mux.c                |  8 ++++----
>>   drivers/clk/clk.c                    | 12 +++++++++---
>>   include/linux/clk-provider.h         | 38 ++++++++++++++++++++++++++----------
>>   7 files changed, 65 insertions(+), 30 deletions(-)
>>

[...]


-- 
regards,
-grygorii
S/ILKP
