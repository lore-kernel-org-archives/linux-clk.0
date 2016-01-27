Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 16:52:10 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 04/11] clk: sunxi: factors: Add unregister function
Message-ID: <20160127155210.GH4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-5-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
In-Reply-To: <1453727747-23307-5-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:40PM +0800, Chen-Yu Tsai wrote:
> sunxi's factors clk did not have an unregister function. This means
> multiple structs were leaked whenever a factors clk was unregistered.
>=20
> Add an unregister function for it. Also keep pointers to the mux and
> gate structs so they can be freed.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqOeqAAoJEBx+YmzsjxAgUHQP/Ax4s1hQ7X6kZpAhgrdKiOp6
VadcMucoN/ttJr+c6Pf6tS7FxQmf/aYxAF5DsVO3kqwtBeEbNXiF4GhgpVaY8jgO
+NjPeX2jXvF99sysfDw1EP8X3oXYfCv4myTLdBRBCDbE30qgQB4UyK8s+7z2rMfP
GdhTWw8UjMn2k8fNNVY+dcCn3/47gxfgDUuRFq2lLuHBbLAny/o3ZIXE/yFiVuU3
023/N8stJk3Xf3tPmBdALYRt6t4h0hcnhjUe9cm0RrJA9Q7gSOr95YjarnkWu2Hz
ykOJjMZkg+QSl9v2IIJ68J/1BsfOItbmLxvkDY8fPzb9HWDdxE8RwKScvvcpDsYR
gcG9h8otP4BH1RfrG3C3bpPGnfbOVheE8PjfeABtALcv8VvvS1+7/L9hMhaNp06p
Bgx5jz1N++lE+qT8T630w2nHeHn3UTdv/Abrh21LS0Vne7rQnEx34frj/8CSBZ6Z
2rN5qM1pdaenb02n5YoMjrOMSLaXnoxzLZJlZ/CVvDfqShysMGLJDz9vHe3fJPmf
uvc8VPE0Mfa/uktFeTCd9s8DmnfYrw8WEFeaiipGGwGEnjHayewZAkis2VMpf09N
vTho4zWCH+9KlPxUQWfiKbVNnPfUGwxDk3EKegsUSL/1l/RbL1yjrHr+68MJRl2C
U5PgDl8xVzR1AY60ogTu
=8ff5
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--
