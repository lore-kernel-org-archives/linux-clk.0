Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 11:06:51 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 01/11] ARM: dts: sun8i: a83t: Switch to CCU device tree
 binding macros
Message-ID: <20170717090651.olohxjjzte4whvvz@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-2-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rk2jjb2pk3dt7sqe"
In-Reply-To: <20170714064302.20383-2-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--rk2jjb2pk3dt7sqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 02:42:52PM +0800, Chen-Yu Tsai wrote:
> Now that the CCU device tree binding headers have been merged, we can
> use the properly named macros in the device tree, instead of raw
> numbers.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>=20
> This patch is included as it is a pre-requisite to the other device
> tree changes in this series. It is however independent, and should
> be applied as a fix for 4.13-rc, not for -next, and preferably sooner
> than later.

Applied as a fix for 4.13, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rk2jjb2pk3dt7sqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbH4rAAoJEBx+YmzsjxAgU+gQAJS9/Mcz7azKmhGieFbEKtl9
K7V3P+5nFlEMpbRDguGTLQ4SVDfwbhKI/LSqkZ+Gb0u2wFayfqFMgVh8wwGSPnb8
0vfLS89Y6SWxOsZ8+XU+EHqToM0ZICpNzAnVzw8rVaZlPcR+NB4/L4UDX7vKFp6t
/vrAVTyzvCM4OzrZxSchF6J7ah+91dewf9LKw99A+T1wacD4T6YnVJ7am515WyzN
xv2WEHi6f54fxhNwEse03If6e5j2IVhg+n39GYCWE9kcGiPCt5FZtSWEYrLSsyuY
zUpxOPy7V5QmagDX26NwH6K1Th631HLCPkoaEVeaSCdzC5uhxk4y1i00Vvzc+tFX
GHyGSgDCsgwpYsZyZ67E51qrtScD1QIeEOW0IZKEaGb8zNIxf3kfxXhmjoe/lUSM
97y8PdUi/2SVNndhTlM2nP9EaEaFkO+2N/qR57nzsShsmK89qkTgiDAr0rYp9I01
XnqVfRjvWwbtX+9nE8b58tHblfhADD/YY7dhcciPKNZbUHWGfGUxbY/AgHY5C827
6LLLBIL3L1RR5woxdXwPJDKmVW47+EJ3ZxN+13ILOb+seDac7PSCM7GwV6rb4+O5
EClhca7TaWuCkUH+ez1bsclnrvbMegKVDWfqOy68h255/oWxZce0JnY1/b6qTUyW
DTr5C/LjoH4HyjYZ9poH
=M6an
-----END PGP SIGNATURE-----

--rk2jjb2pk3dt7sqe--
