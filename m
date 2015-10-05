Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 5 Oct 2015 12:19:32 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 1/5] clk: Add a basic multiplier clock
Message-ID: <20151005101932.GH2696@lukather>
References: <1443512353-28073-1-git-send-email-maxime.ripard@free-electrons.com>
 <1443512353-28073-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151002204308.GY12338@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iAL9S67WQOXgEPD9"
In-Reply-To: <20151002204308.GY12338@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--iAL9S67WQOXgEPD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 02, 2015 at 01:43:08PM -0700, Stephen Boyd wrote:
> On 09/29, Maxime Ripard wrote:
> > diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
> > new file mode 100644
> > index 000000000000..61097e365d55
> > --- /dev/null
> > +++ b/drivers/clk/clk-multiplier.c
> > @@ -0,0 +1,176 @@
> > +/*
> > + * Copyright (C) 2015 Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +#include <linux/module.h>
>=20
> Maybe export.h is more appropriate?

Indeed.

> > +#include <linux/clk-provider.h>
> > +#include <linux/slab.h>
> > +#include <linux/err.h>
> > +#include <linux/of.h>
> > +
> > +#define to_clk_multiplier(_hw) container_of(_hw, struct clk_multiplier=
, hw)
> > +
> > +static unsigned long __get_mult(struct clk_multiplier *mult,
> > +				unsigned long rate,
> > +				unsigned long parent_rate)
> > +{
> > +	if (mult->flags & CLK_MULTIPLIER_ROUND_CLOSEST)
> > +		return DIV_ROUND_CLOSEST(rate, parent_rate);
>=20
> We should include kernel.h for this macro.

Ack.

> > +
> > +	return rate / parent_rate;
> > +}
> > +
> > +static unsigned long clk_multiplier_recalc_rate(struct clk_hw *hw,
> > +						unsigned long parent_rate)
> > +{
> > +	struct clk_multiplier *mult =3D to_clk_multiplier(hw);
> > +	unsigned long val;
> > +=09
> > +	val =3D clk_readl(mult->reg) >> mult->shift;
> > +	val &=3D GENMASK(mult->width, 0);
>=20
> and bitops.h for GENMASK

Ack.

> > +
> > +	if (!val && mult->flags & CLK_MULTIPLIER_ZERO_BYPASS)
> > +		val =3D 1;
> > +=09
> > +	return parent_rate * val;
> > +}
> > +
> > +static bool __is_best_rate(unsigned long rate, unsigned long new,
> > +			   unsigned long best, unsigned long flags)
> > +{
> > +	if (flags & CLK_MULTIPLIER_ROUND_CLOSEST)
>=20
> Is the only difference in this function vs the divider one that
> flag? Maybe we should make this function generic to the framework
> and pass a flag indicating closest or not.

Actually, the logic is also reversed.

The divider driver will always try to find some rate that is higher
than the one we already have, without going above than the one
requested.

Here, we're tring to be lower than the best rate, without going below
the requested rate.

>=20
> > +		return abs(rate - new) < abs(rate - best);
> > +
> > +	return new >=3D rate && new < best;
> > +}
> > +
> > +static unsigned long __bestmult(struct clk_hw *hw, unsigned long rate,
> > +				unsigned long *best_parent_rate,
> > +				u8 width, unsigned long flags)
> > +{
> > +	unsigned long orig_parent_rate =3D *best_parent_rate;
> > +	unsigned long parent_rate, current_rate, best_rate =3D ~0;
> > +	unsigned int i, bestmult =3D 0;
> > +
> > +	if (!(__clk_get_flags(hw->clk) & CLK_SET_RATE_PARENT))
>=20
> Please use clk_hw_get_flags. I'd *really* like to kill
> __clk_get_flags() but we still have one user in omap code.

Ack.

>=20
> > +		return rate / *best_parent_rate;
> > +
> > +	for (i =3D 1; i < ((1 << width) - 1); i++) {
> > +		if (rate * i =3D=3D orig_parent_rate) {
> > +			/*
> > +			 * This is the best case for us if we have a
> > +			 * perfect match without changing the parent
> > +			 * rate.
> > +			 */
> > +			*best_parent_rate =3D orig_parent_rate;
> > +			return i;
> > +		}
> > +
> > +		parent_rate =3D clk_hw_round_rate(clk_hw_get_parent(hw),
> > +						rate / i);
> > +		current_rate =3D parent_rate * i;
> > +
> > +		if (__is_best_rate(rate, current_rate, best_rate, flags)) {
> > +			bestmult =3D i;
> > +			best_rate =3D current_rate;
> > +			*best_parent_rate =3D parent_rate;
> > +		}
> > +	}
> > +
> > +	return bestmult;
> > +}
> > +
> > +static int clk_multiplier_set_rate(struct clk_hw *hw, unsigned long ra=
te,
> > +			       unsigned long parent_rate)
> > +{
> > +	struct clk_multiplier *mult =3D to_clk_multiplier(hw);
> > +	unsigned long factor =3D __get_mult(mult, rate, parent_rate);
> > +	unsigned long uninitialized_var(flags);
>=20
> hmmm ok. We set it to 0 in other drivers.

I'll change it then.

>=20
> > +	unsigned long val;
> > +
> > +	if (mult->lock)
> > +		spin_lock_irqsave(mult->lock, flags);
>=20
> This needs the same "trick" that we did in the generic clock
> types to avoid sparse warnings.

The __acquire call ?

> > +
> > +	val =3D clk_readl(mult->reg);
> > +	val &=3D ~GENMASK(mult->width + mult->shift, mult->shift);
> > +	val |=3D factor << mult->shift;
> > +	clk_writel(val, mult->reg);
> > +
> > +	if (mult->lock)
> > +		spin_unlock_irqrestore(mult->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +struct clk *clk_register_multiplier(struct device *dev, const char *na=
me,
> > +				    const char *parent_name,
> > +				    unsigned long flags,
> > +				    void __iomem *reg, u8 shift, u8 width,
> > +				    u8 clk_mult_flags, spinlock_t *lock)
> > +{
> > +	struct clk_init_data init;
> > +	struct clk_multiplier *mult;
> > +	struct clk *clk;
> > +
> > +	mult =3D kmalloc(sizeof(*mult), GFP_KERNEL);
> > +	if (!mult) {
> > +		pr_err("%s: could not allocate multiplier clk\n", __func__);
>=20
> We don't need allocation error messages.

Ack.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--iAL9S67WQOXgEPD9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWEk60AAoJEBx+YmzsjxAg0ucP/0LEdhWLYdiEwfQbY4nbJKFT
ZLJNO2Wo9eC+ZuHHG5mR5YDw7Nqakq2w0FqGSKJA7VpcrHfdebyNnNaVXEKG0dq9
SRe8WWngdn+U238gZX7hNZj8BcnreWvLZH4wIuVBshJUAfu+cU1bDHgHBGU371Ux
AI4mpraG3mQT18KvJhm3afAhlCkndBeMyYbVfwnMnjASqKQJ8Jdv1cIHKJRqe2G8
iOoIHK4g+OfS8gGqMczZGZv/iGwqRp8nOcrgWBmq0CqDCiqANWaApQDfs2qD9j+5
+tYE1SszR9NlCnujII2qb6jne+KLcFn3SNYHP4872qvo8gLIKxuk1AdlZqfPqtSR
Zw8yebB8W59MkOZt/sBYVIh2hrRowL1sKye7rTQdpViT83CoKEHsrOC3x1fQkyi+
YtsZ4I+YX8QL4IC6mKPzl3kxzH3usYBMKr82oS5cfqV3cdd1YdKDmIZ1LNhwRLRp
qadSXqha++Uu7/naUn0WYcwkK5hayYHWWfHWpB9fPEb4Y18LylQQziqgs8T8W5di
L4ZLWgi2m0dIHFXY9JZ3oFQQ27wZw+MtEY4kA4E8vqVkJ1D6e8CRxfpCf4CzqJRJ
Jjlmms/NYwmkNgzNLJL3qndE1634wOYzH/0O0QkDelqUhC1k0842sFyI8wJzM5eo
FLikLdoc8s8vCGfRWxsb
=wkjp
-----END PGP SIGNATURE-----

--iAL9S67WQOXgEPD9--
