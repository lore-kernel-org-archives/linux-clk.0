Return-Path: <andre.przywara@arm.com>
Subject: Re: [PATCH 2/5] clk: sunxi: Make clocks setup functions take const
 pointer
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
   Mike Turquette <mturquette@baylibre.com>,
   Stephen Boyd
 <sboyd@codeaurora.org>, Emilio Lopez <emilio@elopez.com.ar>,
   heiko@sntech.de, Chen-Yu Tsai <wens@csie.org>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-3-git-send-email-maxime.ripard@free-electrons.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Andre Przywara <andre.przywara@arm.com>
Message-ID: <56B09CF8.2020801@arm.com>
Date: Tue, 2 Feb 2016 12:11:36 +0000
MIME-Version: 1.0
In-Reply-To: <1454402834-6385-3-git-send-email-maxime.ripard@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 02/02/16 08:47, Maxime Ripard wrote:
> All the data structure that we pass to the clocks setup functions are
> declared const, while our setup functions expects a regular pointer. This
> was hidden by the fact that we cast a void * pointer back to these
> structures, which made it go unnoticed.
> 
> Fix the functions prototype.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre.

> ---
>  drivers/clk/sunxi/clk-sunxi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 67ef94948544..a3d706f5b21c 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -616,7 +616,7 @@ static const struct mux_data sun8i_h3_ahb2_mux_data __initconst = {
>  };
>  
>  static struct clk * __init sunxi_mux_clk_setup(struct device_node *node,
> -					       struct mux_data *data)
> +					       const struct mux_data *data)
>  {
>  	struct clk *clk;
>  	const char *clk_name = node->name;
> @@ -700,7 +700,7 @@ static const struct div_data sun4i_apb0_data __initconst = {
>  };
>  
>  static void __init sunxi_divider_clk_setup(struct device_node *node,
> -					   struct div_data *data)
> +					   const struct div_data *data)
>  {
>  	struct clk *clk;
>  	const char *clk_name = node->name;
> @@ -810,7 +810,7 @@ static const struct divs_data sun6i_a31_pll6_divs_data __initconst = {
>   */
>  
>  static struct clk ** __init sunxi_divs_clk_setup(struct device_node *node,
> -						 struct divs_data *data)
> +						 const struct divs_data *data)
>  {
>  	struct clk_onecell_data *clk_data;
>  	const char *parent;
> 
