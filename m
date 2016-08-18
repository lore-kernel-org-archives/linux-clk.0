Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 16:42:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] clk: max77686: Migrate to clk_hw based OF and
 registration APIs
Message-ID: <20160818234246.GH361@codeaurora.org>
References: <20160816223856.1282-1-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160816223856.1282-1-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
> 
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
