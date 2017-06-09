Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: meson: gxbb: add all clk81 parents
To: Jerome Brunet <jbrunet@baylibre.com>
References: <20170608135545.31499-1-jbrunet@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <0fde1897-966f-45b0-91ef-0f8f0df62c5b@baylibre.com>
Date: Fri, 9 Jun 2017 11:55:32 +0200
MIME-Version: 1.0
In-Reply-To: <20170608135545.31499-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/08/2017 03:55 PM, Jerome Brunet wrote:
> Remove the FIXME on clk81 mux and add all the documented parents
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/gxbb.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 36c0e455437e..a897ea45327c 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -603,7 +603,11 @@ static struct meson_clk_mpll gxbb_mpll2 = {
>   * coordinated clock rates feature
>   */
>  
> -static u32 mux_table_clk81[]	= { 6, 5, 7 };
> +static u32 mux_table_clk81[]	= { 0, 2, 3, 4, 5, 6, 7 };
> +static const char * const clk81_parent_names[] = {
> +	"xtal", "fclk_div7", "mpll1", "mpll2", "fclk_div4",
> +	"fclk_div3", "fclk_div5"
> +};
>  
>  static struct clk_mux gxbb_mpeg_clk_sel = {
>  	.reg = (void *)HHI_MPEG_CLK_CNTL,
> @@ -616,13 +620,12 @@ static struct clk_mux gxbb_mpeg_clk_sel = {
>  		.name = "mpeg_clk_sel",
>  		.ops = &clk_mux_ro_ops,
>  		/*
> -		 * FIXME bits 14:12 selects from 8 possible parents:
> +		 * bits 14:12 selects from 8 possible parents:
>  		 * xtal, 1'b0 (wtf), fclk_div7, mpll_clkout1, mpll_clkout2,
>  		 * fclk_div4, fclk_div3, fclk_div5
>  		 */
> -		.parent_names = (const char *[]){ "fclk_div3", "fclk_div4",
> -			"fclk_div5" },
> -		.num_parents = 3,
> +		.parent_names = clk81_parent_names,
> +		.num_parents = ARRAY_SIZE(clk81_parent_names),
>  		.flags = (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
>  	},
>  };
> 

Should not harm.

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
