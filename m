Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0268C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 12:17:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiJJMR1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 08:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbiJJMR0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 08:17:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8589F11C0E
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 05:17:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 153CEB80E77
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 12:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BE3C433D6;
        Mon, 10 Oct 2022 12:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665404241;
        bh=d21madazv7qgRmB3dsdX8U/gFrfBTVvnEC19ulvvUIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=naL8axO4j7kz+pWoUNwOgsLgo7oXDWSKyVAtHTbJwPoWLNddUihAxSd03xc36cLxg
         LnnQffWeHTCnmsXRy3PepUcu39AN5WgPIIsW7YQauyIhHzEpnSJpaCJKy3dEDU0nUo
         eLnKrh62I4/9wsD7raC3Pp+2FztVCTJOB7Sq3OwN6erSmqou/w7DuRfLVPOM6UvnMx
         YiK2KwdLiiLqjWmyCnLw63SnZX5F+fhJeGWXJ/ypsV4mgZmbrO6p2hAomY1A7/C1fL
         IIqtgj/a4rll0PdNuJddI6M+8pUpXsS+sjzGHOMDGLmMYklWvw0JMDroIZOQucpxWt
         4JwSX5ZzaL/wg==
Date:   Mon, 10 Oct 2022 13:17:15 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        gtucker@collabora.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: next/master bisection: baseline.login on rk3328-rock64
Message-ID: <Y0QNSx+ZgqKSvPOC@sirena.org.uk>
References: <634095b3.a70a0220.ad568.42a8@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ToVdk7XFfLxJF69E"
Content-Disposition: inline
In-Reply-To: <634095b3.a70a0220.ad568.42a8@mx.google.com>
X-Cookie: This sentence no verb.
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ToVdk7XFfLxJF69E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 02:10:11PM -0700, KernelCI bot wrote:

The KernelCI bisection bot found a boot problem on today's -next=20
on rk3328-rock64 with a defconfig plus debug fragments triggered by
cb1b1dd96241f ("clk: Set req_rate on reparenting").  The log doesn't
show any obvious warnings but simply stalls out after:

[  258.676722][    T1] pps_core: LinuxPPS API ver. 1 registered
[  258.684929][    T1] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 =
Rodolfo Giometti <giometti@linux.it>
[  258.788655][    T1] PTP clock support registered
[  259.246358][    T1] EDAC MC: Ver: 3.0.0

It seems like the performance of the system has been dramatically
reduced, current mainline boots with the same kernel config show we're
reaching that point after only 5s:

[    5.577047][    T1] PTP clock support registered
[    5.585556][    T1] EDAC MC: Ver: 3.0.0

and getting to a prompt after a bit over a minute which is much more
viable.  There do seem to be a kasan issues in mainline in some
combination of the clock and ASoC code though, log at:

   https://storage.kernelci.org/mainline/master/v6.0-9423-g493ffd6605b2d/ar=
m64/defconfig%2Bdebug/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt

The full config is:

   https://storage.kernelci.org/next/master/next-20221005/arm64/defconfig+d=
ebug/gcc-10/config/kernel.config

The debug fragment is:

   https://storage.kernelci.org/next/master/next-20221005/arm64/defconfig+d=
ebug/gcc-10/config/kernelci.config

I've left the full bot report, including links to the full logs and
other information plus a tag for the bot below:

> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> next/master bisection: baseline.login on rk3328-rock64
>=20
> Summary:
>   Start:      67ae4f7434cee Add linux-next specific files for 20221005
>   Plain log:  https://storage.kernelci.org/next/master/next-20221005/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20221005/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
>   Result:     cb1b1dd96241f clk: Set req_rate on reparenting
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
>   Branch:     master
>   Target:     rk3328-rock64
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-10
>   Config:     defconfig+debug
>   Test case:  baseline.login
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit cb1b1dd96241f37ea41d241946d5153c48141cd5
> Author: Maxime Ripard <maxime@cerno.tech>
> Date:   Tue Aug 16 13:25:18 2022 +0200
>=20
>     clk: Set req_rate on reparenting
>    =20
>     If a non-rate clock started by default with a parent that never
>     registered, core->req_rate will be 0. The expectation is that whenever
>     the parent will be registered, req_rate will be updated with the new
>     value that has just been computed.
>    =20
>     However, if that clock is a mux, clk_set_parent() can also make that
>     clock no longer orphan. In this case however, we never update req_rat=
e.
>    =20
>     The natural solution to this would be to update core->rate and
>     core->req_rate in clk_reparent() by calling clk_recalc().
>    =20
>     However, this doesn't work in all cases. Indeed, clk_recalc() is call=
ed
>     by __clk_set_parent_before(), __clk_set_parent() and
>     clk_core_reparent(). Both __clk_set_parent_before() and __clk_set_par=
ent
>     will call clk_recalc() with the enable_lock taken through a call to
>     clk_enable_lock(), the underlying locking primitive being a spinlock.
>    =20
>     clk_recalc() calls the backing driver .recalc_rate hook, and that
>     implementation might sleep if the underlying device uses a bus with
>     accesses that might sleep, such as i2c.
>    =20
>     In such a situation, we would end up sleeping while holding a spinloc=
k,
>     and thus in an atomic section.
>    =20
>     In order to work around this, we can move the core->rate and
>     core->req_rate update to the clk_recalc() calling sites, after the
>     enable_lock has been released if it was taken.
>    =20
>     The only situation that could still be problematic is the
>     clk_core_reparent() -> clk_reparent() case that doesn't have any
>     locking. clk_core_reparent() is itself called by clk_hw_reparent(),
>     which is then called by 4 drivers:
>    =20
>       * clk-stm32mp1.c, stm32/clk-stm32-core.c and tegra/clk-tegra210-emc=
=2Ec
>         use it in their set_parent implementation. The set_parent hook is
>         only called by __clk_set_parent() and clk_change_rate(), both of
>         them calling it without the enable_lock taken.
>    =20
>       * clk/tegra/clk-tegra124-emc.c calls it as part of its set_rate
>         implementation. set_rate is only called by clk_change_rate(), aga=
in
>         without the enable_lock taken.
>    =20
>     In both cases we can't end up in a situation where the clk_hw_reparen=
t()
>     caller would hold a spinlock, so it seems like this is a good
>     workaround.
>    =20
>     Let's also add some unit tests to make sure we cover the original bug.
>    =20
>     Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
>     Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, =
meson g12b
>     Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>     Link: https://lore.kernel.org/r/20220816112530.1837489-14-maxime@cern=
o.tech
>     Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
>     Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>     Signed-off-by: Stephen Boyd <sboyd@kernel.org>
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 53b28e63deae3..91bb1ea0e147b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1765,6 +1765,23 @@ static void clk_core_update_orphan_status(struct c=
lk_core *core, bool is_orphan)
>  		clk_core_update_orphan_status(child, is_orphan);
>  }
> =20
> +/*
> + * Update the orphan rate and req_rate of @core and all its children.
> + */
> +static void clk_core_update_orphan_child_rates(struct clk_core *core)
> +{
> +	struct clk_core *child;
> +	unsigned long parent_rate =3D 0;
> +
> +	if (core->parent)
> +		parent_rate =3D core->parent->rate;
> +
> +	core->rate =3D core->req_rate =3D clk_recalc(core, parent_rate);
> +
> +	hlist_for_each_entry(child, &core->children, child_node)
> +		clk_core_update_orphan_child_rates(child);
> +}
> +
>  static void clk_reparent(struct clk_core *core, struct clk_core *new_par=
ent)
>  {
>  	bool was_orphan =3D core->orphan;
> @@ -1834,6 +1851,8 @@ static struct clk_core *__clk_set_parent_before(str=
uct clk_core *core,
>  	clk_reparent(core, parent);
>  	clk_enable_unlock(flags);
> =20
> +	clk_core_update_orphan_child_rates(core);
> +
>  	return old_parent;
>  }
> =20
> @@ -1878,6 +1897,8 @@ static int __clk_set_parent(struct clk_core *core, =
struct clk_core *parent,
>  		flags =3D clk_enable_lock();
>  		clk_reparent(core, old_parent);
>  		clk_enable_unlock(flags);
> +
> +		clk_core_update_orphan_child_rates(core);
>  		__clk_set_parent_after(core, old_parent, parent);
> =20
>  		return ret;
> @@ -2506,6 +2527,7 @@ static void clk_core_reparent(struct clk_core *core,
>  				  struct clk_core *new_parent)
>  {
>  	clk_reparent(core, new_parent);
> +	clk_core_update_orphan_child_rates(core);
>  	__clk_recalc_accuracies(core);
>  	__clk_recalc_rates(core, POST_RATE_CHANGE);
>  }
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index d3e121f21ae21..d1b1372f7aaa9 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -594,6 +594,41 @@ clk_test_orphan_transparent_multiple_parent_mux_set_=
parent(struct kunit *test)
>  	clk_put(clk);
>  }
> =20
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_drop_range() on the mux won't affect the parent
> + * rate.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_drop_range(st=
ruct kunit *test)
> +{
> +	struct clk_multiple_parent_ctx *ctx =3D test->priv;
> +	struct clk_hw *hw =3D &ctx->hw;
> +	struct clk *clk =3D clk_hw_get_clk(hw, NULL);
> +	struct clk *parent;
> +	unsigned long parent_rate, new_parent_rate;
> +	int ret;
> +
> +	parent =3D clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> +
> +	parent_rate =3D clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, parent_rate, 0);
> +
> +	ret =3D clk_set_parent(clk, parent);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D clk_drop_range(clk);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_parent_rate =3D clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
> +	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
> +
> +	clk_put(parent);
> +	clk_put(clk);
> +}
> +
>  /*
>   * Test that, for a mux that started orphan but got switched to a valid
>   * parent, the rate of the mux and its new parent are consistent.
> @@ -625,6 +660,39 @@ clk_test_orphan_transparent_multiple_parent_mux_set_=
parent_get_rate(struct kunit
>  	clk_put(clk);
>  }
> =20
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_put() on the mux won't affect the parent rate.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_put(struct ku=
nit *test)
> +{
> +	struct clk_multiple_parent_ctx *ctx =3D test->priv;
> +	struct clk *clk, *parent;
> +	unsigned long parent_rate, new_parent_rate;
> +	int ret;
> +
> +	parent =3D clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> +
> +	clk =3D clk_hw_get_clk(&ctx->hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
> +
> +	parent_rate =3D clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, parent_rate, 0);
> +
> +	ret =3D clk_set_parent(clk, parent);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	clk_put(clk);
> +
> +	new_parent_rate =3D clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
> +	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
> +
> +	clk_put(parent);
> +}
> +
>  /*
>   * Test that, for a mux that started orphan but got switched to a valid
>   * parent, calling clk_set_rate_range() will affect the parent state if
> @@ -658,6 +726,43 @@ clk_test_orphan_transparent_multiple_parent_mux_set_=
parent_set_range_modified(st
>  	clk_put(clk);
>  }
> =20
> +/*
> + * Test that, for a mux that started orphan but got switched to a valid
> + * parent, calling clk_set_rate_range() won't affect the parent state if
> + * its rate is within range.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_unt=
ouched(struct kunit *test)
> +{
> +	struct clk_multiple_parent_ctx *ctx =3D test->priv;
> +	struct clk_hw *hw =3D &ctx->hw;
> +	struct clk *clk =3D clk_hw_get_clk(hw, NULL);
> +	struct clk *parent;
> +	unsigned long parent_rate, new_parent_rate;
> +	int ret;
> +
> +	parent =3D clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> +
> +	parent_rate =3D clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, parent_rate, 0);
> +
> +	ret =3D clk_set_parent(clk, parent);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ret =3D clk_set_rate_range(clk,
> +				 DUMMY_CLOCK_INIT_RATE - 1000,
> +				 DUMMY_CLOCK_INIT_RATE + 1000);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	new_parent_rate =3D clk_get_rate(parent);
> +	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
> +	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
> +
> +	clk_put(parent);
> +	clk_put(clk);
> +}
> +
>  /*
>   * Test that, for a mux whose current parent hasn't been registered yet,
>   * calling clk_set_rate_range() will succeed, and will be taken into
> @@ -724,8 +829,11 @@ clk_test_orphan_transparent_multiple_parent_mux_set_=
range_set_parent_get_rate(st
>  static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test=
_cases[] =3D {
>  	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
>  	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
> +	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_d=
rop_range),
>  	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_g=
et_rate),
> +	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_p=
ut),
>  	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_s=
et_range_modified),
> +	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_s=
et_range_untouched),
>  	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_ro=
und_rate),
>  	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_se=
t_parent_get_rate),
>  	{}
> @@ -1021,6 +1129,136 @@ static struct kunit_suite clk_orphan_transparent_=
single_parent_test_suite =3D {
>  	.test_cases =3D clk_orphan_transparent_single_parent_mux_test_cases,
>  };
> =20
> +struct clk_single_parent_two_lvl_ctx {
> +	struct clk_dummy_context parent_parent_ctx;
> +	struct clk_dummy_context parent_ctx;
> +	struct clk_hw hw;
> +};
> +
> +static int
> +clk_orphan_two_level_root_last_test_init(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx;
> +	int ret;
> +
> +	ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +	test->priv =3D ctx;
> +
> +	ctx->parent_ctx.hw.init =3D
> +		CLK_HW_INIT("intermediate-parent",
> +			    "root-parent",
> +			    &clk_dummy_single_parent_ops,
> +			    CLK_SET_RATE_PARENT);
> +	ret =3D clk_hw_register(NULL, &ctx->parent_ctx.hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->hw.init =3D
> +		CLK_HW_INIT("test-clk", "intermediate-parent",
> +			    &clk_dummy_single_parent_ops,
> +			    CLK_SET_RATE_PARENT);
> +	ret =3D clk_hw_register(NULL, &ctx->hw);
> +	if (ret)
> +		return ret;
> +
> +	ctx->parent_parent_ctx.rate =3D DUMMY_CLOCK_INIT_RATE;
> +	ctx->parent_parent_ctx.hw.init =3D
> +		CLK_HW_INIT_NO_PARENT("root-parent",
> +				      &clk_dummy_rate_ops,
> +				      0);
> +	ret =3D clk_hw_register(NULL, &ctx->parent_parent_ctx.hw);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void
> +clk_orphan_two_level_root_last_test_exit(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx =3D test->priv;
> +
> +	clk_hw_unregister(&ctx->hw);
> +	clk_hw_unregister(&ctx->parent_ctx.hw);
> +	clk_hw_unregister(&ctx->parent_parent_ctx.hw);
> +}
> +
> +/*
> + * Test that, for a clock whose parent used to be orphan, clk_get_rate()
> + * will return the proper rate.
> + */
> +static void
> +clk_orphan_two_level_root_last_test_get_rate(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx =3D test->priv;
> +	struct clk_hw *hw =3D &ctx->hw;
> +	struct clk *clk =3D clk_hw_get_clk(hw, NULL);
> +	unsigned long rate;
> +
> +	rate =3D clk_get_rate(clk);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
> +
> +	clk_put(clk);
> +}
> +
> +/*
> + * Test that, for a clock whose parent used to be orphan,
> + * clk_set_rate_range() won't affect its rate if it is already within
> + * range.
> + *
> + * See (for Exynos 4210):
> + * https://lore.kernel.org/linux-clk/366a0232-bb4a-c357-6aa8-636e398e05e=
b@samsung.com/
> + */
> +static void
> +clk_orphan_two_level_root_last_test_set_range(struct kunit *test)
> +{
> +	struct clk_single_parent_two_lvl_ctx *ctx =3D test->priv;
> +	struct clk_hw *hw =3D &ctx->hw;
> +	struct clk *clk =3D clk_hw_get_clk(hw, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	ret =3D clk_set_rate_range(clk,
> +				 DUMMY_CLOCK_INIT_RATE - 1000,
> +				 DUMMY_CLOCK_INIT_RATE + 1000);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	rate =3D clk_get_rate(clk);
> +	KUNIT_ASSERT_GT(test, rate, 0);
> +	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
> +
> +	clk_put(clk);
> +}
> +
> +static struct kunit_case
> +clk_orphan_two_level_root_last_test_cases[] =3D {
> +	KUNIT_CASE(clk_orphan_two_level_root_last_test_get_rate),
> +	KUNIT_CASE(clk_orphan_two_level_root_last_test_set_range),
> +	{}
> +};
> +
> +/*
> + * Test suite for a basic, transparent, clock with a parent that is also
> + * such a clock. The parent's parent is registered last, while the
> + * parent and its child are registered in that order. The intermediate
> + * and leaf clocks will thus be orphan when registered, but the leaf
> + * clock itself will always have its parent and will never be
> + * reparented. Indeed, it's only orphan because its parent is.
> + *
> + * These tests exercise the behaviour of the consumer API when dealing
> + * with an orphan clock, and how we deal with the transition to a valid
> + * parent.
> + */
> +static struct kunit_suite
> +clk_orphan_two_level_root_last_test_suite =3D {
> +	.name =3D "clk-orphan-two-level-root-last-test",
> +	.init =3D clk_orphan_two_level_root_last_test_init,
> +	.exit =3D clk_orphan_two_level_root_last_test_exit,
> +	.test_cases =3D clk_orphan_two_level_root_last_test_cases,
> +};
> +
>  /*
>   * Test that clk_set_rate_range won't return an error for a valid range
>   * and that it will make sure the rate of the clock is within the
> @@ -1729,6 +1967,7 @@ kunit_test_suites(
>  	&clk_multiple_parents_mux_test_suite,
>  	&clk_orphan_transparent_multiple_parent_mux_test_suite,
>  	&clk_orphan_transparent_single_parent_test_suite,
> +	&clk_orphan_two_level_root_last_test_suite,
>  	&clk_range_test_suite,
>  	&clk_range_maximize_test_suite,
>  	&clk_range_minimize_test_suite,
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [40a5af128af54dc0fbd06e11ef2d8a693e25d33f] Merge tag 'samsung-dt-=
dt64-6.1-2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux i=
nto arm/dt
> git bisect good 40a5af128af54dc0fbd06e11ef2d8a693e25d33f
> # bad: [67ae4f7434cee86ee318d46fb10b8a9840ad2e81] Add linux-next specific=
 files for 20221005
> git bisect bad 67ae4f7434cee86ee318d46fb10b8a9840ad2e81
> # bad: [7755a2e51417434920d2727d1e8a13b6b7bc2a7b] Merge branch 'master' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> git bisect bad 7755a2e51417434920d2727d1e8a13b6b7bc2a7b
> # good: [d4e9325a5c3e933944240648fb59b32cc8354536] Merge branch 'for-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
> git bisect good d4e9325a5c3e933944240648fb59b32cc8354536
> # good: [62c07983bef9d3e78e71189441e1a470f0d1e653] once: add DO_ONCE_SLOW=
() for sleepable contexts
> git bisect good 62c07983bef9d3e78e71189441e1a470f0d1e653
> # bad: [15be0f33185304d3031c6226fe999be86aaeb0d4] Merge branch '9p-next' =
of git://github.com/martinetd/linux
> git bisect bad 15be0f33185304d3031c6226fe999be86aaeb0d4
> # bad: [fb41178108eaf0ad17a9d76dc2be4cc46c57b47c] Merge branch 'next' of =
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
> git bisect bad fb41178108eaf0ad17a9d76dc2be4cc46c57b47c
> # bad: [0e343aed45e3f4f893ac2766331ca7961c164ec8] Merge branch 'clk-next'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
> git bisect bad 0e343aed45e3f4f893ac2766331ca7961c164ec8
> # good: [26bebbfed5bd06fd7202fd1befa6c2c935a593e8] Merge branches 'clk-ro=
ckchip', 'clk-renesas', 'clk-microchip', 'clk-allwinner' and 'clk-imx' into=
 clk-next
> git bisect good 26bebbfed5bd06fd7202fd1befa6c2c935a593e8
> # good: [f9efefdba95a5110a1346bb03acdd8ff3cdf557f] Merge branches 'clk-ba=
ikal', 'clk-broadcom', 'clk-vc5' and 'clk-versaclock' into clk-next
> git bisect good f9efefdba95a5110a1346bb03acdd8ff3cdf557f
> # good: [3b989d7c1cfc79eb79676cd5440d0fbf98d42148] Merge branch 'for-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
> git bisect good 3b989d7c1cfc79eb79676cd5440d0fbf98d42148
> # bad: [718af795d3fd786928506cd5251597fbe29c7fda] clk: Change clk_core_in=
it_rate_req prototype
> git bisect bad 718af795d3fd786928506cd5251597fbe29c7fda
> # good: [7d79c26b60e623a9a089d771f81c5997bda577cd] clk: tests: Add refere=
nce to the orphan mux bug report
> git bisect good 7d79c26b60e623a9a089d771f81c5997bda577cd
> # good: [74933ef22c1c3d3d1456c2f949f1910ce2aab1f1] clk: tests: Add tests =
for mux with multiple parents
> git bisect good 74933ef22c1c3d3d1456c2f949f1910ce2aab1f1
> # good: [3afb07231d603d51dca6a5d5e16d9d8f422f9b5f] clk: Take into account=
 uncached clocks in clk_set_rate_range()
> git bisect good 3afb07231d603d51dca6a5d5e16d9d8f422f9b5f
> # bad: [cb1b1dd96241f37ea41d241946d5153c48141cd5] clk: Set req_rate on re=
parenting
> git bisect bad cb1b1dd96241f37ea41d241946d5153c48141cd5
> # first bad commit: [cb1b1dd96241f37ea41d241946d5153c48141cd5] clk: Set r=
eq_rate on reparenting
> -------------------------------------------------------------------------=
------
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#32442): https://groups.io/g/kernelci-results/message/=
32442
> Mute This Topic: https://groups.io/mt/94189147/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--ToVdk7XFfLxJF69E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNEDUoACgkQJNaLcl1U
h9Aizwf/Rpy8KNOzfv8snbMu/K0VaCMmabX6jV/lkgmxqclalEwXrHC3pTVBD6Ls
lL3vOYoSSiJJmr0i3ywwv8ok2rEUY33Wrl9Ux40jmrkK8A/9ECLt/fvsTMnBwDym
ht0ooKzZFLZdEevxvTM5tV7Eu8aA9mCHvHwZTpXRWSPmv4lajF0OyonUbGrP/K+X
fnXCdkZtrYE9e4P+ZJFSrGnPHH+K3WbxV/Serl24h4TNK4xoAdp61HXWrR115o0W
1ntN9b80wskVuWsjPVGAUDOrKxjbHWE7KpjWjw2MLTDIcKu3C1VfucTIoq/wNNJ6
ekvT/QP7CpazLf0CikztocJLJEfPuA==
=DxWZ
-----END PGP SIGNATURE-----

--ToVdk7XFfLxJF69E--
