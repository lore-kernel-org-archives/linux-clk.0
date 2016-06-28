Return-Path: <sboyd@codeaurora.org>
Date: Tue, 28 Jun 2016 11:05:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] clk: qcom: Remove gcc_aggre1_pnoc_ahb_clk from msm8996
Message-ID: <20160628180511.GE1521@codeaurora.org>
References: <20160621230004.30209-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160621230004.30209-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/21, Stephen Boyd wrote:
> This clk is critical to operation of the SoC and should never be
> turned off. Furthermore, there are no consumers of this clk so
> let's just delete it so things like eMMC work.
> 
> Reported-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
