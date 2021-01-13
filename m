Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D78C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 08:31:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5790E23341
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jan 2021 08:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbhAMIb3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jan 2021 03:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbhAMIb2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 03:31:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8633AC061786
        for <linux-clk@vger.kernel.org>; Wed, 13 Jan 2021 00:30:48 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzbYB-0005td-LM; Wed, 13 Jan 2021 09:30:43 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kzbYA-0006tF-R3; Wed, 13 Jan 2021 09:30:42 +0100
Date:   Wed, 13 Jan 2021 09:30:42 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Simon South <simon@simonsouth.net>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] clk: Warn when clk_get_rate is called for a disabled clk
Message-ID: <20210113083042.tezxr5sim2oevtvm@pengutronix.de>
References: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="meaki2s2yzngoesd"
Content-Disposition: inline
In-Reply-To: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--meaki2s2yzngoesd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

<linux/clk.h> claims that clk_get_rate() must only be called for enabled
clocks. So emit a warning if a consumer calls this function without
ensuring the clock being on.

Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

I didn't hear back, so went on to create a proper patch now.

On Mon, Dec 21, 2020 at 10:27:13AM +0100, Uwe Kleine-K=F6nig wrote:
> the documentation about clk_get_rate in include/linux/clk.h reads:
>=20
> 	[...] obtain the current clock rate (in Hz) for a clock source.
> 	This is only valid once the clock source has been enabled.
>=20
> The second part isn't enforced and (I think) there are many consumers
> who don't ensure the clock being enabled. (I just stumbled over
> rockchip_pwm_get_state().)
>=20
> I wonder if it would be sensible to add a development check to
> clk_get_rate, something like:
>=20
> 	if (WARN(!clk->usecount, "Trying to get rate of a disabled clk"))
> 		return 0;
>=20
> (or something less consequent like not returning 0 but the value it also
> returns today).

This conservative approach is what I implemented now, and I only emit 1
warning to not overflow systems that trigger that problem several times.

I'm unsure if I really must take the enable_lock, but it is not
completely wrong.

 drivers/clk/clk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8c1d04db990d..7558753883dc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1614,6 +1614,16 @@ static void __clk_recalc_rates(struct clk_core *core=
, unsigned long msg)
=20
 static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
 {
+	unsigned long flags;
+	unsigned int enable_count;
+
+	flags =3D clk_enable_lock();
+	enable_count =3D core->enable_count;
+	clk_enable_unlock(flags);
+
+	WARN_ONCE(enable_count =3D=3D 0,
+		  "A clock must be enabled to determine its rate\n");
+
 	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
 		__clk_recalc_rates(core, 0);
=20
--=20
2.29.2

>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |



--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--meaki2s2yzngoesd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/+r68ACgkQwfwUeK3K
7AlwTAf+JfZDhu0Ns0UKv6ko7x76kABgLcu3DP7XyRdaznfF17fScTTH+eHtowN5
MnnZaoaGO0v8tz41IAyN1+i94dIaHBNlt+AxKiSgLeiRzMglojl1CYitRHxSlf7d
6DJbqTKP55YG2aqWaTgEnSKzEkFDI2hxjFzovJPNqzJxGyn2XWpHlMSAg1r8geS6
bd/6q976A35D5NM4LDBRWbHxbKV2lbnaVwcmgTKDdkFR3AGbtv5gyGZQ6TZVztYK
C4ioJNFuWVBWnRjcsNfJv1m7SP4E8JTOAj+iyfCDLyd5w3Ohxx1BRqYSY+0MnBFR
yybuIWu+DzUaAvp2ol9j0zBRSzKvaw==
=r+6A
-----END PGP SIGNATURE-----

--meaki2s2yzngoesd--
