Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 26 Jan 2017 11:15:29 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 10/11] arm64: dts: allwinner: Remove no longer used
 pinctrl/sun4i-a10.h header
Message-ID: <20170126101529.j3fuku4hyy3pbge3@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-11-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6cimiexpexa5m2q4"
In-Reply-To: <20170124023230.3990-11-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--6cimiexpexa5m2q4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 10:32:29AM +0800, Chen-Yu Tsai wrote:
> All dts files for the sunxi platform have been switched to the generic
> pinconf bindings. As a result, the sunxi specific pinctrl macros are
> no longer used.
>=20
> Remove the #include entry with the following command:
>=20
>     sed -i -e '/pinctrl\/sun4i-a10.h/D' \
> 	arch/arm64/boot/dts/allwinner/*.dts?
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!

Maybe we should also remove the header entirely?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6cimiexpexa5m2q4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYicxBAAoJEBx+YmzsjxAg/0wP/jFWpobbF6UDUxzv8x32eMDk
R6veMEe1yFJ/AaArFLAiIFVgP52QPB5JR4jOLBh8eLL9B3JDN8g4EkmSJQ6Cc3AT
xv5dUPXelEIbq17ij79p7Y74lCOTMINd0ni1DH0hr+HLBvRsW2Ls05nKVgQsTL9n
LgtVrihsxAKtykrBEpLGKuIXrm9GfN4svHiCukLEOFcnzsc2M4jZ8vPl1Dm096XR
x7fewDVKSrH6b14Xm9tuQ634uX9Brq20lytbS06u6e5ta+ju5lP4DLh00rUmfnB2
yKp3JsJU+XjZuCSSSddO4M6QLsO18HKTAtLwQtNjvbAfEwNiMSpM0JlBYem0b9cQ
zEmWOOWGGAwfH4nE9JaiLecJzattxSY7Yms+oPgKRV9UHGul5kPhO9E+NOg0crVn
itsxZ8rF9qDI1b1eVn+K2RYIZMeQhxWxmsPaXa4ENmYQrfTM4R5mUIxlcgoHbd4W
/DoSUkWFgl4lwKy+kM/QvBVNryrXvl+EkaogBkAdf9lUsLSb0JCo0BgsgjC1Qfp3
Zo4GneY4kS2Gd2uuvQGwL+1pwOsaytGxP84qRJv6b3y7sBnUcqxO4f2zk47KRT/A
M5gYMyqDixqZ3izer/i2pqGjc97he4nd9tldgkDdDeN/wFpUr/Bz84jCqblBm6C0
AoR2BmyCf1IfwWWoO3PH
=A6P1
-----END PGP SIGNATURE-----

--6cimiexpexa5m2q4--
