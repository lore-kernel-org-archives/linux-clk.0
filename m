Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A621C43334
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jun 2022 17:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376298AbiFVRZN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jun 2022 13:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376658AbiFVRZM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jun 2022 13:25:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6618627CC8
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 10:25:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o4449-0007bK-D9; Wed, 22 Jun 2022 19:22:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o4445-0025DG-GF; Wed, 22 Jun 2022 19:22:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o4446-000T6L-06; Wed, 22 Jun 2022 19:22:54 +0200
Date:   Wed, 22 Jun 2022 19:22:52 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-clk@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] clk: Fix pointer casting to prevent oops in
 devm_clk_release()
Message-ID: <20220622172252.jg5csri4bsixgmqp@pengutronix.de>
References: <0cdc7588-4dc3-266f-aa37-86bf5996497f@samsung.com>
 <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="56szqziqiwuolggp"
Content-Disposition: inline
In-Reply-To: <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--56szqziqiwuolggp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jun 20, 2022 at 07:18:15PM +0200, Uwe Kleine-K=F6nig wrote:
> The release function is called with a pointer to the memory returned by
> devres_alloc(). I was confused about that by the code before the
> generalization that used a struct clk **ptr.
>=20
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Forwarding from https://lore.kernel.org/linux-clk/CA+G9fYtUu2VCZ2NRpKMV4iCi=
mi8koQ3OTeqQ3byZ9W11sE9fSg@mail.gmail.com:

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Up to now there were three reports about this breakage.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--56szqziqiwuolggp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKzT+kACgkQwfwUeK3K
7AlenQgAn3rfdYk8GlWItEND/FJKYcABbdjmsFIPj4RObILyl5nlIXxoMIQ//tDY
Bgqg3zAAb/28NPpoM9dH6uvYGvREGoZn/b01GWNdlm4SoUuEVE0UubGuiugXP01C
XPd4NmrXkb9Al7kH2fEGuX3tY8ewAehWvWZWgerT6vAiVCcQsMdUNIh7yrUF+W0C
ibH8z3LPsItHRA2f2F6dohPr/nighLvLCiy0Aj0sf1Wt3EPB1ReglSeq51qbVtvy
JY7iixt4kCdCp4PwHlyydpRfAaPzs+godGg1adZX3CIjIRABMMgbvLSOHunAAlcM
vzkuedBGZqdlUivZPlKG8tFsrLILUw==
=eWf1
-----END PGP SIGNATURE-----

--56szqziqiwuolggp--
