Return-Path: <Aisheng.Dong@freescale.com>
Date: Mon, 4 May 2015 16:35:51 +0800
From: Dong Aisheng <b29396@freescale.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Dong Aisheng <aisheng.dong@freescale.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mturquette@linaro.org>,
	<shawn.guo@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<Ranjani.Vaidyanathan@freescale.com>, <b20596@freescale.com>,
	<r64343@freescale.com>, <b20788@freescale.com>
Subject: Re: [PATCH RFC v1 2/5] clk: add missing lock when call
 clk_core_enable in clk_set_parent
Message-ID: <20150504083549.GC4082@shlinux1.ap.freescale.net>
References: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com>
 <1429107999-24413-3-git-send-email-aisheng.dong@freescale.com>
 <55427D83.3060900@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <55427D83.3060900@codeaurora.org>
Return-Path: b29396@freescale.com
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 30, 2015 at 12:07:47PM -0700, Stephen Boyd wrote:
> On 04/15/15 07:26, Dong Aisheng wrote:
> > clk_core_enable is executed without &enable_clock in clk_set_parent function.
> > Adding it to avoid potential race condition issue.
> >
> > Fixes: 035a61c314eb ("clk: Make clk API return per-user struct clk instances")
> > Cc: Mike Turquette <mturquette@linaro.org>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
> > ---
> 
> Can you please describe the race condition? From what I can tell there
> is not a race condition here and we've gone around on this part of the
> code before to fix any race conditions.
> 

Do you mean we do not need to acquire enable lock when execute clk_core_enable
in set_parent function? Can you help explain a bit more why?

The clk doc looks to me says the enable lock should be held across calls to
the .enable, .disable and .is_enabled operations.

And before the commit
035a61c314eb ("clk: Make clk API return per-user struct clk instances"),
all the clk_enable/disable in set_parent() is executed with lock.

A rough thinking of race condition is assuming Thread A calls
clk_set_parent(x, y) while Thread B calls clk_enable(x), clock x is disabled
but prepared initially, due to clk_core_enable in set_parent() is not
executed with enable clock, the clk_core_enable may be reentrant during
the locking time executed by B.
Won't this be a race condition?

Regards
Dong Aisheng

> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
