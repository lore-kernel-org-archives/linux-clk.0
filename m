Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jul 2016 09:27:55 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] clk: sunxi-ng: nkm: Add mux to support multiple
 parents
Message-ID: <20160727072755.GF6560@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-7-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
In-Reply-To: <1469516671-19377-7-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 03:04:28PM +0800, Chen-Yu Tsai wrote:
> The MIPI mode of the MIPI-PLL on A31 is an NKM-style PLL with 2
> selectable parents.
>=20
> Add mux support to the NKM clock.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmGJ7AAoJEBx+YmzsjxAg1c8P/3GVAkmofxpghWq+4a+PL+gQ
6YumrP5oYm9tRgbEtBfnv8ZjswxYPRgnFpqY1UpaEmuEezzoenjAffFuQbVNFRAf
qeGCxPP+Iaw8XhOKR9fMpGjmPUZpQlemv9RKDA1KaZnsOt9X/JzNL6d3cls1Nrtu
JvfXibLyj1uNt509kfDXunDV9zDLnDgPcy4aP/si7XcL3mwLIkWTeb1taGdvcjIU
jsFdbRPeehFiT1Zsd+o262HEo+kjwJ+opVoBaf+ltN32ATGejujcCPTZb7kGGxxw
9N44HJCs9Rwg/7r9R44pv7W43RrCuSvdbnSWpLNRho6gs18waE/b8a+u9GLs4Ggp
K8HnggUdCzhmIcbE7cJgGXmdsGfjJ20gKqkC/fiK8U7tiFKg0LmNRf7ifhSzcjwP
OP2Ly6S0Cb1psfQgAv/KejPB0hEoO6/Do4f0U40dDV7jrYQfW4BJkmynbPqu1/vr
yRtZXJFoeVJXT3Z+myDd8squliO+Udv5L3pvHnYZTicEj2R6X5r8UbLeW1nZ+JEy
/AnaMvMgl09vAo7gFUomRv1VMwFeXpK0SAmy9rCFCdSk9dSLRC2JEWMErHilJFzE
twMoW0Pi3zZRvH36E/9c/ibxEd+woyaKNGguYe09BYYvzLt5p7yAxDjg0ULgsblv
/6EGM164ds9fDz50SV4k
=3QFU
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
