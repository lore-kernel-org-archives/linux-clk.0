Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 4 Nov 2016 08:49:40 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?St=E9phan?= Rafin <stephan@soliotek.com>
Cc: emilio@elopez.com.ar, mturquette@baylibre.com, sboyd@codeaurora.org,
	wens@csie.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Fix M factor computation for APB1
Message-ID: <20161104074940.ak46ghzoa3o3xcie@lukather>
References: <1478217236-12831-1-git-send-email-stephan@soliotek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hduxgfhvdeiveyfy"
In-Reply-To: <1478217236-12831-1-git-send-email-stephan@soliotek.com>
List-ID: <linux-clk.vger.kernel.org>


--hduxgfhvdeiveyfy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2016 at 12:53:56AM +0100, St=E9phan Rafin wrote:
> commit cfa636886033 ("clk: sunxi: factors: Consolidate get_factors
> parameters into a struct") introduced a regression for m factor
> computation in sun4i_get_apb1_factors function.
>=20
> The old code reassigned the "parent_rate" parameter to the targeted
> divisor value and was buggy for the returned frequency but not for the
> computed factors. Now, returned frequency is good but m factor is
> incorrectly computed (its max value 31 is always set resulting in a
> significantly slower frequency than the requested one...)
>=20
> This patch simply restores the original proper computation for m while
> keeping the good changes for returned rate.
>=20
> Signed-off-by: St=E9phan Rafin <stephan@soliotek.com>

Applied (added a Fixes tag), thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hduxgfhvdeiveyfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYHD2UAAoJEBx+YmzsjxAggBIP/A6dbJVxtx6GOcZoQacBLZwt
Bf39nDDeHAwAYhDbb5a84RDFW10pzO+UEweyTA5DUm4OfAUPB3k+9ahknJXQU38r
FAqPU44vs+sktrwHzrxqBiULTE9cxQHeqWAygpj5QPWGOIyODH9sykzoWVz76fei
Bo2gvcHja0t5nEN98dHbf6uEXRxqi5QamkmB+U7hZNl//GrivYWI0IMtPUZMWFz0
yvUGHcEDPL904Cz12UO+47iXaR7Loe6VyQ99Do/SqlQeiQtRlSsJmhMzOS+WHUs4
GOQngsZVrEOPaOsIKkFjFqcEnDQKuUE5WaW+dboWALlGyndPloj+amRDdSpAPuRV
57QSvww/pH6OpE89di7U0hAn7Jjr75Wv+B/6uSt9xZJmPV6W2WsCG2V3Bk/MlOJp
axAdmpOTJDm/wb/I3i65KrmDqVFDdiSUcSC+Ldgq9QxXDs+en393Ck8YyIFvtnOM
snIB1qBvIsSqQokSfewB8i1u0x/h+LL00UhiGqLLRIpZ2xS6d86fE8O+bgUKu5N/
6WNZroCbKr+1btTkXMjEYi0sChKt+ahsSecezqiVrSkbYO4kFWIBSj7OEo3wtYTx
ZV6ALNapTrb9CCTJ9ALGTju5cAQlE7/4ueUZNe89Mwtr2zofnhXNHbWD0ajA9v7d
VDZKfy7m5/KmijA6DCTL
=Sity
-----END PGP SIGNATURE-----

--hduxgfhvdeiveyfy--
