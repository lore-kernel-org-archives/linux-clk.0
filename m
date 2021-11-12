Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAACC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 08:49:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 476A860F55
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 08:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234577AbhKLIwf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Nov 2021 03:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhKLIwe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Nov 2021 03:52:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26529C061766
        for <linux-clk@vger.kernel.org>; Fri, 12 Nov 2021 00:49:44 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1mlSFb-0008Eh-Cu; Fri, 12 Nov 2021 09:49:35 +0100
Received: from pengutronix.de (2a03-f580-87bc-d400-de63-3764-bcb9-a107.ip6.dokom21.de [IPv6:2a03:f580:87bc:d400:de63:3764:bcb9:a107])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id F26526AA3A7;
        Fri, 12 Nov 2021 08:49:32 +0000 (UTC)
Date:   Fri, 12 Nov 2021 09:49:32 +0100
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Simon South <simon@simonsouth.net>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] clk: Warn when clk_get_rate is called for a disabled clk
Message-ID: <20211112084932.cmnf5f22commor7s@pengutronix.de>
References: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de>
 <20210113083042.tezxr5sim2oevtvm@pengutronix.de>
 <161301324986.1254594.14610246660375821616@swboyd.mtv.corp.google.com>
 <20210211080509.5kl2u3ofdggyzuvj@pengutronix.de>
 <161317887654.1254594.6078241024095194891@swboyd.mtv.corp.google.com>
 <20210213165406.GQ1463@shell.armlinux.org.uk>
 <20211112083430.wqzsmrjrh2zqihmp@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gin7bnrxobw2owsa"
Content-Disposition: inline
In-Reply-To: <20211112083430.wqzsmrjrh2zqihmp@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--gin7bnrxobw2owsa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12.11.2021 09:34:30, Uwe Kleine-K=C3=B6nig wrote:
> > From what I remember, the restriction came after some discussion,
> > and the problem that on some platforms, the clock tree would not
> > be known prior to the clock being enabled (at that time, which
> > was before the "prepare" stuff got added.) Consequently, because
> > the child/parent relationships were not known, and PLLs were not
> > initialised, the rate that a particular clock would be ticking
> > could be different before and after it being enabled.
> >=20
> > For this reason, it was decided that the only sensible approach
> > was to declare that the return value of clk_get_rate() on a
> > disabled clock is undefined.
> >=20
> > That said, finding the discussion is proving difficult, so I may
> > be misremembering.
>=20
> I wonder what should be the consequence here. Is it still true that
> clk_get_rate() should not be called for a disabled clk? Or for an
> unprepared clk?

Anecdotal evidence:

In the early days of the stm32mp1 in the vendor kernel, there was a
problem with the CAN driver. All CAN drivers call clk_get_rate() during
probe to read the clock rate and later in the network device open
callback they use this rate to calculate the dividers to get the
configured bit rate.

The CAN driver was not working, as the clock tree changed between probe
and open callback. The problem was worked around by using a different
parent PLL that doesn't change during startup.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--gin7bnrxobw2owsa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmGOKpkACgkQqclaivrt
76nHMggAh3la0tuMr+FQOVvGyWN1VMT2rZ6aEavRj0r4irm0oJMVOmUd5iho4MKO
EmcKtcb/xEpmePLrdcXwGnZcTpPo5I/f4ak3+wO/bycPZ1JA+r9JPljgQhFuUxMX
UKOm3wEikocOolZtCDQzjq+iNL0SZIW7kAuGkKDKYk4YIB3sI1CP3JuOribVs5uX
Xi/bVtubNADHIvGmIUH6XtejGHBQbVcdN7K6EY9xSuZPqo+utuS0USDFOLS2fL0g
EVZC2ashIK+rbGRvCg/xWSBbKMfYh+PrjzafwhL0bQ8jk/Lqoqugr4jek+IVs/cJ
+SMu2oy9WrDE3s8Wdru0O1ai6jBthw==
=P40B
-----END PGP SIGNATURE-----

--gin7bnrxobw2owsa--
