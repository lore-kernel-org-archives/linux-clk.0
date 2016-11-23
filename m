Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Nov 2016 11:57:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael.scott@linaro.org
Subject: Re: [PATCH v2 1/2] clk: qcom: clk-smd-rpm: Fix clk_hw references
Message-ID: <20161123195739.GF25626@codeaurora.org>
References: <20161123145249.14912-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161123145249.14912-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/23, Georgi Djakov wrote:
> Fix the clk_hw references to the actual clocks and add a xlate function
> to return the hw pointers from the already existing static array.
> 
> Reported-by: Michael Scott <michael.scott@linaro.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
