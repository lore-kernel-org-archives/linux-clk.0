Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA27C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 22:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbiBXWvd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Feb 2022 17:51:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiBXWvd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Feb 2022 17:51:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DE1179A12
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 14:51:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF7E661B75
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 22:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C688C340E9;
        Thu, 24 Feb 2022 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645743062;
        bh=miZQIOaNjDKs+B9YS4Zo2kAtM8uvsD5UsWevRUafv5Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WbiACK5upH9WET6LVVmRpPOb9JDzPjB5ThQFjmj/zaZMqWmVfC2zXrYjv+zyzcw6B
         btwk9Wpz/c8OyQMPGD85dUWauHBIe1UjfSGYyNkczm6q7l2BpBQUix+HpjMTvd2hn+
         /fD7ZCkWKXbtZ93OEdTVVuClcQGVNSy4nP+e+BMCY7Rai0xcyBLLPXtj4mgqsO5vWv
         0GP2gJz5sUP2aWuUMwEI5chnugTpx7SOmK3LVyCOblR+KIpTRg/jCeHsuH1JzqdKr+
         w6noE1gs8zX7rFJKToe1RbO2kO6JA89kLrmseX7ZV4FRrX7SEUGAff0dgbmTe6yqnX
         an2fE2PQL5EaQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220223105600.1132593-6-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech> <20220223105600.1132593-6-maxime@cerno.tech>
Subject: Re: [PATCH v6 05/12] clk: Use clamp instead of open-coding our own
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Thu, 24 Feb 2022 14:51:00 -0800
User-Agent: alot/0.10
Message-Id: <20220224225102.1C688C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-02-23 02:55:53)
> The code in clk_set_rate_range() will, if the current rate is outside of
> the new range, will force it to the minimum or maximum.

s/will//

>=20
> Since it's running under the condition that the rate is either lower
> than the minimum, or higher than the maximum, this is equivalent to
> using clamp, while being less readable. Let's switch to using clamp
> instead.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 6c4e10209568..c15ee5070f52 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2388,11 +2388,7 @@ int clk_set_rate_range(struct clk *clk, unsigned l=
ong min, unsigned long max)
>                  *   this corner case when determining the rate
>                  */
> =20
> -               if (rate < min)
> -                       rate =3D min;
> -               else
> -                       rate =3D max;
> -
> +               rate =3D clamp(clk->core->req_rate, min, max);
>                 ret =3D clk_core_set_rate_nolock(clk->core, rate);
>                 if (ret) {
