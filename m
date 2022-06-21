Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99569C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 09:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbiFUJw3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 05:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346335AbiFUJw2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 05:52:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BDB27B2D
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 02:52:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3aYW-0003ux-07; Tue, 21 Jun 2022 11:52:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3aYP-001o9A-Gb; Tue, 21 Jun 2022 11:52:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3aYQ-000B3T-1J; Tue, 21 Jun 2022 11:52:14 +0200
Date:   Tue, 21 Jun 2022 11:52:13 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-clk@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] clk: Fix pointer casting to prevent oops in
 devm_clk_release()
Message-ID: <20220621095213.m3bbsys34cga34tt@pengutronix.de>
References: <0cdc7588-4dc3-266f-aa37-86bf5996497f@samsung.com>
 <CGME20220620171854eucas1p2702e46ab21fd706d9c1d1c76f68e0d38@eucas1p2.samsung.com>
 <20220620171815.114212-1-u.kleine-koenig@pengutronix.de>
 <5ebb4585-90fa-02b5-a49c-dc81fce7285a@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="remd54dwnnrhqac6"
Content-Disposition: inline
In-Reply-To: <5ebb4585-90fa-02b5-a49c-dc81fce7285a@samsung.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--remd54dwnnrhqac6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jun 21, 2022 at 08:25:23AM +0200, Marek Szyprowski wrote:
> On 20.06.2022 19:18, Uwe Kleine-K=F6nig wrote:
> > The release function is called with a pointer to the memory returned by
> > devres_alloc(). I was confused about that by the code before the
> > generalization that used a struct clk **ptr.
> >
> > Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for your confirmation here.

> > ---
> > On Mon, Jun 20, 2022 at 05:26:12PM +0200, Marek Szyprowski wrote:
> >>> -   clk_put(*(struct clk **)res);
> >>> +   struct devm_clk_state *state =3D *(struct devm_clk_state **)res;
> >> This should be:
> >>
> >> struct devm_clk_state *state =3D res;
> >>
> >> otherwise it nukes badly during cleanup:
> >> [...]
> > How embarrassing. I understood how I confused that, but I wonder how
> > that didn't pop up earlier.
> >
> > FTR: I didn't test that now, but assume you did. My focus now was to get
> > out an applicable patch fast.

I fear that this issue will break some more tests, so I think it would
be good to get this fix quick into next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--remd54dwnnrhqac6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKxlMYACgkQwfwUeK3K
7AlvkQf/SpMJECFjBWfK0O6nfQ6zMCznsnEfHuyIErMhImnMOYV0dnYZ3RnYFiay
Da1wmbPZkrhLU/OAqpUwTrLPhjlIFsyvusT96Z2Os6cnPb2CY61KrZpTImRWxC0b
5o1aMUj8xJLZv39ViVph6XDAHFcOJ8qJgYWrbyHCP+jmVPHbURCKFzzANFMPpKBx
xxGhd2cSZcNIJ2HkC5vr+nGzGC0J847h81bDyqlOT/D8bDg/xoM7Yx9BQ3OOjMs9
acw/aCmzOQRS08NDS2bH1ByZQ0CGfq0JQlr8HW8ndtr5HEd3JHUqQGjf/r7JvuHb
V1Ftg1aIhTNR2bwBGGG3fc9IxztT0Q==
=q+2/
-----END PGP SIGNATURE-----

--remd54dwnnrhqac6--
