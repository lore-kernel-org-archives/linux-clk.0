Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:37116 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751927AbcC2Pyz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 29 Mar 2016 11:54:55 -0400
Date: Tue, 29 Mar 2016 17:54:39 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/5] clk: shmobile: r8a7795: add R clk
Message-ID: <20160329155439.GG1398@katana>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
 <1458824442-20279-4-git-send-email-wsa@the-dreams.de>
 <CAMuHMdW1zTwLbgEVZD+VOEy934yUEp90pEv-ju_1+dd5RjLp-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
In-Reply-To: <CAMuHMdW1zTwLbgEVZD+VOEy934yUEp90pEv-ju_1+dd5RjLp-A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > @@ -114,8 +117,11 @@ static const struct cpg_core_clk r8a7795_core_clks=
[] __initconst =3D {
> >         DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250=
),
> >         DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244=
),
> >
> > -       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, 0x0240, 8=
),
> > -       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, 0x0240, 3=
2),
> > +       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR=
, 8),
> > +       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, CPG_RCKCR=
, 32),
> > +
> > +       /* must come after EXTALR because we need its rate */
>=20
> must come after r_int because we need that clock as a possible parent?

Well, I added the comment because the dependency to EXTALR is not
obvious. Unlike the dependency to RINT which is described in the same
manner as the rest of the clocks.

Maybe I should simply remove the comment if it creates only confusion?


--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIbBAEBAgAGBQJW+qU+AAoJEBQN5MwUoCm2ws4P93Val+LaIawxxzGgC1aqw+I3
5pQA64JSTmJF+WqDbGi7gusGsLFDjtgMGzwW2OWV1EwRxe9/NDyxB9vFAbKCvrYd
eJ3pwyc60b2kD1pvq/tZTXtJYDVccCi/uobRDOo8B70Nd8lkpzxslOM/XYDV8dQW
Z7BUac/JkqIub4mbi+EBmHAIkiEYYMKL4DMnevGbsciMKA9myXAm0udUl5ciDSI7
yb9iZ8P673mcxCC7WrAeMrP09gX73OUM6aZnUpir4GAWW1VzFrOxWcsx8vS9ho0Q
WP4M2j6+jVpIT1w19CQux2YWsWbmN4RwpsEJ7HfCRdgg8ikn5G4Vg+P/0K/sJitY
Lm9KP+Jy8WFrJUwfSrEFmyUGeEzuGKsDE5CxEAXemuoSwo0XZ4PT/w/MDlhYYvn2
mAhuEBu89cR+i5Ot6ANXBu2pPB3d4zUqyiVTbNklDHt2L27JNv52hAyesHS/qSB3
djscQ/I+mK8rlgDQ1VnOtATrC3npmcjpoCAgvq7yKb+lIAZcgG2oS/zCkzfQItb3
S9Kf/srY0ZAHbVPQsfqOa9+GdcLyopcuFsAKRnWJwKNmsUCHr71ZQoWOMue0j7sk
f0Cg5NgUd6S9tevbpmmXH4g+1Umu3fp2pnI4hr+gjwQtaZrYa9OEsbhzazmSTS1l
mJXus/+hSBRG7MeEiYg=
=clMz
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
