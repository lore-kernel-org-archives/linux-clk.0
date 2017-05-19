Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:59778 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753621AbdESSGe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2017 14:06:34 -0400
Date: Fri, 19 May 2017 20:06:16 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [RFC PATCH 10/11] ARM: sun8i: h3: add display engine pipeline
 for TVE
Message-ID: <20170519180616.vzrlu2avuucsjkiu@flea.home>
References: <20170517164354.16399-1-icenowy@aosc.io>
 <20170517164354.16399-11-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="edcycfhvxrzyae46"
In-Reply-To: <20170517164354.16399-11-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--edcycfhvxrzyae46
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 12:43:53AM +0800, Icenowy Zheng wrote:
> As we have already the support for the TV encoder on Allwinner H3, add
> the display engine pipeline device tree nodes to its DTSI file.
>=20
> The H5 pipeline has some differences and will be enabled later.
>=20
> The currently-unused mixer0 and tcon0 are also needed, for the
> completement of the pipeline.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 189 ++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 189 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index b36f9f423c39..20172ef92415 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -41,6 +41,8 @@
>   */
> =20
>  #include "sunxi-h3-h5.dtsi"
> +#include <dt-bindings/clock/sun8i-de2.h>
> +#include <dt-bindings/reset/sun8i-de2.h>
> =20
>  / {
>  	cpus {
> @@ -72,6 +74,193 @@
>  		};
>  	};
> =20
> +	de: display-engine {
> +		compatible =3D "allwinner,sun8i-h3-display-engine";
> +		allwinner,pipelines =3D <&mixer0>,
> +				      <&mixer1>;
> +		status =3D "disabled";
> +	};
> +
> +	soc {
> +		display_clocks: clock@1000000 {
> +			compatible =3D "allwinner,sun8i-a83t-de2-clk";
> +			reg =3D <0x01000000 0x100000>;
> +			clocks =3D <&ccu CLK_BUS_DE>,
> +				 <&ccu CLK_DE>;
> +			clock-names =3D "bus",
> +				      "mod";
> +			resets =3D <&ccu RST_BUS_DE>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			assigned-clocks =3D <&ccu CLK_DE>;
> +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
> +			assigned-clock-rates =3D <432000000>;

This shouldn't be set in the DT, but evaluated at runtime when calling
clk_set_rate.

> +		tve0: tv-encoder@1e00000 {
> +			compatible =3D "allwinner,sun8i-h3-tv-encoder";
> +			reg =3D <0x01e00000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_TVE>, <&ccu CLK_TVE>;
> +			clock-names =3D "bus", "mod";
> +			resets =3D <&ccu RST_BUS_TVE>;
> +			status =3D "disabled";
> +
> +			assigned-clocks =3D <&ccu CLK_TVE>;
> +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;

Same thing here. clk_set_rate should just do the right thing.

> +			assigned-clock-rates =3D <216000000>;

And why are you setting it in the driver and in the DT?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--edcycfhvxrzyae46
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHzQYAAoJEBx+YmzsjxAg9MAP/39QEJN/iHUv8E5KcUEr3dpg
w9exBvS9HQtliYIvOtA+mUrV85A4Dk8g592aRlGDAYJXVGBfhw9KrbDVCXtK0LOX
lmh194JopE8GT44hMaa6nsxXBbXjm99RL5Sy8eDJ4zePNVufxGLOvdNH5nZFEahQ
TFxPbSid+vNWmMqhYPzKywKKfv2JZvUqcmo0Siz6kQSgCax19SaS1/caygC19bDg
KrM2tifFiZoQGh7BKLm3vvcNOsQ5BI3ww4XXg9nyopd1z0/jkflcBwRBFUIVUJGy
gzqi4p+t+QdcBf9TF4MqZSCPc5AMRnYfIYLd/dPMTHelLoFF1Vhw25SlM4YQ2Dfz
09qCOtwj3pgZ/mA6HrTpCum//CpTD+X/WaTpQFyfa4UO+PgfNyYiOJiQcw5JrLjA
YHMgh01OiVOJVK3i8Jjmiy0Ad0cV7J6UXzZzET02mGEPl9dKbvDwt3vzYOIvJqnQ
bP6gAnzTuxwEilj+7R2lTgzJ1fIm877A7DmypHI8zmNUn7epFonxgd+mssC65UKR
Ep9G80g7pdrwHOPQy29i9ODjTnAcfLIWeNlQC8h1QGyTmlpmBpofAkFg3vdIG5ry
6XEIwz4m+1A+gx885brYFjQIsVtJIUtluZgCLJ1l15ctvPfcZGlGwfuiQxrRT9hG
iEzzZdvKe1NJbOrPt9gn
=cUBL
-----END PGP SIGNATURE-----

--edcycfhvxrzyae46--
