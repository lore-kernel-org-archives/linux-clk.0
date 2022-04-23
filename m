Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A6CC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 03:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbiDWDyc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Apr 2022 23:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbiDWDy0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 23:54:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03CD160972
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 20:51:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 591C3B831BC
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A8DC385A0;
        Sat, 23 Apr 2022 03:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650685886;
        bh=MqBRSWtSenkd6F1HSxC9JLNLQa+hTMTQZ0DG7367g2w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N7Tul15D40jKhR+quOa6D1duuaHdLrde4/eJNzq29TTLvEPFKshfvp/4o59uV3RoZ
         1AJQE+mA9aqfSLk4/ZS/8zsy6xeZpq32NxaCOoqqoXx+b8zwhlbwCaVj9zobtVjNQM
         ai7uLAF8ZvKZmL+PD52j10xWruvn557voUb/WobdqndKPmbUUVYJ47kDktSCcVGKIr
         2XD9hZf6RmYAIl9OK6L8pi5pQPNElQxbNnxwKw2D40GSik6Z5cDizf+L6okM/xCma+
         pfbSD6YGbMZN/76MsH3qVJTmILCOV8F5VzNJ8t3eTZJc8wTjIkmTGXV+XdvESFd20L
         oPaKUzzCslLxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220408091037.2041955-16-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech> <20220408091037.2041955-16-maxime@cerno.tech>
Subject: Re: [PATCH 15/22] clk: Add missing clk_core_init_rate_req calls
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
Date:   Fri, 22 Apr 2022 20:51:24 -0700
User-Agent: alot/0.10
Message-Id: <20220423035126.13A8DC385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-04-08 02:10:30)
> Some callers of clk_core_round_rate_nolock() will initialize the
> clk_rate_request structure by hand, missing a few parameters that leads

Which parameters?

> to inconsistencies in what drivers can expect from that structure.
>=20
> Let's use clk_core_init_rate_req() everywhere to make sure it's built in
> a consistent manner.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 83dd5f1df0b9..3a59152b06b8 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1480,7 +1480,7 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, =
unsigned long rate)
>         int ret;
>         struct clk_rate_request req;
> =20
> -       req.rate =3D rate;
> +       clk_core_init_rate_req(hw->core, &req, rate);
> =20
>         ret =3D clk_core_round_rate_nolock(hw->core, &req);

clk_core_round_rate_nolock() has a clk_core_init_rate_req() inside it.
This is duplicating that.

>         if (ret)
> @@ -1512,7 +1512,7 @@ long clk_round_rate(struct clk *clk, unsigned long =
rate)
>         if (clk->exclusive_count)
>                 clk_core_rate_unprotect(clk->core);
> =20
> -       req.rate =3D rate;
> +       clk_core_init_rate_req(clk->core, &req, rate);
> =20
>         ret =3D clk_core_round_rate_nolock(clk->core, &req);

Duplicating again?

> =20
> @@ -2216,8 +2216,7 @@ static unsigned long clk_core_req_round_rate_nolock=
(struct clk_core *core,
>         if (cnt < 0)
>                 return cnt;
> =20
> -       clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
> -       req.rate =3D req_rate;
> +       clk_core_init_rate_req(core, &req, req_rate);

So we put the boundaries inside clk_core_init_rate_req()? That sounds
like it's required now after we clamp all the time.

> =20
>         ret =3D clk_core_round_rate_nolock(core, &req);

Same.
