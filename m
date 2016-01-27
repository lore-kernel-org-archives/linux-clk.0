Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 18:41:25 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 09/11] clk: sunxi: rewrite sun6i-a31-ahb1-clk using
 factors clk with custom recalc
Message-ID: <20160127174125.GN4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-10-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UUMz/kfoogzZ9WLZ"
In-Reply-To: <1453727747-23307-10-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--UUMz/kfoogzZ9WLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:45PM +0800, Chen-Yu Tsai wrote:
> The factors clk implementation has been extended to support custom
> recalc callbacks to support clocks that use one factor for certain
> parents only, like a pre-divider.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--UUMz/kfoogzZ9WLZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqQFFAAoJEBx+YmzsjxAgSncQAKobVXLzUF0h6fY1hIJxOEcS
Ps5Pv4TIEsLN/DJT3S7Ebby0ssU9DparTO+hXQdRqzCgIr1+nhqhHk16wlc3ujHu
KKCFyaI0WZcpsW/cygTb+uP4zslUON3cGPhlDIPIr6ONLoYvlIr9rqVwGQf3lBJK
7kPFdh3hPulTVndMjF+oZZoBNwHyRwA9lwjgZuvVwlEm6gIO8Rq0yfUhCVbFqj3/
Clpa5NCkIappDV985Hw3vw1s7IkzhttO/iUpTQMd9cTFz4usppg5oRqAm4A6xKlI
nCT8EMhdVHezsc4RjjCEGCmmN/FZwXv8uodibCylnpHta4YIQobBJzx6hoccVOMW
1BVfH08CKeaQ/uFGZt8mymAZ3M/q5mlApztJPnlxSHaX2ce/c3O3YiPIXYKJ/Gpk
9WjH8s9Jn0F/daDxpNKY935SE20zHZFrY92dDX+Smx5iRQ7Gb9ROMjF9vbMo2X+h
Cqpni9OEMtDy56tgs79oTxQlkWxhPSDUyENVRtMFUoEdPGLWimX986rxrbcXsGSF
P21vt/yYCH0Vb9LE0bX8N89Co+pih0ZLCDZNVmv0Ej1mdwMjtGFSe+DWe+kSdSOY
z8CY1azI4O3f/ShEmzRzSDgxO5WnWa2BKaKTdgC+Z+g/mpv2w8u+p4AMXHER0vW7
UaofsV0hmb4kgPjCSvCu
=uuOJ
-----END PGP SIGNATURE-----

--UUMz/kfoogzZ9WLZ--
