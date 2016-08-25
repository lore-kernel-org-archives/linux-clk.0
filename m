Return-Path: <sboyd@codeaurora.org>
Date: Wed, 24 Aug 2016 17:25:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peter Ujfalusi <peter.ujfalusi@ti.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 22/34] clk: palmas: Migrate to clk_hw based OF and
 registration APIs
Message-ID: <20160825002535.GW19826@codeaurora.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org>
 <20160601231533.9354-23-stephen.boyd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160601231533.9354-23-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/01, Stephen Boyd wrote:
> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
