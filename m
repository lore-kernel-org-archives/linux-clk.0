Return-Path: <sboyd@codeaurora.org>
Date: Mon, 17 Jul 2017 18:22:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, architt@codeaurora.org,
	hverkuil@xs4all.nl, bjorn.andersson@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: qcom: clk-smd-rpm: Fix the reported rate of
 branches
Message-ID: <20170718012232.GQ22780@codeaurora.org>
References: <20170713180332.GC22780@codeaurora.org>
 <20170717153542.21676-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170717153542.21676-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/17, Georgi Djakov wrote:
> As there is no way to actually query the hardware for the current clock
> rate, now racalc_rate() just returns the last rate that was previously
> set. But if the rate was not set yet, we return the bogus rate of 1000Hz.
> 
> The branch clocks have the same rate as their parent, so in this case we
> just need to remove recalc_rate ops and then the core framework will handle
> this automagically. The round_rate() is unused, so remove it as well.
> 
> Reported-by: Archit Taneja <architt@codeaurora.org>
> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
