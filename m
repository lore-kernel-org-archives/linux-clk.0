Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 16 Feb 2017 18:56:50 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, stable@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bob Ham <rah@settrans.net>
Subject: Re: [PATCH] clk: sunxi-ng: sun6i: Fix enable bit offset for hdmi-ddc
 module clock
Message-ID: <20170216175650.kkwbmwa4yyk33ozp@lukather>
References: <20170214022332.13326-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="atbf2wmzen52r6sm"
In-Reply-To: <20170214022332.13326-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--atbf2wmzen52r6sm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 10:23:32AM +0800, Chen-Yu Tsai wrote:
> The enable bit offset for the hdmi-ddc module clock is wrong. It is
> pointing to the main hdmi module clock enable bit.
>=20
> Reported-by: Bob Ham <rah@settrans.net>
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Cc: stable@vger.kernel.org # 4.9.x-
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Queued as a fix for 4.11, thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--atbf2wmzen52r6sm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYpefiAAoJEBx+YmzsjxAgBCkP/0E2fz4KjZYWIBSD1L4YTnOB
Hcn1sQ6HlsV79do4cgAHQUNrmlKn08tm/L8GaLQBOVQNei9If2E0fBWQXJ8uXje0
5JbsFgh9eAoG321MqrPIQbqg2NrR94ftUEU9bCJevC9jYQqKroNpWPH1cxIGCsQo
N6Gh87lXvBjCZlrpO2OWW3ymBkT1BA2/1UXcMLVNcIXCowq3yRhhm2uGhnL9EHsi
gPitY7kbN1HehoZgaMox3JRVa45ew6fZxuMAOoYoWPLa2sVjpvCSyz5WgHPiUtXe
UBngW5RDmfca6Ud6ruo+W+tSjuGr6eRlDrdImuUHN/IEzH43U2tdWw6uo4EpFYhO
Z+Zbe3C9s2n02eb8A9jU0/LF/PA0FZ1Ls0JmfR47GCHNGWekWJf+kqGYIi8jv85w
yrdA/E4aAu5PQapjFVYusayu1ixygAXm5iJv9/RmaNbxUsULiSLen/j0YTBXeGPp
psjxktTzqvw1Wu17Rdc8OPBJ+JESGHcyrT3+v43BQkwM0K2IUCligPPx45lu/zIH
7xHfsADVgl4WqAOTP5A7BpqYFpgSjOzpdPyB/5jtpCg+E8tHmGcqaGthTvdM0bPh
Yk36OBeHiQv7g8nqIuHYsq4OE3s8gln4H5rdHlrbKRvBCR65o26YGMkS+V0rgbc3
os6Kx+V6tMXZte+kHT0n
=+1el
-----END PGP SIGNATURE-----

--atbf2wmzen52r6sm--
