Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA32C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 09:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiF2JFr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiF2JFr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 05:05:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7448263A9
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:05:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0FFA561DED
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 09:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52719C34114;
        Wed, 29 Jun 2022 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656493545;
        bh=w6i3D/kiYYJcCaEfiNQbAAvgKQbjnnJzhVFlDg/jWkE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DPUyjaPic7MMaPUFydH1msXvH4HlNYz40TNq7LjWjBW2pMX2P9gjsWdXUzxC8LFMt
         fmqeJmO/AQKYFpn8J8Xsmm1gxtiAway0OTPsMgU9RODw4OsAzwp4cuxdguDSyjIm+/
         OyHlVwUkQhas5zI5L5m96LH3d0rFJkc7KYNOOLmEOV/YYzBpwEc+X5fEReW59me7qJ
         K8fkiN8w/mwh7GeGsejz6uAyaq5Lk4YxRieKTuNHtx9vpkbr3VIf7090jDFGXss+Y6
         uqzuh5Dz3aN0fRH15zJ71b7HsuUz3aEoW7GCGXpm50Gdx7d7wgxpUscWTLOP3Eh4TE
         zbqgG2HSzy4RA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516132527.328190-15-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-15-maxime@cerno.tech>
Subject: Re: [PATCH v5 14/28] clk: Fix clk_get_parent() documentation
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
Date:   Wed, 29 Jun 2022 02:05:43 -0700
User-Agent: alot/0.10
Message-Id: <20220629090545.52719C34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-05-16 06:25:13)
> The clk_get_parent() documentation in the header states that it will
> return a valid pointer, or an error pointer on failure.
>=20
> However, the documentation in the source file, and the code itself, will
> return also return NULL if there isn't any parent for that clock. Let's

s/return//

> mention it.
>=20
> An orphan clock should return NULL too, so let's add a test for it.
>=20
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meso=
n g12b
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk_test.c | 17 +++++++++++++++++
>  include/linux/clk.h    |  5 +++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 9aa5b946f324..c52098e463d3 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -532,6 +532,22 @@ clk_orphan_transparent_multiple_parent_mux_test_exit=
(struct kunit *test)
>         clk_hw_unregister(&ctx->parents_ctx[1].hw);
>  }
> =20
> +/*
> + * Test that, for a mux whose current parent hasn't been registered yet,

Mention "orphan" here somehow.

> + * clk_get_parent() will return NULL.
> + */
> +static void
> +clk_test_orphan_transparent_multiple_parent_mux_get_parent(struct kunit =
*test)
> +{
> +       struct clk_multiple_parent_ctx *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       struct clk *parent;
> +
> +       parent =3D clk_get_parent(clk);
> +       KUNIT_EXPECT_PTR_EQ(test, parent, NULL);

Please put clk_get_parent() into the expectation so that the print on
error is more verbose.

> +}
> +
>  /*
>   * Test that, for a mux whose current parent hasn't been registered yet,
>   * calling clk_set_parent() to a valid parent will properly update the
> @@ -678,6 +694,7 @@ clk_test_orphan_transparent_multiple_parent_mux_set_r=
ange_set_parent_get_rate(st
>  }
> =20
>  static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test=
_cases[] =3D {
> +       KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_pa=
rent),
>         KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_pa=
rent),
>         KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_pa=
rent_get_rate),
>         KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_pa=
rent_set_range_modified),

Please split the test from the documentation update.

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 1507d5147898..39710b8453fa 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -755,8 +755,9 @@ int clk_set_parent(struct clk *clk, struct clk *paren=
t);
>   * clk_get_parent - get the parent clock source for this clock
>   * @clk: clock source
>   *
> - * Returns struct clk corresponding to parent clock source, or
> - * valid IS_ERR() condition containing errno.
> + * Returns struct clk corresponding to parent clock source, a NULL
> + * pointer if it doesn't have a parent, or a valid IS_ERR() condition
> + * containing errno.

I'd rather not update this. A return value of NULL is a 'struct clk
corresponding to parent clock source' already, and we don't want to
document CCF implementation details in clk.h because there are other
implementations of the API.
