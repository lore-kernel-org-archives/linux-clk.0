Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F8CC77B6E
	for <linux-clk@archiver.kernel.org>; Wed, 12 Apr 2023 16:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjDLQ0n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Apr 2023 12:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjDLQ0m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2023 12:26:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49DEB9
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2023 09:26:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmdIu-00032w-1i; Wed, 12 Apr 2023 18:26:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmdIt-00AmN5-5A; Wed, 12 Apr 2023 18:26:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pmdIs-00Cep5-8P; Wed, 12 Apr 2023 18:26:38 +0200
Date:   Wed, 12 Apr 2023 18:26:38 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Russell King <linux@armlinux.org.uk>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] clk: Fix a typo "opereation" -> "operation"
Message-ID: <20230412162638.cgw42il3gc4os6ja@pengutronix.de>
References: <20230215083701.124786-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="764rucbsjgpjk4cs"
Content-Disposition: inline
In-Reply-To: <20230215083701.124786-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--764rucbsjgpjk4cs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Russell,

On Wed, Feb 15, 2023 at 09:37:01AM +0100, Uwe Kleine-K=F6nig wrote:
> While touching that comment also add an article and a full stop at the end
> of the sentence
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I received no feedback on this patch. Is the patch system the right
place to submit this driver? Or is this supposed to go via the clk tree
with your ack?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--764rucbsjgpjk4cs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ2270ACgkQj4D7WH0S
/k414Af/bD5T/ek5bHpqN4HJlC2Uf8F4llMKsDg2ZfFUUtahm4or1xSO0P3RW8sd
8xKdSUZc+IvRnZRDZ8IOxCFM3yJ/375KkR2U2rc29r9YUJyRVfP1aogu7wHkrR/0
JMasCt46a9ZkTvWzFYx8Hl7z+xldT2POSSBJBNXPgjHaE3pdxDfseYTH/5yEJQgh
ewLOFpA0ctc1JELtnPeKDkSGbmH8QoxVRAVoNjh+QLGy4oKF1O6kYcQSzlJEsxnh
Vh/sYUwir/1xm7BJ60MNAcV3z7bsT1WB9maDJWrueu0yfM47SrquCOzCj7RkmW4X
UpgNzDDf4fPsTwgm0ehQqdTNAShPdw==
=zYxv
-----END PGP SIGNATURE-----

--764rucbsjgpjk4cs--
