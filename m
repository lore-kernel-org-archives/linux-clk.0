Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 13 Oct 2017 09:28:03 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/9] clk: sunxi-ng: Use sigma-delta modulation for audio
 PLL
Message-ID: <20171013072803.y6nqwpgry2eqxgop@flea.lan>
References: <20171012083705.24409-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cv3tunu5e2fp7xec"
In-Reply-To: <20171012083705.24409-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--cv3tunu5e2fp7xec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 08:36:56AM +0000, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This series adds support for fractional-N synthesis using sigma-delta
> modulation in the audio PLL to get the exact required clock rate.
> This fixes the speed and pitch change when audio is played back on
> sunxi platforms, due to the slightly inaccurate audio clock.
>=20
> I've done this for all platforms I can test at the moment. A83T is left
> out for now as the the clock unit's design is slightly different. I
> was unable to work on the A33, as my board is very unstable, plus A33
> audio playback seems to be broken at the moment. There might be some
> issue with the DAPM routes.

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cv3tunu5e2fp7xec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ4GsDAAoJEBx+YmzsjxAghzYP/2AWB85SfeAzzYSjxLdPt/+j
LJ4k6ZpOH6Bu8APDZfgn7PrUSvKQ1qMfQuVKMIEEq0ukAWpL2q8sSy/lZ8tRAE6u
GEcziv0mZdglZpne8oJMUCIvr8rEvfYPvWOVlDG0fqf7sUZY7Z3aNcTVTOJVzcjW
vOjdKNNyeypvwxRO0QNrkdLeyfx48Iiwf4yS/rmQsS2nQxZVKugBjPPaQRlacBpS
r+qU3QupPYUx8yw1W+bLW6EGmX89Eh4wvZVrjI7/l9cUnpjr8i6TgbC7UYvLh/2p
VHrbxcKxPfqfbbFHxZdffq+eY3P/U6ATDk1RunE1gi4nHMP2QnQt+eMtdQc9JvQx
U4BdgXdtTJ1mxJHMSJb1gsi0ao44lqqAUVybnrmmWDkWQ8iD3qnsMfAyYetHjtcj
IaD0H35UrGLroSWWQ6/otyrcEsrvbFxGnCx8o1EXZsZg5MyuABY31xAyU4wXiIYy
lxXx2B0y+NQ0YorpKJQEYC08P6xa7QpWpbNFYS9FR0NbiqutaTN1WE+1plEffycE
Jm2ZF8aP58pYZEh/LJoJgvibtO1iTYyUTcvqrSoGGrCcAQTjuff7RxO/dGFLKXsz
G/GoKnk4PtQGLZvLlJcc4k7bN7xjodqYATvkGnHCDD36XHhW/2R08SMm++BPkvif
9zlsO6f9Dg1hjiiYIIp7
=B9qS
-----END PGP SIGNATURE-----

--cv3tunu5e2fp7xec--
