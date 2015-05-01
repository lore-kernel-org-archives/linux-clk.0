Return-Path: <sboyd@codeaurora.org>
Date: Thu, 30 Apr 2015 18:10:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@freescale.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@linaro.org, shawn.guo@linaro.org, b29396@freescale.com,
	linux-arm-kernel@lists.infradead.org,
	Ranjani.Vaidyanathan@freescale.com, b20596@freescale.com,
	r64343@freescale.com, b20788@freescale.com
Subject: Re: [PATCH RFC v1 5/5] clk: introduce clk_core_enable_lock and
 clk_core_disable_lock functions
Message-ID: <20150501011043.GF32407@codeaurora.org>
References: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com>
 <1429107999-24413-6-git-send-email-aisheng.dong@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1429107999-24413-6-git-send-email-aisheng.dong@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/15, Dong Aisheng wrote:
> This can be usefully when clock core wants to enable/disable clocks.
> Then we don't have to convert the struct clk_core to struct clk to call
> clk_enable/clk_disable which is a bit un-align with exist using.
> 
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
> ---

Yeah let's add this patch either before patch 4 or squash it into
patch 4. Also, avoid adding more function prototypes please.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
