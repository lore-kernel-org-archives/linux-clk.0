Return-Path: <cw00.choi@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5A8A6E7E.4040009@samsung.com>
Date: Mon, 19 Feb 2018 15:28:14 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kukjin
	Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "moderated
 list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open
 list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] clk: samsung: exynos7: fix PLL rates
In-reply-to: <20180216145754.14428-6-a.hajda@samsung.com>
References: <20180216145754.14428-1-a.hajda@samsung.com>
	<CGME20180216145806eucas1p1e939d3138e29d3446df90e1a69ea9624@eucas1p1.samsung.com>
	<20180216145754.14428-6-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 2018년 02월 16일 23:57, Andrzej Hajda wrote:
> Rates declared in PLL rate tables should match exactly rates calculated
> from PLL coefficients. If that is not the case, rate of parent might be being
> set not as expected. For instance, if in the PLL rates table we have
> a 393216000 Hz entry and the real value as returned by the PLL's recalc_rate
> callback is 393216003, after setting PLL's clk rate to 393216000 clk_get_rate
> will return 393216003. If we now attempt to set rate of a PLL's child divider
> clock to 393216000/2 its rate will be 131072001, rather than 196608000.
> That is the divider will be set to 3 instead of 2, because 393216003/2 is
> greater than 196608000.
> 
> To fix this issue declared rates are changed to exactly match rates generated
> by a PLL, as calculated from the P, M, S, K coefficients.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index 5931a4140c3d..bbfa57b4e017 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -140,7 +140,7 @@ static const struct samsung_div_clock topc_div_clks[] __initconst = {
>  };
>  
>  static const struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initconst = {
> -	PLL_36XX_RATE(491520000, 20, 1, 0, 31457),
> +	PLL_36XX_RATE(491519897, 20, 1, 0, 31457),
>  	{},
>  };
>  
> 

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
