Return-Path: <sboyd@codeaurora.org>
Date: Fri, 6 May 2016 11:04:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: msm8916: Fix crypto clock flags
Message-ID: <20160506180451.GY3492@codeaurora.org>
References: <1462307051-19256-1-git-send-email-andy.gross@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1462307051-19256-1-git-send-email-andy.gross@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 05/03, Andy Gross wrote:
> This patch adds the CLK_SET_RATE_PARENT flag for the crypto core and
> ahb blocks.  Without this flag, clk_set_rate can fail for certain
> frequency requests.
> 
> Signed-off-by: Andy Gross <andy.gross@linaro.org>
> ---

Applied to clk-next + added Fixes tag.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
