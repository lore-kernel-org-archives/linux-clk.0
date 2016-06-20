Return-Path: <tony@atomide.com>
Date: Mon, 20 Jun 2016 05:10:28 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCHv2 00/28] clk: ti: hwmod clock type support
Message-ID: <20160620121027.GG22406@atomide.com>
References: <1465844702-12200-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465844702-12200-1-git-send-email-t-kristo@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [160613 12:07]:
> Hi,
> 
> Resending the series as it didn't get that much attention last time.
> This has just been rebased on top of 4.7-rc1, no other changes.
> 
> This series adds support for hwmod module clocks, which are currently
> directly handled by hwmod core. This addresses following issues:
> 
>  * one step closer of removing hwmod core / data from kernel
>  * unblock Tony's interconnect driver work (this is also required
>    for removing hwmod codebase)
>  * add proper clock support for the hardware modules currently handled
>    by hwmod core; use counting for clocks, ability to share clocks
>    between multiple modules, etc.
>  * add helper clock APIs for removing most of the clock aliases under
>    drivers/clk/ti/clk-xyz.c files

Mike & Stephen, are you guys OK with this approach? If so, we should
put this into an immutable branch to avoid merge conflicts.

Regards,

Tony
