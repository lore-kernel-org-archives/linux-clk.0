Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:52934 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752847AbdDKJN6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2017 05:13:58 -0400
Date: Tue, 11 Apr 2017 11:13:46 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 4/5] ARM: sun8i: h3: add operating-points-v2 table for CPU
Message-ID: <20170411091346.mcwyskezadabsobn@lukather>
References: <20170408185025.53841-1-icenowy@aosc.io>
 <20170408185025.53841-5-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ugizphasj3wc7vbe"
In-Reply-To: <20170408185025.53841-5-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ugizphasj3wc7vbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 09, 2017 at 02:50:24AM +0800, Icenowy Zheng wrote:
> The CPU on Allwinner H3 can do dynamic frequency scaling.
>=20
> Add a DVFS table based on the one tweaked by Armbian developers, which
> are proven to work stably on BSP kernels.
>=20
> Frequencies higher than 1008MHz are temporarily dropped in the table, as
> they may lead to over voltage on boards without proper regulator
> settings or over temperature on boards with proper regulator settings.
> They will be added back once regulator settings are ready and thermal
> sensor driver is merged.
>=20
> In order to satisfy all different regulators (SY8106A which is 50mV per
> level, SY8113B which have two states: 1.1V and 1.3V, and some board with
> non-tweakable regulators), all the OPPs are defined with a range which has
> the target value as the minimum allowed value, and 1.3V (the highest
> VDD-CPUX voltage suggested by the datasheet) as the maximum allowed value.
> It's proven to work well with a board with SY8113B.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 38 +++++++++++++++++++++++++++++++++++=
++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index b36f9f423c39..a0cee17fe44b 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -43,32 +43,68 @@
>  #include "sunxi-h3-h5.dtsi"
> =20
>  / {
> +	cpu0_opp_table: opp_table0 {
> +		compatible =3D "operating-points-v2";
> +		opp-shared;
> +
> +		opp@480000000 {
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			opp-microvolt =3D <980000 980000 1300000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +
> +		opp@648000000 {
> +			opp-hz =3D /bits/ 64 <816000000>;
> +			opp-microvolt =3D <1020000 1020000 1300000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +
> +		opp@912000000 {
> +			opp-hz =3D /bits/ 64 <960000000>;
> +			opp-microvolt =3D <1080000 1080000 1300000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +
> +		opp@1008000000 {
> +			opp-hz =3D /bits/ 64 <1008000000>;
> +			opp-microvolt =3D <1140000 1140000 1300000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +	};
> +

=46rom your serie, I guess you never actually tested those OPPs on any
board without SY8113B, right?

(and therefore, without operating at the voltages listed here).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ugizphasj3wc7vbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY7J5GAAoJEBx+YmzsjxAgX0wQAKakE2m8O0Xcshd6pACHwss9
9jfIwHVeF4Rf7++FoP0KIYwAWQIJL0rsYQxA8uWF48rrVcOKuym5+c49A+EnSv/O
Bd1Gl4loiDmyTu19guQffziJnS6qNrcWsuJ7rvKnlfP4aPIaGBHJc1XjwvZkohw2
wpw1JtM/wMu39A7P2oXqxDlArADDA1MiXHBF2YU4QUwc/br6I1twZNcqa8Gg9X7X
FXY3yoQvfTO+amFVVURDAbDle67SPQ2aRVNyq0EIKTahDhLTekT2OJ/y5iY8uSlo
E+K53wBZXTwnKGIvznznvnSuwJ5HlGJgc94EfTFhkCn3rJuTqLzTHqXFENJ2rGJd
GuTVDXTPRqGzFBmVjf/1FEho5b9u20XL4is4c7MF4cqhIUblayNWzQ72b1pzykce
S4SukP/j8iCKEfj5Cu6CmRrB/cLEpqaP1G7e2doNKSkOipVMjq0xV9qbyC1r69vj
BTybBkWrKa2orz4QtsFwBTkAIlmMje9nubUa7ikt82spciCZ6WoOhi+WHL8I8rJA
YNXOSe5TuIGbMOhYOwOAaiE/JPQ4cJbg8QEh1HgCELKqGTNc2lNsNZl01qouQ3rX
aiLoyA2ixGoC55zALr9bxCHHMU7Qpafm/B4hLZKPmZEYVuhfgzCG3hHEsBpCgemr
17XCNSSOsjOnUkhgN2Lu
=a182
-----END PGP SIGNATURE-----

--ugizphasj3wc7vbe--
