Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 17:22:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 15/34] clk: efm32gg: Migrate to clk_hw based OF and
 registration APIs
Message-ID: <20160825002253.GU19826@codeaurora.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
 <20160601231533.9354-16-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20160601231533.9354-16-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/01, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
> 
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
