Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 18 May 2017 08:49:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: enable SUNXI_CCU_MP for PRCM
Message-ID: <20170518064949.4i3jebpijpjbvm5q@flea.home>
References: <20170517212035.3100471-1-arnd@arndb.de>
 <CAGb2v67EHRVrbR9dsNtMuuG+L11WxHcoqVw4GyyD0-hhJ3EPnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f57mzh55h2i5djoh"
In-Reply-To: <CAGb2v67EHRVrbR9dsNtMuuG+L11WxHcoqVw4GyyD0-hhJ3EPnw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--f57mzh55h2i5djoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 10:25:23AM +0800, Chen-Yu Tsai wrote:
> On Thu, May 18, 2017 at 5:19 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > The newly added PRCM CCU driver uses SUNXI_CCU_MP_WITH_MUX_GATE, which =
causes
> > a link error when no other driver enables SUNXI_CCU_MP:
> >
> > drivers/clk/built-in.o:(.data+0x5c8c8): undefined reference to `ccu_mp_=
ops'
> >
> > This adds an explicit 'select' statement for it.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--f57mzh55h2i5djoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHUQNAAoJEBx+YmzsjxAgvL4QAJewVEvXVJqfbblOqo00ljfv
t9Yc8bRWH8N06ZLnspO8uKYTh+4byDRd5Okyt2x0McKB/h+zYHwf/d7s6dvv2/Ke
GQvia12jMHzFoYlru+ZlBeu+54SMw8WUdOUfDHYHREK8hpwJCgQwtxwwBgs31hIK
qR11FlVMyOhaYPd1a9ie5mPRad6viiBwvKRTxHfBRcvMlbAyVn9w+VpYm0x7k0qw
KWmNbRDT3rAtCEpyFvhibBFqm3Tx5+ExGW/HClpRDtaib7v1A6S2R92vpAFvszOY
m6JO11wVfP1QNPuU0Fsa3529vTVB2t6Oj2g2zGFiZcTFSCXbSj1zjmYFlLfdllW1
ej1AlNLDoXlv6u2paB2LDp0gVX5Btgyms+pw9lHIC+th9fhvlsEVZ2MULglyMaC1
cRsJ+n/d43EPYXQYDuqWeXWGu5BDLRp+ccZLirb2mdKKPjCZGu2UOB3yqMmMqsZ/
cs7PvfBUrpeBOVbWYbIWaGpiK8Lo5fWCk7k/z5noSFuF9clPaudqydPVBOTY6MSl
LV/RbvKosKmBBTvgjCH99EW2YqAOhBE0iTPrzHIlU1BX0eGoP9t881Ep06ORoApO
Z1SmUEWDyP4bHrggneJZKb86XcDVqO60qpK7yjGl+njNyYqpxsz/amchMUYSVHw3
88imuiR0+qDsXrrLXNNz
=LNOG
-----END PGP SIGNATURE-----

--f57mzh55h2i5djoh--
