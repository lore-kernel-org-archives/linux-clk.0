Return-Path: <sboyd@codeaurora.org>
Date: Thu, 10 Nov 2016 14:07:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: ipq806x: Fix board clk rates
Message-ID: <20161110220717.GG16026@codeaurora.org>
References: <20161110011337.25707-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161110011337.25707-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/09, Stephen Boyd wrote:
> The clocks on these boards run at 25 MHz, not 19.2 and 27 like
> other platforms. Unfortunately I copy/pasted from other similar
> SoCs but forgot this one is different. Fix it.
> 
> Fixes: a085f877a882 ("clk: qcom: Move cxo/pxo/xo into dt files")
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
