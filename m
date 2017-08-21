Return-Path: <boris.brezillon@free-electrons.com>
Date: Mon, 21 Aug 2017 21:43:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com,
 huangtao@rock-chips.com, david.wu@rock-chips.com, xjq@rock-chips.com, Doug
 Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1] clk: Keep clocks in their initial state until
 clk_disable_unused() is called
Message-ID: <20170821214303.25169c7d@bbrezillon>
In-Reply-To: <1502264249-30509-1-git-send-email-zhangqing@rock-chips.com>
References: <1502264249-30509-1-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

+Doug

Le Wed,  9 Aug 2017 15:37:29 +0800,
Elaine Zhang <zhangqing@rock-chips.com> a =C3=A9crit :

> ome drivers are briefly preparing+enabling the clock in their

*Some

> ->probe() hook and disable+unprepare them before leaving the function. =20
>=20
> This can be problem if a clock is shared between different devices, and
> one of these devices is critical to the system. If this clock is
> enabled/disabled by a non-critical device before the driver of the
> critical one had a chance to enable+prepare it, there might be a short
> period of time during which the critical device is not clocked.
>=20
> To solve this problem, we save the initial clock state (at registration
> time) and prevent the clock from being disabled until kernel init is done
> (which is when clk_disable_unused() is called).

Well, my patch was just an informal proposal, and Doug pointed one
thing that needs to be addressed before considering this approach: we
are breaking clk users that expect clk_disable/unprepare() to be
synchronous even when they're called before clk_disable_unused().

Mike, Stephen, any idea how to solve this problem properly?

>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  drivers/clk/clk.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fc58c52a26b4..3f61374a364b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -58,6 +58,8 @@ struct clk_core {
>  	struct clk_core		*new_child;
>  	unsigned long		flags;
>  	bool			orphan;
> +	bool			keep_enabled;
> +	bool			keep_prepared;
>  	unsigned int		enable_count;
>  	unsigned int		prepare_count;
>  	unsigned long		min_rate;
> @@ -486,7 +488,7 @@ static void clk_core_unprepare(struct clk_core *core)
> =20
>  	trace_clk_unprepare(core);
> =20
> -	if (core->ops->unprepare)
> +	if (core->ops->unprepare && !core->keep_prepared)
>  		core->ops->unprepare(core->hw);
> =20
>  	trace_clk_unprepare_complete(core);
> @@ -602,7 +604,7 @@ static void clk_core_disable(struct clk_core *core)
> =20
>  	trace_clk_disable_rcuidle(core);
> =20
> -	if (core->ops->disable)
> +	if (core->ops->disable && !core->keep_enabled)
>  		core->ops->disable(core->hw);
> =20
>  	trace_clk_disable_complete_rcuidle(core);
> @@ -739,6 +741,12 @@ static void clk_unprepare_unused_subtree(struct clk_=
core *core)
>  	hlist_for_each_entry(child, &core->children, child_node)
>  		clk_unprepare_unused_subtree(child);
> =20
> +	/*
> +	 * Reset the ->keep_prepared flag so that subsequent calls to
> +	 * clk_unprepare() on this clk actually unprepare it.
> +	 */
> +	core->keep_prepared =3D false;
> +
>  	if (core->prepare_count)
>  		return;
> =20
> @@ -770,6 +778,12 @@ static void clk_disable_unused_subtree(struct clk_co=
re *core)
> =20
>  	flags =3D clk_enable_lock();
> =20
> +	/*
> +	 * Reset the ->keep_enabled flag so that subsequent calls to
> +	 * clk_disable() on this clk actually disable it.
> +	 */
> +	core->keep_enabled =3D false;
> +
>  	if (core->enable_count)
>  		goto unlock_out;
> =20
> @@ -2446,6 +2460,17 @@ static int __clk_core_init(struct clk_core *core)
>  		core->accuracy =3D 0;
> =20
>  	/*
> +	 * We keep track of the initial clk status to keep clks in the state
> +	 * they were left in by the bootloader until all drivers had a chance
> +	 * to keep them prepared/enabled if they need to.
> +	 */
> +	if (core->ops->is_prepared && !clk_ignore_unused)
> +		core->keep_prepared =3D core->ops->is_prepared(core->hw);
> +
> +	if (core->ops->is_enabled && !clk_ignore_unused)
> +		core->keep_enabled =3D core->ops->is_enabled(core->hw);
> +
> +	/*
>  	 * Set clk's phase.
>  	 * Since a phase is by definition relative to its parent, just
>  	 * query the current clock phase, or just assume it's in phase.
