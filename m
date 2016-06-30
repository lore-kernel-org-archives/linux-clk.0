Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 30 Jun 2016 23:16:35 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] clk: sunxi: Add a driver for the CCU
Message-ID: <20160630211635.GE5485@lukather>
References: <cover.1467135898.git.moinejf@free.fr>
 <a55dc5d1a9f02dc4d71d5c21064bffebe5a7b149.1467135898.git.moinejf@free.fr>
 <20160628204502.GG5550@lukather>
 <20160629101256.93895e6ff9184efa340f69dd@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
In-Reply-To: <20160629101256.93895e6ff9184efa340f69dd@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2016 at 10:12:56AM +0200, Jean-Francois Moine wrote:
> On Tue, 28 Jun 2016 22:45:02 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > On Tue, Jun 28, 2016 at 05:37:35PM +0200, Jean-Francois Moine wrote:
> > > +/* --- prepare / enable --- */
> > > +int ccu_prepare(struct clk_hw *hw)
> > > +{
> > > +	struct ccu *ccu =3D hw2ccu(hw);
> > > +
> > > +	if (!ccu->reset_reg && !ccu->bus_reg)
> > > +		return 0;
> > > +
> > > +#if CCU_DEBUG
> > > +	pr_info("** ccu %s prepare\n", clk_hw_get_name(&ccu->hw));
> > > +#endif
> > > +	spin_lock(&ccu_lock);
> > > +	if (ccu->reset_reg)
> > > +		writel(readl(ccu->base + ccu->reset_reg) |
> > > +							BIT(ccu->reset_bit),
> > > +				ccu->base + ccu->reset_reg);
> > > +	if (ccu->bus_reg)
> > > +		writel(readl(ccu->base + ccu->bus_reg) | BIT(ccu->bus_bit),
> > > +				ccu->base + ccu->bus_reg);
> >=20
> > Like I already said, this is a no-go.
>=20
> I don't see why: prepare/unprepare do the right job.

This is a huge hack.

These clocks and reset lines are doing something different, should and
can be enabled at totally different times, have different behaviour
that is already relied on by the drivers. So we *need* to expose them
as different clocks and reset lines, because they *are* different
clocks and reset lines.

Plus, I'd like to see the behaviour of that clocks when you call
clk_set_rate or clk_set_parent. It's going to be interesting.

>=20
> > > +
> > > +/* --- PLL --- */
> > > +static int ccu_pll_find_best(struct ccu *ccu,
> > > +				unsigned long rate,
> > > +				unsigned long parent_rate,
> > > +				struct values *p_v)
> > > +{
> > > +	int max_mul, max_div, mul, div, t;
> > > +	int n =3D 1, d1 =3D 1, k =3D 1, m =3D 1, p =3D 0;
> > > +	int max_n =3D 1 << ccu->n_width;
> > > +	int max_d1 =3D 1 << ccu->d1_width;
> > > +	int max_k =3D 1 << ccu->k_width;
> > > +	int max_m =3D 1 << ccu->m_width;
> > > +	int max_p =3D 1 << ccu->p_width;
> > > +
> > > +	if (ccu->features & CCU_FEATURE_N0)
> > > +		max_n--;
> > > +
> > > +	/* compute n */
> > > +	if (max_n > 1) {
> > > +		max_mul =3D max_n * max_k;
> > > +		if (rate > parent_rate * max_mul) {
> > > +			pr_err("%s: Clock rate too high %ld > %ld * %d * %d\n",
> > > +				clk_hw_get_name(&ccu->hw),
> > > +				rate, parent_rate, max_n, max_k);
> > > +			return -EINVAL;
> > > +		}
> > > +		max_div =3D max_m * max_d1 << max_p;
> > > +		if (max_div > 1) {
> > > +			unsigned long lmul, ldiv;
> > > +
> > > +			rational_best_approximation(rate, parent_rate,
> > > +						max_mul - 1,
> > > +						max_div - 1,
> > > +						&lmul, &ldiv);
> > > +			mul =3D lmul;
> > > +			div =3D ldiv;
> > > +			if (ccu->n_min && mul < ccu->n_min) {
> > > +				t =3D (ccu->n_min + mul - 1) / mul;
> > > +				mul *=3D t;
> > > +				div *=3D t;
> > > +			}
> > > +		} else {
> > > +			mul =3D (rate + parent_rate - 1) / parent_rate;
> > > +			div =3D 1;
> > > +		}
> > > +
> > > +		/* compute k (present only when 'n' is present) */
> > > +		if (max_k > 1) {
> > > +			int k_min, k_opt, delta_opt =3D 100, delta;
> > > +
> > > +			k =3D (mul + max_n - 1) / max_n;
> > > +			k_opt =3D k_min =3D k;
> > > +			for (k =3D max_k; k > k_min; k--) {
> > > +				n =3D (mul + k - 1) / k;
> > > +				t =3D n * k;
> > > +				delta =3D t - mul;
> > > +				if (delta =3D=3D 0) {
> > > +					k_opt =3D k;
> > > +					break;
> > > +				}
> > > +				if (delta < 0)
> > > +					delta =3D -delta;
> > > +				if (delta < delta_opt) {
> > > +					delta_opt =3D delta;
> > > +					k_opt =3D k;
> > > +				}
> > > +			}
> > > +			k =3D k_opt;
> > > +			n =3D (mul + k - 1) / k;
> > > +		} else {
> > > +			n =3D mul;
> > > +		}
> > > +	} else {
> > > +		div =3D (parent_rate + rate - 1) / rate;
> > > +	}
> > > +
> > > +	/* compute d1 (value is only 1 or 2) */
> > > +	if (max_d1 > 1) {
> > > +		if (div % 2 =3D=3D 0) {
> > > +			d1 =3D 2;
> > > +			div /=3D 2;
> > > +		}
> > > +	}
> > > +
> > > +	/* compute p */
> > > +/*	p =3D 0; */
> > > +	while (div % 2 =3D=3D 0 && p <=3D max_p) {
> > > +		p++;
> > > +		div /=3D 2;
> > > +	}
> > > +
> > > +	/* compute m */
> > > +	if (max_m > 1) {
> > > +		if (div <=3D max_m)
> > > +			m =3D div;
> > > +		else
> > > +			m =3D max_m;
> > > +		div /=3D m;
> > > +	}
> > > +
> > > +	/* adjust n */
> > > +	n =3D DIV_ROUND_CLOSEST((rate << p) * m * d1, parent_rate);
> > > +	n =3D DIV_ROUND_CLOSEST(n, k);
> > > +
> > > +	p_v->n =3D n;
> > > +	p_v->d1 =3D d1;
> > > +	p_v->k =3D k;
> > > +	p_v->m =3D m;
> > > +	p_v->p =3D p;
> > > +
> > > +	return 0;
> > > +}
> >=20
> > So. In order to move away from an unmaintainable mess, we create a new
> > unmaintainable mess? Looks like the way to go.
>=20
> Why is it unmaintainable? This routine should work fine for most
> Allwinner's SoCs.

Define the algorithm used in three sentences. Maintainability is also
about having code that is concise, clear and easy to debug and review.

This functions fails in all four.

> If it would not for some particular SoC, an other one could be written
> and called for this case.

The point is to have *common* code.

> Maybe are you thinking about the pre/post-divider order. Yes, this
> routine should enhanced if some rounding problem would be found.
>=20
> > > +const struct clk_ops ccu_pll_ops =3D {
> > > +	.prepare	=3D ccu_prepare,
> > > +	.unprepare	=3D ccu_unprepare,
> > > +	.enable		=3D ccu_enable,
> > > +	.disable	=3D ccu_disable,
> > > +/*	.is_enabled	=3D NULL;	(don't disable the clocks at startup time) =
*/
> >=20
> > Why?
>=20
> 3 reasons:
>=20
> - as the unused clocks are disabled at system startup time, all the
>   critical clocks should be flagged as such. A problem exists when
>   trying a new SoC: we may not know which clocks are critical, and
>   we stay in front of a black screen when trying to boot.

Then we find which clock it is, and we flag it as such. That's
actually quite easy to do, since the clocks very late in the boot
process, way after your UART has been initialised, so this is totally
something you can trace.

> - the clocks may be enabled again when already enabled without any
>   problem.

Indeed

> So, it is not important to know if they are already enabled by
> hardware: the software enable counter is enough.

It is important to know it if we have some unused clock running, so
that we can disable it. And disabling it has a bunch of side effects,
most notably saving polar bears, and pointing out clocks that should
be flagged as such.

> - less code!

I fail to see how that's an argument.

> > > +int ccu_periph_set_rate(struct clk_hw *hw, unsigned long rate,
> > > +			unsigned long parent_rate)
> > > +{
> > > +	struct ccu *ccu =3D hw2ccu(hw);
> > > +	const struct ccu_extra *extra =3D ccu->extra;
> > > +	struct values v;
> > > +	u32 mask;
> > > +	int ret;
> > > +
> > > +	if (!ccu->m_width && !ccu->p_width)
> > > +		return 0;
> > > +
> > > +	ccu_mux_adjust_parent_for_prediv(ccu, -1, &parent_rate);
> > > +
> > > +	if (extra && (ccu->features & CCU_FEATURE_MODE_SELECT)) {
> > > +		/* fixme: should use new mode */
> > > +		if (rate =3D=3D extra->mode_select.rate)
> > > +			rate /=3D 2;
> > > +	}
> >=20
> > That needs synchronisation with the MMC driver. How are you dealing
> > with this?
>=20
> I have problems with the MMCs. I will propose the necessary changes in
> both the clock and MMC drivers as soon as I have the 3 MMCs working
> (SDcard, wifi and eMMC) in the Banana Pi M3.

For the time being, that code is broken. And you are using it.

> > > +
> > > +	if (ccu->p_width) {				/* m and p */
> > > +		ret =3D ccu_pll_find_best(ccu, rate, parent_rate, &v);
> > > +		if (ret)
> > > +			return ret;
> > > +	} else {					/* m alone */
> > > +		v.m =3D divider_get_val(rate, parent_rate,
> > > +				ccu->div_table, ccu->m_width, ccu->div_flags);
> > > +		v.p =3D 0;
> > > +		return 0;
> > > +	}
> > > +
> > > +	mask =3D CCU_MASK(ccu->m_shift, ccu->m_width) |
> > > +		CCU_MASK(ccu->p_shift, ccu->p_width);
> > > +
> > > +	if (ccu->features & CCU_FEATURE_SET_RATE_UNGATE)
> > > +		ccu_disable(hw);
> >=20
> > ungating means enable, and this is already dealt with by the core.
>=20
> Right, the name is wrong.
> But nothing is done by the core: when CLK_SET_RATE_GATE is set, and
> when the gate is enabled, set_rate() fails.

I was talking about CLK_SET_RATE_UNGATE.

> > > +const struct clk_ops ccu_fixed_factor_ops =3D {
> > > +	.disable	=3D ccu_disable,
> > > +	.enable		=3D ccu_enable,
> > > +/*	.is_enabled	=3D NULL, */
> > > +
> > > +	.recalc_rate	=3D ccu_fixed_factor_recalc_rate,
> > > +	.round_rate	=3D ccu_fixed_factor_round_rate,
> > > +	.set_rate	=3D ccu_fixed_factor_set_rate,
> > > +};
> >=20
> > This is redundant with the core.
>=20
> I don't see how:
> - the 'mul' and 'div' fields are not at the same offset
> - some fixed_factor clocks may have a gate.

Which ones?

> > > +	mask =3D BIT(bit);
> > > +
> > > +	spin_lock(&ccu_lock);
> > > +	if (enable)
> > > +		writel(readl(ccu_reset->base + reg) | mask,
> > > +			ccu_reset->base + reg);
> > > +	else
> > > +		writel(readl(ccu_reset->base + reg) & ~mask,
> > > +			ccu_reset->base + reg);
> > > +	spin_unlock(&ccu_lock);
> > > +}
> > > +
> > > +static int ccu_reset_assert(struct reset_controller_dev *rcdev,
> > > +			    unsigned long id)
> > > +{
> > > +	struct ccu_reset *ccu_reset =3D rcdev_to_ccu_reset(rcdev);
> > > +	const struct ccu_reset_map *map =3D &ccu_reset->reset_map[id];
> > > +
> > > +	ccu_set_reset_clock(ccu_reset, map->reg, map->bit, 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int ccu_reset_deassert(struct reset_controller_dev *rcdev,
> > > +			      unsigned long id)
> > > +{
> > > +	struct ccu_reset *ccu_reset =3D rcdev_to_ccu_reset(rcdev);
> > > +	const struct ccu_reset_map *map =3D &ccu_reset->reset_map[id];
> > > +
> > > +	ccu_set_reset_clock(ccu_reset, map->reg, map->bit, 1);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +const struct reset_control_ops ccu_reset_ops =3D {
> > > +	.assert		=3D ccu_reset_assert,
> > > +	.deassert	=3D ccu_reset_deassert,
> > > +};
> > > +
> > > +/* --- init --- */
> > > +int __init ccu_probe(struct device_node *node,
> > > +			struct clk_hw_onecell_data *data,
> > > +			struct ccu_reset *resets)
> > > +{
> > > +	struct clk_hw *hw;
> > > +	struct ccu *ccu;
> > > +	void __iomem *reg;
> > > +	int i, ret;
> > > +
> > > +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > > +	if (IS_ERR(reg)) {
> > > +		pr_err("%s: Clock mapping failed %d\n",
> > > +			of_node_full_name(node), (int) PTR_ERR(reg));
> > > +		return PTR_ERR(reg);
> > > +	}
> > > +
> > > +	/* register the clocks */
> > > +	for (i =3D 0; i < data->num; i++) {
> > > +		hw =3D data->hws[i];
> > > +#if CCU_DEBUG
> > > +		if (!hw) {
> > > +			pr_err("%s: Bad number of clocks %d !=3D %d\n",
> > > +				of_node_full_name(node),
> > > +				i + 1, data->num);
> > > +			data->num =3D i;
> > > +			break;
> > > +		}
> > > +#endif
> > > +		ccu =3D hw2ccu(hw);
> > > +		ccu->base =3D reg;
> > > +		ret =3D clk_hw_register(NULL, hw);
> > > +		if (ret < 0) {
> > > +			pr_err("%s: Register clock %s failed %d\n",
> > > +				of_node_full_name(node),
> > > +				clk_hw_get_name(hw), ret);
> > > +			data->num =3D i;
> > > +			break;
> > > +		}
> > > +	}
> > > +	ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data);
> > > +	if (ret < 0)
> > > +		goto err;
> > > +
> > > +	/* register the resets */
> > > +	resets->rcdev.of_node =3D node;
> > > +	resets->base =3D reg;
> > > +
> > > +	ret =3D reset_controller_register(&resets->rcdev);
> > > +	if (ret) {
> > > +		pr_err("%s: Reset register failed %d\n",
> > > +			of_node_full_name(node), ret);
> > > +		goto err;
> > > +	}
> > > +
> > > +	return ret;
> >=20
> > What's the point of this, if we're not using (or exposing for that
> > matter) any of it?
>=20
> Maybe I was misunderstood:
> - the control of the reset state may be needed for some clocks or by
>   some drivers, but,
> - most clocks / drivers don't need it, so, it is possible to hide these
>   resets inside the clock stuff. You may note that some drivers are
>   already prepared to this fact. For example, in the sunxi MMC driver,
>   the reset is optional.

Because you don't have a reset line on the first SoCs. This has
nothing to do with our discussion.

> - in case a driver requests a reset, this last one should exist.
>   But, this reset may point to a void one (reg =3D null) when the real
>   reset has been moved to the prepare/unprepare of the associated clock.

And what if this driver wants to be reset, by calling
reset_control_reset? You realize you're going against the semantics of
the reset and clock APIs, and what the hardware expose here right?

> > I'm sorry, but the whole point of the initial serie was to rework and
> > simplify things, precisely because dealing with the clk_factors code
> > was just too difficult nowadays. And this doesn't solve anything on
> > that aspect.
>=20
> In my code, all the clock factors I know about are handled.
> Basically, the requested and the parent rates give a multiplier and a
> divider. These ones are dispatched into the specific clock factors
> according to their constraints.

You missed the "simplify" part. The other reason for this serie to
exist was to be consistent with what the other architectures are
doing, which is not the case here either.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXdYwzAAoJEBx+YmzsjxAgbAUP+gKy8iNCBfDmHBujbo+HIwDI
9Qwb9u5mcqLwWoTPi1MDTReKX0tOq1MYm1kE2ljsj8othMMimYuWGuTuGwrNP0xx
bcmsu8X3oLZ57f71f3ItZ51NTLKfbiR5cj4qIdeJMAjtjd7/yQvWoJHX2ZA5U9p1
65YV0W4T5/u/7u3GyBk/QOK+ohwlBj7lDyFLH5uDpo5Vv/zHDPJ9E4JFlbec5LF+
81NnQuvmsrovLFITZ4CTXuoOq14paehU/tqeL7ddCtnhfJu9ChpXE1nfHSTUhBa/
1I+rpbLU/BbJZ9ng2/HdUv7Gyu5JJ4XPuexyWtvYk6oS4Xgk/Llu1GhRYsaV/edT
PMmxbgP2/ouuU6H0hyqt6vUFzEt6UGEqYMEySpF+d7x809StooU53wJ0dTUFC+Es
H5fzFSw0ud7S2TIsNzmPlk1niRF6XhwL24eBieZI82Kh6TtFZ8taEzn6xfC3+16i
dYYRvr637ojDIYEF1tQi9av/HjyvO2r+mP0A2ZKIMuw4sgUPx88PxF9F3DqDP7DM
QXDx6/obL+6P9xRmfHyI6nHaYqBUxIGKhI4+8/x1Y//ngVnvcvZ1fs4C0vxIcn2t
dqIszY23kxwv63a/6jBh+IhXZ0XeXIk97FlxxxJk05B+r0HtkqBcQqA7uV04ESUI
dm0FgFZQb8j5LVpSsWOZ
=vgNd
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
