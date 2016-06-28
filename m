Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Subject: Re: [linux-sunxi] [PATCH 1/3] clk: sunxi: Add a driver for the CCU
References: <bfb8ceb4-5445-3f43-0a16-bd0e83f2af22@xff.cz>
To: moinejf@free.fr, Emilio Lopez <emilio@elopez.com.ar>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>
Message-ID: <536aa072-d110-1b08-fa25-72c1645e2459@xff.cz>
Date: Tue, 28 Jun 2016 21:31:06 +0200
MIME-Version: 1.0
In-Reply-To: <bfb8ceb4-5445-3f43-0a16-bd0e83f2af22@xff.cz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6284294562237358157=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6284294562237358157==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="60DsunVfurmCCoHNdLCFUt0LO5OR2gQMu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--60DsunVfurmCCoHNdLCFUt0LO5OR2gQMu
Content-Type: multipart/mixed; boundary="DOXF63OIpqsm1EVm7GuHaaoQFMbX6PksW"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>
To: moinejf@free.fr, Emilio Lopez <emilio@elopez.com.ar>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Message-ID: <536aa072-d110-1b08-fa25-72c1645e2459@xff.cz>
Subject: Re: [linux-sunxi] [PATCH 1/3] clk: sunxi: Add a driver for the CCU
References: <bfb8ceb4-5445-3f43-0a16-bd0e83f2af22@xff.cz>
In-Reply-To: <bfb8ceb4-5445-3f43-0a16-bd0e83f2af22@xff.cz>

--DOXF63OIpqsm1EVm7GuHaaoQFMbX6PksW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 28.6.2016 17:37, Jean-Francois Moine wrote:
> Most of the clocks in the Allwinner's SoCs are configured in the CCU
> (Clock Configuration Unit).
>=20
> The PLL clocks are driven from the main clock. Their rates are controll=
ed
> by a set of multiply and divide factors, named from the Allwinner's
> documentation:
> - multipliers: 'n' and 'k'
> - dividers: 'd1', 'd2', 'm' and 'p'
>=20
> The peripheral clocks may receive their inputs from one or more parents=
,
> thanks to a mux. Their rates are controlled by a set of divide factors
> only, named 'm' and 'p'.
>=20
> This driver also handles:
> - fixed clocks,
> - the phase delays for the MMCs,
> - the clock gates,
> - the bus gates,
> - and the resets.
>=20
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
>  drivers/clk/sunxi/Makefile |   2 +
>  drivers/clk/sunxi/ccu.c    | 980 +++++++++++++++++++++++++++++++++++++=
++++++++
>  drivers/clk/sunxi/ccu.h    | 153 +++++++
>  3 files changed, 1135 insertions(+)
>  create mode 100644 drivers/clk/sunxi/ccu.c
>  create mode 100644 drivers/clk/sunxi/ccu.h
>=20
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 39d2044..b8ca3e2 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -26,3 +26,5 @@ obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun9i-cpus.o
>  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
>  	clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
>  	clk-sun8i-apb0.o
> +
> +obj-y +=3D ccu.o
> diff --git a/drivers/clk/sunxi/ccu.c b/drivers/clk/sunxi/ccu.c
> new file mode 100644
> index 0000000..5749f9c
> --- /dev/null
> +++ b/drivers/clk/sunxi/ccu.c
> @@ -0,0 +1,980 @@
> +/*
> + * Allwinner system CCU
> + *
> + * Copyright (C) 2016 Jean-Francois Moine <moinejf@free.fr>
> + * Rewrite from 'sunxi-ng':
> + * Copyright (C) 2016 Maxime Ripard <maxime.ripard@free-electrons.com>=

> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/reset-controller.h>
> +#include <linux/iopoll.h>
> +#include <linux/slab.h>
> +#include <linux/rational.h>
> +#include <linux/of_address.h>
> +
> +#include "ccu.h"
> +
> +#define CCU_DEBUG 0
> +
> +#define CCU_MASK(shift, width) (((1 << width) - 1) << shift)
> +

You may use macros from:

http://lxr.free-electrons.com/source/include/linux/bitops.h

At least as a basis for the CCU_MASK macro.

> +/*
> + * factors:
> + *	n: multiplier (PLL)
> + *	d1, d2: boolean dividers by 2 (d2 is p with 1 bit width - PLL)
> + *	k: multiplier (PLL)
> + *	m: divider
> + *	p: divider by power of 2
> + */
> +struct values {
> +	int n, d1, k, m, p;
> +};
> +
> +static DEFINE_SPINLOCK(ccu_lock);
> +
> +void ccu_set_clock(struct ccu *ccu, int reg, u32 mask, u32 val)
> +{
> +
> +#if CCU_DEBUG
> +	pr_info("** ccu %s set %03x %08x\n",
> +		clk_hw_get_name(&ccu->hw), reg,
> +		(readl(ccu->base + reg) & ~mask) | val);
> +#endif
> +	spin_lock(&ccu_lock);
> +	writel((readl(ccu->base + reg) & ~mask) | val, ccu->base + reg);
> +	spin_unlock(&ccu_lock);
> +}
> +
> +/* --- prepare / enable --- */
> +int ccu_prepare(struct clk_hw *hw)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	if (!ccu->reset_reg && !ccu->bus_reg)
> +		return 0;
> +
> +#if CCU_DEBUG
> +	pr_info("** ccu %s prepare\n", clk_hw_get_name(&ccu->hw));
> +#endif
> +	spin_lock(&ccu_lock);
> +	if (ccu->reset_reg)
> +		writel(readl(ccu->base + ccu->reset_reg) |
> +							BIT(ccu->reset_bit),
> +				ccu->base + ccu->reset_reg);
> +	if (ccu->bus_reg)
> +		writel(readl(ccu->base + ccu->bus_reg) | BIT(ccu->bus_bit),
> +				ccu->base + ccu->bus_reg);
> +	spin_unlock(&ccu_lock);
> +
> +	return 0;
> +}
> +
> +void ccu_unprepare(struct clk_hw *hw)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	if (!ccu->reset_reg && !ccu->bus_reg)
> +		return;
> +
> +#if CCU_DEBUG
> +	pr_info("** ccu %s unprepare\n", clk_hw_get_name(&ccu->hw));
> +#endif
> +	spin_lock(&ccu_lock);
> +	if (ccu->bus_reg)
> +		writel(readl(ccu->base + ccu->bus_reg) & ~BIT(ccu->bus_bit),
> +				ccu->base + ccu->bus_reg);
> +	if (ccu->reset_reg)
> +		writel(readl(ccu->base + ccu->reset_reg) &
> +							~BIT(ccu->reset_bit),
> +				ccu->base + ccu->reset_reg);
> +	spin_unlock(&ccu_lock);
> +}
> +
> +int ccu_enable(struct clk_hw *hw)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	if (!ccu->has_gate)
> +		return 0;
> +
> +#if CCU_DEBUG
> +	pr_info("** ccu %s enable\n", clk_hw_get_name(&ccu->hw));
> +#endif
> +	spin_lock(&ccu_lock);
> +	writel(readl(ccu->base + ccu->reg) | BIT(ccu->gate_bit),
> +				ccu->base + ccu->reg);
> +	spin_unlock(&ccu_lock);
> +
> +	return 0;
> +}
> +
> +void ccu_disable(struct clk_hw *hw)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	if (!ccu->has_gate)
> +		return;
> +
> +#if CCU_DEBUG
> +	pr_info("** ccu %s disable\n", clk_hw_get_name(&ccu->hw));
> +#endif
> +	spin_lock(&ccu_lock);
> +	writel(readl(ccu->base + ccu->reg) & ~BIT(ccu->gate_bit),
> +				ccu->base + ccu->reg);
> +	spin_unlock(&ccu_lock);
> +}
> +
> +/* --- PLL --- */
> +static int ccu_pll_find_best(struct ccu *ccu,
> +				unsigned long rate,
> +				unsigned long parent_rate,
> +				struct values *p_v)
> +{
> +	int max_mul, max_div, mul, div, t;
> +	int n =3D 1, d1 =3D 1, k =3D 1, m =3D 1, p =3D 0;
> +	int max_n =3D 1 << ccu->n_width;
> +	int max_d1 =3D 1 << ccu->d1_width;
> +	int max_k =3D 1 << ccu->k_width;
> +	int max_m =3D 1 << ccu->m_width;
> +	int max_p =3D 1 << ccu->p_width;
> +
> +	if (ccu->features & CCU_FEATURE_N0)
> +		max_n--;
> +
> +	/* compute n */
> +	if (max_n > 1) {
> +		max_mul =3D max_n * max_k;
> +		if (rate > parent_rate * max_mul) {
> +			pr_err("%s: Clock rate too high %ld > %ld * %d * %d\n",
> +				clk_hw_get_name(&ccu->hw),
> +				rate, parent_rate, max_n, max_k);
> +			return -EINVAL;
> +		}
> +		max_div =3D max_m * max_d1 << max_p;
> +		if (max_div > 1) {
> +			unsigned long lmul, ldiv;
> +
> +			rational_best_approximation(rate, parent_rate,
> +						max_mul - 1,
> +						max_div - 1,
> +						&lmul, &ldiv);
> +			mul =3D lmul;
> +			div =3D ldiv;
> +			if (ccu->n_min && mul < ccu->n_min) {
> +				t =3D (ccu->n_min + mul - 1) / mul;
> +				mul *=3D t;
> +				div *=3D t;
> +			}
> +		} else {
> +			mul =3D (rate + parent_rate - 1) / parent_rate;
> +			div =3D 1;
> +		}
> +
> +		/* compute k (present only when 'n' is present) */
> +		if (max_k > 1) {
> +			int k_min, k_opt, delta_opt =3D 100, delta;
> +
> +			k =3D (mul + max_n - 1) / max_n;
> +			k_opt =3D k_min =3D k;
> +			for (k =3D max_k; k > k_min; k--) {
> +				n =3D (mul + k - 1) / k;
> +				t =3D n * k;
> +				delta =3D t - mul;
> +				if (delta =3D=3D 0) {
> +					k_opt =3D k;
> +					break;
> +				}
> +				if (delta < 0)
> +					delta =3D -delta;
> +				if (delta < delta_opt) {
> +					delta_opt =3D delta;
> +					k_opt =3D k;
> +				}
> +			}
> +			k =3D k_opt;
> +			n =3D (mul + k - 1) / k;
> +		} else {
> +			n =3D mul;
> +		}
> +	} else {
> +		div =3D (parent_rate + rate - 1) / rate;
> +	}
> +
> +	/* compute d1 (value is only 1 or 2) */
> +	if (max_d1 > 1) {
> +		if (div % 2 =3D=3D 0) {
> +			d1 =3D 2;
> +			div /=3D 2;
> +		}
> +	}
> +
> +	/* compute p */
> +/*	p =3D 0; */
> +	while (div % 2 =3D=3D 0 && p <=3D max_p) {
> +		p++;
> +		div /=3D 2;
> +	}
> +
> +	/* compute m */
> +	if (max_m > 1) {
> +		if (div <=3D max_m)
> +			m =3D div;
> +		else
> +			m =3D max_m;
> +		div /=3D m;
> +	}
> +
> +	/* adjust n */
> +	n =3D DIV_ROUND_CLOSEST((rate << p) * m * d1, parent_rate);
> +	n =3D DIV_ROUND_CLOSEST(n, k);
> +
> +	p_v->n =3D n;
> +	p_v->d1 =3D d1;
> +	p_v->k =3D k;
> +	p_v->m =3D m;
> +	p_v->p =3D p;
> +
> +	return 0;
> +}
> +
> +static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	const struct ccu_extra *extra =3D ccu->extra;
> +	unsigned long rate;
> +	int i, n, d1, m, k, p;
> +	u32 reg;
> +
> +	reg =3D readl(ccu->base + ccu->reg);
> +
> +	if (extra) {
> +		for (i =3D 0; i < extra->num_frac - 1; i++) {
> +			if ((reg & extra->frac[i].mask) =3D=3D extra->frac[i].val)
> +				return rate =3D extra->frac[i].rate;
> +		}
> +	}
> +
> +	rate =3D parent_rate;
> +
> +	if (ccu->d1_width) {
> +		d1 =3D reg >> ccu->d1_shift;
> +		d1 &=3D (1 << ccu->d1_width) - 1;
> +		rate /=3D (d1 + 1);
> +	}
> +
> +	if (ccu->n_width) {
> +		n =3D reg >> ccu->n_shift;
> +		n &=3D (1 << ccu->n_width) - 1;
> +		if (!(ccu->features & CCU_FEATURE_N0))
> +			n++;
> +		rate *=3D n;
> +	}
> +
> +	if (ccu->m_width) {
> +		m =3D reg >> ccu->m_shift;
> +		m &=3D (1 << ccu->m_width) - 1;
> +		rate /=3D (m + 1);
> +	}
> +
> +	if (ccu->k_width) {
> +		k =3D reg >> ccu->k_shift;
> +		k &=3D (1 << ccu->k_width) - 1;
> +		rate *=3D (k + 1);
> +	}
> +
> +	if (ccu->p_width) {
> +		p =3D reg >> ccu->p_shift;
> +		p &=3D (1 << ccu->p_width) - 1;
> +		rate >>=3D p;
> +	}
> +
> +	if (extra && (ccu->features & CCU_FEATURE_FIXED_POSTDIV))
> +		rate /=3D extra->fixed_div[0];
> +
> +	return rate;
> +}
> +
> +static long ccu_pll_round_rate(struct clk_hw *hw,
> +				unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	const struct ccu_extra *extra =3D ccu->extra;
> +	struct values v;
> +	int i, ret;
> +
> +	if (extra) {
> +		for (i =3D 0; i < extra->num_frac - 1; i++) {
> +			if (extra->frac[i].rate =3D=3D rate)
> +				return rate;
> +		}
> +
> +		if (ccu->features & CCU_FEATURE_FIXED_POSTDIV)
> +			rate *=3D extra->fixed_div[0];
> +	}
> +
> +	ret =3D ccu_pll_find_best(ccu, rate, *parent_rate, &v);
> +	if (ret)
> +		return ret;
> +
> +	rate =3D *parent_rate / v.d1 * v.n / v.m * v.k >> v.p;
> +
> +	if (extra && (ccu->features & CCU_FEATURE_FIXED_POSTDIV))
> +		rate /=3D extra->fixed_div[0];
> +
> +	return rate;
> +}
> +
> +static void ccu_pll_set_flat_factors(struct ccu *ccu, u32 mask, u32 va=
l)
> +{
> +	u32 reg, m_val, p_val;
> +	u32 m_mask =3D (1 << ccu->m_width) - 1;
> +	u32 p_mask =3D (1 << ccu->p_width) - 1;

I see you have shifted the factor values to be set in the caller of this
function, but then you have to shift masks too, to match. It might be
clearer to do both shifts in this function.

> +	reg =3D readl(ccu->base + ccu->reg);
> +	m_val =3D reg & m_mask;
> +	p_val =3D reg & p_mask;
> +
> +	spin_lock(&ccu_lock);
> +
> +	/* increase p, then m */
> +	if (ccu->p_width && p_val < (val & p_mask)) {
> +		reg &=3D ~p_mask;
> +		reg |=3D val & p_mask;
> +		writel(reg, ccu->base + ccu->reg);
> +		udelay(10);
> +	}
> +	if (ccu->m_width && m_val < (val & m_mask)) {
> +		reg &=3D ~m_mask;
> +		reg |=3D val & m_mask;
> +		writel(reg, ccu->base + ccu->reg);
> +		udelay(10);
> +	}
> +
> +	/* set other factors */
> +	reg &=3D ~(mask & ~(p_mask | m_mask));
> +	reg |=3D val & ~(p_mask | m_mask);
> +	writel(reg, ccu->base + ccu->reg);
> +
> +	/* decrease m */
> +	if (ccu->m_width && m_val > (val & m_mask)) {
> +		reg &=3D ~m_mask;
> +		reg |=3D val & m_mask;
> +		writel(reg, ccu->base + ccu->reg);
> +		udelay(10);
> +	}
> +
> +	/* wait for PLL stable */
> +	if (ccu->lock_reg) {
> +		u32 lock;
> +
> +		lock =3D BIT(ccu->lock_bit);
> +		WARN_ON(readl_relaxed_poll_timeout(ccu->base + ccu->lock_reg,
> +							reg, !(reg & lock),
> +							100, 70000));
> +	}

Any reason why you're waiting for the lock after decreasing m and not
before? PLL output may till run too fast before reducing the postdivider
potentially causing a crash. But I might be misunderstanding what m is
exactly.

regards,
  Ondrej Jirman

> +	/* decrease p */
> +	if (ccu->p_width && p_val > (val & p_mask)) {
> +		reg &=3D ~p_mask;
> +		reg |=3D val & p_mask;
> +		writel(reg, ccu->base + ccu->reg);
> +		udelay(10);
> +	}
> +
> +	spin_unlock(&ccu_lock);
> +}
> +
> +static int ccu_pll_set_rate(struct clk_hw *hw,
> +				unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	const struct ccu_extra *extra =3D ccu->extra;
> +	struct values v;
> +	u32 mask, val;
> +	int ret;
> +
> +	mask =3D  CCU_MASK(ccu->n_shift, ccu->n_width) |
> +		CCU_MASK(ccu->d1_shift, ccu->d1_width) |
> +		CCU_MASK(ccu->k_shift, ccu->k_width) |
> +		CCU_MASK(ccu->m_shift, ccu->m_width) |
> +		CCU_MASK(ccu->p_shift, ccu->p_width);
> +	val =3D 0;
> +
> +	if (extra && extra->num_frac) {
> +		int i;
> +
> +		for (i =3D 0; i < extra->num_frac - 1; i++) {
> +			if (extra->frac[i].rate =3D=3D rate) {
> +				ccu_set_clock(ccu, ccu->reg,
> +						extra->frac[i].mask,
> +						extra->frac[i].val);
> +				return 0;
> +			}
> +		}
> +		mask |=3D extra->frac[i].mask;
> +		val |=3D extra->frac[i].val;
> +	}
> +
> +	if (extra && (ccu->features & CCU_FEATURE_FIXED_POSTDIV))
> +		rate *=3D extra->fixed_div[0];
> +
> +
> +	ret =3D ccu_pll_find_best(ccu, rate, parent_rate, &v);
> +	if (ret)
> +		return ret;
> +
> +	if (!(ccu->features & CCU_FEATURE_N0))
> +		v.n--;
> +
> +	val |=3D  (v.n << ccu->n_shift) |
> +		((v.d1 - 1) << ccu->d1_shift) |
> +		((v.k - 1) << ccu->k_shift) |
> +		((v.m - 1) << ccu->m_shift) |
> +		(v.p << ccu->p_shift);
> +
> +	if (ccu->upd_bit)				/* cannot be 0 */
> +		val |=3D BIT(ccu->upd_bit);
> +
> +	if (!(ccu->features & CCU_FEATURE_FLAT_FACTORS))
> +		ccu_set_clock(ccu, ccu->reg, mask, val);
> +	else
> +		ccu_pll_set_flat_factors(ccu, mask, val);
> +
> +	/* wait for PLL stable */
> +	if (ccu->lock_reg) {
> +		u32 lock, reg;
> +
> +		lock =3D BIT(ccu->lock_bit);
> +		WARN_ON(readl_relaxed_poll_timeout(ccu->base + ccu->lock_reg,
> +							reg, !(reg & lock),
> +							100, 70000));
> +	}
> +
> +	return 0;
> +}
> +
> +const struct clk_ops ccu_pll_ops =3D {
> +	.prepare	=3D ccu_prepare,
> +	.unprepare	=3D ccu_unprepare,
> +	.enable		=3D ccu_enable,
> +	.disable	=3D ccu_disable,
> +/*	.is_enabled	=3D NULL;	(don't disable the clocks at startup time) */=

> +
> +	.recalc_rate	=3D ccu_pll_recalc_rate,
> +	.round_rate	=3D ccu_pll_round_rate,
> +	.set_rate	=3D ccu_pll_set_rate,
> +};
> +
> +/* --- mux parent --- */
> +u8 ccu_get_parent(struct clk_hw *hw)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	if (!ccu->mux_width)
> +		return 0;
> +
> +	return (readl(ccu->base + ccu->reg) >> ccu->mux_shift) &
> +				((1 << ccu->mux_width) - 1);
> +}
> +
> +int ccu_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	u32 mask;
> +
> +	if (!ccu->mux_width)
> +		return 0;
> +
> +	mask =3D CCU_MASK(ccu->mux_shift, ccu->mux_width);
> +
> +	ccu_set_clock(ccu, ccu->reg, mask, index << ccu->mux_shift);
> +
> +	return 0;
> +}
> +
> +/* --- mux --- */
> +static void ccu_mux_adjust_parent_for_prediv(struct ccu *ccu,
> +					     int parent_index,
> +					     unsigned long *parent_rate)
> +{
> +	const struct ccu_extra *extra =3D ccu->extra;
> +	int prediv =3D 1;
> +	u32 reg;
> +
> +	if (!(extra &&
> +	      (ccu->features & (CCU_FEATURE_MUX_FIXED_PREDIV |
> +				CCU_FEATURE_MUX_VARIABLE_PREDIV))))
> +		return;
> +
> +	reg =3D readl(ccu->base + ccu->reg);
> +	if (parent_index < 0)
> +		parent_index =3D (reg >> ccu->mux_shift) &
> +					((1 << ccu->mux_width) - 1);
> +
> +	if (ccu->features & CCU_FEATURE_MUX_FIXED_PREDIV)
> +		prediv =3D extra->fixed_div[parent_index];
> +
> +	if (ccu->features & CCU_FEATURE_MUX_VARIABLE_PREDIV)
> +		if (parent_index =3D=3D extra->variable_prediv.index) {
> +			u8 div;
> +
> +			div =3D reg >> extra->variable_prediv.shift;
> +			div &=3D (1 << extra->variable_prediv.width) - 1;
> +			prediv =3D div + 1;
> +		}
> +
> +	*parent_rate /=3D prediv;
> +}
> +
> +/* --- periph --- */
> +static unsigned long ccu_m_round_rate(struct ccu *ccu,
> +					unsigned long rate,
> +					unsigned long parent_rate)
> +{
> +	int m;
> +
> +	/*
> +	 * We can't use divider_round_rate that assumes that there's
> +	 * several parents, while we might be called to evaluate
> +	 * several different parents.
> +	 */
> +	m =3D divider_get_val(rate, parent_rate,
> +			ccu->div_table, ccu->m_width, ccu->div_flags);
> +
> +	return divider_recalc_rate(&ccu->hw, parent_rate, m,
> +				   ccu->div_table, ccu->div_flags);
> +}
> +
> +static unsigned long ccu_mp_round_rate(struct ccu *ccu,
> +				unsigned long rate,
> +				unsigned long parent_rate)
> +{
> +	struct values v;
> +	int ret;
> +
> +	ret =3D ccu_pll_find_best(ccu, rate, parent_rate, &v);
> +	if (ret)
> +		return 0;
> +
> +	return parent_rate / v.m >> v.p;
> +}
> +
> +unsigned long ccu_periph_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	int m, p;
> +	u32 reg;
> +
> +	ccu_mux_adjust_parent_for_prediv(ccu, -1, &parent_rate);
> +
> +	if (!ccu->m_width && !ccu->p_width)
> +		return parent_rate;
> +
> +	reg =3D readl(ccu->base + ccu->reg);
> +	m =3D (reg >> ccu->m_shift) & ((1 << ccu->m_width) - 1);
> +
> +	if (ccu->p_width) {
> +		reg =3D readl(ccu->base + ccu->reg);
> +		p =3D (reg >> ccu->p_shift) & ((1 << ccu->p_width) - 1);
> +
> +		return parent_rate / (m + 1) >> p;
> +	}
> +
> +	return divider_recalc_rate(hw, parent_rate, m,
> +				ccu->div_table, ccu->div_flags);
> +}
> +
> +int ccu_periph_determine_rate(struct clk_hw *hw,
> +				struct clk_rate_request *req)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	unsigned long best_parent_rate =3D 0, best_rate =3D 0;
> +	struct clk_hw *best_parent;
> +	unsigned int i;
> +	unsigned long (*round)(struct ccu *,
> +				unsigned long,
> +				unsigned long);
> +
> +	if (ccu->p_width)
> +		round =3D ccu_mp_round_rate;
> +	else if (ccu->m_width)
> +		round =3D ccu_m_round_rate;
> +	else
> +		return __clk_mux_determine_rate(hw, req);
> +
> +	for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
> +		unsigned long new_rate, parent_rate;
> +		struct clk_hw *parent;
> +
> +		parent =3D clk_hw_get_parent_by_index(hw, i);
> +		if (!parent)
> +			continue;
> +
> +		parent_rate =3D clk_hw_get_rate(parent);
> +		ccu_mux_adjust_parent_for_prediv(ccu, i, &parent_rate);
> +		new_rate =3D round(ccu, req->rate, parent_rate);
> +
> +		if (new_rate =3D=3D req->rate) {
> +			best_parent =3D parent;
> +			best_parent_rate =3D parent_rate;
> +			best_rate =3D new_rate;
> +			goto out;
> +		}
> +
> +		if ((req->rate - new_rate) < (req->rate - best_rate)) {
> +			best_rate =3D new_rate;
> +			best_parent_rate =3D parent_rate;
> +			best_parent =3D parent;
> +		}
> +	}
> +
> +	if (best_rate =3D=3D 0)
> +		return -EINVAL;
> +
> +out:
> +	req->best_parent_hw =3D best_parent;
> +	req->best_parent_rate =3D best_parent_rate;
> +	req->rate =3D best_rate;
> +
> +	return 0;
> +}
> +
> +int ccu_periph_set_rate(struct clk_hw *hw, unsigned long rate,
> +			unsigned long parent_rate)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	const struct ccu_extra *extra =3D ccu->extra;
> +	struct values v;
> +	u32 mask;
> +	int ret;
> +
> +	if (!ccu->m_width && !ccu->p_width)
> +		return 0;
> +
> +	ccu_mux_adjust_parent_for_prediv(ccu, -1, &parent_rate);
> +
> +	if (extra && (ccu->features & CCU_FEATURE_MODE_SELECT)) {
> +		/* fixme: should use new mode */
> +		if (rate =3D=3D extra->mode_select.rate)
> +			rate /=3D 2;
> +	}
> +
> +	if (ccu->p_width) {				/* m and p */
> +		ret =3D ccu_pll_find_best(ccu, rate, parent_rate, &v);
> +		if (ret)
> +			return ret;
> +	} else {					/* m alone */
> +		v.m =3D divider_get_val(rate, parent_rate,
> +				ccu->div_table, ccu->m_width, ccu->div_flags);
> +		v.p =3D 0;
> +		return 0;
> +	}
> +
> +	mask =3D CCU_MASK(ccu->m_shift, ccu->m_width) |
> +		CCU_MASK(ccu->p_shift, ccu->p_width);
> +
> +	if (ccu->features & CCU_FEATURE_SET_RATE_UNGATE)
> +		ccu_disable(hw);
> +	ccu_set_clock(ccu, ccu->reg, mask, ((v.m - 1) << ccu->m_shift) |
> +					    (v.p << ccu->p_shift));
> +	if (ccu->features & CCU_FEATURE_SET_RATE_UNGATE)
> +		ccu_enable(hw);
> +
> +	return 0;
> +}
> +
> +const struct clk_ops ccu_periph_ops =3D {
> +	.prepare	=3D ccu_prepare,
> +	.unprepare	=3D ccu_unprepare,
> +	.enable		=3D ccu_enable,
> +	.disable	=3D ccu_disable,
> +/*	.is_enabled	=3D NULL;	(don't disable the clocks at startup time) */=

> +
> +	.get_parent	=3D ccu_get_parent,
> +	.set_parent	=3D ccu_set_parent,
> +
> +	.determine_rate	=3D ccu_periph_determine_rate,
> +	.recalc_rate	=3D ccu_periph_recalc_rate,
> +	.set_rate	=3D ccu_periph_set_rate,
> +};
> +
> +/* --- fixed factor --- */
> +/* mul is n_width - div is m_width */
> +unsigned long ccu_fixed_factor_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	return parent_rate / ccu->m_width * ccu->n_width;
> +}
> +
> +long ccu_fixed_factor_round_rate(struct clk_hw *hw,
> +				unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +
> +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> +		unsigned long best_parent;
> +
> +		best_parent =3D (rate / ccu->n_width) * ccu->m_width;
> +		*parent_rate =3D clk_hw_round_rate(clk_hw_get_parent(hw),
> +						 best_parent);
> +	}
> +
> +	return *parent_rate / ccu->m_width * ccu->n_width;
> +}
> +
> +int ccu_fixed_factor_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	return 0;
> +}
> +
> +const struct clk_ops ccu_fixed_factor_ops =3D {
> +	.disable	=3D ccu_disable,
> +	.enable		=3D ccu_enable,
> +/*	.is_enabled	=3D NULL, */
> +
> +	.recalc_rate	=3D ccu_fixed_factor_recalc_rate,
> +	.round_rate	=3D ccu_fixed_factor_round_rate,
> +	.set_rate	=3D ccu_fixed_factor_set_rate,
> +};
> +
> +/* --- phase --- */
> +static int ccu_phase_get_phase(struct clk_hw *hw)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	struct clk_hw *parent, *grandparent;
> +	unsigned int parent_rate, grandparent_rate;
> +	u16 step, parent_div;
> +	u32 reg;
> +	u8 delay;
> +
> +	reg =3D readl(ccu->base + ccu->reg);
> +	delay =3D (reg >> ccu->p_shift);
> +	delay &=3D (1 << ccu->p_width) - 1;
> +
> +	if (!delay)
> +		return 180;
> +
> +	/* Get our parent clock, it's the one that can adjust its rate */
> +	parent =3D clk_hw_get_parent(hw);
> +	if (!parent)
> +		return -EINVAL;
> +
> +	/* And its rate */
> +	parent_rate =3D clk_hw_get_rate(parent);
> +	if (!parent_rate)
> +		return -EINVAL;
> +
> +	/* Now, get our parent's parent (most likely some PLL) */
> +	grandparent =3D clk_hw_get_parent(parent);
> +	if (!grandparent)
> +		return -EINVAL;
> +
> +	/* And its rate */
> +	grandparent_rate =3D clk_hw_get_rate(grandparent);
> +	if (!grandparent_rate)
> +		return -EINVAL;
> +
> +	/* Get our parent clock divider */
> +	parent_div =3D grandparent_rate / parent_rate;
> +
> +	step =3D DIV_ROUND_CLOSEST(360, parent_div);
> +	return delay * step;
> +}
> +
> +static int ccu_phase_set_phase(struct clk_hw *hw, int degrees)
> +{
> +	struct ccu *ccu =3D hw2ccu(hw);
> +	struct clk_hw *parent, *grandparent;
> +	unsigned int parent_rate, grandparent_rate;
> +	u32 mask;
> +	u8 delay =3D 0;
> +	u16 step, parent_div;
> +
> +	if (degrees =3D=3D 180)
> +		goto set_phase;
> +
> +	/* Get our parent clock, it's the one that can adjust its rate */
> +	parent =3D clk_hw_get_parent(hw);
> +	if (!parent)
> +		return -EINVAL;
> +
> +	/* And its rate */
> +	parent_rate =3D clk_hw_get_rate(parent);
> +	if (!parent_rate)
> +		return -EINVAL;
> +
> +	/* Now, get our parent's parent (most likely some PLL) */
> +	grandparent =3D clk_hw_get_parent(parent);
> +	if (!grandparent)
> +		return -EINVAL;
> +
> +	/* And its rate */
> +	grandparent_rate =3D clk_hw_get_rate(grandparent);
> +	if (!grandparent_rate)
> +		return -EINVAL;
> +
> +	/* Get our parent divider */
> +	parent_div =3D grandparent_rate / parent_rate;
> +
> +	/*
> +	 * We can only outphase the clocks by multiple of the
> +	 * PLL's period.
> +	 *
> +	 * Since our parent clock is only a divider, and the
> +	 * formula to get the outphasing in degrees is deg =3D
> +	 * 360 * delta / period
> +	 *
> +	 * If we simplify this formula, we can see that the
> +	 * only thing that we're concerned about is the number
> +	 * of period we want to outphase our clock from, and
> +	 * the divider set by our parent clock.
> +	 */
> +	step =3D DIV_ROUND_CLOSEST(360, parent_div);
> +	delay =3D DIV_ROUND_CLOSEST(degrees, step);
> +
> +set_phase:
> +	mask =3D CCU_MASK(ccu->p_shift, ccu->p_width);
> +	ccu_set_clock(ccu, ccu->reg, mask, delay << ccu->p_shift);
> +
> +	return 0;
> +}
> +
> +const struct clk_ops ccu_phase_ops =3D {
> +	.get_phase	=3D ccu_phase_get_phase,
> +	.set_phase	=3D ccu_phase_set_phase,
> +};
> +
> +/* --- reset --- */
> +static inline
> +struct ccu_reset *rcdev_to_ccu_reset(struct reset_controller_dev *rcde=
v)
> +{
> +	return container_of(rcdev, struct ccu_reset, rcdev);
> +}
> +
> +static void ccu_set_reset_clock(struct ccu_reset *ccu_reset,
> +				int reg, int bit, int enable)
> +{
> +	u32 mask;
> +
> +	if (!reg)			/* compatibility */
> +		return;
> +
> +#if CCU_DEBUG
> +	pr_info("** ccu reset %03x %d %sassert\n",
> +		reg, bit, enable ? "de-" : "");
> +#endif
> +	mask =3D BIT(bit);
> +
> +	spin_lock(&ccu_lock);
> +	if (enable)
> +		writel(readl(ccu_reset->base + reg) | mask,
> +			ccu_reset->base + reg);
> +	else
> +		writel(readl(ccu_reset->base + reg) & ~mask,
> +			ccu_reset->base + reg);
> +	spin_unlock(&ccu_lock);
> +}
> +
> +static int ccu_reset_assert(struct reset_controller_dev *rcdev,
> +			    unsigned long id)
> +{
> +	struct ccu_reset *ccu_reset =3D rcdev_to_ccu_reset(rcdev);
> +	const struct ccu_reset_map *map =3D &ccu_reset->reset_map[id];
> +
> +	ccu_set_reset_clock(ccu_reset, map->reg, map->bit, 0);
> +
> +	return 0;
> +}
> +
> +static int ccu_reset_deassert(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct ccu_reset *ccu_reset =3D rcdev_to_ccu_reset(rcdev);
> +	const struct ccu_reset_map *map =3D &ccu_reset->reset_map[id];
> +
> +	ccu_set_reset_clock(ccu_reset, map->reg, map->bit, 1);
> +
> +	return 0;
> +}
> +
> +const struct reset_control_ops ccu_reset_ops =3D {
> +	.assert		=3D ccu_reset_assert,
> +	.deassert	=3D ccu_reset_deassert,
> +};
> +
> +/* --- init --- */
> +int __init ccu_probe(struct device_node *node,
> +			struct clk_hw_onecell_data *data,
> +			struct ccu_reset *resets)
> +{
> +	struct clk_hw *hw;
> +	struct ccu *ccu;
> +	void __iomem *reg;
> +	int i, ret;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Clock mapping failed %d\n",
> +			of_node_full_name(node), (int) PTR_ERR(reg));
> +		return PTR_ERR(reg);
> +	}
> +
> +	/* register the clocks */
> +	for (i =3D 0; i < data->num; i++) {
> +		hw =3D data->hws[i];
> +#if CCU_DEBUG
> +		if (!hw) {
> +			pr_err("%s: Bad number of clocks %d !=3D %d\n",
> +				of_node_full_name(node),
> +				i + 1, data->num);
> +			data->num =3D i;
> +			break;
> +		}
> +#endif
> +		ccu =3D hw2ccu(hw);
> +		ccu->base =3D reg;
> +		ret =3D clk_hw_register(NULL, hw);
> +		if (ret < 0) {
> +			pr_err("%s: Register clock %s failed %d\n",
> +				of_node_full_name(node),
> +				clk_hw_get_name(hw), ret);
> +			data->num =3D i;
> +			break;
> +		}
> +	}
> +	ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data);
> +	if (ret < 0)
> +		goto err;
> +
> +	/* register the resets */
> +	resets->rcdev.of_node =3D node;
> +	resets->base =3D reg;
> +
> +	ret =3D reset_controller_register(&resets->rcdev);
> +	if (ret) {
> +		pr_err("%s: Reset register failed %d\n",
> +			of_node_full_name(node), ret);
> +		goto err;
> +	}
> +
> +	return ret;
> +
> +err:
> +	/* don't do anything, otherwise no uart anymore */
> +	return ret;
> +}
> diff --git a/drivers/clk/sunxi/ccu.h b/drivers/clk/sunxi/ccu.h
> new file mode 100644
> index 0000000..5597681
> --- /dev/null
> +++ b/drivers/clk/sunxi/ccu.h
> @@ -0,0 +1,153 @@
> +/*
> + * Copyright (C) 2016 Jean-Francois Moine <moinejf@free.fr>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + */
> +
> +#ifndef _CCU_H_
> +#define _CCU_H_
> +
> +struct device_node;
> +
> +#define CCU_HW(_name, _parent, _ops, _flags)			\
> +	.hw.init =3D &(struct clk_init_data) {			\
> +		.flags		=3D _flags,			\
> +		.name		=3D _name,			\
> +		.parent_names	=3D (const char *[]) { _parent },	\
> +		.num_parents	=3D 1,				\
> +		.ops		=3D _ops,				\
> +	}
> +
> +#define CCU_HW_PARENTS(_name, _parents, _ops, _flags)		\
> +	.hw.init =3D &(struct clk_init_data) {			\
> +		.flags		=3D _flags,			\
> +		.name		=3D _name,			\
> +		.parent_names	=3D _parents,			\
> +		.num_parents	=3D ARRAY_SIZE(_parents),		\
> +		.ops		=3D _ops,				\
> +	}
> +
> +#define CCU_REG(_reg) .reg =3D _reg
> +#define CCU_RESET(_reg, _bit) .reset_reg =3D _reg, .reset_bit =3D _bit=

> +#define CCU_BUS(_reg, _bit) .bus_reg =3D _reg, .bus_bit =3D _bit
> +#define CCU_GATE(_bit) .has_gate =3D 1, .gate_bit =3D _bit
> +#define CCU_LOCK(_reg, _bit) .lock_reg =3D _reg, .lock_bit =3D _bit
> +#define CCU_MUX(_shift, _width) .mux_shift =3D _shift, .mux_width =3D =
_width
> +#define CCU_N(_shift, _width) .n_shift =3D _shift, .n_width =3D _width=

> +#define CCU_D1(_shift, _width) .d1_shift =3D _shift, .d1_width =3D _wi=
dth
> +#define CCU_D2(_shift, _width) .p_shift =3D _shift, .p_width =3D _widt=
h
> +#define CCU_K(_shift, _width) .k_shift =3D _shift, .k_width =3D _width=

> +#define CCU_M(_shift, _width) .m_shift =3D _shift, .m_width =3D _width=

> +#define CCU_P(_shift, _width) .p_shift =3D _shift, .p_width =3D _width=

> +#define CCU_UPD(_bit) .upd_bit =3D _bit
> +/* with ccu_fixed_factor_ops */
> +#define CCU_FIXED(_mul, _div) .n_width =3D _mul, .m_width =3D _div
> +/* with ccu_phase_ops */
> +#define CCU_PHASE(_shift, _width) .p_shift =3D _shift, .p_width =3D _w=
idth
> +
> +#define CCU_FEATURE_FRACTIONAL		BIT(0)
> +#define CCU_FEATURE_MUX_VARIABLE_PREDIV	BIT(1)
> +#define CCU_FEATURE_MUX_FIXED_PREDIV	BIT(2)
> +#define CCU_FEATURE_FIXED_POSTDIV	BIT(3)
> +#define CCU_FEATURE_N0			BIT(4)
> +#define CCU_FEATURE_MODE_SELECT		BIT(5)
> +#define CCU_FEATURE_FLAT_FACTORS	BIT(6)
> +#define CCU_FEATURE_SET_RATE_UNGATE	BIT(7)
> +
> +/* extra */
> +#define CCU_EXTRA_FRAC(_frac) .frac =3D _frac, .num_frac =3D ARRAY_SIZ=
E(_frac)
> +#define CCU_EXTRA_POST_DIV(_div) .fixed_div[0] =3D _div
> +
> +/* fractional values */
> +struct frac {
> +	unsigned long rate;
> +	u32 mask;
> +	u32 val;
> +};
> +
> +/* extra features */
> +struct ccu_extra {
> +	const struct frac *frac; /* array - last is the fractional mask/value=
 */
> +	u8 num_frac;
> +
> +	u8 fixed_div[4];
> +
> +	struct {
> +		u8 index;
> +		u8 shift;
> +		u8 width;
> +	} variable_prediv;
> +
> +	struct {
> +		unsigned long rate;
> +		u8 bit;
> +	} mode_select;
> +};
> +
> +struct ccu {
> +	struct clk_hw	hw;
> +
> +	void __iomem *base;
> +	u16 reg;
> +
> +	u16 reset_reg, bus_reg, lock_reg;
> +	u8  reset_bit, bus_bit, lock_bit;
> +	u8 has_gate, gate_bit;
> +
> +	u8 mux_shift, mux_width;
> +	u8 n_shift, n_width, n_min;
> +	u8 d1_shift, d1_width;
> +	u8 k_shift, k_width;
> +	u8 m_shift, m_width;
> +	u8 p_shift, p_width;
> +
> +	u8 upd_bit;
> +
> +	u8 features;
> +
> +	const struct clk_div_table *div_table;
> +	u32 div_flags;
> +
> +	const struct ccu_extra *extra;
> +};
> +
> +struct ccu_reset_map {
> +	u16	reg;
> +	u16	bit;
> +};
> +
> +struct ccu_reset {
> +	void __iomem			*base;
> +	const struct ccu_reset_map	*reset_map;
> +	struct reset_controller_dev	rcdev;
> +};
> +
> +extern const struct clk_ops ccu_fixed_factor_ops;
> +extern const struct clk_ops ccu_periph_ops;
> +extern const struct clk_ops ccu_pll_ops;
> +extern const struct clk_ops ccu_phase_ops;
> +extern const struct reset_control_ops ccu_reset_ops;
> +
> +static inline struct ccu *hw2ccu(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct ccu, hw);
> +}
> +
> +int ccu_probe(struct device_node *node,
> +		struct clk_hw_onecell_data *data,
> +		struct ccu_reset *resets);
> +
> +/* functions exported for specific features */
> +void ccu_set_clock(struct ccu *ccu, int reg, u32 mask, u32 val);
> +unsigned long ccu_fixed_factor_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate);
> +long ccu_fixed_factor_round_rate(struct clk_hw *hw,
> +				unsigned long rate,
> +				unsigned long *parent_rate);
> +int ccu_fixed_factor_set_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long parent_rate);
> +
> +#endif /* _CCU_H_ */
>=20




--DOXF63OIpqsm1EVm7GuHaaoQFMbX6PksW--

--60DsunVfurmCCoHNdLCFUt0LO5OR2gQMu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXctB7AAoJEG5kJsZ3z+/xCqoQAJoJKJEnMvhfOBrQzxkHBwa2
ooItqNhHmKpT/qzrxnQ9pCDaMad5Q0yj1ygocylKrQy7Kq0BH5d7Rblx4nszU0SB
E5Mpg5SFB8iiy9qZY39w9Koz42Z+xmaZYoHBi5JmEljxmntxxFmIdCc/vdbusF/U
zeMeHRH57DnJdUp9DwL+IW6GWONfarwH4Lwko+qCCUqbilMnmpUzDnfNbAhuBMZ6
qJi2Bu8EAMijoK5E+U2JiWu1AUsPTpm4y5bnOlXsADy85ZAgAGrdmdAXtDyFLpR+
dOk0fIWoFjlh0LedkExP9Dmc0idKFvwdOjgZGDYlahIxnbPZ7YFb+bVvTIVZtM/Y
lQbL6URVljAnrIs2xS6rztIva5pWD2StfyjDH/DLZhCG9Q0TIspvzH6+vWQ8a03j
i5ZBfVrGlVQywWTNyhzL6T0STwO4qqhIB2C/jQKNdJ7fPdif+L/sESy/SiIFVx18
jkSQkEv/fstuVfWQWECSjFeeYw3SeBjBcrww2NptVNkSZY6ZyyWBwJZuXhA3yRyF
LaLgG8jSRPTyiGanf/+jDH9XLmGyhCF0ibAnGvC/p5SCzxNztR3/I4QvLVSWVaKO
CzJV0XnUcbRut2sxVpWhi87IdgELTeJIvFjJARAFTNMJi8YNUgvIxQ+n5KQ6LPgi
yjLVT1PmIDO/q6JEShR1
=2n28
-----END PGP SIGNATURE-----

--60DsunVfurmCCoHNdLCFUt0LO5OR2gQMu--


--===============6284294562237358157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6284294562237358157==--
