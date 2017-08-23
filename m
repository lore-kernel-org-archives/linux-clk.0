Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Aug 2017 15:55:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, robdclark@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: msm8916: Fix bimc gpu clock ops
Message-ID: <20170823225543.GJ21656@codeaurora.org>
References: <20170818142250.27867-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170818142250.27867-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/18, Georgi Djakov wrote:
> The clock bimc_gpu_clk_src is incorrectly set to use the shared rcg2
> ops, which are for RCGs with child branches controlled by different
> CPUs.
> 
> The result of the incorrect ops is that the GPU's PM runtime may leave
> this clock set at a very low rate. Fix this issue by using the correct
> rcg2 ops.
> 
> Fixes: a2e8272f3f89 ("clk: qcom: Add MSM8916 gpu clocks")
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

This is the only user of clk_rcg2_shared_ops. I'm totally lost
why we added this in the first place.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
