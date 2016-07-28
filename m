Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 28 Jul 2016 15:31:45 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] clk: sunxi-ng: Add A31/A31s clocks
Message-ID: <20160728133145.GB6682@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-9-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
In-Reply-To: <1469516671-19377-9-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 03:04:30PM +0800, Chen-Yu Tsai wrote:
> Add a new style driver for the clock control unit in Allwinner A31/A31s.
>=20
> A few clocks are still missing:
>=20
>     - EMAC clock
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Looks good to me, aside from the comment made by Jean-Francois.

I guess I'd prefer to have the SoC names in the define, just in case
we need to introduce support for another SoC, but this can always be
done later.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmglBAAoJEBx+YmzsjxAgFc0P/iNgLZshtE7s3k62EH60E+5i
7og05mhhIItkXR0omNlpZIhDv0S7K+noH/2k1sUzmhWyHgvSPAnv9utV6UEgtcjX
qxnR6r3fjWsf+Yus7axxxbZIbvqFt6jpJYip2kGaTAN9diUoDPeNPjaw1TMOIJ7m
pX15mK623kcRTfy5iiuKlKAYHyNsd9DRpAucURd7OFBs32mXsnxsbIHiY8dUP/Ge
/85R+wrCg7BUHSW5Y0OBCRoR0F9OP8bW/LxeEotmuCf7IgW3PMh94nnqFrSIUu96
xcOIH6FQFOE59f5L+k7IHFzq6ddTowkBtEBmum5B0r2VmBttsw+X+tLF0t4jTGKB
EBhnJYL3/rUkuwB3RXqN1VgXLhOKAubSufOoxaP01WU0IlTsJIknrWHygdujrFgp
JOb51atlSghnf94EWoB76aaeRXCrzwlmIVgSlGEJzaK181wLtLFIAymJN1gv4hmL
574mgYFSW11j+E3Gu5BJSm5Afl/eZy7RTOh3OeE4U/XA6TYVExW57LHyS5prMgA0
fMLbENkJzaoxBe2iCgNm7XlL1+dxvwrnBgVfK3pwWB7kQglBMxGvtUn0DYr1bPXY
a1Lkkl4ZFlnUCk6MISP985fElD+8jve3rCqxbPOwYL8e9uSGCnb8GnH/I9KVtB/i
pHP0ln2pi/0scAqaMSKr
=7Xn3
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
