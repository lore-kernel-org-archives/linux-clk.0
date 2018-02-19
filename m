Return-Path: <cw00.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5A8A9C74.6080503@samsung.com>
Date: Mon, 19 Feb 2018 18:44:20 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin
	Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated
 list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open
 list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] clk: samsung: add compile time PLL rate
 validators
In-reply-to: <20180216145754.14428-8-a.hajda@samsung.com>
References: <20180216145754.14428-1-a.hajda@samsung.com>
	<CGME20180216145807eucas1p27282e8889ea210ee082a5ffa3c94a4ff@eucas1p2.samsung.com>
	<20180216145754.14428-8-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 2018년 02월 16일 23:57, Andrzej Hajda wrote:
> Rates declared in PLL rate tables should match exactly rates calculated
> from PLL coefficients. To avoid possible mistakes we can use compile
> time validation.
> The patch introduces such validators and expands all initializers
> with additional input frequency parameter, required to validate rates.
> Since S3C24xx PLLs requires different validators two new macros have
> been introduced to deal with it.
> As the patch adds only compile time validators it should not have impact
> on compiled code.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
> Thanks Krzysztof for ack, I hope my changes do not invalidate it.
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

[snip]

>  
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 61eb8abbfd9c..1d8c0a581249 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -41,35 +41,62 @@ enum samsung_pll_type {
>  	pll_1460x,
>  };
>  
> -#define PLL_35XX_RATE(_rate, _m, _p, _s)			\
> +#define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> +	((u64)(_fin) * (BIT(_ks) * (_m) + (_k)) / BIT(_ks) / ((_p) << (_s)))
> +#define PLL_VALID_RATE(_fin, _fout, _m, _p, _s, _k, _ks) ((_fout) + \
> +	BUILD_BUG_ON_ZERO(PLL_RATE(_fin, _m, _p, _s, _k, _ks) != (_fout)))
> +
> +#define PLL_35XX_RATE(_fin, _rate, _m, _p, _s)			\
> +	{							\
> +		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
> +				_m, _p, _s, 0, 16),		\
> +		.mdiv	=	(_m),				\
> +		.pdiv	=	(_p),				\
> +		.sdiv	=	(_s),				\
> +	}
> +
> +#define PLL_S3C2410_MPLL_RATE(_fin, _rate, _m, _p, _s)		\
> +	{							\
> +		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
> +				_m + 8, _p + 2, _s, 0, 16),	\
> +		.mdiv	=	(_m),				\
> +		.pdiv	=	(_p),				\
> +		.sdiv	=	(_s),				\
> +	}
> +
> +#define PLL_S3C2440_MPLL_RATE(_fin, _rate, _m, _p, _s)		\
>  	{							\
> -		.rate	=	(_rate),				\
> +		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
> +				_m + 8, _p + 2, _s - 1, 0, 16),	\
>  		.mdiv	=	(_m),				\
>  		.pdiv	=	(_p),				\
>  		.sdiv	=	(_s),				\

Do you use 's - 1' instead of 'multiplication 2' of numerator?

>  	}
>  
> -#define PLL_36XX_RATE(_rate, _m, _p, _s, _k)			\
> +#define PLL_36XX_RATE(_fin, _rate, _m, _p, _s, _k)		\
>  	{							\
> -		.rate	=	(_rate),				\
> +		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
> +				_m, _p, _s, _k, 16),		\
>  		.mdiv	=	(_m),				\
>  		.pdiv	=	(_p),				\
>  		.sdiv	=	(_s),				\
>  		.kdiv	=	(_k),				\
>  	}
>  
> -#define PLL_45XX_RATE(_rate, _m, _p, _s, _afc)			\
> +#define PLL_45XX_RATE(_fin, _rate, _m, _p, _s, _afc)		\
>  	{							\
> -		.rate	=	(_rate),			\
> +		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
> +				_m, _p, _s - 1, 0, 16),		\

In clk-exynos4.c
PLL_45XX_RATE() is used for exynos4210_plls[apll] which is pll_4508 type.

In clk-pll.c,
Both pll_4502 and pll_4508 shares the samsung_pll45xx_recalc_rate()
which is samsung_pll45xx_clk_ops.recalc_rate().

The samsung_pll45xx_recalc_rate() contains the following if statement.
	if (pll->type == pll_4508)
		sdiv = sdiv - 1;

It means that following 's - 1' is not valid for 'pll_4502'.
> +				_m, _p, _s - 1, 0, 16),		\

Even if there are not any use-case of PLL_45XX_RATE for pll_4502 type,
you need to use the correct name as following.
- PLL_45XX_RATE() -> PLL_4508_RATE()


>  		.mdiv	=	(_m),				\
>  		.pdiv	=	(_p),				\
>  		.sdiv	=	(_s),				\
>  		.afc	=	(_afc),				\
>  	}
>  
> -#define PLL_4600_RATE(_rate, _m, _p, _s, _k, _vsel)		\
> +#define PLL_4600_RATE(_fin, _rate, _m, _p, _s, _k, _vsel)	\
>  	{							\
> -		.rate	=	(_rate),			\
> +		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
> +				_m, _p, _s, _k, 16),		\
>  		.mdiv	=	(_m),				\
>  		.pdiv	=	(_p),				\
>  		.sdiv	=	(_s),				\
> @@ -77,9 +104,10 @@ enum samsung_pll_type {
>  		.vsel	=	(_vsel),			\
>  	}
>  
> -#define PLL_4650_RATE(_rate, _m, _p, _s, _k, _mfr, _mrr, _vsel)	\
> +#define PLL_4650_RATE(_fin, _rate, _m, _p, _s, _k, _mfr, _mrr, _vsel) \
>  	{							\
> -		.rate	=	(_rate),			\
> +		.rate	=	PLL_VALID_RATE(_fin, _rate,	\
> +				_m, _p, _s, _k, 10),		\
>  		.mdiv	=	(_m),				\
>  		.pdiv	=	(_p),				\
>  		.sdiv	=	(_s),				\
> diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
> index d8e58a659467..0c6aa3e51336 100644
> --- a/drivers/clk/samsung/clk-s3c2410.c
> +++ b/drivers/clk/samsung/clk-s3c2410.c
> @@ -162,34 +162,34 @@ struct samsung_clock_alias s3c2410_common_aliases[] __initdata = {
>  static struct samsung_pll_rate_table pll_s3c2410_12mhz_tbl[] __initdata = {
>  	/* sorted in descending order */
>  	/* 2410A extras */
> -	PLL_35XX_RATE(270000000, 127, 1, 1),
> -	PLL_35XX_RATE(268000000, 126, 1, 1),
> -	PLL_35XX_RATE(266000000, 125, 1, 1),
> -	PLL_35XX_RATE(226000000, 105, 1, 1),
> -	PLL_35XX_RATE(210000000, 132, 2, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 270000000, 127, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 268000000, 126, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 266000000, 125, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 226000000, 105, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 210000000, 132, 2, 1),
>  	/* 2410 common */
> -	PLL_35XX_RATE(202800000, 161, 3, 1),
> -	PLL_35XX_RATE(192000000, 88, 1, 1),
> -	PLL_35XX_RATE(186000000, 85, 1, 1),
> -	PLL_35XX_RATE(180000000, 82, 1, 1),
> -	PLL_35XX_RATE(170000000, 77, 1, 1),
> -	PLL_35XX_RATE(158000000, 71, 1, 1),
> -	PLL_35XX_RATE(152000000, 68, 1, 1),
> -	PLL_35XX_RATE(147000000, 90, 2, 1),
> -	PLL_35XX_RATE(135000000, 82, 2, 1),
> -	PLL_35XX_RATE(124000000, 116, 1, 2),
> -	PLL_35XX_RATE(118500000, 150, 2, 2),
> -	PLL_35XX_RATE(113000000, 105, 1, 2),
> -	PLL_35XX_RATE(101250000, 127, 2, 2),
> -	PLL_35XX_RATE(90000000, 112, 2, 2),
> -	PLL_35XX_RATE(84750000, 105, 2, 2),
> -	PLL_35XX_RATE(79000000, 71, 1, 2),
> -	PLL_35XX_RATE(67500000, 82, 2, 2),
> -	PLL_35XX_RATE(56250000, 142, 2, 3),
> -	PLL_35XX_RATE(48000000, 120, 2, 3),
> -	PLL_35XX_RATE(50700000, 161, 3, 3),
> -	PLL_35XX_RATE(45000000, 82, 1, 3),
> -	PLL_35XX_RATE(33750000, 82, 2, 3),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 202800000, 161, 3, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 192000000, 88, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 186000000, 85, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 180000000, 82, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 170000000, 77, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 158000000, 71, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 152000000, 68, 1, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 147000000, 90, 2, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 135000000, 82, 2, 1),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 124000000, 116, 1, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 118500000, 150, 2, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 113000000, 105, 1, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 101250000, 127, 2, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 90000000, 112, 2, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 84750000, 105, 2, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 79000000, 71, 1, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 67500000, 82, 2, 2),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 56250000, 142, 2, 3),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 48000000, 120, 2, 3),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 50700000, 161, 3, 3),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 45000000, 82, 1, 3),
> +	PLL_S3C2410_MPLL_RATE(12 * MHZ, 33750000, 82, 2, 3),
>  	{ /* sentinel */ },
>  };
>  
> @@ -229,33 +229,33 @@ struct samsung_clock_alias s3c2410_aliases[] __initdata = {
>  
>  static struct samsung_pll_rate_table pll_s3c244x_12mhz_tbl[] __initdata = {
>  	/* sorted in descending order */
> -	PLL_35XX_RATE(400000000, 0x5c, 1, 1),
> -	PLL_35XX_RATE(390000000, 0x7a, 2, 1),
> -	PLL_35XX_RATE(380000000, 0x57, 1, 1),
> -	PLL_35XX_RATE(370000000, 0xb1, 4, 1),
> -	PLL_35XX_RATE(360000000, 0x70, 2, 1),
> -	PLL_35XX_RATE(350000000, 0xa7, 4, 1),
> -	PLL_35XX_RATE(340000000, 0x4d, 1, 1),
> -	PLL_35XX_RATE(330000000, 0x66, 2, 1),
> -	PLL_35XX_RATE(320000000, 0x98, 4, 1),
> -	PLL_35XX_RATE(310000000, 0x93, 4, 1),
> -	PLL_35XX_RATE(300000000, 0x75, 3, 1),
> -	PLL_35XX_RATE(240000000, 0x70, 1, 2),
> -	PLL_35XX_RATE(230000000, 0x6b, 1, 2),
> -	PLL_35XX_RATE(220000000, 0x66, 1, 2),
> -	PLL_35XX_RATE(210000000, 0x84, 2, 2),
> -	PLL_35XX_RATE(200000000, 0x5c, 1, 2),
> -	PLL_35XX_RATE(190000000, 0x57, 1, 2),
> -	PLL_35XX_RATE(180000000, 0x70, 2, 2),
> -	PLL_35XX_RATE(170000000, 0x4d, 1, 2),
> -	PLL_35XX_RATE(160000000, 0x98, 4, 2),
> -	PLL_35XX_RATE(150000000, 0x75, 3, 2),
> -	PLL_35XX_RATE(120000000, 0x70, 1, 3),
> -	PLL_35XX_RATE(110000000, 0x66, 1, 3),
> -	PLL_35XX_RATE(100000000, 0x5c, 1, 3),
> -	PLL_35XX_RATE(90000000, 0x70, 2, 3),
> -	PLL_35XX_RATE(80000000, 0x98, 4, 3),
> -	PLL_35XX_RATE(75000000, 0x75, 3, 3),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 400000000, 0x5c, 1, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 390000000, 0x7a, 2, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 380000000, 0x57, 1, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 370000000, 0xb1, 4, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 360000000, 0x70, 2, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 350000000, 0xa7, 4, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 340000000, 0x4d, 1, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 330000000, 0x66, 2, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 320000000, 0x98, 4, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 310000000, 0x93, 4, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 300000000, 0x75, 3, 1),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 240000000, 0x70, 1, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 230000000, 0x6b, 1, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 220000000, 0x66, 1, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 210000000, 0x84, 2, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 200000000, 0x5c, 1, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 190000000, 0x57, 1, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 180000000, 0x70, 2, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 170000000, 0x4d, 1, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 160000000, 0x98, 4, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 150000000, 0x75, 3, 2),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 120000000, 0x70, 1, 3),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 110000000, 0x66, 1, 3),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 100000000, 0x5c, 1, 3),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 90000000, 0x70, 2, 3),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 80000000, 0x98, 4, 3),
> +	PLL_S3C2440_MPLL_RATE(12 * MHZ, 75000000, 0x75, 3, 3),
>  	{ /* sentinel */ },
>  };
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
