Return-Path: <cw00.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5A8BC9DC.5050304@samsung.com>
Date: Tue, 20 Feb 2018 16:10:20 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin
	Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated
 list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open
 list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] clk: samsung: add compile time PLL rate
 validators
In-reply-to: <20180220070539.31361-1-a.hajda@samsung.com>
References: <5A8A9C74.6080503@samsung.com>
	<CGME20180220070544eucas1p17987a47caeba1c07a1d82eb852fcd3b1@eucas1p1.samsung.com>
	<20180220070539.31361-1-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Hi, 

On 2018년 02월 20일 16:05, Andrzej Hajda wrote:
> Rates declared in PLL rate tables should match exactly rates calculated
> from PLL coefficients. To avoid possible mistakes we can use compile
> time validation.
> The patch introduces such validators and expands all initializers
> with additional input frequency parameter, required to validate rates.
> Since S3C24xx PLLs requires different validators two new macros have
> been introduced to deal with it. Also since PLLs 4502 and 4508 have
> different formulas PLL_45XX_RATE has been replaced with PLL_4508_RATE.
> 
> As the patch adds only compile time validators it should not have impact
> on compiled code.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
> v3 (addressed Chanwoo comments):
> - renamed PLL_45XX_RATE to PLL_4508_rate,
> - modified PLL_S3C2440_MPLL_RATE to match exactly code in recalc_rate
> 
> v2:
> - replaced custom checker with existing BUILD_BUG_ON_ZERO,
> - fixed comment (by annihilation),
> - added Acked-By
> ---
>  drivers/clk/samsung/clk-exynos3250.c | 114 +++++++++++++++++-----------------
>  drivers/clk/samsung/clk-exynos4.c    | 102 +++++++++++++++---------------
>  drivers/clk/samsung/clk-exynos5250.c |  54 ++++++++--------
>  drivers/clk/samsung/clk-exynos5260.c |  90 +++++++++++++--------------
>  drivers/clk/samsung/clk-exynos5410.c |  20 +++---
>  drivers/clk/samsung/clk-exynos5420.c |  62 +++++++++----------
>  drivers/clk/samsung/clk-exynos5433.c | 116 +++++++++++++++++------------------
>  drivers/clk/samsung/clk-exynos7.c    |   2 +-
>  drivers/clk/samsung/clk-pll.h        |  48 ++++++++++++---
>  drivers/clk/samsung/clk-s3c2410.c    | 108 ++++++++++++++++----------------
>  10 files changed, 372 insertions(+), 344 deletions(-)
> 

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
