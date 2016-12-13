Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 13 Dec 2016 16:44:26 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	Hans de Goede <hdegoede@redhat.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: sunxi-ng: fix PLL_CPUX adjusting on A33
Message-ID: <20161213154426.gnuohez6seeu7kso@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-2-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ojgty3q2jzipajqo"
In-Reply-To: <20161213152252.53749-2-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>


--ojgty3q2jzipajqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:22:47PM +0800, Icenowy Zheng wrote:
> When adjusting PLL_CPUX on A33, the PLL is temporarily driven too high,
> and the system hangs.
>=20
> Add a notifier to avoid this situation by temporarily switching to a
> known stable 24 MHz oscillator.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ojgty3q2jzipajqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUBdaAAoJEBx+YmzsjxAgmJsP/1HoxynJxrMQmGBDwOkekI9U
u6sB7LQY/tnb3AiwJF5FeFf0Ko1OK27iUxa3rZdYUFMX4xned0qjJZikfDATA9Y1
T/xG7UicAiZjGZ4xn5Nkwq5r5It2tA106oR/PQq2i04PI/jie+RTl26qvH/5TY03
Ou2bnRC8u334gxgv7zZ4XxLSexlxIajWwX4By9vZ3oBDc0dXldyJBQ+wPAbW8FRi
JFNMfUKxi8gpnQeAheH0I+IONQoqFAhG6WHw6LPsbIAZa3XJFjVcYI2wotEXZAy8
xR+dFg+3Ty15HfO26tGWGeZw0s1Z8BYgnciiblQifr7nPjvQVnNIc1R1IQxP6Lry
K1HHhZEbuJO1I/+11GA/z6sEKmAQ/xphYUbu3kig1Y4ellcXr5R+fJLJxRXrRaR8
csY2dfGjnBT6BUT/Vt3qDVo+RsXEOzhMKcgio/uHuh4C6l8iP6qW0R0tiJUvToqX
TwTJ4mrm/i27aoyYb/35Zib9T0eicQUQNrYEPGUg4M1NbAPC8omWQB9GHli29rV5
6sWQG+Drp4LWtQ9Rl13IPSfHPth5ZNN14nJnZ23PybXgJDLh6K6S6bJVImgqGCGN
2Fg438i0pO5Rv0oojasdIHNunNvcJym9bd5Xi3A3PPKMSCTNfnYfUfZTiW2Zlrnh
I/EbUg4AQOXoKAw3hu7i
=TL+T
-----END PGP SIGNATURE-----

--ojgty3q2jzipajqo--
