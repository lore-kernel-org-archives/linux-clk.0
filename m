Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1524927694.28715.2.camel@baylibre.com>
Subject: Re: [PATCH meson-clk-next] clk: meson: meson8b: enable
 CLK_MESON_MPLL_ROUND_CLOSEST for all MPLLs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
	khilman@baylibre.com, linux-clk@vger.kernel.org
Date: Sat, 28 Apr 2018 17:01:34 +0200
In-Reply-To: <20180428132316.20108-1-martin.blumenstingl@googlemail.com>
References: <20180428132316.20108-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2018-04-28 at 15:23 +0200, Martin Blumenstingl wrote:
> Until recently the clk-mpll implementation always used
> DIV_ROUND_UP_ULL(). However, since commit 1b0e500dc606e9 ("clk: meson:
> mpll: add round closest support") the default was changed to round down
> the SDM divisor.
> This broke RGMII Ethernet on Meson8b (which uses MPLL2 as RGMII TX
> clock). With the old implementation the MPLL2 output was 249999701Hz,
> but with "round closest" disabled the output is 212500000Hz.

> 
> Enabling CLK_MESON_MPLL_ROUND_CLOSEST for all MPLL2 clocks on Meson8b
> fixes this because we now get the same 249999701Hz from MPLL2 as before.

It should either be rounding up or down, not down or 'more down'
I guess I need to revisit this series. In the mean time, I'll drop it.
Thanks for reporting the issue

> 
> Fixes: 1b0e500dc606e9 ("clk: meson: mpll: add round closest support")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index d0524ec71aad..2639a892a5d4 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -382,6 +382,7 @@ static struct clk_regmap meson8b_mpll0_div = {
>  			.width   = 1,
>  		},
>  		.lock = &meson_clk_lock,
> +		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mpll0_div",
> @@ -423,6 +424,7 @@ static struct clk_regmap meson8b_mpll1_div = {
>  			.width   = 9,
>  		},
>  		.lock = &meson_clk_lock,
> +		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mpll1_div",
> @@ -464,6 +466,7 @@ static struct clk_regmap meson8b_mpll2_div = {
>  			.width   = 9,
>  		},
>  		.lock = &meson_clk_lock,
> +		.flags = CLK_MESON_MPLL_ROUND_CLOSEST,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "mpll2_div",
