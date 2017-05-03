Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 3 May 2017 22:28:07 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, stable@vger.kernel.org,
	Bob Ham <rah@settrans.net>, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: a31: Correct lcd1-ch1 clock register
 offset
Message-ID: <20170503202807.g33ssiyli5tw7iej@lukather>
References: <20170503031346.29174-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hliaqwgrr25avblh"
In-Reply-To: <20170503031346.29174-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--hliaqwgrr25avblh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 11:13:46AM +0800, Chen-Yu Tsai wrote:
> The register offset for the lcd1-ch1 clock was incorrectly pointing to
> the lcd0-ch1 clock. This resulted in the lcd0-ch1 clock being disabled
> when the clk core disables unused clocks. This then stops the simplefb
> HDMI output path.
>=20
> Reported-by: Bob Ham <rah@settrans.net>
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Cc: stable@vger.kernel.org # 4.9.x-
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hliaqwgrr25avblh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCj1SAAoJEBx+YmzsjxAgFgkQALrz+orjZ6jqasxdbbWuC8CY
snwSdx8rWFASZggrEzktshBM3YCvvoePxpUN/KOyVZ/mJ5+ffpXVFPzUoXyAhjn2
Akmz/tW/7ulijkSx7sUkxGp0Imxd1cT+YXgZNVKt5Xp7u1OS/9uRt8cRUEuTEypt
0nUil5FUpNcvqaKxIfNQnZMEc/GauiDtyc/19rP5sz6m67R8iXAuM0AQ3PwTLzLT
NlP9lfvm8AD3zFbX8Z7lhpyIq0cDRoAkUvU3+pKwMl3g57d7ZNdumV2M/ZgPDWkR
2FpFcB8w0FnTne0Sxv8QDUaEY1Xx7XeTA+rLjXGtmp6Q0wcQ0o5OIwuujHzP2k6N
p2cW/1E0sIXAQFacFUvqP0t1Bv7VDVPCuSMyLyfDojffODRip8k5NFg5B4BIc4eg
diR8GeL2bB6fmZvXO4iqBmX8GvMXjpqaMlul7w7FKGQUtBMQW+K8IrtgdwcW4BIZ
ochDmOXKHOikTxFRAPeJYxZ3ppfSUmol7MFJkg2vE3MFHLY0oJZ/1CzTdl3ai/nf
c3jqjQ6q4WSGa7eJTizzJp1jPkmJ2agMw+9XXgVdj7rAxRh7PVo5n+Ll76F4c+Sx
weBQnHfOEL5JeSipsheF873cV9Fyj5UEzpxf5W5F1Z5DzlC7RhbvKVrBYxc37Xlk
Yz8doR3bmiR3yVy2y5H8
=j7cs
-----END PGP SIGNATURE-----

--hliaqwgrr25avblh--
