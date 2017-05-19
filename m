Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 19 May 2017 10:26:31 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH -next] clk: sunxi-ng: de2: fix wrong pointer passed to
 PTR_ERR()
Message-ID: <20170519082631.epwxqh3dqhxr6va5@flea.home>
References: <20170518155513.29628-1-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lqybtb436w47a4z3"
In-Reply-To: <20170518155513.29628-1-weiyj.lk@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--lqybtb436w47a4z3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 03:55:13PM +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
>=20
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
>=20
> Fixes: b0d9a4bd52bd ("clk: sunxi-ng: add support for DE2 CCU")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lqybtb436w47a4z3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHqw3AAoJEBx+YmzsjxAgXfsQAJVW1t0A+YqOgsTaqPt/VD23
JtS5S/VR37btvq4K0wd6xhCB5y2woGDTg5K15NQZdvL5mfBmp+NQI5EwYVaDM0I4
vL96Kt5Dn+k9GDSECnSXx0duKPTkTi3gZdZdTr7kiZ4uGSkpYFSWcdjuad8y+2a4
bt+mrWZFwoEvKDCKxkVg4liyk113ZU0c6DYaaKOz2EUfWlLkwCFwqkVOJ4FcQUie
fSuo75C5BGrcXFej3Tx4D8VKLPwSkcWGYtAn/Yj7t3JBvf41rOAvt+U/cU1Vu6hx
ryVGuKsN/2qUFTy0e/ZPGsVO4yhv1sfP+Q7t14pyyvwtfnl1+iPaB0VGa9udZEeb
X1lP0NjwtvZFo4O3hVKrvBXoL1IWFHKxFZ5GDJAMZPh3dE85e2CpWOUg+l8kQ5mY
IhgIPHG58UbfmRWJpZ7F3x828bABBff4sA5V6Ew7/s4cKuPvOSAn5dZ/qGBD7Yht
Ch4uql53E6vKZYDORhVwaq7atxkSwQUQuE9qIZ53tyYVUszJzQDlcCfDRxno8Bov
FtFTBGJ4cJIn5yMpJQxT/eVbXF5MKjcxfKCWWOY61urmBy12vLpICrUPWCdU0uRI
UAOWsf+PkkCD9u0NPuCGYDcHhEmfelxzHPMlV5JpdQ5k3BzOIwX8/YYlFzBBEOja
/3q04t+6PZF8M8kq+Vt0
=utuD
-----END PGP SIGNATURE-----

--lqybtb436w47a4z3--
