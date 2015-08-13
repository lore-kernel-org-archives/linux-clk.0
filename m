Return-Path: <sboyd@codeaurora.org>
Date: Thu, 13 Aug 2015 11:25:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@freescale.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@linaro.org, shawnguo@kernel.org, b29396@freescale.com,
	linux-arm-kernel@lists.infradead.org,
	Ranjani.Vaidyanathan@freescale.com, b20596@freescale.com,
	r64343@freescale.com, b20788@freescale.com
Subject: Re: [PATCH V3 1/5] clk: remove duplicated code with
 __clk_set_parent_after
Message-ID: <20150813182510.GQ26614@codeaurora.org>
References: <1438089585-30103-1-git-send-email-aisheng.dong@freescale.com>
 <1438089585-30103-2-git-send-email-aisheng.dong@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438089585-30103-2-git-send-email-aisheng.dong@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/28, Dong Aisheng wrote:
> __clk_set_parent_after() actually used the second argument then we
> could put this duplicate logic in there and call it with a different
> order of arguments in the success vs. error paths in this function.
> 
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
