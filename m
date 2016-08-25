Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 17:40:20 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: Migrate to clk_hw based registration and
 OF APIs
Message-ID: <20160825004020.GI19826@codeaurora.org>
References: <20160816223827.977-1-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160816223827.977-1-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers in this driver, allowing us to
> move closer to a clear split of consumer and provider clk APIs.
> 
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
