Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 21 Nov 2016 14:06:29 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: sun6i-a31: Enable PLL-MIPI LDOs when
 ungating it
Message-ID: <20161121130629.2qp6tvdd5slvl5m6@lukather>
References: <20161118071557.30195-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cvxnhaajgw6ylfu7"
In-Reply-To: <20161118071557.30195-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--cvxnhaajgw6ylfu7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 03:15:57PM +0800, Chen-Yu Tsai wrote:
> The PLL-MIPI clock is somewhat special as it has its own LDOs which
> need to be turned on for this PLL to actually work and output a clock
> signal.
>=20
> Add the 2 LDO enable bits to the gate bits. This fixes issues with
> the TCON not sending vblank interrupts when the tcon and dot clock are
> indirectly clocked from the PLL-MIPI clock.
>=20
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cvxnhaajgw6ylfu7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYMvFUAAoJEBx+YmzsjxAgeJcP/A+HLzT2tyTkNB/j109dFrYR
B1NVaKOa68gTctfvkkV8fw/c1ZH/lyUIv54sYUz8KDO8R+bSRiCtc8+0SODAg5eN
gltxrSSQ1ewYy8SEPLUtAvJqxxSFAMxwl3YDpuXQuZKX+VGe0AKSDS3eubh8Q+t8
VBIxinJIShtDRQbW70/Ybh9dj/NMK5dC/gCwRp31rc/t3xKJz2L9q88Bkz/eGY6Y
heJU2NLXXfgJ5rGZg56HeRSRQWGQ5sKn14fdoIyihsr5SfCEDP/n/0F11sM3xvZZ
ewRFAzRJKTneB6/90Y4RqQDhFpPDOCOaoz5vykTAfG6CvRNdekbsM+ZIomFxS1qV
zARtx4RQE6xMXP6Zd1372q1dQL1ietgLv+7Ty26p4Qxi+uBhGUTXntdOKXwwXTyn
Oc8P8y49zoRlr74xSiTGvMKnFqHLD+Mvyl7/FSzKGML1CkCOoh4gsfRk18tCUDEd
kubBCAWh0UpjOAKTq3qCLC+hRqSvS2PYsnbfbaulFCy9xfkeCvmGxF0AvyogpyDQ
hT7FlYaYThu9L8SIu01jluOtCcSKVac+0pk98hbpNuEO8HhwMjmW8NlEWgkGA96U
PG+2Ig9DaRX+VS0cgHSfPx0997yVOgftVYu1KrNsncj1/MxYv2VBTBJQsekQ4L7+
4aQ8U7dNT2MRlNP/vNYw
=xGpc
-----END PGP SIGNATURE-----

--cvxnhaajgw6ylfu7--
