Return-Path: <sjoerd.simons@collabora.co.uk>
Message-ID: <1444072191.9895.27.camel@collabora.co.uk>
Subject: Re: [PATCH 2/3] clk: rockchip: handle mux dependency of fractional
 dividers
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Mon, 05 Oct 2015 21:09:51 +0200
In-Reply-To: <1990916.Xur8Q3rQIb@phil>
References: <1929669.AsgMSusdJb@phil> <1990916.Xur8Q3rQIb@phil>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2015-08-21 at 19:47 +0200, Heiko Stuebner wrote:
> The fractional dividers of Rockchip SoCs contain an "auto-gating
> -feature"
> that requires the downstream mux to actually point to the fractional
> divider and the fractional divider gate to be enabled, for it to
> really
> accept changes to the divider ratio.
>=20
> The downstream muxes themselfs are not generic enough to include them
> directly into the fractional divider, as they have varying sources of
> parent clocks including not only clocks related to the fractional
> dividers but other clocks as well.
>=20
> To solve this, allow our clock branches to specify direct child clock
> -
> branches in the new child property, let the fractional divider
> register
> its downstream mux through this and add a clock notifier that
> temporarily
> switches the mux setting when it notices rate changes to the
> fractional
> divider.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Tested-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Reviewed-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>


>  drivers/clk/rockchip/clk.c | 137
> ++++++++++++++++++++++++++++++++++++++++-----
>  drivers/clk/rockchip/clk.h |  19 +++++++
>  2 files changed, 142 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index 2493881..8c7fd2b 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -102,22 +102,82 @@ static struct clk
> *rockchip_clk_register_branch(const char *name,
>  	return clk;
>  }
> =20
> +struct rockchip_clk_frac {
> +	struct notifier_block			clk_nb;
> +	struct clk_fractional_divider		div;
> +	struct clk_gate				gate;
> +
> +	struct clk_mux				mux;
> +	const struct clk_ops			*mux_ops;
> +	int					mux_frac_idx;
> +
> +	bool					rate_change_remu
> xed;
> +	int					rate_change_idx;
> +};
> +
> +#define to_rockchip_clk_frac_nb(nb) \
> +			container_of(nb, struct rockchip_clk_frac,
> clk_nb)
> +
> +static int rockchip_clk_frac_notifier_cb(struct notifier_block *nb,
> +					 unsigned long event, void
> *data)
> +{
> +	struct clk_notifier_data *ndata =3D data;
> +	struct rockchip_clk_frac *frac =3D
> to_rockchip_clk_frac_nb(nb);
> +	struct clk_mux *frac_mux =3D &frac->mux;
> +	int ret =3D 0;
> +
> +	pr_debug("%s: event %lu, old_rate %lu, new_rate: %lu\n",
> +		 __func__, event, ndata->old_rate, ndata->new_rate);
> +	if (event =3D=3D PRE_RATE_CHANGE) {
> +		frac->rate_change_idx =3D frac->mux_ops
> ->get_parent(&frac_mux->hw);
> +		if (frac->rate_change_idx !=3D frac->mux_frac_idx) {
> +			frac->mux_ops->set_parent(&frac_mux->hw,
> frac->mux_frac_idx);
> +			frac->rate_change_remuxed =3D 1;
> +		}
> +	} else if (event =3D=3D POST_RATE_CHANGE) {
> +		/*
> +		 * The POST_RATE_CHANGE notifier runs directly after
> the
> +		 * divider clock is set in clk_change_rate, so we'll
> have
> +		 * remuxed back to the original parent before
> clk_change_rate
> +		 * reaches the mux itself.
> +		 */
> +		if (frac->rate_change_remuxed) {
> +			frac->mux_ops->set_parent(&frac_mux->hw,
> frac->rate_change_idx);
> +			frac->rate_change_remuxed =3D 0;
> +		}
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
>  static struct clk *rockchip_clk_register_frac_branch(const char
> *name,
>  		const char *const *parent_names, u8 num_parents,
>  		void __iomem *base, int muxdiv_offset, u8 div_flags,
>  		int gate_offset, u8 gate_shift, u8 gate_flags,
> -		unsigned long flags, spinlock_t *lock)
> +		unsigned long flags, struct rockchip_clk_branch
> *child,
> +		spinlock_t *lock)
>  {
> +	struct rockchip_clk_frac *frac;
>  	struct clk *clk;
>  	struct clk_gate *gate =3D NULL;
>  	struct clk_fractional_divider *div =3D NULL;
>  	const struct clk_ops *div_ops =3D NULL, *gate_ops =3D NULL;
> =20
> -	if (gate_offset >=3D 0) {
> -		gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> -		if (!gate)
> -			return ERR_PTR(-ENOMEM);
> +	if (muxdiv_offset < 0)
> +		return ERR_PTR(-EINVAL);
> =20
> +	if (child && child->branch_type !=3D branch_mux) {
> +		pr_err("%s: fractional child clock for %s can only
> be a mux\n",
> +		       __func__, name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	frac =3D kzalloc(sizeof(*frac), GFP_KERNEL);
> +	if (!frac)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (gate_offset >=3D 0) {
> +		gate =3D &frac->gate;
>  		gate->flags =3D gate_flags;
>  		gate->reg =3D base + gate_offset;
>  		gate->bit_idx =3D gate_shift;
> @@ -125,13 +185,7 @@ static struct clk
> *rockchip_clk_register_frac_branch(const char *name,
>  		gate_ops =3D &clk_gate_ops;
>  	}
> =20
> -	if (muxdiv_offset < 0)
> -		return ERR_PTR(-EINVAL);
> -
> -	div =3D kzalloc(sizeof(*div), GFP_KERNEL);
> -	if (!div)
> -		return ERR_PTR(-ENOMEM);
> -
> +	div =3D &frac->div;
>  	div->flags =3D div_flags;
>  	div->reg =3D base + muxdiv_offset;
>  	div->mshift =3D 16;
> @@ -145,7 +199,61 @@ static struct clk
> *rockchip_clk_register_frac_branch(const char *name,
>  				     NULL, NULL,
>  				     &div->hw, div_ops,
>  				     gate ? &gate->hw : NULL,
> gate_ops,
> -				     flags);
> +				     flags | CLK_SET_RATE_UNGATE);
> +	if (IS_ERR(clk)) {
> +		kfree(frac);
> +		return clk;
> +	}
> +
> +	if (child) {
> +		struct clk_mux *frac_mux =3D &frac->mux;
> +		struct clk_init_data init;
> +		struct clk *mux_clk;
> +		int i, ret;
> +
> +		frac->mux_frac_idx =3D -1;
> +		for (i =3D 0; i < child->num_parents; i++) {
> +			if (!strcmp(name, child->parent_names[i])) {
> +				pr_debug("%s: found fractional
> parent in mux at pos %d\n",
> +					 __func__, i);
> +				frac->mux_frac_idx =3D i;
> +				break;
> +			}
> +		}
> +
> +		frac->mux_ops =3D &clk_mux_ops;
> +		frac->clk_nb.notifier_call =3D
> rockchip_clk_frac_notifier_cb;
> +
> +		frac_mux->reg =3D base + child->muxdiv_offset;
> +		frac_mux->shift =3D child->mux_shift;
> +		frac_mux->mask =3D BIT(child->mux_width) - 1;
> +		frac_mux->flags =3D child->mux_flags;
> +		frac_mux->lock =3D lock;
> +		frac_mux->hw.init =3D &init;
> +
> +		init.name =3D child->name;
> +		init.flags =3D child->flags | CLK_SET_RATE_PARENT;
> +		init.ops =3D frac->mux_ops;
> +		init.parent_names =3D child->parent_names;
> +		init.num_parents =3D child->num_parents;
> +
> +		mux_clk =3D clk_register(NULL, &frac_mux->hw);
> +		if (IS_ERR(mux_clk))
> +			return clk;
> +
> +		rockchip_clk_add_lookup(mux_clk, child->id);
> +
> +		/* notifier on the fraction divider to catch rate
> changes */
> +		if (frac->mux_frac_idx >=3D 0) {
> +			ret =3D clk_notifier_register(clk, &frac
> ->clk_nb);
> +			if (ret)
> +				pr_err("%s: failed to register clock
> notifier for %s\n",
> +						__func__, name);
> +		} else {
> +			pr_warn("%s: could not find %s as parent of
> %s, rate changes may not work\n",
> +				__func__, name, child->name);
> +		}
> +	}
> =20
>  	return clk;
>  }
> @@ -249,7 +357,8 @@ void __init rockchip_clk_register_branches(
>  				list->parent_names, list
> ->num_parents,
>  				reg_base, list->muxdiv_offset, list
> ->div_flags,
>  				list->gate_offset, list->gate_shift,
> -				list->gate_flags, flags, &clk_lock);
> +				list->gate_flags, flags, list
> ->child,
> +				&clk_lock);
>  			break;
>  		case branch_gate:
>  			flags |=3D CLK_SET_RATE_PARENT;
> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> index dc8ecb2..147db79 100644
> --- a/drivers/clk/rockchip/clk.h
> +++ b/drivers/clk/rockchip/clk.h
> @@ -235,6 +235,7 @@ struct rockchip_clk_branch {
>  	int				gate_offset;
>  	u8				gate_shift;
>  	u8				gate_flags;
> +	struct rockchip_clk_branch	*child;
>  };
> =20
>  #define COMPOSITE(_id, cname, pnames, f, mo, ms, mw, mf, ds, dw,\
> @@ -369,6 +370,24 @@ struct rockchip_clk_branch {
>  		.gate_flags	=3D gf,			=09
> \
>  	}
> =20
> +#define COMPOSITE_FRACMUX(_id, cname, pname, f, mo, df, go, gs, gf,
> ch) \
> +	{							\
> +		.id		=3D _id,			=09
> \
> +		.branch_type	=3D branch_fraction_divider,=09
> \
> +		.name		=3D cname,		=09
> \
> +		.parent_names	=3D (const char *[]){ pname },=09
> \
> +		.num_parents	=3D 1,			=09
> \
> +		.flags		=3D f,			=09
> \
> +		.muxdiv_offset	=3D mo,			=09
> \
> +		.div_shift	=3D 16,			=09
> \
> +		.div_width	=3D 16,			=09
> \
> +		.div_flags	=3D df,			=09
> \
> +		.gate_offset	=3D go,			=09
> \
> +		.gate_shift	=3D gs,			=09
> \
> +		.gate_flags	=3D gf,			=09
> \
> +		.child		=3D &(struct
> rockchip_clk_branch)ch, \
> +	}
> +
>  #define MUX(_id, cname, pnames, f, o, s, w, mf)		=09
> \
>  	{							\
>  		.id		=3D _id,			=09
> \

--=20
Sjoerd Simons
Collabora Ltd.
