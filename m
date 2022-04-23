Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCAEC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 04:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbiDWEJ2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 00:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbiDWEJ1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 00:09:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71661A73EB
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 21:06:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 50718B8321B
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 04:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00213C385A5;
        Sat, 23 Apr 2022 04:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650686788;
        bh=E4Q2qIhEezb9zxdrQhIIhGPqYw0e50F2JWMZIoGE0Y0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cm9Hi0nBKquQRtol23dkpl9pOOxPVp36xVEmK3jLqXXBGKmo2dGaCKo2n4lA7Mq8k
         e+9v35LIX0cur/EfMbin6ud+ml/PzjRtWAYwTZ99oMv4z9437zLcY2aJEhCqtcLin7
         LS4L0joMtGm7d8LouSvmR/8szrvdZMn2ZZ4LqsTzj3eACj4LTOpKXrsgo1kmMUl+Wc
         mJhOoQxPvbzdDTxpbWL1kcZQj+xpKY3swfw8tPQ6wtFQhTbHCZhZNFtggbZUqlRVo7
         Tl7rq9glg4qgJ/jTh0ddXo0tD6YLeusv+kiWzGKRnSdBhOk5Jsx9JiLZBG6CxcNanK
         7d/q4Gw8xIzIg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220408091037.2041955-3-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech> <20220408091037.2041955-3-maxime@cerno.tech>
Subject: Re: [PATCH 02/22] clk: tests: Add test suites description
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 22 Apr 2022 21:06:26 -0700
User-Agent: alot/0.10
Message-Id: <20220423040628.00213C385A5@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-04-08 02:10:17)
> We start to have a few test suites, and we'll add more, so it will get
> pretty confusing to figure out what is supposed to be tested in what
> suite.
>=20
> Let's add some comments to explain what setup they create, and what we
> should be testing in every suite.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Thanks. Mostly nitpicks but otherwise looks good.

> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index fd2339cc5898..663b3dd388f7 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -250,6 +250,11 @@ static struct kunit_case clk_test_cases[] =3D {
>         {}
>  };
> =20
> +/*
> + * Test suite for a basic rate clock, without any parent.
> + *
> + * These tests are supposed to exercise the rate API with simple scenari=
os

s/are supposed to//

Simplify please.

> + */
>  static struct kunit_suite clk_test_suite =3D {
>         .name =3D "clk-test",
>         .init =3D clk_test_init,
> @@ -336,6 +341,14 @@ static struct kunit_case clk_orphan_transparent_sing=
le_parent_mux_test_cases[] =3D
>         {}
>  };
> =20
> +/*
> + * Test suite for a basic mux clock with one parent. The parent is
> + * registered after its child. The clock will thus be orphan when

s/be/be an/

> + * registered, but will no longer be when the tests run.
> + *
> + * These tests are supposed to make sure a clock that used to be orphan

s/are supposed to//

> + * has a sane, consistent, behaviour.
> + */
>  static struct kunit_suite clk_orphan_transparent_single_parent_test_suit=
e =3D {
>         .name =3D "clk-orphan-transparent-single-parent-test",
>         .init =3D clk_orphan_transparent_single_parent_mux_test_init,
> @@ -645,6 +658,13 @@ static struct kunit_case clk_range_test_cases[] =3D {
>         {}
>  };
> =20
> +/*
> + * Test suite for a basic rate clock, without any parent.
> + *
> + * These tests are supposed to exercise the rate range API

s/are supposed to//

s/API/API:/


> + * (clk_set_rate_range, clk_set_min_rate, clk_set_max_rate,

Functions have () after them. Drop parenthesis around the list and use
colon instead.

> + * clk_drop_range).
> + */
>  static struct kunit_suite clk_range_test_suite =3D {
>         .name =3D "clk-range-test",
>         .init =3D clk_test_init,
> @@ -822,6 +842,14 @@ static struct kunit_case clk_range_maximize_test_cas=
es[] =3D {
>         {}
>  };
> =20
> +/*
> + * Test suite for a basic rate clock, without any parent.
> + *
> + * These tests are supposed to exercise the rate range API

s/are supposed to//

> + * (clk_set_rate_range, clk_set_min_rate, clk_set_max_rate,

s/(//

> + * clk_drop_range), with a driver that will always try to run at the

s/)//

> + * highest possible rate.
> + */
>  static struct kunit_suite clk_range_maximize_test_suite =3D {
>         .name =3D "clk-range-maximize-test",
>         .init =3D clk_maximize_test_init,
> @@ -991,6 +1019,14 @@ static struct kunit_case clk_range_minimize_test_ca=
ses[] =3D {
>         {}
>  };
> =20
> +/*
> + * Test suite for a basic rate clock, without any parent.
> + *
> + * These tests are supposed to exercise the rate range API

s/are supposed to//

> + * (clk_set_rate_range, clk_set_min_rate, clk_set_max_rate,
> + * clk_drop_range), with a driver that will always try to run at the
> + * lowest possible rate.
> + */
>  static struct kunit_suite clk_range_minimize_test_suite =3D {
>         .name =3D "clk-range-minimize-test",
>         .init =3D clk_minimize_test_init,
