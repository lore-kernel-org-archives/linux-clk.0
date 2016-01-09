Return-Path: <sjoerd.simons@collabora.co.uk>
Message-ID: <1452343234.4120.3.camel@collabora.co.uk>
Subject: Re: [RFC PATCH v3] clk: defer clk_gets on orphan clocks
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner@collabora.com>,
	mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Sat, 09 Jan 2016 13:40:34 +0100
In-Reply-To: <1483326.lTmfGmv5pO@diego>
References: <1483326.lTmfGmv5pO@diego>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2015-11-24 at 13:42 +0100, Heiko St=C3=BCbner wrote:
> Orphan clocks or children of orphan clocks don't have rate
> information at
> all and can produce strange results if they're allowed to be used and
> the
> parent becomes available later on.
>=20
> This change, based on one from Stephen Boyd, defers
> __clk_create_clk()
> calls on orphan clocks in all regular cases.
>=20
> One special case that gets handled, is accessing such orphan clocks
> when
> handling assigned-clocks configurations. In the boot-defaults it may
> be
> the case that a clock is connected to an orphan parent which then
> might
> be needed to get reparented to an actually usable clock using
> assigned-clock-parents. In this case even orphaned clocks should be
> usable, but only for the set-parent case.
>=20
> The added of_clk_get_from_provider_with_orphans() is only available
> to ccf internal parts to prevent abuse.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@collabora.com>

Tested-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Just tested this on a rock 2 with the RTC as a module (which is the
provider of the 32k clock on this board). This solves both unreliably
probing of the wireless card and much more importantly the thermal
sensors.

Would be great to see this move out of the RFC stage at some point :)


> ---
> This of course will still break sunxi, hence the RFC state for now.
> As there is work pending for critical/handed-off clocks, I'm hoping
> this can move forward at some point :-) .
>=20
> I'd mainly like to get feedback if the assigned-clocks case looks ok
> or should move somewhere else.
>=20
> changes in v3:
> - add special handling for assigned-clock-parents to allow
> reparenting
> =C2=A0 of orphaned child-clocks.
>=20
> changes in v2 (Stephens version):
> - find a better place for the deferral
>=20
> =C2=A0drivers/clk/clk-conf.c |=C2=A0=C2=A05 +++--
> =C2=A0drivers/clk/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 48 +++++++++=
+++++++++++++++++++++++++++++
> ----------
> =C2=A0drivers/clk/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 10 +++++++--=
-
> =C2=A0drivers/clk/clkdev.c=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A04 ++--
> =C2=A04 files changed, 50 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 43a218f..60ebfd9 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/printk.h>
> +#include "clk.h"
> =C2=A0
> =C2=A0static int __set_clk_parents(struct device_node *node, bool
> clk_supplier)
> =C2=A0{
> @@ -38,7 +39,7 @@ static int __set_clk_parents(struct device_node
> *node, bool clk_supplier)
> =C2=A0		}
> =C2=A0		if (clkspec.np =3D=3D node && !clk_supplier)
> =C2=A0			return 0;
> -		pclk =3D of_clk_get_from_provider(&clkspec);
> +		pclk =3D
> of_clk_get_from_provider_with_orphans(&clkspec);
> =C2=A0		if (IS_ERR(pclk)) {
> =C2=A0			pr_warn("clk: couldn't get parent clock %d
> for %s\n",
> =C2=A0				index, node->full_name);
> @@ -53,7 +54,7 @@ static int __set_clk_parents(struct device_node
> *node, bool clk_supplier)
> =C2=A0			rc =3D 0;
> =C2=A0			goto err;
> =C2=A0		}
> -		clk =3D of_clk_get_from_provider(&clkspec);
> +		clk =3D
> of_clk_get_from_provider_with_orphans(&clkspec);
> =C2=A0		if (IS_ERR(clk)) {
> =C2=A0			pr_warn("clk: couldn't get parent clock %d
> for %s\n",
> =C2=A0				index, node->full_name);
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f13c3f4..46760cb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2476,15 +2476,11 @@ out:
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> -struct clk *__clk_create_clk(struct clk_hw *hw, const char *dev_id,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *con_id)
> +static struct clk *clk_hw_create_clk(struct clk_hw *hw, const char
> *dev_id,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *con_id)
> =C2=A0{
> =C2=A0	struct clk *clk;
> =C2=A0
> -	/* This is to allow this function to be chained to others */
> -	if (!hw || IS_ERR(hw))
> -		return (struct clk *) hw;
> -
> =C2=A0	clk =3D kzalloc(sizeof(*clk), GFP_KERNEL);
> =C2=A0	if (!clk)
> =C2=A0		return ERR_PTR(-ENOMEM);
> @@ -2501,6 +2497,19 @@ struct clk *__clk_create_clk(struct clk_hw
> *hw, const char *dev_id,
> =C2=A0	return clk;
> =C2=A0}
> =C2=A0
> +struct clk *__clk_create_clk(struct clk_hw *hw, const char *dev_id,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *con_id, bool with_orphans)
> +{
> +	/* This is to allow this function to be chained to others */
> +	if (!hw || IS_ERR(hw))
> +		return (struct clk *) hw;
> +
> +	if (hw->core->orphan && !with_orphans)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return clk_hw_create_clk(hw, dev_id, con_id);
> +}
> +
> =C2=A0void __clk_free_clk(struct clk *clk)
> =C2=A0{
> =C2=A0	clk_prepare_lock();
> @@ -2569,7 +2578,7 @@ struct clk *clk_register(struct device *dev,
> struct clk_hw *hw)
> =C2=A0
> =C2=A0	INIT_HLIST_HEAD(&core->clks);
> =C2=A0
> -	hw->clk =3D __clk_create_clk(hw, NULL, NULL);
> +	hw->clk =3D clk_hw_create_clk(hw, NULL, NULL);
> =C2=A0	if (IS_ERR(hw->clk)) {
> =C2=A0		ret =3D PTR_ERR(hw->clk);
> =C2=A0		goto fail_parent_names_copy;
> @@ -3002,7 +3011,8 @@ void of_clk_del_provider(struct device_node
> *np)
> =C2=A0EXPORT_SYMBOL_GPL(of_clk_del_provider);
> =C2=A0
> =C2=A0struct clk *__of_clk_get_from_provider(struct of_phandle_args
> *clkspec,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *dev_id, const
> char *con_id)
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *dev_id, const
> char *con_id,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool with_orphans)
> =C2=A0{
> =C2=A0	struct of_clk_provider *provider;
> =C2=A0	struct clk *clk =3D ERR_PTR(-EPROBE_DEFER);
> @@ -3017,7 +3027,7 @@ struct clk *__of_clk_get_from_provider(struct
> of_phandle_args *clkspec,
> =C2=A0			clk =3D provider->get(clkspec, provider-
> >data);
> =C2=A0		if (!IS_ERR(clk)) {
> =C2=A0			clk =3D __clk_create_clk(__clk_get_hw(clk),
> dev_id,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0con_id);
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0con_id,
> with_orphans);
> =C2=A0
> =C2=A0			if (!IS_ERR(clk) && !__clk_get(clk)) {
> =C2=A0				__clk_free_clk(clk);
> @@ -3042,7 +3052,25 @@ struct clk *__of_clk_get_from_provider(struct
> of_phandle_args *clkspec,
> =C2=A0 */
> =C2=A0struct clk *of_clk_get_from_provider(struct of_phandle_args
> *clkspec)
> =C2=A0{
> -	return __of_clk_get_from_provider(clkspec, NULL, __func__);
> +	return __of_clk_get_from_provider(clkspec, NULL, __func__,
> false);
> +}
> +
> +/**
> + * of_clk_get_from_provider_with_orphans() - Lookup clock from a
> clock provider
> + * @clkspec: pointer to a clock specifier data structure
> + *
> + * This function looks up a struct clk from the registered list of
> clock
> + * providers, an input is a clock specifier data structure as
> returned
> + * from the of_parse_phandle_with_args() function call.
> + *
> + * The difference to of_clk_get_from_provider() is that this
> function will
> + * also successfully lookup orphan-clocks, as it in some cases may
> be
> + * necessary to access such orphan-clocks as well.
> + */
> +struct clk *
> +of_clk_get_from_provider_with_orphans(struct of_phandle_args
> *clkspec)
> +{
> +	return __of_clk_get_from_provider(clkspec, NULL, __func__,
> true);
> =C2=A0}
> =C2=A0
> =C2=A0int of_clk_get_parent_count(struct device_node *np)
> diff --git a/drivers/clk/clk.h b/drivers/clk/clk.h
> index 00b35a1..5a70f09 100644
> --- a/drivers/clk/clk.h
> +++ b/drivers/clk/clk.h
> @@ -13,17 +13,21 @@ struct clk_hw;
> =C2=A0
> =C2=A0#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
> =C2=A0struct clk *__of_clk_get_from_provider(struct of_phandle_args
> *clkspec,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *dev_id, const
> char *con_id);
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *dev_id, const
> char *con_id,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool with_orphans);
> +struct clk *
> +of_clk_get_from_provider_with_orphans(struct of_phandle_args
> *clkspec);
> =C2=A0#endif
> =C2=A0
> =C2=A0#ifdef CONFIG_COMMON_CLK
> =C2=A0struct clk *__clk_create_clk(struct clk_hw *hw, const char *dev_id,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *con_id);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const char *con_id, bool with_orphans);
> =C2=A0void __clk_free_clk(struct clk *clk);
> =C2=A0#else
> =C2=A0/* All these casts to avoid ifdefs in clkdev... */
> =C2=A0static inline struct clk *
> -__clk_create_clk(struct clk_hw *hw, const char *dev_id, const char
> *con_id)
> +__clk_create_clk(struct clk_hw *hw, const char *dev_id, const char
> *con_id,
> +		=C2=A0bool with_orphans)
> =C2=A0{
> =C2=A0	return (struct clk *)hw;
> =C2=A0}
> diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
> index 779b6ff..eda20c2 100644
> --- a/drivers/clk/clkdev.c
> +++ b/drivers/clk/clkdev.c
> @@ -43,7 +43,7 @@ static struct clk *__of_clk_get(struct device_node
> *np, int index,
> =C2=A0	if (rc)
> =C2=A0		return ERR_PTR(rc);
> =C2=A0
> -	clk =3D __of_clk_get_from_provider(&clkspec, dev_id, con_id);
> +	clk =3D __of_clk_get_from_provider(&clkspec, dev_id, con_id,
> false);
> =C2=A0	of_node_put(clkspec.np);
> =C2=A0
> =C2=A0	return clk;
> @@ -177,7 +177,7 @@ struct clk *clk_get_sys(const char *dev_id, const
> char *con_id)
> =C2=A0	if (!cl)
> =C2=A0		goto out;
> =C2=A0
> -	clk =3D __clk_create_clk(cl->clk_hw, dev_id, con_id);
> +	clk =3D __clk_create_clk(cl->clk_hw, dev_id, con_id, false);
> =C2=A0	if (IS_ERR(clk))
> =C2=A0		goto out;
> =C2=A0

--=20
Sjoerd Simons
Collabora Ltd.
