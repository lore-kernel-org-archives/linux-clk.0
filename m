Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B255BC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 04:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbiDWEPi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 00:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbiDWEPd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 00:15:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FE1D42
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 21:12:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B76BB8321B
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 04:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8A2C385A0;
        Sat, 23 Apr 2022 04:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650687155;
        bh=Vwxx8g3NpzCuImHEjypkg30vfdZszf2jkkcJVouUHzM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VCHekgP1OoifQGOQSReC4dzllZirPKIg+QDkJNviVhEFhq/ZKg+3QoK32ahcC8i5Q
         b25HpQRGDhGkEfTRauZTAiyS8MLMUWa4o+UlTiyrh2ENASNncapkT4sUDH1Mxcir0s
         +K3SqhtSXuckrEhIviubshI8W1DTNn0EVXtceM9RbblS9K+XMSQl+hyw/+A3zm3ROz
         g5dc3lEct1MdzAMnBJgGWzGEyPWXKTEgNH2hlXHiNiEmiOySpbtnKPAbz5gr+BoGU2
         UGI8IFIa/dc8/roCKk0NRRZ92aUdMTqroKB7zMgGQwNIVm6gRdS9j4Qncl9erKapnt
         tp3H/POrS0kLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220408091037.2041955-23-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech> <20220408091037.2041955-23-maxime@cerno.tech>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
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
Date:   Fri, 22 Apr 2022 21:12:33 -0700
User-Agent: alot/0.10
Message-Id: <20220423041235.3F8A2C385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-04-08 02:10:37)
> A rate of 0 for a clock is considered an error, as evidenced by the
> documentation of clk_get_rate() and the code of clk_get_rate() and
> clk_core_get_rate_nolock().
>=20
> The main source of that error is if the clock is supposed to have a
> parent but is orphan at the moment of the call. This is likely to be
> transient and solved later in the life of the system as more clocks are
> registered.
>=20
> The corollary is thus that if a clock is not an orphan, has a parent that
> has a rate (so is not an orphan itself either) but returns a rate of 0,
> something is wrong in the driver. Let's return an error in such a case.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8bbb6adeeead..e8c55678da85 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
>                 rate =3D 0;
>         core->rate =3D core->req_rate =3D rate;
> =20
> +       /*
> +        * If we're not an orphan clock and our parent has a rate, then
> +        * if our rate is 0, something is badly broken in recalc_rate.
> +        */
> +       if (!core->orphan && (parent && parent->rate) && !core->rate) {

It's possible that it is an orphan at time of registration, so this
check doesn't even cover the case when it is parented by a later clk
registration. How would we error out when parenting the clk to the
parent if recalc_rate then starts returning 0? It doesn't seem possible
to implement this.
