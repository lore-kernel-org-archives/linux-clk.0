Return-Path: <manuel.lauss@gmail.com>
MIME-Version: 1.0
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Thu, 30 Apr 2015 12:35:03 +0200
Message-ID: <CAOLZvyHLwNZ+V8rvBHxDt_cMG5=1T_Tb7594kLt2hgFT3gN4Qw@mail.gmail.com>
Subject: linux-4.1-rc*: clk alias broken?
To: Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

Hello,

On MIPS, with latest linus-git (and back to 4.0-rc3 at least), I get
this oops on bootup:

Unhandled kernel unaligned access[#1]:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.1.0-rc1-db1xxx-00058-ga068c92-dirty #1
task: 8fc29728 ti: 8fc2a000 task.ti: 8fc2a000
$ 0   : 00000000 10003c00 8fd0d380 00000006
$ 4   : 8fd0d400 00000000 00000000 80920640
$ 8   : 00000000 803da0f0 8fc67f80 53425553
$12   : 80850000 ffffffe0 00000000 00000006
$16   : 8fd0d380 616d2f65 80920634 00000000
$20   : 809e42f8 80a08744 00000008 80a20000
$24   : 00000018 00000000
$28   : 8fc2a000 8fc2bda8 80a12850 8057c7dc
Hi    : 00000003
Lo    : 75c28f6a
epc   : 8057c7e4 __clk_create_clk+0x50/0xe4
    Not tainted
ra    : 8057c7dc __clk_create_clk+0x48/0xe4
Status: 10003c03        KERNEL EXL IE
Cause : 00808010
BadVA : 616d2f65
PrId  : 800c8000 (Au1300)
Modules linked in:
Process swapper (pid: 1, threadinfo=8fc2a000, task=8fc29728, tls=00000000)
Stack : 809ac174 00000000 00000000 809a0b50 809e42f8 00000000 809e0000 80920634
          809a0b50 80579958 10003c01 8fd0d600 809e8f18 00000000
8fd0d600 809e8f18
          00000000 809e8618 80a12850 803dbc70 80920c20 ffffffff
00000000 8fd0d800
          00000006 809e8f18 00000000 809a0b50 809e42f8 803dbcb4
8fd0d600 809e8f28
          8fd0d880 809f8630 8fd0d600 809e8f18 8fd0d600 8010057c
00000000 80239aec
          ...
Call Trace:
[<8057c7e4>] __clk_create_clk+0x50/0xe4
[<80579958>] clk_get_sys+0x124/0x194
[<809e8618>] db1300_dev_setup+0xd4/0x1f4
[<8010057c>] do_one_initcall+0xe8/0x23c
[<809e4d00>] kernel_init_freeable+0x19c/0x258
[<807f935c>] kernel_init+0x10/0x100
[<80109f48>] ret_from_kernel_thread+0x14/0x1c


Code: 00c09021  1040001a  00408021 <8e220000> ae130004  ae020000
2402ffff  ae020010  0c15e836
---[ end trace ebbb3030d8da4bcd ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

epc points to:

(gdb) list *0x8057c7e4
0x8057c7e4 is in __clk_create_clk
(/home/mano/dev/db1200/kernel/linux/drivers/clk/clk.c:2453).
2448
2449            clk = kzalloc(sizeof(*clk), GFP_KERNEL);
2450            if (!clk)
2451                    return ERR_PTR(-ENOMEM);
2452
2453            clk->core = hw->core;
2454            clk->dev_id = dev_id;
2455            clk->con_id = con_id;
2456            clk->max_rate = ULONG_MAX;
2457

i.e. "hw" is completely bogus (reg $17).

The code leading to this oops does:

(gdb) list *0x809e8618
0x809e8618 is in db1300_dev_setup
(/home/mano/dev/db1200/kernel/linux/arch/mips/alchemy/devboards/db1300.c:810).
805             wmb();
806             __raw_writel(PSC_SEL_CLK_SERCLK,
807                 (void __iomem *)KSEG1ADDR(AU1300_PSC2_PHYS_ADDR) +
PSC_SEL_OFFSET);
808             wmb();
809             /* I2C driver wants 50MHz, get as close as possible */
810             c = clk_get(NULL, "psc3_intclk");
811             if (!IS_ERR(c)) {
812                     clk_set_rate(c, 50000000);
813                     clk_prepare_enable(c);
814                     clk_put(c);

"psc3_intclk" is an alias for a clock named "EXTCLK1" which is set up in
arch/mips/alchemy/common/clock.c, line 1106 as
clk_add_alias("psc3_intclk", NULL, "EXTCLK1", NULL);

If I change the "psc3_intclk" to "EXTCLK1" the oops goes away, but another
pops up due to the clk_get() in drivers/net/ethernet/smsc911x.c, line 442.

I haven't looked at the arch/mips/alchemy/common/clock.c code since I wrote it
about 1 year ago.  There haven't been any major changes to this code since 3.19
(except for a few function prototype changes) where it last worked.

Any hints?

Thanks!
     Manuel
