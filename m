Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 26 Jan 2017 11:21:45 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 09/11] ARM: dts: sunxi: Remove no longer used
 pinctrl/sun4i-a10.h header
Message-ID: <20170126102145.35dfx6q6lpxdt72c@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-10-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lb7h7x2njnhqcnef"
In-Reply-To: <20170124023230.3990-10-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--lb7h7x2njnhqcnef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 10:32:28AM +0800, Chen-Yu Tsai wrote:
> All dts files for the sunxi platform have been switched to the generic
> pinconf bindings. As a result, the sunxi specific pinctrl macros are
> no longer used.
>=20
> Remove the #include entry with the following command:
>=20
>     sed -i -e '/pinctrl\/sun4i-a10.h/D' arch/arm/boot/dts/sun?i*.*
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lb7h7x2njnhqcnef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYic20AAoJEBx+YmzsjxAgHc8P/R9eV0g605bhQsL2RMG3sO6t
qX169C8vVE4X6E+5axWuoO8AVC8nfsRJU6eF9KdpP7kIRAll9S5Vl/nMHLLSLExb
Sml3k1emTFcl9h2fTEeG44Dr70/T/G/HeGHKNSnJXTuoCAi+AlIfEFQl3dtNqbrr
lDbPu0SAZKh1tTshxslyU9xPiG/wiZIOt9YNxKDEFfs4ePrAnVBOmijn2MgnR8FP
KHBBox8eE3kiXuo7zkzewPMxWpTu2K9NG1P4w8qctRfpYa0P8qJLaXCQ7rMR6qR7
m1glUNOFOxcXx8J0afwGBO/LggkzRfdqWR6G4RZNtcQxram5V4Bt06exQckPeXdA
iXzsbrM4lRC/KixQGEN0s+FP3QZ6jVLVOmYJNuYSXznPAH1DMSm9GKWk+mrqQOeD
gfgF1jkU5O60COgknDT7JBQd/1P6jQ75kPYahvIgDwWWs2BtimrdiyL2RBzZBeu4
ZekmYFH0V4SPvn7RTDKNBQkbDQDectM8ZUXPXU2WrvrL+vadOYiDylW+BobluZYX
Lmaksf4Zq1U1NYrbEgyYpTxMDV6BZAaW//xOPufggQb+LA3A+JEkpw5oCR9Vj2GB
k/wvY2j79KV+jIhiuqBqBsGXbtTIk0ZPFIKx+xfRTe8Alf3va2Tyjt8h17N8aUzX
XmZ+2ssbAuEQAr0+bg/O
=L+I4
-----END PGP SIGNATURE-----

--lb7h7x2njnhqcnef--
