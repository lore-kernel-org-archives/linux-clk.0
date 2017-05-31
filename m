Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 31 May 2017 21:58:27 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 0/6] clk: sunxi-ng: Add support for A83T's PRCM
Message-ID: <20170531195827.kcbkwf5k2mh4q4re@flea.home>
References: <20170531075824.657-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qkey6pgizbckwfak"
In-Reply-To: <20170531075824.657-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--qkey6pgizbckwfak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 31, 2017 at 03:58:18PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is the remaining parts of my A83T PRCM support series, along with
> changes requested by Maxime.
>=20
> Patch 1 updates the device tree bindings for the PRCM, adding pll-periph
> to the list of required clocks
>=20
> Patch 2 adds a device node for the PRCM on the A83T SoC, updated from v1
> to include the pll-periph clock.
>=20
> Patch 3 exports the PLL_PERIPH0 clock from the CCU on the H3/H5, for
> consumption by the PRCM.
>=20
> Patch 4 adds the pll-periph clock to the PRCM device node on the H3/H5.
>=20
> Patch 5 / 6 are the same as 3 / 4, but for the A64.

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qkey6pgizbckwfak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZLyBjAAoJEBx+YmzsjxAgKG4P/iVzjBTJ1EiWJFghrcrAKNiZ
XRE5O5KRh8wrarfw2FXAON+wKXF0pAUnqv4s4rqaflWnEp+O+xhMm2FWMi18dZSX
tzP7rXT14ESC2IySvlv9n8yhg27JpsptwXE+VS37xTMRGcVAN7Hx/ak8WhyCdHoh
N3p2UDlguXmaDiPNtdtgv0dpPZTy1T4M3euhBZMy2Oz1W4tE3qevGFsVAomrsK/s
fA7T/3zULGh0enm9POeLQBYKZj/IuqImUReCuzDXNWOR+1cGTOKxvRT0HhRpqK8g
ZUIafnW/ZipFKx2D9mY/8WxyfLC+BNk3SaWxzUjMGBchuUc4koaG6TIJ9nfhmQIm
Pi8hWwtVknRtY/UnEuqBKnjVBy91rapTuDhcNRT061CoYr2nApwlN5DBa7quKj3W
LqvakT6NRRgPDPjXcBF84RLRDkC7mBFV1Buas+01s7EMIXLjBvfHqWtad3siA8dA
n2CRid5CyHQ5hWWjNSmz0hAm/3t/2pwBKE8f/smZwPQXmnPCqy5l5z82n0yuk2f9
z8QDquTAQb9hUr8Ezkb5vdLHmUCPhm2bYPE99eP8fG1g086IKB0gIRQS1piU9GyG
GG8IpYtyUciuMf9ZDgibpmrzjgid6qtbSuGLgGAiuDEtrr9VKECAPtZHPkUi9OuS
82o4YgTRuMAYJ53aq+1k
=jW0a
-----END PGP SIGNATURE-----

--qkey6pgizbckwfak--
