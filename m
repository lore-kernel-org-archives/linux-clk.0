Return-Path: <sboyd@codeaurora.org>
Date: Fri, 29 Sep 2017 14:17:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] clk: Export clk_bulk_prepare()
Message-ID: <20170929211722.GK457@codeaurora.org>
References: <20170923050029.19013-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170923050029.19013-1-bjorn.andersson@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/22, Bjorn Andersson wrote:
> Allow clk_bulk_prepare() to be referenced by kernel modules by adding
> the missing EXPORT_SYMBOL_GPL().
> 
> Fixes: 266e4e9d9150 ("clk: add clk_bulk_get accessories")
> Reported-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
