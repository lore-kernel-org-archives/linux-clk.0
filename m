Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AF5C433DB
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 10:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EE7722AAB
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 10:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgLUKA6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 05:00:58 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55711 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgLUKA6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 05:00:58 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1krHTG-0000Q8-4j; Mon, 21 Dec 2020 10:27:14 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1krHTF-0008KC-76; Mon, 21 Dec 2020 10:27:13 +0100
Date:   Mon, 21 Dec 2020 10:27:13 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Simon South <simon@simonsouth.net>,
        kernel@pengutronix.de
Subject: clk_get_rate for disabled clks
Message-ID: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qkbtavyxzct6cg3j"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--qkbtavyxzct6cg3j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

the documentation about clk_get_rate in include/linux/clk.h reads:

	[...] obtain the current clock rate (in Hz) for a clock source.
	This is only valid once the clock source has been enabled.

The second part isn't enforced and (I think) there are many consumers
who don't ensure the clock being enabled. (I just stumbled over
rockchip_pwm_get_state().)

I wonder if it would be sensible to add a development check to
clk_get_rate, something like:

	if (WARN(!clk->usecount, "Trying to get rate of a disabled clk"))
		return 0;

(or something less consequent like not returning 0 but the value it also
returns today). Or is the statement in the comment wrong today and it
can be assumed that clk_get_rate() also works for a disabled clock (and
yields the rate it would have were it enabled)?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qkbtavyxzct6cg3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/gam4ACgkQwfwUeK3K
7AlAsAf/RIax1pkcl0ZroljA8O7PGALZPf8/aJtuv07hbd1PED7tao6fQrT6NHj7
Dh9E9Hyp7udDoT+sm6N73fxUqiB+kWX8H0ILkckNCyRYGp68si8kWeBHyEs/uaL2
pxzoiFkUwOTnyg18qhVFEoosYiTDQqTHdVzwnXXQPQajypCkbU0psybnL5gynS3n
5lh+AWh+DeFgb2SxQTYJZzXJMFFaYMVs4MbBB+u3/9qCGhGPgZqFbLruR7frot2E
cG3Xbhn5yShEg6PhopDQaQc7iLxz0nF2l3/qncOvUyJE65wm2SpkWogLQD/p9Ve8
Bo7N3oYzyIzz7seE+sqwkaFlonT8aQ==
=TUS2
-----END PGP SIGNATURE-----

--qkbtavyxzct6cg3j--
