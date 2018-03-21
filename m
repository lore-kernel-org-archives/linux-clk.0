Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 21 Mar 2018 12:28:28 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: sunxi-ng: add missing hdmi-slow clock for H6 CCU
Message-ID: <20180321112828.6i3qdbes3no5gypd@flea>
References: <20180321024625.18516-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6lie35ayrltfz7mp"
In-Reply-To: <20180321024625.18516-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--6lie35ayrltfz7mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2018 at 10:46:25AM +0800, Icenowy Zheng wrote:
> The Allwinner H6 CCU has a "HDMI Slow Clock", which is currently missing
> in the ccu-sun50i-h6 driver.
>=20
> Add this missing clock to the driver.
>=20
> Fixes: 542353ea ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--6lie35ayrltfz7mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqyQdsACgkQ0rTAlCFN
r3QwFA//ba27IeqfOdQHt2UmZ89H+cWAFeYvXZpZLQ17kzXn6fUU3gVJynyCbBoc
2sXo2CARtHyQCfbmtbyFnKNoe3sIzSnMcszgc0r/1anWMUevkvHPJK+R7IgykDre
YdwZE3OZVop+qTJIx1XBD5odMUr1E/GvZfECYNLpjXRJOROS4asRmibpe5vg79sP
djBMpH+B0PvE8/VQL5QnizJ9WSsVVd6lsMZNOv3LlE9BvatTuKzTou64FaPoX5qN
P5WADP5F7xM+YgqbNBasA72+acHtWYPn5Vyd9n1DBv3/tLqtPftZLKpD56l3Jwqz
Rajv4JOy4F0/V/z2NecNiuWZnJZo9ISiWgaTOE7EY/gVxpC9wVIsZJiBysOZfhWz
6aAF84vwwqzLHMOSZuHxwsC9dyBlb5PgV3LJ7M0pDnfcGJRoiF+WYq6+DrBrqm3c
coajlMvOEvLFqDq57MjWzwytKb2HNMKOYcxgISaMLy5wLuw0uk66Mt/PPwzVlpqa
fUDRsEEfyvzT8X73XAgbrtGatEjbEFjvl2LAEs/d8BwI0EPmyFN5S+M9MWfTIryT
CqT7HMFP4ePO0xoMZ6MG4nZEIHrPkK1T7y0lFGKt11NAmqhUAtc6hMXVYW4MYMCK
X/8+Sl0oKxBt26Z60cW9veVwavBB8R27usXFvuxc/l8RBZa5Sos=
=V0BF
-----END PGP SIGNATURE-----

--6lie35ayrltfz7mp--
