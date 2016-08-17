Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH v2] clk: max77686: Migrate to clk_hw based OF and
 registration APIs
To: Stephen Boyd <stephen.boyd@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20160816223856.1282-1-stephen.boyd@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <4edf11bf-53b9-e419-1d27-69eaed07e3ab@osg.samsung.com>
Date: Tue, 16 Aug 2016 23:04:22 -0400
MIME-Version: 1.0
In-Reply-To: <20160816223856.1282-1-stephen.boyd@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

On 08/16/2016 06:38 PM, Stephen Boyd wrote:
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

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Also, I've tested this on an Exynos5800 Peach Pi Chromebook that has a
max77802 (supported by this driver) and the clocks are working correctly.

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
