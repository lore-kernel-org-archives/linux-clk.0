Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 3 Mar 2017 08:12:55 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Priit Laes <plaes@plaes.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: sun5i: Fix mux width for csi clock
Message-ID: <20170303071255.i4lle7thsyhcpj3x@lukather>
References: <20170302205527.23007-1-plaes@plaes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5uu6ko3jyevsujmj"
In-Reply-To: <20170302205527.23007-1-plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>


--5uu6ko3jyevsujmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 10:55:27PM +0200, Priit Laes wrote:
> Mux for CSI clock is 3 bits, not 2.
>=20
> Signed-off-by: Priit Laes <plaes@plaes.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5uu6ko3jyevsujmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuRd3AAoJEBx+YmzsjxAgbusQAIpkT9WBdG0h2TjPye8aGKHt
1aDc8LozeWKP2a4od0RysywsP9ayOb+yEFB/TNjT9jPk8570c1nsxPy9KAWLbD9v
FynykZf/q9OA5WwJJyt67ZI7fxnQHfvfciCM4E4gnti8CcWrK+my8DM4RyUd0owh
0vpjI2686PwBiCABFA9jlt/F1myaGPCMQZS5riLke4PCpXlpQl5u4vVJE0cY/Dn/
BmxLjUuCIHlZRMZOpl9wZoxE1qYesClVjZWd4raKZ/PLmOPwAmlfYEx+Cl5yT4On
QSAPzfL0i/DhenGipUa/E/Ls0iSZ7R5QPXSus1yO0cbqUPwrN/ZNULN8XEsVzUff
Sp1U5TnJiumA94e4AdMvix1n/GyCln3IG84XJVMQXlFxSzwtAYC7idf5pru1FQ20
jgoAKO3mnNKeTk/o26qLYi5hD7IHKOfXxsBz9KhogwOo2ZGtBGax+1HG3OBlyKYs
18xh2EJVj0gMuhBLd0fnufvkIeHMJEWQCcupflFT/xXhz6XPIaDu07EKprGRhbX5
0U1lZHnejg7oySy2KlD9rX6cA40TAOYNo/pYVyZjuVeRI9EgRoz2fZHdnQ+tt+KH
tRm5byVkARRNHPJ7vBFbvBJzSd3XCEcK+CIt31v9tsTHy1mQW9sZuvimfU4CaXM3
jsnoiE5mZt15nLoQe2vs
=gW7v
-----END PGP SIGNATURE-----

--5uu6ko3jyevsujmj--
