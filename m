Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 25 Jan 2016 10:26:15 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi: usb: Sort clk providers by chip family and
 name
Message-ID: <20160125092615.GJ7908@lukather>
References: <1453701300-28241-1-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRtZRu2mMGBZ6YQ7"
In-Reply-To: <1453701300-28241-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--wRtZRu2mMGBZ6YQ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 01:55:00PM +0800, Chen-Yu Tsai wrote:
> The latest addition of H3 USB clocks placed them at the bottom. Move it
> before A80 (sun9i), so they are sorted by SoC family then name.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wRtZRu2mMGBZ6YQ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWpeo3AAoJEBx+YmzsjxAgNAoP/0QVEVeVz4GV3Jh3d5hPseDl
zxZpdFTEhluXn1GCTRsDwEPuZ0w+EPYSoZVrrgd2cWzXB2mZBWgwZylpbzCt5YOY
WZWglD/KDs/gd2YbhbOc4OPHbD++QvrWN8JziN3cjHmrumgM/VcbXW+/n+le7Kw+
gGPRZg1Kv7OWmLsXrFB5QjAhFSzxrlgyTd26wnWicxl/R3F4VzlTVCoirfui2q1W
WI9iWfP0kodaWuaAfJD+EYO6WHancoRC9/sUF31JRjzqe6Uj1VXz2hMhWfbSN7Kk
H5FfVdPSmEpwD9NAUPM4/WqA2Qfq6fscz8ZmqEBsLk0T0ZttbH0X7zjvUF6O5XEz
OrSa/3dy/oIwfFNqHGx6tZVlFzKojBrqxVUMkrB76xbsrEwp0LSeb9sy8Blkh8Ge
iSFCCLij+LNvOOoayE0sgaben8GT0sKfAoYcNPyyeWEvY5z5v+/bOnJ/LfKU3pav
CaxC4z28ccc2k2iTSGVuQfGfQP2XRsxcjNT326o0E1F8VRGTCDaB8UHcL91x1Xb9
N0xb9OcrJMBAmsqWJgV8c9FoN8ZBYIlET3RkPyAL/QNcd6OmdGhzD4Q/ndJ3Teyl
admbWtP2cY58SNQzSPm3Ore5mmT+SXn5C7ALF9HQX4YJGirQZtJj6evJCQx4aEJ1
Q9l82n9jvncm13eXvcQt
=/abF
-----END PGP SIGNATURE-----

--wRtZRu2mMGBZ6YQ7--
