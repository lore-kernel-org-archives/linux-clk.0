Return-Path: <sjoerd.simons@collabora.co.uk>
Message-ID: <1444072153.9895.25.camel@collabora.co.uk>
Subject: Re: [PATCH 1/3] clk: add flag for clocks that need to be enabled on
 rate changes
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Date: Mon, 05 Oct 2015 21:09:13 +0200
In-Reply-To: <1929669.AsgMSusdJb@phil>
References: <1929669.AsgMSusdJb@phil>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2015-08-21 at 19:46 +0200, Heiko Stuebner wrote:
> Some clocks need to be enabled to accept rate changes. This patch
> adds a
> new flag CLK_SET_RATE_UNGATE that lets clk_change_rate enable the
> clock
> before trying to change the rate and disable it again afterwards.
> This of course doesn't effect clocks that are already running at that
> point, as their refcount will only temporarily increase.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Tested-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Reviewed-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

> ---
>  drivers/clk/clk.c            | 18 ++++++++++++++++++
>  include/linux/clk-provider.h |  1 +
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 28cd923..564f11e 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1438,6 +1438,15 @@ static void clk_change_rate(struct clk_core
> *core)
>  	else if (core->parent)
>  		best_parent_rate =3D core->parent->rate;
> =20
> +	if (core->flags & CLK_SET_RATE_UNGATE) {
> +		unsigned long flags;
> +
> +		clk_core_prepare(core);
> +		flags =3D clk_enable_lock();
> +		clk_core_enable(core);
> +		clk_enable_unlock(flags);
> +	}
> +
>  	if (core->new_parent && core->new_parent !=3D core->parent) {
>  		old_parent =3D __clk_set_parent_before(core, core
> ->new_parent);
>  		trace_clk_set_parent(core, core->new_parent);
> @@ -1464,6 +1473,15 @@ static void clk_change_rate(struct clk_core
> *core)
> =20
>  	core->rate =3D clk_recalc(core, best_parent_rate);
> =20
> +	if (core->flags & CLK_SET_RATE_UNGATE) {
> +		unsigned long flags;
> +
> +		flags =3D clk_enable_lock();
> +		clk_core_disable(core);
> +		clk_enable_unlock(flags);
> +		clk_core_unprepare(core);
> +	}
> +
>  	if (core->notifier_count && old_rate !=3D core->rate)
>  		__clk_notify(core, POST_RATE_CHANGE, old_rate, core
> ->rate);
> =20
> diff --git a/include/linux/clk-provider.h b/include/linux/clk
> -provider.h
> index 3ecc07d..21e0025 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -31,6 +31,7 @@
>  #define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate
> change */
>  #define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk
> accuracy */
>  #define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after
> notifications */
> +#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to
> set rate */
> =20
>  struct clk;
>  struct clk_hw;

--=20
Sjoerd Simons
Collabora Ltd.
