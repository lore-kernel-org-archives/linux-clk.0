Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 16:52:36 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 05/11] clk: sunxi: unmap registers in
 sunxi_factors_clk_setup if register call fails
Message-ID: <20160127155236.GI4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-6-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v2/QI0iRXglpx0hK"
In-Reply-To: <1453727747-23307-6-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--v2/QI0iRXglpx0hK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:41PM +0800, Chen-Yu Tsai wrote:
> sunxi_factors_clk_setup() does not unmap registers when
> sunxi_factors_register() fails.
>=20
> This patch adds proper error handling, and also an error message
> when sunxi_factors_register() fails. Also use the full DT node name
> in error messages, as the node name is often just "clk", which is
> useless.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

APplied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--v2/QI0iRXglpx0hK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqOfEAAoJEBx+YmzsjxAgDEUQAKYvMARDefMTWsvgSNE0tlfL
ndZMfGNoHImcZZCGs/SiMLtZ2VlgvSN4Pv89lFthlFxgaYQwpXjMfbtd+CCrm6iE
q27FNUirdaRCYIlrqW2Gij1eRRwjqX8W3JndqN4JIG6mm6NTJmdSTuUjoJbtvTE5
bG4iBRoAlGKnB+WTSgii5yGf/Z1XakQ78JOd6y2no/AX0rN5wnJiSds2+C0yMpWM
35SRpF/qv9cJwSQiPQwyIYKD+E1vM7c5XhjRduUtiW2XbuNuDqRmRzh+Q9PJyk1U
mfn3cY73CQ0fq+fXeLtajfSJFPMdLrjEOqP1CzbRspoYn+tYS733AwwBO/22HWP9
+W99td+0hpqEJWnrs4l6Uk6l3kmm/KBkyPZQl01efa/oIzqjItd0OO9tNuwo/ztr
0Nfopj092kQ4m7hViIZdjt6ti9Uzp0UocHA6Mwvc0IK7Ymv1PCHZniLejiEkiIE+
IJ+Ky6n5DyImzwp7ySopuEYfnnJxlM+HItdZmhDpuVUvdDvcFlvm6+GPSzWdbMD6
afckJi5fJNwTAy34LdMunvwiLVhfFqaiPQGgkR+buqW1uWVxdx57pkX0eF1jKuwp
hOCheyIIIj7nOJbkSQfi4Lp0aESdwDA6zyXR96nYupbCr4SoeFLxxyBwMno39DsQ
CZbCUX18eje/nk1JtjoZ
=2VhC
-----END PGP SIGNATURE-----

--v2/QI0iRXglpx0hK--
