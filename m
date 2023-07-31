Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1FAC001DC
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 08:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjGaIUZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 04:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjGaIT5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 04:19:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A116F19B3
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 01:18:07 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQO6P-0007Qm-Am; Mon, 31 Jul 2023 10:18:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQO6O-00056Y-7m; Mon, 31 Jul 2023 10:18:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qQO6N-009FeO-HY; Mon, 31 Jul 2023 10:18:03 +0200
Date:   Mon, 31 Jul 2023 10:18:03 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] clk: versaclock3: Switch to use i2c_driver's probe
 callback
Message-ID: <20230731081803.vua6hyxhofasvrsm@pengutronix.de>
References: <20230721071846.111663-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="slme77pfiokahsua"
Content-Disposition: inline
In-Reply-To: <20230721071846.111663-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--slme77pfiokahsua
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Cc: +=3D Wolfram]

On Fri, Jul 21, 2023 at 09:18:46AM +0200, Uwe Kleine-K=F6nig wrote:
> The previous mass switch of clk drivers done in commit 62279db5a323
> ("clk: Switch i2c drivers back to use .probe()") was based on v6.4-rc1
> Since then this driver was added which needs to be converted back in the
> same way before eventually .probe_new() can be dropped from struct
> i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this driver appeared in next today. It would be great if this patch
> could be added on top to not interfere with the quest to remove
> .probe_new directly after v6.6-rc1.

my eventual plan is to send the patch removing .probe_new() around
v6.6-rc1 with the intention to get it into next early during the merge
window. So if this patch doesn't make it in before v6.6-rc1, I'd send it
together with the change dropping .probe_new() for Wolfram to apply as
in today's next-20230731 there are only two drivers left making use of
=2Eprobe_new (and the maintainer of the other driver already agreed to fix
their driver with a patch going in via i2c, too).

So in my order of preference, the options here are:

 - patch is applied via clk before v6.6-rc1
 - patch is applied via i2c together with change dropping .probe_new()
   with a clk maintainer's Ack.
 - patch is ignored and goes in without an Ack via i2c.

My current WIP branch based on v6.5-rc4 is available at

	https://git.pengutronix.de/git/ukl/linux i2c-probe-new

if you want to take a look. (And even if you don't want, it's there :-)

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--slme77pfiokahsua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTHbjoACgkQj4D7WH0S
/k7HNwf7ByVoN4u5woHpoUxjh2+49Lu2JmYtoUVZJdDhjuF0bEqX+1st0AtWfX8S
BXrAqfAAL7XsheAeXQ5PaVzMm1kZB7dp4/rQr34a4afoouWIWA/7W704bIi0lXmX
+xl5EWV3ZwmwOO158vUI/l4nx4HtsVDuLFKUvGiF0edWJi5ekoSBQknHC0Udzv3X
K+QBYG/6xNc6AmttQL0EOGAR+LVIUMdvd/8qzp0WBhXIhfjvye2HBHZYRZOJKA45
5f4LLdluBcL4x1TzcwjFUy5m1OpgTEuoaL/z3/fYS3lHr+vY72aB236ZQjgEinK/
lpeyWd5W1j0L2nHMZQe0ThwPTUT32w==
=sGMC
-----END PGP SIGNATURE-----

--slme77pfiokahsua--
