Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 31 Jul 2015 20:46:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chao Xie <chao.xie@marvell.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Javier Martinez Canillas <javier.martinez@collabora.co.uk>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Emilio =?UTF-8?B?TMOz?= =?UTF-8?B?cGV6?= <emilio@elopez.com.ar>,
	Tero Kristo <t-kristo@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 02/26] clk: Replace __clk_get_num_parents with
 clk_hw_get_num_parents()
Message-ID: <20150731204604.1d0b753b@bbrezillon>
In-Reply-To: <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	<1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, 31 Jul 2015 10:03:42 -0700
Stephen Boyd <sboyd@codeaurora.org> wrote:

> Mostly converted with the following semantic patch:
> 
> @@
> struct clk_hw *E;
> @@
> 
> -__clk_get_num_parents(E->clk)
> +clk_hw_get_num_parents(E)
> 
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> Cc: Chao Xie <chao.xie@marvell.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: "Emilio López" <emilio@elopez.com.ar>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/at91/clk-programmable.c    | 2 +-
>  drivers/clk/at91/clk-usb.c             | 2 +-
>  drivers/clk/clk-composite.c            | 2 +-
>  drivers/clk/clk-mux.c                  | 2 +-
>  drivers/clk/mmp/clk-mix.c              | 8 ++++----
>  drivers/clk/qcom/clk-rcg.c             | 4 ++--
>  drivers/clk/qcom/clk-rcg2.c            | 2 +-
>  drivers/clk/qcom/common.c              | 2 +-
>  drivers/clk/qcom/mmcc-msm8960.c        | 2 +-
>  drivers/clk/samsung/clk-s3c2410-dclk.c | 2 +-
>  drivers/clk/shmobile/clk-div6.c        | 4 ++--
>  drivers/clk/sunxi/clk-factors.c        | 2 +-
>  drivers/clk/sunxi/clk-sun6i-ar100.c    | 2 +-
>  drivers/clk/sunxi/clk-sunxi.c          | 2 +-
>  drivers/clk/ti/mux.c                   | 2 +-
>  15 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
> index ce9c3b9d00f2..42ec812404ab 100644
> --- a/drivers/clk/at91/clk-programmable.c
> +++ b/drivers/clk/at91/clk-programmable.c
> @@ -64,7 +64,7 @@ static int clk_programmable_determine_rate(struct clk_hw *hw,
>  	int shift;
>  	int i;
>  
> -	for (i = 0; i < __clk_get_num_parents(hw->clk); i++) {
> +	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
>  		parent = clk_get_parent_by_index(hw->clk, i);
>  		if (!parent)
>  			continue;
> diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
> index 1fdf0e33545d..82dce8f2e03b 100644
> --- a/drivers/clk/at91/clk-usb.c
> +++ b/drivers/clk/at91/clk-usb.c
> @@ -66,7 +66,7 @@ static int at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
>  	int tmp_diff;
>  	int i;
>  
> -	for (i = 0; i < __clk_get_num_parents(hw->clk); i++) {
> +	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
>  		int div;
>  
>  		parent = clk_get_parent_by_index(hw->clk, i);
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index 35ac062d7df6..7835cc4d1cf9 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -92,7 +92,7 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
>  			return 0;
>  		}
>  
> -		for (i = 0; i < __clk_get_num_parents(mux_hw->clk); i++) {
> +		for (i = 0; i < clk_hw_get_num_parents(mux_hw); i++) {
>  			parent = clk_get_parent_by_index(mux_hw->clk, i);
>  			if (!parent)
>  				continue;
> diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> index 33c09a3bfa51..7129c86a79db 100644
> --- a/drivers/clk/clk-mux.c
> +++ b/drivers/clk/clk-mux.c
> @@ -31,7 +31,7 @@
>  static u8 clk_mux_get_parent(struct clk_hw *hw)
>  {
>  	struct clk_mux *mux = to_clk_mux(hw);
> -	int num_parents = __clk_get_num_parents(hw->clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	u32 val;
>  
>  	/*
> diff --git a/drivers/clk/mmp/clk-mix.c b/drivers/clk/mmp/clk-mix.c
> index 665cb6794639..8653e555c920 100644
> --- a/drivers/clk/mmp/clk-mix.c
> +++ b/drivers/clk/mmp/clk-mix.c
> @@ -63,7 +63,7 @@ static unsigned int _get_div(struct mmp_clk_mix *mix, unsigned int val)
>  
>  static unsigned int _get_mux(struct mmp_clk_mix *mix, unsigned int val)
>  {
> -	int num_parents = __clk_get_num_parents(mix->hw.clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	int i;
>  
>  	if (mix->mux_flags & CLK_MUX_INDEX_BIT)
> @@ -241,7 +241,7 @@ static int mmp_clk_mix_determine_rate(struct clk_hw *hw,
>  			}
>  		}
>  	} else {
> -		for (i = 0; i < __clk_get_num_parents(mix_clk); i++) {
> +		for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
>  			parent = clk_get_parent_by_index(mix_clk, i);
>  			parent_rate = __clk_get_rate(parent);
>  			div_val_max = _get_maxdiv(mix);
> @@ -408,13 +408,13 @@ static int mmp_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  		else
>  			return -EINVAL;
>  	} else {
> -		for (i = 0; i < __clk_get_num_parents(mix_clk); i++) {
> +		for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
>  			parent = clk_get_parent_by_index(mix_clk, i);
>  			parent_rate = __clk_get_rate(parent);
>  			if (parent_rate == best_parent_rate)
>  				break;
>  		}
> -		if (i < __clk_get_num_parents(mix_clk))
> +		if (i < clk_hw_get_num_parents(hw))
>  			return _set_rate(mix, _get_mux_val(mix, i),
>  					_get_div_val(mix, best_divisor), 1, 1);
>  		else
> diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
> index 2bc42bb21b3d..e5c60826b7a9 100644
> --- a/drivers/clk/qcom/clk-rcg.c
> +++ b/drivers/clk/qcom/clk-rcg.c
> @@ -45,7 +45,7 @@ static u32 src_to_ns(struct src_sel *s, u8 src, u32 ns)
>  static u8 clk_rcg_get_parent(struct clk_hw *hw)
>  {
>  	struct clk_rcg *rcg = to_clk_rcg(hw);
> -	int num_parents = __clk_get_num_parents(hw->clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	u32 ns;
>  	int i, ret;
>  
> @@ -72,7 +72,7 @@ static int reg_to_bank(struct clk_dyn_rcg *rcg, u32 bank)
>  static u8 clk_dyn_rcg_get_parent(struct clk_hw *hw)
>  {
>  	struct clk_dyn_rcg *rcg = to_clk_dyn_rcg(hw);
> -	int num_parents = __clk_get_num_parents(hw->clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	u32 ns, reg;
>  	int bank;
>  	int i, ret;
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index db3471eecfee..d1d24917c531 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -63,7 +63,7 @@ static int clk_rcg2_is_enabled(struct clk_hw *hw)
>  static u8 clk_rcg2_get_parent(struct clk_hw *hw)
>  {
>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
> -	int num_parents = __clk_get_num_parents(hw->clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	u32 cfg;
>  	int i, ret;
>  
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 34e60c552cea..2dedceefd21d 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -46,7 +46,7 @@ EXPORT_SYMBOL_GPL(qcom_find_freq);
>  
>  int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
>  {
> -	int i, num_parents = __clk_get_num_parents(hw->clk);
> +	int i, num_parents = clk_hw_get_num_parents(hw);
>  
>  	for (i = 0; i < num_parents; i++)
>  		if (src == map[i].src)
> diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
> index 70316a3a107d..97e98278c21a 100644
> --- a/drivers/clk/qcom/mmcc-msm8960.c
> +++ b/drivers/clk/qcom/mmcc-msm8960.c
> @@ -510,7 +510,7 @@ static int pix_rdi_set_parent(struct clk_hw *hw, u8 index)
>  	u32 val;
>  	struct clk_pix_rdi *rdi = to_clk_pix_rdi(hw);
>  	struct clk *clk = hw->clk;
> -	int num_parents = __clk_get_num_parents(hw->clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  
>  	/*
>  	 * These clocks select three inputs via two muxes. One mux selects
> diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
> index 71ebad941f86..e9eb935d7616 100644
> --- a/drivers/clk/samsung/clk-s3c2410-dclk.c
> +++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
> @@ -61,7 +61,7 @@ struct s3c24xx_clkout {
>  static u8 s3c24xx_clkout_get_parent(struct clk_hw *hw)
>  {
>  	struct s3c24xx_clkout *clkout = to_s3c24xx_clkout(hw);
> -	int num_parents = __clk_get_num_parents(hw->clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	u32 val;
>  
>  	val = readl_relaxed(S3C24XX_MISCCR) >> clkout->shift;
> diff --git a/drivers/clk/shmobile/clk-div6.c b/drivers/clk/shmobile/clk-div6.c
> index 6810bfb6ef5e..ee66f49812df 100644
> --- a/drivers/clk/shmobile/clk-div6.c
> +++ b/drivers/clk/shmobile/clk-div6.c
> @@ -133,7 +133,7 @@ static u8 cpg_div6_clock_get_parent(struct clk_hw *hw)
>  
>  	hw_index = (clk_readl(clock->reg) >> clock->src_shift) &
>  		   (BIT(clock->src_width) - 1);
> -	for (i = 0; i < __clk_get_num_parents(hw->clk); i++) {
> +	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
>  		if (clock->parents[i] == hw_index)
>  			return i;
>  	}
> @@ -149,7 +149,7 @@ static int cpg_div6_clock_set_parent(struct clk_hw *hw, u8 index)
>  	u8 hw_index;
>  	u32 mask;
>  
> -	if (index >= __clk_get_num_parents(hw->clk))
> +	if (index >= clk_hw_get_num_parents(hw))
>  		return -EINVAL;
>  
>  	mask = ~((BIT(clock->src_width) - 1) << clock->src_shift);
> diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
> index a650eae4cc49..574a3da33b58 100644
> --- a/drivers/clk/sunxi/clk-factors.c
> +++ b/drivers/clk/sunxi/clk-factors.c
> @@ -87,7 +87,7 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
>  	unsigned long parent_rate, best = 0, child_rate, best_child_rate = 0;
>  
>  	/* find the parent that can help provide the fastest rate <= rate */
> -	num_parents = __clk_get_num_parents(clk);
> +	num_parents = clk_hw_get_num_parents(hw);
>  	for (i = 0; i < num_parents; i++) {
>  		parent = clk_get_parent_by_index(clk, i);
>  		if (!parent)
> diff --git a/drivers/clk/sunxi/clk-sun6i-ar100.c b/drivers/clk/sunxi/clk-sun6i-ar100.c
> index 3a2ea010f148..3a9459197f9b 100644
> --- a/drivers/clk/sunxi/clk-sun6i-ar100.c
> +++ b/drivers/clk/sunxi/clk-sun6i-ar100.c
> @@ -47,7 +47,7 @@ static unsigned long ar100_recalc_rate(struct clk_hw *hw,
>  static int ar100_determine_rate(struct clk_hw *hw,
>  				struct clk_rate_request *req)
>  {
> -	int nparents = __clk_get_num_parents(hw->clk);
> +	int nparents = clk_hw_get_num_parents(hw);
>  	long best_rate = -EINVAL;
>  	int i;
>  
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 1c5b1369e8f3..76e07a19ad38 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -128,7 +128,7 @@ static int sun6i_ahb1_clk_determine_rate(struct clk_hw *hw,
>  	unsigned long parent_rate, best = 0, child_rate, best_child_rate = 0;
>  
>  	/* find the parent that can help provide the fastest rate <= rate */
> -	num_parents = __clk_get_num_parents(clk);
> +	num_parents = clk_hw_get_num_parents(hw);
>  	for (i = 0; i < num_parents; i++) {
>  		parent = clk_get_parent_by_index(clk, i);
>  		if (!parent)
> diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
> index 99fe27e8376b..69f08a1d047d 100644
> --- a/drivers/clk/ti/mux.c
> +++ b/drivers/clk/ti/mux.c
> @@ -31,7 +31,7 @@
>  static u8 ti_clk_mux_get_parent(struct clk_hw *hw)
>  {
>  	struct clk_mux *mux = to_clk_mux(hw);
> -	int num_parents = __clk_get_num_parents(hw->clk);
> +	int num_parents = clk_hw_get_num_parents(hw);
>  	u32 val;
>  
>  	/*



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
