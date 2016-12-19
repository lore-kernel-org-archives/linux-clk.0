Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:40019 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751255AbcLSIqz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Dec 2016 03:46:55 -0500
Date: Mon, 19 Dec 2016 09:46:52 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2] ARM: dts: sun8i: add opp-v2 table for A33
Message-ID: <20161219084652.kiqdkiewu5tujlyd@lukather>
References: <20161215182754.33921-1-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oyrqlppj6omlvwzf"
In-Reply-To: <20161215182754.33921-1-icenowy@aosc.xyz>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--oyrqlppj6omlvwzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2016 at 02:27:54AM +0800, Icenowy Zheng wrote:
> An operating point table is needed for the cpu frequency adjusting to
> work.
>=20
> The operating point table is converted from the common value in
> extracted script.fex from many A33 board/tablets.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes since v1:
> - Fix format problem (blank lines).
> - Removed the 1.344GHz operating point, as it's overvoltage and overclock=
ed.
>=20
> This patch depends on the following patchset:
>=20
> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-December/47396=
2.html
>=20
> It's the v2 of the [PATCH 4/6] in this patchset.
>=20
> I think this operating point table may also apply to A23, as there's no
> difference except the points over 1.2GHz between A23 and A33's stock dvfs=
 table.
>=20
> But as A23 CCU may not have the necessary fixes, I won't add the table to=
 A23
> now.
>=20
> Chen-Yu, could you test the CCU fixes I described in the patchset above o=
n A23,
> then test this operating points table?
>=20
> If it's necessary, you can send out the CCU fixes and add one more patch =
that
> moves this opp-v2 table to sun8i-a23-a33.dtsi .
>=20
>  arch/arm/boot/dts/sun8i-a33.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a=
33.dtsi
> index 504996cbee29..0f5b2af72981 100644
> --- a/arch/arm/boot/dts/sun8i-a33.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a33.dtsi
> @@ -46,7 +46,42 @@
>  #include <dt-bindings/dma/sun4i-a10.h>
> =20
>  / {
> +	cpu0_opp_table: opp_table0 {
> +		compatible =3D "operating-points-v2";
> +		opp-shared;
> +
> +		opp@648000000 {
> +			opp-hz =3D /bits/ 64 <648000000>;
> +			opp-microvolt =3D <1040000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +
> +		opp@816000000 {
> +			opp-hz =3D /bits/ 64 <816000000>;
> +			opp-microvolt =3D <1100000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +
> +		opp@1008000000 {
> +			opp-hz =3D /bits/ 64 <1008000000>;
> +			opp-microvolt =3D <1200000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +
> +		opp@1200000000 {
> +			opp-hz =3D /bits/ 64 <1200000000>;
> +			opp-microvolt =3D <1320000>;
> +			clock-latency-ns =3D <244144>; /* 8 32k periods */
> +		};
> +	};
> +
>  	cpus {
> +		cpu0: cpu@0 {

There's no need to duplicate the label here. I removed it and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--oyrqlppj6omlvwzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYV554AAoJEBx+YmzsjxAgMm0P/01hiBKSIhlolFjpiLfYWs7H
pyLqkHZMTs7PAH1KZTn+UJR7zj8AHz3mhp9IXP7u/IWSOOT0bQCz9HpaDubp5cLR
0HJSzchltJ1pgAPcrY1/0plXBB3mFsQ0MpBw76mBouFnTEReEpVChfjdYHRt0jQ7
iWb+SrWIjKQD7NtSLF2KeP5J6aOJ8LAVxgWGRQETPzD/k4t/Wqj/i5cDtAFsDHML
ga/MHTj8sMjVtq8oW85ESjStB4e0XJS7/EBiFu6vnoebxG+f71Pb9/kvZjvjgsUI
L6yjYfPjvwV3nGczgTfX4Uk9KFys3FsRbvMFsE8+f+7bTayROBekdQqK0vJ6zBCv
AorL+LhUF09arA35X169vCjvc9F3k6kH/4Mcd02AJoPYIDRZl7I/TgwAAECi79oC
O2obsQjXXQa7Q5GZF/acoagITzXDWcrcEFzM4Qf7MTACQvha3d1CMthCa7X35StF
biQtk7O1qub8yK1Eun20+nHaKY5nX9sJxFzQl0uQRpW9FKxCW2CTrU0GjIXLi/BE
sjkpDnYzmddncTLo8xPNmt/psHeLuYVA2FwHYa/SFUBIjA7P+mdQ5r+MgoZU7MdM
9Rx9RuUVin3dSMvO5vmTU+OKK4QBc1cBiNPkPFk+S86zgAEbbtizAuxyPTxUOuWz
24ncKObtXPQIaEM90sw0
=ts/3
-----END PGP SIGNATURE-----

--oyrqlppj6omlvwzf--
