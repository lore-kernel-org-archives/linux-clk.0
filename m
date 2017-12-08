Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 8 Dec 2017 10:08:53 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/3] clk: sunxi-ng: sun8i: a83t: Use sigma-delta
 modulation for audio PLL
Message-ID: <20171208090853.cnn52xqrpbihmpsq@flea.lan>
References: <20171208083512.24080-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nazpecrw7tte7nfl"
In-Reply-To: <20171208083512.24080-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--nazpecrw7tte7nfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2017 at 04:35:09PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> This series follows previous improvements for the other Allwinner SoCs to
> improve audio quality, in particular the speed and pitch of audio playbac=
k.
> The audio PLLs in Allwinner SoCs cannot produce the correct frequency to
> match the audio sample rate families through integer factors. As such
> the audio is either too fast or too flow.
>=20
> This is dealt with by using sigma-delta modulation, a form of fractional-N
> synthesis, on the divider. The parameters used are copied from the BSP
> kernel.
>=20
> As these parameters assume that one of the untracked dividers is set to
> 2, we first add a fixed /2 post divider to the PLL, and force the
> untracked divider to /2. Then we introduce the sigma-delta modulation
> parameters.
>=20
> This has been tested with SPDIF playback on the Cubietruck Plus, and an
> external PCM5122 DAC from a PiFi DAC 2.0+, connected via I2S to the
> Banana Pi M3. The I2C and I2S support used in this latter test will be
> sent as a separate series later.

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nazpecrw7tte7nfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloqVqIACgkQ0rTAlCFN
r3TGYA/9EMR2C950B+0QbwAx8wp+dlkLK7HU+lST5TMHg2kJsSuHO5HXRe/1uDEe
7iM0E7DczGGeDi+g0ghE7klmXAvQvWRceGhn7wOAKfnqV1iUNoQtnSnsk1JuhBBc
ipVbzn9LYKFauReJ6qgonbphfmV4+UMLVxX5Hxft5xXN9BOlH4MwnEUtqjgLQ3ml
vEM6KksSjQwZTOh4DDzLZOW3yu3wWclxZLz5OuvLMiNxMnxi2cK7dNVt/eiMXTk4
FHIvaeSduOBPf/upwY4K0FAbqwIQpnwHt6fwD1wyaxyU53+wgy8MZif/AKpD0qzB
AFQ4jbxV3fADSi9u1nE2eUkGBPhKD47f3RSr7R2waaqYWoc2sTeDHARKIsf6UoiH
cVc892kmbnawpjnzbHqcqR4G91GXGsOjORTobICaH4hd3OqY/9wT4AWr0X42dy0s
gh7GtliaD5c8f6aUuuPVgXkAGCAndAE6sMR1UzYVx0R1jlzI6OdFCSe/BWLR5Snc
ShZiXHtkRzWzR4ifcj4eoCXCTeWPFWRtDqkvr7b/HrvfVcgrZ10VBvnFm2Vygjky
wlFtEYRAYwFy1lYs7p5/DrOYRfYMq5uBKV//Vx63niA57pQo9KMUz1cl+DpXDBxD
203BZSqFGVj/onv6QNj8y8tGPx/jVGisYQPmA66/elyFeQcOyVI=
=TskE
-----END PGP SIGNATURE-----

--nazpecrw7tte7nfl--
