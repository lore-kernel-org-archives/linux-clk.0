Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Jul 2017 16:11:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, architt@codeaurora.org,
	bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-smd-rpm: Fix the initial rate of branches
Message-ID: <20170712231103.GO22780@codeaurora.org>
References: <20170704123447.25552-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170704123447.25552-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/04, Georgi Djakov wrote:
> As there is no way to actually query the hardware for the current clock
> rate, now racalc_rate() just returns the last rate that was previously
> set. But if the rate was not set yet, we return the bogus rate of 1KHz.
> 
> Knowing what the rate of XO is and that some clocks are just branches of
> it, we can do better and return that rate instead of a bogus one.
> 
> Reported-by: Archit Taneja <architt@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-next, any Fixes: tag to attach here?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
