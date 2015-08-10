Return-Path: <Zdenko.Pulitika@imgtec.com>
From: Zdenko Pulitika <Zdenko.Pulitika@imgtec.com>
To: Govindraj Raja <Govindraj.Raja@imgtec.com>, "linux-mips@linux-mips.org"
	<linux-mips@linux-mips.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, "Michael
 Turquette" <mturquette@baylibre.com>
CC: Kevin Cernekee <cernekee@chromium.org>, Ralf Baechle
	<ralf@linux-mips.org>, Andrew Bresticker <abrestic@chromium.org>, "James
 Hartley" <James.Hartley@imgtec.com>, Damien Horsley
	<Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH v2 1/4] clk: pistachio: Fix 32bit integer overflows
Date: Mon, 10 Aug 2015 15:55:58 +0000
Message-ID: <E3EE94C54B0A8346A2210452C2C8281D288B1B8C@hhmail02.hh.imgtec.org>
References: <1438964413-18876-1-git-send-email-govindraj.raja@imgtec.com>
 <1438964413-18876-2-git-send-email-govindraj.raja@imgtec.com>
In-Reply-To: <1438964413-18876-2-git-send-email-govindraj.raja@imgtec.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Govindraj,

> -----Original Message-----
> From: Govindraj Raja
> Sent: 07 August 2015 17:20
> To: linux-mips@linux-mips.org; linux-clk@vger.kernel.org; Stephen Boyd;
> Michael Turquette
> Cc: Zdenko Pulitika; Kevin Cernekee; Ralf Baechle; Andrew Bresticker; Jam=
es
> Hartley; Govindraj Raja; Damien Horsley; James Hogan; Ezequiel Garcia;
> Govindraj Raja
> Subject: [PATCH v2 1/4] clk: pistachio: Fix 32bit integer overflows
>=20
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
>=20
> This commit fixes 32bit integer overflows throughout the pll driver (i.e.
> wherever the result of integer multiplication may exceed the range of u32=
).
>=20
> One of the functions affected by this problem is .recalc_rate. It returns
> incorrect rate for some pll settings (not for all though) which in turn r=
esults in
> the incorrect rate setup of pll's child clocks.
>=20
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> ---
>  drivers/clk/pistachio/clk-pll.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/clk/pistachio/clk-pll.c b/drivers/clk/pistachio/clk-=
pll.c index
> e17dada..68066ef 100644
> --- a/drivers/clk/pistachio/clk-pll.c
> +++ b/drivers/clk/pistachio/clk-pll.c
> @@ -88,12 +88,10 @@ static inline void pll_lock(struct pistachio_clk_pll =
*pll)
>  		cpu_relax();
>  }
>=20
> -static inline u32 do_div_round_closest(u64 dividend, u32 divisor)
> +static inline u64 do_div_round_closest(u64 dividend, u64 divisor)
>  {
>  	dividend +=3D divisor / 2;
> -	do_div(dividend, divisor);
> -
> -	return dividend;
> +	return div64_u64(dividend, divisor);
>  }
>=20
>  static inline struct pistachio_clk_pll *to_pistachio_pll(struct clk_hw *=
hw) @@ -
> 173,7 +171,7 @@ static int pll_gf40lp_frac_set_rate(struct clk_hw *hw,
> unsigned long rate,
>  	struct pistachio_clk_pll *pll =3D to_pistachio_pll(hw);
>  	struct pistachio_pll_rate_table *params;
>  	int enabled =3D pll_gf40lp_frac_is_enabled(hw);
> -	u32 val, vco, old_postdiv1, old_postdiv2;
> +	u64 val, vco, old_postdiv1, old_postdiv2;
>  	const char *name =3D __clk_get_name(hw->clk);
>=20
>  	if (rate < MIN_OUTPUT_FRAC || rate > MAX_OUTPUT_FRAC) @@ -
> 183,17 +181,17 @@ static int pll_gf40lp_frac_set_rate(struct clk_hw *hw,
> unsigned long rate,
>  	if (!params || !params->refdiv)
>  		return -EINVAL;
>=20
> -	vco =3D params->fref * params->fbdiv / params->refdiv;
> +	vco =3D div64_u64(params->fref * params->fbdiv, params->refdiv);
>  	if (vco < MIN_VCO_FRAC_FRAC || vco > MAX_VCO_FRAC_FRAC)
> -		pr_warn("%s: VCO %u is out of range %lu..%lu\n", name, vco,
> +		pr_warn("%s: VCO %llu is out of range %lu..%lu\n", name, vco,
>  			MIN_VCO_FRAC_FRAC, MAX_VCO_FRAC_FRAC);
>=20
> -	val =3D params->fref / params->refdiv;
> +	val =3D div64_u64(params->fref, params->refdiv);
>  	if (val < MIN_PFD)
> -		pr_warn("%s: PFD %u is too low (min %lu)\n",
> +		pr_warn("%s: PFD %llu is too low (min %lu)\n",
>  			name, val, MIN_PFD);
>  	if (val > vco / 16)
> -		pr_warn("%s: PFD %u is too high (max %u)\n",
> +		pr_warn("%s: PFD %llu is too high (max %llu)\n",
>  			name, val, vco / 16);
>=20
>  	val =3D pll_readl(pll, PLL_CTRL1);
> @@ -237,8 +235,7 @@ static unsigned long pll_gf40lp_frac_recalc_rate(stru=
ct
> clk_hw *hw,
>  						 unsigned long parent_rate)
>  {
>  	struct pistachio_clk_pll *pll =3D to_pistachio_pll(hw);
> -	u32 val, prediv, fbdiv, frac, postdiv1, postdiv2;
> -	u64 rate =3D parent_rate;
> +	u64 val, prediv, fbdiv, frac, postdiv1, postdiv2, rate;
>=20
>  	val =3D pll_readl(pll, PLL_CTRL1);
>  	prediv =3D (val >> PLL_CTRL1_REFDIV_SHIFT) &
> PLL_CTRL1_REFDIV_MASK; @@ -251,6 +248,7 @@ static unsigned long
> pll_gf40lp_frac_recalc_rate(struct clk_hw *hw,
>  		PLL_FRAC_CTRL2_POSTDIV2_MASK;
>  	frac =3D (val >> PLL_FRAC_CTRL2_FRAC_SHIFT) &
> PLL_FRAC_CTRL2_FRAC_MASK;
>=20
> +	rate =3D parent_rate;
>  	rate *=3D (fbdiv << 24) + frac;
>  	rate =3D do_div_round_closest(rate, (prediv * postdiv1 * postdiv2) << 2=
4);
>=20
> @@ -325,12 +323,12 @@ static int pll_gf40lp_laint_set_rate(struct clk_hw
> *hw, unsigned long rate,
>  	if (!params || !params->refdiv)
>  		return -EINVAL;
>=20
> -	vco =3D params->fref * params->fbdiv / params->refdiv;
> +	vco =3D div_u64(params->fref * params->fbdiv, params->refdiv);
>  	if (vco < MIN_VCO_LA || vco > MAX_VCO_LA)
>  		pr_warn("%s: VCO %u is out of range %lu..%lu\n", name, vco,
>  			MIN_VCO_LA, MAX_VCO_LA);
>=20
> -	val =3D params->fref / params->refdiv;
> +	val =3D div_u64(params->fref, params->refdiv);
>  	if (val < MIN_PFD)
>  		pr_warn("%s: PFD %u is too low (min %lu)\n",
>  			name, val, MIN_PFD);
> --
> 1.9.1

[Zdenko Pulitika] Reverting pll_rate_table members from 64 to 32 bit re-int=
roduces multiplication overflow issue.=20
We can either 1) keep 64bit members in pll_rate_table and forget about over=
flow or 2) have 32 bit members but
then we need to type cast them to u64 in every multiplication expression wh=
ich may overflow. In my opinion, first=20
solution is safer and nicer, 2nd will result in ugly typecasts throughout t=
he code and, more importantly, there's a=20
risk of overflow bug being repeated if somebody wishes to modify/upgrade th=
e existing code.=20
