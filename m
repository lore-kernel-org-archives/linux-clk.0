Return-Path: <rah@settrans.net>
Message-ID: <1487110855.7145.46.camel@settrans.net>
Subject: Re: [PATCH] clk: sunxi-ng: sun6i: Fix enable bit offset for
 hdmi-ddc module clock
From: Bob Ham <rah@settrans.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
	stable@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Feb 2017 22:20:55 +0000
In-Reply-To: <20170214022332.13326-1-wens@csie.org>
References: <20170214022332.13326-1-wens@csie.org>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-yoPiYm75KzXdIUw03yNz"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-yoPiYm75KzXdIUw03yNz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-02-14 at 10:23 +0800, Chen-Yu Tsai wrote:
> The enable bit offset for the hdmi-ddc module clock is wrong. It is
> pointing to the main hdmi module clock enable bit.
>=20
> Reported-by: Bob Ham <rah@settrans.net>
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Cc: stable@vger.kernel.org # 4.9.x-
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>=20
> Hi Bob,
>=20
> Can you try this patch and see if it fixes your HDMI issue?
> With the kernel running without "clk_ignore_unused" that is.

Hi Chen-Yu,

Unfortunately, that doesn't fix it; I get the same behaviour as without
clk_ignore_unused.

Thanks though,

Bob


--=-yoPiYm75KzXdIUw03yNz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlijgtMACgkQ7whsMRnFexR0vACgqvMJWPM8Kk7HuQKhuN+DtWRv
OoEAoLzHwWuWyBVghUaXty4GYIKmjIEQ
=ezHP
-----END PGP SIGNATURE-----

--=-yoPiYm75KzXdIUw03yNz--
