Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5574BC76196
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 09:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235883AbjDFJ1D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 05:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235352AbjDFJ1C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 05:27:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139686EAF
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 02:26:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pkLtH-0007A1-Qs; Thu, 06 Apr 2023 11:26:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pkLtH-009LiD-3b; Thu, 06 Apr 2023 11:26:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pkLtG-00B0Co-Av; Thu, 06 Apr 2023 11:26:46 +0200
Date:   Thu, 6 Apr 2023 11:26:46 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] clk: Disambiguate comment about clk_get_rate() for
 disabled clocks
Message-ID: <20230406092646.ykkppfahiemfvp7h@pengutronix.de>
References: <20230201082309.233348-1-u.kleine-koenig@pengutronix.de>
 <Y+UX2ysd1B5/cHpk@shell.armlinux.org.uk>
 <20230214090652.dq2gdipvxnrxil7p@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vbncwnxcsarc2gn"
Content-Disposition: inline
In-Reply-To: <20230214090652.dq2gdipvxnrxil7p@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--5vbncwnxcsarc2gn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Russell,

On Tue, Feb 14, 2023 at 10:06:52AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Feb 09, 2023 at 03:57:15PM +0000, Russell King (Oracle) wrote:
> > On Wed, Feb 01, 2023 at 09:23:09AM +0100, Uwe Kleine-K=F6nig wrote:
> > > The sentence "[clk_get_rate()] is only valid once the clock source has
> > > been enabled." can be understood in two ways:
> > >=20
> > > a) When called for a disabled clock the return value might be wrong; =
or
> > > b) The disabled clock must be enabled before it runs at the returned
> > > rate.
> > >=20
> > > It's hard to find evidence what is actually meant, but given that the
> > > clock tree can change between the call to clk_get_rate() and the retu=
rn
> > > of a later clk_enable() call, it's prudent to assume a).
> > >=20
> > > Adapt the comment accordingly to be unambiguous.
> >=20
> > From the API perspective, it's both.
>=20
> I documented a) now which is weaker than b), so b) is (only somewhat?)
> implied.
>=20
> I wonder if your mail is essentialy an Ack, or if you are unhappy with
> my change. Can you suggest an alternative wording?

Would you pleas care to share your thoughts about this patch? I think
the patch is fine, but I didn't understood your reply if you're in
favour of it or you'd prefer a different wording.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5vbncwnxcsarc2gn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQukFUACgkQj4D7WH0S
/k5U7gf9GZjBp1xU2qDoQG9quxcr4swH27mpFJahO8bdhZWERwjxqKo/94fEIpVA
kRboOwqrt8cwDXB3wKYT0P+oN0ukToA51iXh3TlKUgtLpNUmfTSICH+5Dyilzmvo
e8UltxaQFac1tl0a6bjW35b9WmC2FFAVIO/lH48FcmHjXJAbX2fCqpYdtZ2m/tOd
cYcBucPRoBLhtrf9HjGfcxyxqChjaIEjzuoJkap79WsSLnz0rThVdg8tZKfP2qxe
4w1p+j86xK98J/OdgSo+jhXFrYr6YCb5syMyaJ0HLYlhq+Nraunr6EPlEht1lqsF
TXcEBTAMjIydf02YX8Au+qccGVk8NA==
=Zt9O
-----END PGP SIGNATURE-----

--5vbncwnxcsarc2gn--
