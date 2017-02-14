Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 14 Feb 2017 10:34:38 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: sunxi-ng: mp: Adjust parent rate for
 pre-dividers
Message-ID: <20170214093438.4v6ykhqrstnkvzl6@lukather>
References: <20170214033526.16977-1-wens@csie.org>
 <20170214033526.16977-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j4nzvk2jz6annz23"
In-Reply-To: <20170214033526.16977-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--j4nzvk2jz6annz23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 11:35:22AM +0800, Chen-Yu Tsai wrote:
> The MP style clocks support an mux with pre-dividers. While the driver
> correctly accounted for them in the .determine_rate callback, it did
> not in the .recalc_rate and .set_rate callbacks.
>=20
> This means when calculating the factors in the .set_rate callback, they
> would be off by a factor of the active pre-divider. Same goes for
> reading back the clock rate after it is set.
>=20
> Fixes: 2ab836db5097 ("clk: sunxi-ng: Add M-P factor clock support")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>=20
> Maybe we want to Cc stable for this one?

I've applied it and added the Cc.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--j4nzvk2jz6annz23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYos8qAAoJEBx+YmzsjxAgW8MP/1vZ4FqDgXfzqV8MDBnmJCyf
3t/Dz8Js5o8Fr2KRZ0ax+tLnGh5Fsa2sIPFWDR7+oBUqBo0srRQQ6n5ZIpq+2aWp
kkLzOXV0pfX1ZhsnRD2alP0Tyl+JXuO8NbqKMOUji7xgYBm0PhAHbACx+afmCMsF
dbvE2t4SMToFpuq7Zl77DB4OHL9hqmZPR7gWDGe5K8I1NoiMorRIUg4wNJgbZudu
++U5YNufc0ZUgz1NWo7NpZnHaDTts9degB2nCo9UPehNbQKxawV1Iu9al/SbQ+ky
5PjoOlQvCPtFAUQgLYuB7g/on1BfN+RcxJtKCCnuGo1i8e32XSSuASTU4g9ITaiu
oKZFVQKl5RKqtrwfwM6kwh5aVsDrFirwesMx1FH35/vYtu4LSzagO+mES2MWOXJE
AJM5N4cUTnUBTb4TINq0davFPS6uf6Smy2atEa+9oDAskJ4Z4TtYrhzlkalO71J3
1A/WOis4y7WpVbRyz01VeXN9PnnohCzakzXIN08rFzTeL+D7AgmwvddBhD0wemUL
KaYlmzgqYxpRL2S4AHGrFIBMarJ3jCjTGNOTL0HnH/l5jcLGVZX1nKD15xZVcCZh
YQYxKZ92fnu+ew6IPBi3Due4w+ZeBf7rnG6Sd84Y9HGlsK3feWG73c9G6c5ttjFG
iMgoTF16tl7NOor4pO4Z
=wN9d
-----END PGP SIGNATURE-----

--j4nzvk2jz6annz23--
