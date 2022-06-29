Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD03C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 09:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbiF2JLW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbiF2JLW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 05:11:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ABC10FF8
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:11:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E82D261E09
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 09:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466E2C34114;
        Wed, 29 Jun 2022 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656493880;
        bh=InT/MBpqDzJimLT0+rRxmDxSXq4BDTs7xjjj5iKViuA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uko2C6aLRpdf3R2p2U0XdRqGIt4IDfyXrkL4l0rV1loWDMyQ933lul5gHUPqirIbq
         4ITlLVZcm5xWYKqD7eR+GA0FbvC6aae7XcHJXz60urjWbi3d9s0fuXtH5N2shPHJyd
         lrhdERKFx5k8J1A+nyti3kM/uEW7CSl2upoDm/S2deWIOVrcLzmD15JKQTF6+4TZPG
         btUQckYKWWYyPPR7VskdGZGT4Q6cWv0hFopPjXlDVAeB2BXYfHcsCFAHaXHuDIHVC8
         pV6CNkQI5X5SiY95R853f/ApdPAkgGYsnVoh2SeXgmzGcdFMScyRSZkLs+pKdpSXB9
         +g8ZfC7JD7kpg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516132527.328190-22-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-22-maxime@cerno.tech>
Subject: Re: [PATCH v5 21/28] clk: Introduce clk_core_has_parent()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Wed, 29 Jun 2022 02:11:18 -0700
User-Agent: alot/0.10
Message-Id: <20220629091120.466E2C34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-05-16 06:25:20)
> We will need to know if a clk_core pointer has a given parent in other
> functions, so let's create a clk_core_has_parent() function that
> clk_has_parent() will call into.
>=20
> For good measure, let's add some unit tests as well to make sure it
> works properly.
>=20
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meso=
n g12b
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c      | 36 +++++++++++++++++++++---------------
>  drivers/clk/clk_test.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 1a217c21be48..7754a5140a6b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -539,6 +539,26 @@ static bool mux_is_better_rate(unsigned long rate, u=
nsigned long now,
>  static int clk_core_round_rate_nolock(struct clk_core *core,
>                                       struct clk_rate_request *req);
> =20
> +static bool clk_core_has_parent(struct clk_core *core, struct clk_core *=
parent)

const parent please. Sadly core isn't const though because we may fill
the cache in clk_core_get_parent_by_index().

> +{
> +       unsigned int i;
> +
> +       /* Optimize for the case where the parent is already the parent. =
*/
> +       if (core =3D=3D parent)
> +               return true;
> +
> +       for (i =3D 0; i < core->num_parents; i++) {
> +               struct clk_core *tmp =3D clk_core_get_parent_by_index(cor=
e, i);
> +               if (!tmp)
> +                       continue;
> +
> +               if (tmp =3D=3D parent)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  int clk_mux_determine_rate_flags(struct clk_hw *hw,
>                                  struct clk_rate_request *req,
>                                  unsigned long flags)
> @@ -2590,25 +2610,11 @@ void clk_hw_reparent(struct clk_hw *hw, struct cl=
k_hw *new_parent)
>   */
>  bool clk_has_parent(struct clk *clk, struct clk *parent)

Doesn't need to be done in this patch but we should probably mark both
clk and parent as const to indicate we're not going to modify them.

>  {
> -       struct clk_core *core, *parent_core;
> -       int i;
> -
>         /* NULL clocks should be nops, so return success if either is NUL=
L. */
>         if (!clk || !parent)
>                 return true;
> =20
> -       core =3D clk->core;
> -       parent_core =3D parent->core;
> -
> -       /* Optimize for the case where the parent is already the parent. =
*/
> -       if (core->parent =3D=3D parent_core)
> -               return true;
> -
> -       for (i =3D 0; i < core->num_parents; i++)
> -               if (!strcmp(core->parents[i].name, parent_core->name))
> -                       return true;
> -
> -       return false;
> +       return clk_core_has_parent(clk->core, parent->core);
>  }
>  EXPORT_SYMBOL_GPL(clk_has_parent);
> =20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 4c71c6570021..7e1a231a5a6b 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -473,8 +473,24 @@ clk_test_multiple_parents_mux_get_parent(struct kuni=
t *test)
>         KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parents_ctx[0].=
hw.clk));
>  }
> =20
> +/*
> + * Test that for a clock with a multiple parents, clk_has_parent()
> + * actually reports all of them as parents.
> + */
> +static void
> +clk_test_multiple_parents_mux_has_parent(struct kunit *test)
> +{
> +       struct clk_multiple_parent_ctx *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +
> +       KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, ctx->parents_ctx[0].h=
w.clk));
> +       KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, ctx->parents_ctx[1].h=
w.clk));
> +}
> +
>  static struct kunit_case clk_multiple_parents_mux_test_cases[] =3D {
>         KUNIT_CASE(clk_test_multiple_parents_mux_get_parent),
> +       KUNIT_CASE(clk_test_multiple_parents_mux_has_parent),
>         {}
>  };
> =20
> @@ -884,6 +900,21 @@ clk_test_single_parent_mux_get_parent(struct kunit *=
test)
>         KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parent_ctx.hw.c=
lk));
>  }
> =20
> +/*
> + * Test that for a clock with a single parent, clk_has_parent() actually
> + * reports it as a parent.
> + */
> +static void
> +clk_test_single_parent_mux_has_parent(struct kunit *test)
> +{
> +       struct clk_single_parent_ctx *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       struct clk *parent =3D ctx->parent_ctx.hw.clk;

Instead of using hw.clk directly can we use clk_hw_get_clk() and then
clk_put() it later? Eventually we want to remove the clk pointer inside
clk_hw, so every new use means more work later.

> +
> +       KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, parent));
> +}
> +
>  /*
>   * Test that for a clock that can't modify its rate and with a single
>   * parent, if we set disjoints range on the parent and then the child,
> @@ -982,6 +1013,7 @@ clk_test_single_parent_mux_set_range_round_rate_chil=
d_smaller(struct kunit *test
> =20
>  static struct kunit_case clk_single_parent_mux_test_cases[] =3D {
>         KUNIT_CASE(clk_test_single_parent_mux_get_parent),
> +       KUNIT_CASE(clk_test_single_parent_mux_has_parent),
>         KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_la=
st),
>         KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_l=
ast),
>         KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_child_=
smaller),
> --=20
> 2.36.1
>
