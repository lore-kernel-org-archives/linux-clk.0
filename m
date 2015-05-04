Return-Path: <Aisheng.Dong@freescale.com>
Date: Mon, 4 May 2015 18:38:37 +0800
From: Dong Aisheng <b29396@freescale.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Dong Aisheng <aisheng.dong@freescale.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mturquette@linaro.org>,
	<shawn.guo@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<Ranjani.Vaidyanathan@freescale.com>, <b20596@freescale.com>,
	<r64343@freescale.com>, <b20788@freescale.com>
Subject: Re: [PATCH RFC v1 5/5] clk: introduce clk_core_enable_lock and
 clk_core_disable_lock functions
Message-ID: <20150504103836.GE4082@shlinux1.ap.freescale.net>
References: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com>
 <1429107999-24413-6-git-send-email-aisheng.dong@freescale.com>
 <20150501011043.GF32407@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20150501011043.GF32407@codeaurora.org>
Return-Path: b29396@freescale.com
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 30, 2015 at 06:10:43PM -0700, Stephen Boyd wrote:
> On 04/15, Dong Aisheng wrote:
> > This can be usefully when clock core wants to enable/disable clocks.
> > Then we don't have to convert the struct clk_core to struct clk to call
> > clk_enable/clk_disable which is a bit un-align with exist using.
> > 
> > Cc: Mike Turquette <mturquette@linaro.org>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
> > ---
> 
> Yeah let's add this patch either before patch 4 or squash it into
> patch 4. Also, avoid adding more function prototypes please.
> 

Will do it.
Thanks for the suggestion.

Regards
Dong Aisheng

> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
