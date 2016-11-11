Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 11 Nov 2016 21:48:20 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for
 audio module clocks
Message-ID: <20161111204820.sowe7jj7i3lsltuf@lukather>
References: <20161111100558.14629-1-wens@csie.org>
 <20161111100558.14629-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="chzqfikgkafzatlx"
In-Reply-To: <20161111100558.14629-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--chzqfikgkafzatlx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2016 at 06:05:58PM +0800, Chen-Yu Tsai wrote:
> The audio module clocks are supposed to be set according to the sample
> rate of the audio stream. The audio PLL provides the clock signal for
> thees module clocks, and only it is freely tunable.
>=20
> Set CLK_SET_RATE_PARENT for the audio module clocks so their users can
> properly tune the clock rate.
>=20
> Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Fixed the typo and applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--chzqfikgkafzatlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYJi6KAAoJEBx+YmzsjxAgO0gP/i36qlnozlgbDz8rAUUzj/QE
pJalLoB+S8WlYXNYlWj9158MIGTKq89srzmEggiJI7gK2aqmu1Us/UGGqv3vXc2h
+avdyC8FhkYI7/4Sej41lmDXW2T75ixnDcH5Cw3LQr22LpNDcAW1P1nqVD5nIQpn
k4PJO9Wbe3GojLTsADa1iGfSekUNeY3VboCbykUckLa6wEJFjMmoBNsnXiIHVf1Q
3X/jVs5Ac/viLGWn8bzRWqdQ/sfvq3/mXQnmb/DBdVpEf1+W3HGwhc2GFWzYv6ZI
Nj7jcqvX4rMwAOd6urROrgXXt3VnAM95YFSW6leV7d1v+Zs5pAPPCR5nX85z77BZ
RIx1yOtm3EoBrElLSfMRQTqYNOyiTntOzgWvEG9ssBflaviJuxQze+sHwYj0n7Y8
8cSbF/Mum9HAUGvga9/TpvZ0LnvqiDcUPPm/SO11xiwYpzy26as92yGLSG6ZDPJy
CLHR2S7D7o/L6OHEAIhZndET9iVmVWjeA3/rzOpeIeI2wWiyqLjC7DWDqa8n3cpJ
tjRgdLbV9MSLxjyoQx17DCJBi3O4eAF1JK4Ec5bT9SeNU+I3g28t20u20xQ2WMTI
LrUdQeixAe0VTTIvLea19t346AcW3NzmkIufQ6JeYwPhqbJliwU6oKyDDZR8oLLr
y3l2IHR5aDgSL7/sTTwS
=cfJ8
-----END PGP SIGNATURE-----

--chzqfikgkafzatlx--
