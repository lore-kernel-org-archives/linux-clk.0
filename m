Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Jan 2018 21:29:02 -0200
Message-ID: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
Subject: Warnings from drivers/clk/clk.c
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Bootling linux-next 20180110 on a imx53-qsb leads to the following
warning that gets repeated several times:


[    2.776154] ------------[ cut here ]------------
[    2.780909] WARNING: CPU: 0 PID: 1 at ../drivers/clk/clk.c:802
clk_core_disable+0xc4/0xe0
[    2.789107] Modules linked in:
[    2.792198] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.15.0-rc7-next-20180110 #1
[    2.799696] Hardware name: Freescale i.MX53 (Device Tree Support)
[    2.805805] Backtrace:
[    2.808290] [<c010d1a0>] (dump_backtrace) from [<c010d460>]
(show_stack+0x18/0x1c)
[    2.815879]  r7:00000000 r6:60000093 r5:00000000 r4:c1079954
[    2.821566] [<c010d448>] (show_stack) from [<c0a33bac>]
(dump_stack+0xb4/0xe8)
[    2.828813] [<c0a33af8>] (dump_stack) from [<c0126144>] (__warn+0xf0/0x11c)
[    2.835795]  r9:00000000 r8:00000322 r7:00000009 r6:c0d425e8
r5:00000000 r4:00000000
[    2.843558] [<c0126054>] (__warn) from [<c0126288>]
(warn_slowpath_null+0x44/0x50)
[    2.851148]  r8:c1008908 r7:c0e0777c r6:c04be730 r5:00000322 r4:c0d425e8
[    2.857870] [<c0126244>] (warn_slowpath_null) from [<c04be730>]
(clk_core_disable+0xc4/0xe0)
[    2.866325]  r6:dc02bb00 r5:dc02a980 r4:dc02a980
[    2.870965] [<c04be66c>] (clk_core_disable) from [<c04bf9e8>]
(clk_core_disable_lock+0x20/0x2c)
[    2.879681]  r5:dc02a980 r4:80000013
[    2.883278] [<c04bf9c8>] (clk_core_disable_lock) from [<c04bfa18>]
(clk_disable+0x24/0x28)
[    2.891559]  r5:c0f6b3e4 r4:0000001c
[    2.895160] [<c04bf9f4>] (clk_disable) from [<c0f233b0>]
(imx_clk_disable_uart+0x50/0x68)
[    2.903365] [<c0f23360>] (imx_clk_disable_uart) from [<c010277c>]
(do_one_initcall+0x50/0x19c)
[    2.911996]  r7:c0e0777c r6:c0f63854 r5:c0f23360 r4:ffffe000
[    2.917678] [<c010272c>] (do_one_initcall) from [<c0f00f00>]
(kernel_init_freeable+0x118/0x1d0)
[    2.926397]  r9:c0f63858 r8:000000f0 r7:c0e0777c r6:c0f63854
r5:c107b540 r4:c0f7525c
[    2.934169] [<c0f00de8>] (kernel_init_freeable) from [<c0a48ec8>]
(kernel_init+0x10/0x118)
[    2.942456]  r10:00000000 r9:00000000 r8:00000000 r7:00000000
r6:00000000 r5:c0a48eb8
[    2.950301]  r4:00000000
[    2.952857] [<c0a48eb8>] (kernel_init) from [<c01010b4>]
(ret_from_fork+0x14/0x20)
[    2.960444] Exception stack(0xdc05dfb0 to 0xdc05dff8)
[    2.965516] dfa0:                                     00000000
00000000 00000000 00000000
[    2.973715] dfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.981912] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.988543]  r5:c0a48eb8 r4:00000000
[    2.992135] ---[ end trace 5c23aee63f870994 ]---
[    2.997359] ------------[ cut here ]------------

Does anyone have any ideas on how to fix it?

Thanks
