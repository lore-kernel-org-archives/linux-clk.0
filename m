Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267828;
	b=C1jZ3yAQorqMTfgpvkzYwPcdkV53jRLGyT5OkvE5IgFYFpYZG0rzT77oMHpzoFcGPKsN
	 HIfoaJx7EAOBnKYHWMtodr2tgy8NW+OYlczp1tyR+EXNUiNMpKaR/Ar+A6cjmUxp6aXWa
	 B+6bNzS5mW3QDZsU5//UhZWN2Egk0hqBCxgYUM2wh9JDmYlUrE2G1MZtImy7nPqoDWM21
	 6xTKB8u0ehLUfrpznjmoLMDyZf9jqtlNJD9IyjWf4VQko6Mf6fsi6qBxTUseyTR/tmf3t
	 dK3p4mL5aRjd2Z7EyQ7F9Dfs0dv33ZkFLI1FNzSgs4if5DNOrpUFaYNihHLX2n9u/cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FL2eR8EYUTXDFliIvq3+r6VI7BGzi6yXCZSbMiEvJYo=;
	b=B8AqCK1YcR3EnJOP31e0578mTJaStNoGb6P3qSIKr2KLRESXK4+vQ1w0Rev3Knf8kmXl
	 h142r1Cxx28v+DbnUrIgkRRJ/flsptaI/ALo9sujPWjc80zMhN0K2gJY/AX+0FzUOEbZb
	 ltr6sRmSxS+6TGhZcIJ3ujVEQ2D+3SFeI1HmI4vnOcF6XNHm9hNrWKz4yZV4pMw/Nez4Q
	 iw5QKaPaB6KMn2NaoH72KfzZLcdouNOMY+PDcNyfQspvMy1klf4E5xkGtKbRJE2l6yGR7
	 wTW0KDCUcRpRujgkQiD2mvM2FbbM0tz+jvnOgwnu1g+TCcjtTo1o7/nH46/EU6DC3ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VfeDA2nt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B2606A33A;
	Thu, 29 Oct 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VfeDA2nt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFDA1F01829;
	Thu, 29 Oct 2026 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267828;
	bh=FL2eR8EYUTXDFliIvq3+r6VI7BGzi6yXCZSbMiEvJYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VfeDA2ntD2A6A8rVIMHLYdB0UD35qsrcpyzddVxVd3eziYxFDYS6KsSG4gmR9DSUU
	 yQEekc0zu8o/YdXb+xpL1oYtBRhQblENp7EpQ9CsiP/dWLwNqHvtaj8NHh6+rCTpbz
	 0nomhn026dGIzHyV4+Lq3thfTvCIAVvRoidmh4xGqcbdkQer8ewjLGO3Hj+hJJhqwk
	 n8gUV/7+ehMOPQIKMe5aIrcdmZSvPJrLwLbAKC3lnGaVY39XnKtMOzas4wSxsfLumN
	 CAb0LCXy+FIFsqpWtlCqH8AF7XrQuMsVRn7vNY/zV8DNVr70/HCtx7KEFBWetMuVe9
	 wsj8nA2C02D2w==
Message-ID: <sashiko-outbox-189074@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu" <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 09:57:07 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] clk: meson: pll: CLK_SET_RATE_PARENT on ro_ops PLL DCOs breaks rat=
e rounding
- [High] clk: meson: pll: meson_clk_get_pll_table() fails on non-exact mult=
ipliers
- [High] clk: meson: meson8b: missing CLK_SET_RATE_PARENT on hdmi_pll_dco_in
- [High] clk: meson: pll: cached 0 Hz pre-divider rate on directly programm=
ed PLLs
--

commit b0439d678a94dfead2cca909902c6363ae03f5d0
Author: Jian Hu <jian.hu@amlogic.com>

clk: meson: pll: Remove the dedicated n parameter

This commit removes the dedicated pre-divider (n) field from
struct meson_clk_pll_data and simplifies the Meson PLL rate calculation.
Each PLL pre-divider is instead modeled as a standalone divider clock that
serves as the parent of the PLL DCO clock.

> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 280842e9cb371..e6e6b9a8030c0 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c

[ ... ]

> @@ -202,10 +240,11 @@ static struct clk_regmap axg_sys_pll_dco =3D {
>  	.hw.init =3D &(struct clk_init_data){
>  		.name =3D "sys_pll_dco",
>  		.ops =3D &meson_clk_pll_ro_ops,
> -		.parent_data =3D &(const struct clk_parent_data) {
> -			.fw_name =3D "xtal",
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&axg_sys_prediv.hw
>  		},
>  		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };

[Severity: High]
Does setting CLK_SET_RATE_PARENT on a clock using meson_clk_pll_ro_ops break
rate rounding and rate calculation in the common clock framework?

meson_clk_pll_ro_ops only provides .init, .recalc_rate, and .is_enabled, and
does not implement .determine_rate or .round_rate, so clk_core_can_round() =
is
false.

In drivers/clk/clk.c, clk_core_round_rate_nolock() checks:

	if (clk_core_can_round(core))
		return core->ops->determine_rate(core->hw, req);
	else if (core->flags & CLK_SET_RATE_PARENT)
		return clk_core_round_rate_nolock(core->parent, req);

When CLK_SET_RATE_PARENT is set on a clock that cannot round its own rate,
clk_core_round_rate_nolock() and clk_calc_new_rates() treat the clock as a
1:1 pass-through of its parent and set the rate to the parent pre-divider
rate (24 MHz or 48 MHz) instead of the multi-GHz DCO frequency.

This affects child dividers with CLK_SET_RATE_PARENT when consumer drivers
call clk_round_rate() or clk_set_rate(). The same pattern is also added on:

  - sm1_gp1_pll_dco and g12a_hdmi_pll_dco in drivers/clk/meson/g12a.c
  - gxbb_hdmi_pll_dco, gxl_hdmi_pll_dco, and gxbb_sys_pll_dco in
    drivers/clk/meson/gxbb.c
  - s4_fixed_pll_dco in drivers/clk/meson/s4-pll.c

Should these meson_clk_pll_ro_ops DCO clocks omit CLK_SET_RATE_PARENT (and
use clk_regmap_divider_ro_ops for their pre-dividers)?

> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f3..a7e3f8c8eb783 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c

[ ... ]

> +static int meson_clk_get_pll_table(unsigned long rate,
> +				   unsigned long parent_rate,
> +				   unsigned int *m,
> +				   struct meson_clk_pll_data *pll)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0, ret =3D 0; !ret; i++) {
> +		if (!pll->table[i].m)
> +			return -EINVAL;
> +
> +		if (pll->table[i].m =3D=3D rate / parent_rate) {
> +			*m =3D pll->table[i].m;
> +			return 0;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: High]
What happens in meson_clk_get_pll_table() when rate / parent_rate does not
exactly match an entry in pll->table?

Previously, meson_clk_get_pll_settings() iterated over pll->table and used
meson_clk_pll_is_better() to pick either the closest entry (when
__pll_round_closest_mult(pll) was true) or the largest table entry with a
rate less than or equal to the requested rate.

With this change, meson_clk_get_pll_table() requires an exact match for
rate / parent_rate and returns -EINVAL otherwise:

1. Sparse multiplier tables such as sys_pll_params_table (which has a gap
   between m =3D 68 and m =3D 84 where Meson8 CPU OPPs at 1800 MHz and 1992=
 MHz
   fall) and meson8b_hdmi_pll_params_table in drivers/clk/meson/meson8b.c
   will fail with -EINVAL in meson_clk_pll_determine_rate() and
   meson_clk_pll_set_rate() when rate / parent_rate lands in a gap.

2. Unlike meson_clk_get_pll_range(), which clamps to min and max and returns
   -ENODATA, meson_clk_get_pll_table() returns -EINVAL when rate / parent_r=
ate
   is below the minimum or above the maximum multiplier in the table. When a
   child post-divider runs clk_divider_bestdiv(), any candidate rate * i
   outside the table range fails, and the fallback clk_hw_round_rate(parent=
, 1)
   also fails with -EINVAL because 1 / parent_rate is 0, causing
   clk_round_rate() to return 0 Hz.

3. meson_clk_get_pll_table() no longer checks __pll_round_closest_mult(pll)
   (for example on axg_hifi_pll_dco when fractional mode is not used), and
   leaves ret unmodified in the loop with an unreachable return 0 at the en=
d.

Should meson_clk_get_pll_table() retain the best-match and clamping behavior
from meson_clk_get_pll_settings()?

> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index bc029c6ab622d..0c9ba079bc51a 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c

[ ... ]

> @@ -185,15 +209,38 @@ static struct clk_regmap meson8b_fixed_pll =3D {
>  	},
>  };
> =20
> +static const struct clk_div_table meson8b_prediv_div_table[] =3D {
> +	{ .val =3D 1, .div =3D 1 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap meson8b_hdmi_prediv =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +		.offset =3D HHI_VID_PLL_CNTL,
> +		.shift   =3D 10,
> +		.width   =3D 5,
> +		.table =3D meson8b_prediv_div_table,
> +		.flags =3D CLK_DIVIDER_INVALID_ZERO,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "hdmi_prediv",
> +		.ops =3D &clk_regmap_divider_ops,
> +		.parent_data =3D &(const struct clk_parent_data) {
> +			.fw_name =3D "xtal",
> +			.index =3D -1,
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
>  static struct clk_fixed_factor hdmi_pll_dco_in =3D {
>  	.mult =3D 2,
>  	.div =3D 1,
>  	.hw.init =3D &(struct clk_init_data){
>  		.name =3D "hdmi_pll_dco_in",
>  		.ops =3D &clk_fixed_factor_ops,
> -		.parent_data =3D &(const struct clk_parent_data) {
> -			.fw_name =3D "xtal",
> -			.index =3D -1,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&meson8b_hdmi_prediv.hw
>  		},
>  		.num_parents =3D 1,
>  	},

[ ... ]

> @@ -279,6 +321,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco =3D {
>  			&hdmi_pll_dco_in.hw
>  		},
>  		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };

[Severity: High]
Can rate requests from meson8b_hdmi_pll_dco reach meson8b_hdmi_prediv witho=
ut
CLK_SET_RATE_PARENT on hdmi_pll_dco_in?

meson8b_hdmi_pll_dco has hdmi_pll_dco_in as its parent, and hdmi_pll_dco_in
has meson8b_hdmi_prediv as its parent:

  meson8b_hdmi_prediv -> hdmi_pll_dco_in -> meson8b_hdmi_pll_dco

Because hdmi_pll_dco_in does not set CLK_SET_RATE_PARENT, when
meson8b_hdmi_prediv resets to 0 and reports a 0 Hz rate via
CLK_DIVIDER_INVALID_ZERO, meson_clk_pll_determine_rate() calls
clk_hw_round_rate() on hdmi_pll_dco_in, and clk_factor_determine_rate()
returns 0 without rounding meson8b_hdmi_prediv.

This causes meson_clk_pll_determine_rate() to return -EINVAL and prevents
clk_calc_new_rates() from propagating rate changes to program
meson8b_hdmi_prediv. Should hdmi_pll_dco_in also have
.flags =3D CLK_SET_RATE_PARENT?

> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
> index 0a622f45fa368..28d563fcb1bd2 100644
> --- a/drivers/clk/meson/t7-pll.c
> +++ b/drivers/clk/meson/t7-pll.c

[ ... ]

> @@ -292,6 +346,24 @@ static struct clk_regmap t7_hifi_pll =3D {
>  	},
>  };
> =20
> +static struct clk_regmap t7_pcie_prediv =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +		.offset =3D PCIEPLL_CTRL0,
> +		.shift =3D 10,
> +		.width =3D 5,
> +		.table =3D t7_prediv_div_table,
> +		.flags =3D CLK_DIVIDER_INVALID_ZERO,
> +	},
> +	.hw.init =3D &(struct clk_init_data) {
> +		.name =3D "pcie_prediv",
> +		.ops =3D &clk_regmap_divider_ops,
> +		.parent_data =3D &(const struct clk_parent_data) {
> +			.fw_name =3D "in0",
> +		},
> +		.num_parents =3D 1,
> +	},
> +};

[ ... ]

> @@ -345,10 +412,11 @@ static struct clk_regmap t7_pcie_pll_dco =3D {
>  	.hw.init =3D &(struct clk_init_data){
>  		.name =3D "pcie_pll_dco",
>  		.ops =3D &meson_clk_pcie_pll_ops,
> -		.parent_data =3D &(const struct clk_parent_data) {
> -			.fw_name =3D "in0",
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_pcie_prediv.hw
>  		},
>  		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
>  	},
>  };

[Severity: High]
Will t7_pcie_prediv (as well as g12a_hdmi_prediv, gxbb_hdmi_prediv, and
gxl_hdmi_prediv) remain stuck at a cached rate of 0 Hz if the hardware
pre-divider field is 0 at clock registration time?

t7_pcie_pll_dco uses meson_clk_pcie_pll_ops and defines neither .table nor
.range; it only programs PCIEPLL_CTRL0 (including N =3D 1) inside
meson_clk_pcie_pll_enable(). If PCIEPLL_CTRL0 has N =3D 0 at registration,
t7_pcie_prediv caches a rate of 0 Hz via CLK_DIVIDER_INVALID_ZERO. Because
clk_set_rate() cannot be used on t7_pcie_pll_dco (meson_clk_get_pll_max_mul=
tiplier()
returns 0 when neither .range nor .table is set) and t7_pcie_prediv does not
have CLK_GET_RATE_NOCACHE, t7_pcie_prediv->rate is never recalculated after
meson_clk_pcie_pll_enable() writes PCIEPLL_CTRL0.

Similarly, in drivers/clk/meson/g12a.c (g12a_hdmi_prediv) and
drivers/clk/meson/gxbb.c (gxbb_hdmi_prediv and gxl_hdmi_prediv), the HDMI P=
LL
registers are written directly by the DRM driver in
drivers/gpu/drm/meson/meson_vclk.c rather than through clk_set_rate(). While
hdmi_pll_dco has CLK_GET_RATE_NOCACHE, clk_core_get_rate_recalc() only
recalculates downward from the clock with CLK_GET_RATE_NOCACHE using
core->parent->rate. Because the parent hdmi_prediv clocks lack
CLK_GET_RATE_NOCACHE, their cached rate stays 0 Hz even after the display
driver programs N =3D 1, causing meson_clk_pll_recalc_rate() on hdmi_pll_dc=
o to
return 0 Hz.

Should pre-dividers whose registers are programmed outside clk_set_rate() be
marked with CLK_GET_RATE_NOCACHE?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-meson_refa=
ctor_n-v2-0-ff4ac74e527b@amlogic.com?part=3D3
