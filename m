Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 9 Sep 2016 21:12:21 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: sunxi-ng: a23: Assign base address for
 bus_spinlock_clk
Message-ID: <20160909191221.GI8881@lukather>
References: <20160909035421.16119-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YhFoJY/gx7awiIuK"
In-Reply-To: <20160909035421.16119-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--YhFoJY/gx7awiIuK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2016 at 11:54:21AM +0800, Chen-Yu Tsai wrote:
> bus_spinlock_clk was accidentally left out of the list of clks that
> need to be assigned the register base address.
>=20
> Fixes: 8c9214b0e525 ("clk: sunxi-ng: Add A23 CCU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

I squashed it into the A23 CCU patch.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--YhFoJY/gx7awiIuK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0wmVAAoJEBx+YmzsjxAgdtoP/jH5lRZhbpBLUXARhIUi5XN3
L/pc2tqYU92RMtV8bGmF6RTQ/RXu3t3UndwpYDjuD4ptAqN/ZaBT7ZRvVjrk0iot
XB1JMpeVoYYRaKU6lAtPoiENfHR55rnXo77DrLJvH8jIqedFd0XqPmfpRznOTWdz
JrC2nuveNYSGMd4QpIy6B3yED4e+ppSzm1sDXNI9A5ZYxx07vgvk3c3pcPBMZneb
tWwIE+lshzh0oO8Ehy3Iyk0btu/o/Y4AWNWHU/dySdplfUqO3Q9uTxrGgVwmknrR
lrZ/Nj+p0OvbsF93O8jgFXbUV+2ii1U6nhn5y3tMw/ssx8S8sNDkUOn6Qr1dO1JH
rgKGR17uuZI/Hyqh0adVQwijp+GZCfwFC2uKwfrUOtlu3Fsk4cg4PFRxxEZNAwga
Ro5X+b7brDGRMz8F/R+ORc66CEbfInBFJ6eE+aWJs+rNOyW8TWe5Ve0KSD1Yvsmu
N0AxsrKa3kela5DXO1mLq7R4mv6qS5JMSub+FyZFtCfz7rU9fqlTAUgomIG4G/6w
a/dY8HSQ+qeY81MPZMlSzQTxYZxSzW76gix2MTguv4GnbTwqZwL5uHQufS2NWbOk
zHWm8MLCYzTEFQEcMfm7M2KgWyIv+BTkZa6nUI4cIyXl4PPoe+YqjI0R12UxCM24
IfDyCyCKRfKfx4R+gJWz
=7W8U
-----END PGP SIGNATURE-----

--YhFoJY/gx7awiIuK--
