Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 26 Mar 2017 15:11:38 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 2/3] clk: sunxi-ng: Fix round_rate/set_rate multiplier
 minimum mismatch
Message-ID: <20170326131138.l4mqz7dwueadnkxj@lukather>
References: <20170324083307.18338-1-wens@csie.org>
 <20170324083307.18338-3-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z7tozcuhc5tmtlns"
In-Reply-To: <20170324083307.18338-3-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--z7tozcuhc5tmtlns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2017 at 04:33:06PM +0800, Chen-Yu Tsai wrote:
> In commit 2beaa601c849 ("clk: sunxi-ng: Implement minimum for
> multipliers"), the multiplier minimums in the set_rate callback
> for NM and NKMP style clocks were not updated.
>=20
> This patch fixes them to match their round_rate callbacks.
>=20
> Fixes: 2beaa601c849 ("clk: sunxi-ng: Implement minimum for multipliers")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--z7tozcuhc5tmtlns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY174KAAoJEBx+YmzsjxAgDxEP/1r6z3ZuNkA/49SFSoTq/9aW
s2cEGgtR0vukKqNBYs/ER0ZaHWGhNExIwqXsy/YhN79hABMXEhN2Hx+VQWJqwCOu
pC4wB/ItMkQHMhYbvqRK6uKCj4ObwhWmf66xriDoL7kgIKHoLzcx4AbUjDx5MG1L
XT9sqs0GeCpFRJ5Dc415XxLGLKOerOOHZzsJ0oDJ9LRMSApmSQIkVD0UZ86ibuGY
tP1vhTx2vUoH5IY2rmobWflyxSGqFQjhKiQ/dUrsVYP1hf9tjD3qd+9RYU6+Eov6
K5/XdI1suFqZ+URn9H0/VwntCxOcqkE2dG6vltwe/vc20657RwspHuN0T9UABrlm
9nv6MiOPJgZ1CP9UBwkcz4Pv49RL8u/sD9yJYn8qMlsf5WhbiwJUzq13u6jbrWDj
U+n7exgW0OETI4Swpkvcro29lAA5oNwQUbEG8ABw5tWtWfk1lEsX8uLYZNSvCNDb
7FPhxxIowIgxfXVw+FuEO1nPHj8CLNtSDY+Z+E3n2WjWSfgzcE7ClqMGH+wztF7y
vcU6iwVdiewND1gM68xL5pzJ01kSbtrloPzkOd8UVg89XHJZuddpo3/EWeMu3CEz
hsSgqG/RCdbam3FYwtUkTwiGPcr8fiXrsRYtBjJGfly+h6m7d1xbMwNs8K5WoJCp
YlwlJRdFQFiZPAAAkDDk
=l+vh
-----END PGP SIGNATURE-----

--z7tozcuhc5tmtlns--
