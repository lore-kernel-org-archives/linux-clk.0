Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21726C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 08:06:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D51A260C40
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 08:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhBKIFx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 03:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhBKIFp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Feb 2021 03:05:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CDBC061574
        for <linux-clk@vger.kernel.org>; Thu, 11 Feb 2021 00:05:17 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lA6yP-0004wa-1T; Thu, 11 Feb 2021 09:05:13 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lA6yN-0000MV-V0; Thu, 11 Feb 2021 09:05:11 +0100
Date:   Thu, 11 Feb 2021 09:05:09 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Simon South <simon@simonsouth.net>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] clk: Warn when clk_get_rate is called for a disabled clk
Message-ID: <20210211080509.5kl2u3ofdggyzuvj@pengutronix.de>
References: <20201221092713.vq6cfo2jyxl5l2rm@pengutronix.de>
 <20210113083042.tezxr5sim2oevtvm@pengutronix.de>
 <161301324986.1254594.14610246660375821616@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w2f22uaodhpoinvx"
Content-Disposition: inline
In-Reply-To: <161301324986.1254594.14610246660375821616@swboyd.mtv.corp.google.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--w2f22uaodhpoinvx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Wed, Feb 10, 2021 at 07:14:09PM -0800, Stephen Boyd wrote:
> Quoting Uwe (2021-01-13 00:30:42)
> > <linux/clk.h> claims that clk_get_rate() must only be called for enabled
> > clocks. So emit a warning if a consumer calls this function without
> > ensuring the clock being on.
> >=20
> > ---
> > Hello,
> >=20
> > I didn't hear back, so went on to create a proper patch now.
> >=20
> > On Mon, Dec 21, 2020 at 10:27:13AM +0100, Uwe wrote:
> > > the documentation about clk_get_rate in include/linux/clk.h reads:
> > >=20
> > >       [...] obtain the current clock rate (in Hz) for a clock source.
> > >       This is only valid once the clock source has been enabled.
> > >=20
> > > The second part isn't enforced and (I think) there are many consumers
> > > who don't ensure the clock being enabled. (I just stumbled over
> > > rockchip_pwm_get_state().)
> > >=20
> > > I wonder if it would be sensible to add a development check to
> > > clk_get_rate, something like:
> > >=20
> > >       if (WARN(!clk->usecount, "Trying to get rate of a disabled clk"=
))
> > >               return 0;
> > >=20
> > > (or something less consequent like not returning 0 but the value it a=
lso
> > > returns today).
> >=20
> > This conservative approach is what I implemented now, and I only emit 1
> > warning to not overflow systems that trigger that problem several times.
> >=20
> > I'm unsure if I really must take the enable_lock, but it is not
> > completely wrong.
>=20
> I'm not totally opposed to this but I'm curious if you have a plan to
> fix various drivers that are violating the documentation? I'm more
> inclined to leave the documentation as is, which indicates that it isn't
> promised to work but sometimes does work. Given that we've supported it
> for quite some time I don't see the downside to keeping supporting it
> vs. the many downsides of implementing a check like this and having to
> fix various places that now WARN_ON() (and if you have many on some
> particular device then you'll have to work through them one by one?)

The WARN_ONCE vs. WARN is a trade off. Picking WARN has the downside to
(maybe) overflow your kernel log hiding the things you currently care
for. If you want to address the rounding "problems" making this a WARN
might be sensible.

> What problem are you trying to address? Is there some issue you've
> encountered in the kernel that would have been fixed by having this
> warning?

The warning obviously doesn't fix anything. My eventual goal is to
answer the question in the initial mail in this thread. The motivating
situation is: Should I continue to tell patch authors who use
clk_get_rate() that they have to ensure that the given clk must be
enabled as the documentation suggests? And if yes: Can we please check
this automatically (e.g. with my patch or by returning 0 for a disabled
clk) and don't rely on human review to adhere to this rule.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--w2f22uaodhpoinvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAk5TIACgkQwfwUeK3K
7Am0Ogf+Jley9Z8jKejhVY3ONMT72NimpNNDD89j+EeMEwbuI0EooAaNQgBAbFMO
VogNdVnNibQ1kREg1eT8M9NzuoalagSwirCg/92d/yNCjCohXItDBJetIluSM8n4
aFTZuOqBMLOYIuyrrry/F85lU+pe/2gQ6HFuWqGhyG3Tf5S0G6owLXkVTxHU0I7n
ZV0q3GsPv/CrOfypuqDX69Gnmi3puKYLKcViG+Nam0T8FYo/cke+4EEd2rMXsIV9
65jfa+xJqg+/lbOQ9svBK1cSUFHoBuM+XrULLp/fbwTuofBks1L2ShAkN1FSENkh
XTarLHSnpsDijSGi3uYWDpVoiay/vw==
=kakO
-----END PGP SIGNATURE-----

--w2f22uaodhpoinvx--
