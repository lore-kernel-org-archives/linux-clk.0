Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2C5C05027
	for <linux-clk@archiver.kernel.org>; Tue, 14 Feb 2023 09:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjBNJIW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Feb 2023 04:08:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjBNJHz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Feb 2023 04:07:55 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24ADF2386A
        for <linux-clk@vger.kernel.org>; Tue, 14 Feb 2023 01:07:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pRrH4-0005kT-48; Tue, 14 Feb 2023 10:06:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pRrH2-004qGK-1t; Tue, 14 Feb 2023 10:06:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pRrH2-003R4d-GP; Tue, 14 Feb 2023 10:06:52 +0100
Date:   Tue, 14 Feb 2023 10:06:52 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] clk: Disambiguate comment about clk_get_rate() for
 disabled clocks
Message-ID: <20230214090652.dq2gdipvxnrxil7p@pengutronix.de>
References: <20230201082309.233348-1-u.kleine-koenig@pengutronix.de>
 <Y+UX2ysd1B5/cHpk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="34qbsxp25tb4vwwf"
Content-Disposition: inline
In-Reply-To: <Y+UX2ysd1B5/cHpk@shell.armlinux.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--34qbsxp25tb4vwwf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Russell,

On Thu, Feb 09, 2023 at 03:57:15PM +0000, Russell King (Oracle) wrote:
> On Wed, Feb 01, 2023 at 09:23:09AM +0100, Uwe Kleine-K=F6nig wrote:
> > The sentence "[clk_get_rate()] is only valid once the clock source has
> > been enabled." can be understood in two ways:
> >=20
> > a) When called for a disabled clock the return value might be wrong; or
> > b) The disabled clock must be enabled before it runs at the returned
> > rate.
> >=20
> > It's hard to find evidence what is actually meant, but given that the
> > clock tree can change between the call to clk_get_rate() and the return
> > of a later clk_enable() call, it's prudent to assume a).
> >=20
> > Adapt the comment accordingly to be unambiguous.
>=20
> From the API perspective, it's both.

I documented a) now which is weaker than b), so b) is (only somewhat?)
implied.

I wonder if your mail is essentialy an Ack, or if you are unhappy with
my change. Can you suggest an alternative wording?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--34qbsxp25tb4vwwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPrTykACgkQwfwUeK3K
7Ak41AgAkaVbUzpTblmWCIwyh57953oJwytftBf9Fvrb/I5u0zOiK0MlxnKI8eeH
Gbh6tNouY1ETBK5CEY3dEAaFiswDytqYETrRTq8dSXEQSrEbuD/lEpBWaQEa/n6u
4NnrLO6gBdGaZ5FgjIBxkHZVJ2YXzBfu6EyHJH98ZrU25Ie1mihUSWJvrR1QXXmX
FVxrFoi5u/5oQS9ILsaixnNjuyIy+G4/nW55dc5+DdKHg0zi4+vEUu03Y8xTLTp0
xNciKYfjnh14YUz7n/SK7a6IMolhp/xX3uIuPCUa0xFg82bXIS1gLX+vMBFQcLOO
TGBmi2qEEiQ2v2AkuL8Bfd+5m+mOyA==
=G4w9
-----END PGP SIGNATURE-----

--34qbsxp25tb4vwwf--
