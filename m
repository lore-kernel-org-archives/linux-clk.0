Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 21 Jul 2017 09:21:16 +0200
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
Subject: Re: [PATCH v2 05/10] mmc: sunxi: Support MMC DDR52 transfer mode
 with new timing mode
Message-ID: <20170721072116.bub4fxqq2zg6kj3t@flea>
References: <20170720034452.15920-1-wens@csie.org>
 <20170720034452.15920-6-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l5oxp2yqvksnbrtt"
In-Reply-To: <20170720034452.15920-6-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--l5oxp2yqvksnbrtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 11:44:47AM +0800, Chen-Yu Tsai wrote:
> The MMC controller can support DDR52 transfers under the new timing
> mode. According to the BSP kernel, the module clock has to be double
> the card clock, regardless of the bus width. The default timings in
> the hardware can be used.
>=20
> This also reworks the code setting the internal divider, getting rid
> of a extra conditional.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--l5oxp2yqvksnbrtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcatsAAoJEBx+YmzsjxAguAQP/0owG1JJY5X7ZD3YjLUKIm++
aVme4gnLzYBBspbvx5rPmnBIw9rfog0tfUcmDPCnD5FaEKkOefsAjwyzchMn0j0X
SMGuIVOHHOXYuNVFKvYVK3XIfEqRIRPaAXPHReruhFUXEN2vLbwd2Tt8PRxfbuRK
pyN3Cui9Ab2pIzrLOqXMV38dK62zwa8m9wiB+R/cQUU2aqY6++jjcKr7IWkTlxdY
3y6aFpkI0IWQ5gHloa1BTE05XIkcTsyOsfvcSEBqOQQmrThrIXc39d7QQajQjM1a
ZFzv+T/m75nwuDTtGY+2h+BfljKLTwgsWRMDVVTKcyQdX+gNgzQhjY7vylmBRTRz
/0vWXYDcSJW0k5FVfhJrPTs0h/tTJiy2ix36bp+rWTQHpkLyyyg7sUhp1Kd+tXlR
GJhvjZqMU0NAX3xEhYd70WgeYAj55Oy7U3pBpJaAHUzJUjc+gk8p3PE1rJ7e1MaC
laLD2a1GH4Aa15otjqNYVQS333CRACHHOKldgBal01QOznjuiIE8shcw82KZUKIA
TBTQTIoQYZYIfnhGW8cXKUTdwh6bE21WQQo1KQzMpThLlmEj1v+buJfNHu7W6oZF
FzGBFTd+o8MFCKen4r6ZG3DuSEpxy267xS5luFJoc5JmKWhPTOfLMWU/tPqUN+GH
qF2HlLParXwGTxvUrjRD
=0twz
-----END PGP SIGNATURE-----

--l5oxp2yqvksnbrtt--
