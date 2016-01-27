Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 18:47:42 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 10/11] clk: sunxi: rewrite sun6i-ar100 using factors
 clk
Message-ID: <20160127174742.GO4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-11-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sy9WyBOsCRoUO165"
In-Reply-To: <1453727747-23307-11-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--sy9WyBOsCRoUO165
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:46PM +0800, Chen-Yu Tsai wrote:
> sun6i's AR100 clock is a classic factors clk case:
>=20
> AR100 =3D ((parent mux) >> p) / (m + 1)
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--sy9WyBOsCRoUO165
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqQK+AAoJEBx+YmzsjxAgWVMP/2V//eNFD6gJi0desvzRCSLB
tqqekBIpSvcnIxXCGaC55wbvOOfP3XpAjOSAXVQa4zdtOU0ZvMQ3aqDYmVpgpfzq
kINm8TsvBZL4LjHjsiWmWn0KzByP9+xnnmV4jUBbfrLV8iSgX2gp+6vEDmYOsNk2
G6vXnAFXbPlMERClHAo4WrLyW/1eqNEOzJAgrQn3nlNBRTBfDRkqqerb3OupSFDl
Mg1zoYHSMopjnFZuanBtRZ6ZqFgPCF3bVbr8Ukl9QK5XGYIBctI9sTFnUM5267fm
uUSLpbjR6owwdf3C0pyyZsOj/TwqXAXqVSFDl8hQfUaE0x7KuGXoefPRiT3IrmRd
FKYmAdSZXouLfMKol5X9drLN8uh1RHibgRuIqlkDtSCwD73FsHCxmmnYQloRY/GE
gZ9LbdEqyAY+Lhd6u21mjruaMrt5RT5NckVg0Q4Vb/pFDTRTvkvmPN1g8Zrht31/
mq+3ElYikhSGHlCWduJfRhGdvBcgFyCJ75xE0Sbny3AXJyxI1Kc3thpJmRZ049Vt
ny2kiPhTR7RxnIChy/UhYPgoqReTW2/08kZbGjrwIVraFh/EJtF6DYHcZA3NCzbl
JK4oQ2IntvdN7rvskmuxv5qBXE/ZtT3eP2X3wShsqCOOOY+vVLTy1zngCw/Xi2bL
IYP0GvcQdHiLWRhiGQYM
=7uwZ
-----END PGP SIGNATURE-----

--sy9WyBOsCRoUO165--
