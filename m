Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301A5C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 23:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbiF0XWE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 19:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237413AbiF0XWE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 19:22:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534C12409E
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 16:22:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1849DB818E4
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 23:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ABDC34115;
        Mon, 27 Jun 2022 23:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656372120;
        bh=nM18KZ2pRb363aBJRrW1+lITPPVp3+qR4rjIT5kq82E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m7MA36FQn71YNtfOO5hkfxRV+FxQUiWEg7PvyVIqCElPrXgkObF24WGAirZanr2Bp
         bWWcl9sIH/jrZo0v7jqZEytmrVggIh1safgh+1xWbg1kd4tIpWX+hLeZiOpiRnuI86
         kYP571x5B2f30k+oeQ8BNWEfQUrF8C4xlivtz0Kq7xC+dwx1q4V5fVicO4qxvqmZLL
         qIlrBvzQzUY7Y1xskWdW7kBFlMfH5QkV32r56CPNqqAmQQlywQjxnh8L/uqKrnpRv4
         Vu7dZOpDwBzpdMDh4e+NR43TXlgySVXK1rN7ORFqr8s5EyShbk0J+8ewbd4Q9n2PHc
         FBwal67SrleLQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516132527.328190-3-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-3-maxime@cerno.tech>
Subject: Re: [PATCH v5 02/28] clk: Skip clamping when rounding if there's no boundaries
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
Date:   Mon, 27 Jun 2022 16:21:58 -0700
User-Agent: alot/0.10
Message-Id: <20220627232200.C3ABDC34115@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-05-16 06:25:01)
> Commit 948fb0969eae ("clk: Always clamp the rounded rate") recently
> started to clamp the request rate in the clk_rate_request passed as an
> argument of clk_core_determine_round_nolock() with the min_rate and
> max_rate fields of that same request.
>=20
> While the clk_rate_requests created by the framework itself always have
> those fields set, some drivers will create it themselves and don't
> always fill min_rate and max_rate.
>=20
> In such a case, we end up clamping the rate with a minimum and maximum
> of 0, thus always rounding the rate to 0.
>=20
> Let's skip the clamping if both min_rate and max_rate are set to 0 and
> complain so that it gets fixed.
>=20
> Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 2a32fa9f7618..d46c00bbedea 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1341,7 +1341,19 @@ static int clk_core_determine_round_nolock(struct =
clk_core *core,
>         if (!core)
>                 return 0;
> =20
> -       req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> +       /*
> +        * Some clock providers hand-craft their clk_rate_requests and
> +        * might not fill min_rate and max_rate.
> +        *
> +        * If it's the case, clamping the rate is equivalent to setting
> +        * the rate to 0 which is bad. Skip the clamping but complain so
> +        * that it gets fixed, hopefully.
> +        */
> +       if (!req->min_rate && !req->max_rate)
> +               pr_warn("%s: %s: clk_rate_request has initialized min or =
max rate.\n",
> +                       __func__, core->name);

Is this going to trigger anytime soon? I'd prefer we return an error
from here if the min/max is 0. The warning can stay. Also probably needs
to be a pr_warn_once() or ratelimited because sometimes rate setting
code is called very often.
