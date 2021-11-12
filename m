Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD2EC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 08:34:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58F3960FE3
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 08:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbhKLIha (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Nov 2021 03:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234078AbhKLIh3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Nov 2021 03:37:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD2FC061766
        for <linux-clk@vger.kernel.org>; Fri, 12 Nov 2021 00:34:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mlS12-0006Ie-UF; Fri, 12 Nov 2021 09:34:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1mlS11-0008MO-OM; Fri, 12 Nov 2021 09:34:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mlS10-0000F8-GJ; Fri, 12 Nov 2021 09:34:30 +0100
Date:   Fri, 12 Nov 2021 09:34:30 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Simon South <simon@simonsouth.net>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] clk: Warn when clk_get_rate is called for a disabled clk
Message-ID: <20211112083430.wqzsmrjrh2zqihmp@pengutronix.de>
References: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de>
 <20210113083042.tezxr5sim2oevtvm@pengutronix.de>
 <161301324986.1254594.14610246660375821616@swboyd.mtv.corp.google.com>
 <20210211080509.5kl2u3ofdggyzuvj@pengutronix.de>
 <161317887654.1254594.6078241024095194891@swboyd.mtv.corp.google.com>
 <20210213165406.GQ1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ptnkvmad7nisnze7"
Content-Disposition: inline
In-Reply-To: <20210213165406.GQ1463@shell.armlinux.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ptnkvmad7nisnze7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Feb 13, 2021 at 04:54:06PM +0000, Russell King - ARM Linux admin wr=
ote:
> On Fri, Feb 12, 2021 at 05:14:36PM -0800, Stephen Boyd wrote:
> > Quoting Uwe (2021-02-11 00:05:09)
> > > On Wed, Feb 10, 2021 at 07:14:09PM -0800, Stephen Boyd wrote:
> > >=20
> > > > What problem are you trying to address? Is there some issue you've
> > > > encountered in the kernel that would have been fixed by having this
> > > > warning?
> > >=20
> > > The warning obviously doesn't fix anything. My eventual goal is to
> > > answer the question in the initial mail in this thread. The motivating
> > > situation is: Should I continue to tell patch authors who use
> > > clk_get_rate() that they have to ensure that the given clk must be
> > > enabled as the documentation suggests? And if yes: Can we please check
> > > this automatically (e.g. with my patch or by returning 0 for a disabl=
ed
> > > clk) and don't rely on human review to adhere to this rule.
> > >=20
> >=20
> > I suggest to stop telling folks that they must enable the clk before
> > getting the rate. The documentation says
> >=20
> >  "This is only valid once the clock source has been enabled"
> >=20
> > which is really ambiguous. What is "this?" supposed to be?
>=20
> Please Cc me on CLK API matters, as per my entry in MAINTAINERS.
>=20
> The subject is the clk_get_rate() function, and as it is in the
> section describing that function, I don't see it is ambiguous.

So you interpret it as: "The value returned by clk_get_rate() for a
disabled clk might differ from the actual rate the clk has once it is
enabled.", right?

I agree with Stephen that the semantic isn't as clear as it might be, so
this should be improved.

> From what I remember, the restriction came after some discussion,
> and the problem that on some platforms, the clock tree would not
> be known prior to the clock being enabled (at that time, which
> was before the "prepare" stuff got added.) Consequently, because
> the child/parent relationships were not known, and PLLs were not
> initialised, the rate that a particular clock would be ticking
> could be different before and after it being enabled.
>=20
> For this reason, it was decided that the only sensible approach
> was to declare that the return value of clk_get_rate() on a
> disabled clock is undefined.
>=20
> That said, finding the discussion is proving difficult, so I may
> be misremembering.

I wonder what should be the consequence here. Is it still true that
clk_get_rate() should not be called for a disabled clk? Or for an
unprepared clk?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ptnkvmad7nisnze7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGOJxMACgkQwfwUeK3K
7AmFdQf+NHZM1Mrk0u31jbt9/VtqlqVYAKTtvMT82+/whBbyMosla95UOA+3gdLo
6vSHnt5ytPf0WHisx36arHlgBgo9vkREMo6rK6MoTFX+SylX3qtk1u+p8YYgtae4
FxzapIUoCn82AC/j6uXsdJOa6tzD+lyjJi2lrL/YZ7AR1Isaw5iBXv/vMeQyKROC
hkbasQ8zfUra1lYbhZIABhO9iLnbUIvuaTO/l4QfFtuP9PzUI5/YhQzhop3d/KfB
gsv1o0QRs/FXG1+yujvsD5uCvJWSqNLWIIPUtWoqrc0OeXF0Tv7++qRHqKFq5nzH
dmJVfNMo9dURmtXRve7KP+tEixuoEQ==
=bkIr
-----END PGP SIGNATURE-----

--ptnkvmad7nisnze7--
