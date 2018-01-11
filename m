Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Jan 2018 13:19:48 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: Warnings from drivers/clk/clk.c
Message-ID: <20180111211948.GL28313@codeaurora.org>
References: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/10, Fabio Estevam wrote:
> Hi,
> 
> Bootling linux-next 20180110 on a imx53-qsb leads to the following
> warning that gets repeated several times:
> 
> 
> [    2.776154] ------------[ cut here ]------------
> [    2.780909] WARNING: CPU: 0 PID: 1 at ../drivers/clk/clk.c:802
> clk_core_disable+0xc4/0xe0

We have two WARN_ON in this function. Do you know which one hit
(makes me think we should put a printk in here now and also
include the clk name).

> [    2.789107] Modules linked in:
> [    2.792198] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 4.15.0-rc7-next-20180110 #1
> [    2.799696] Hardware name: Freescale i.MX53 (Device Tree Support)
> [    2.805805] Backtrace:
> [    2.808290] [<c010d1a0>] (dump_backtrace) from [<c010d460>]
> (show_stack+0x18/0x1c)
> [    2.815879]  r7:00000000 r6:60000093 r5:00000000 r4:c1079954
> [    2.821566] [<c010d448>] (show_stack) from [<c0a33bac>]
> (dump_stack+0xb4/0xe8)
> [    2.828813] [<c0a33af8>] (dump_stack) from [<c0126144>] (__warn+0xf0/0x11c)
> [    2.835795]  r9:00000000 r8:00000322 r7:00000009 r6:c0d425e8
> r5:00000000 r4:00000000
> [    2.843558] [<c0126054>] (__warn) from [<c0126288>]
> (warn_slowpath_null+0x44/0x50)
> [    2.851148]  r8:c1008908 r7:c0e0777c r6:c04be730 r5:00000322 r4:c0d425e8
> [    2.857870] [<c0126244>] (warn_slowpath_null) from [<c04be730>]
> (clk_core_disable+0xc4/0xe0)
> [    2.866325]  r6:dc02bb00 r5:dc02a980 r4:dc02a980
> [    2.870965] [<c04be66c>] (clk_core_disable) from [<c04bf9e8>]
> (clk_core_disable_lock+0x20/0x2c)
> [    2.879681]  r5:dc02a980 r4:80000013
> [    2.883278] [<c04bf9c8>] (clk_core_disable_lock) from [<c04bfa18>]
> (clk_disable+0x24/0x28)
> [    2.891559]  r5:c0f6b3e4 r4:0000001c
> [    2.895160] [<c04bf9f4>] (clk_disable) from [<c0f233b0>]
> (imx_clk_disable_uart+0x50/0x68)
> [    2.903365] [<c0f23360>] (imx_clk_disable_uart) from [<c010277c>]
> (do_one_initcall+0x50/0x19c)

Perhaps some critical clk is also in the uart clk list?
Otherwise, there's some sort of imbalance causing a uart clk to
be disabled more than it's been enabled? I don't see any crtical
clk markings in the imx driver, so maybe it's some sort of
improper double disable?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
