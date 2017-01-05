Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 5 Jan 2017 23:13:04 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 6/6] arm64: dts: sunxi: add support for the Orange Pi PC
 2 board
Message-ID: <20170105221304.ai6bue44eu73kwoi@lukather>
References: <20161226171156.11605-1-icenowy@aosc.xyz>
 <20161226171156.11605-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20161226171156.11605-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6725974411921882029=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============6725974411921882029==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="75ndxishggcqllbq"
Content-Disposition: inline


--75ndxishggcqllbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2016 at 01:11:56AM +0800, Icenowy Zheng wrote:
> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The Orange Pi PC 2 is a typical single board computer using the
> Allwinner H5 SoC. Apart from the usual suspects it features three
> separately driven USB ports and a Gigabit Ethernet port.
> Also it has a SPI NOR flash soldered, from which the board can boot
> from. This enables the SBC to behave like a "real computer" with
> built-in firmware.
>=20
> Add the board specific .dts file, which includes the H5 .dtsi and
> enables the peripherals that we support so far.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 183 +++++++++++++++=
++++++
>  2 files changed, 184 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.=
dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 1e29a5ae8282..b26bb46b934c 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -1,4 +1,5 @@
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb sun50i-a64-pine=
64.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
> =20
>  always		:=3D $(dtb-y)
>  subdir-y	:=3D $(dts-dirs)
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> new file mode 100644
> index 000000000000..a29ca6b274bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> @@ -0,0 +1,183 @@
> +/*
> + * Copyright (C) 2016 ARM Ltd.
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "sun50i-h5.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +
> +/ {
> +	model =3D "Xunlong Orange Pi PC 2";
> +	compatible =3D "xunlong,orangepi-pc2", "allwinner,sun50i-h5";
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +	};
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&leds_opc>, <&leds_r_opc>;

There's no need to declare the LED GPIO in pinctrl.

> +
> +		pwr_led {
> +			label =3D "orangepi:green:pwr";
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "on";
> +		};
> +
> +		status_led {
> +			label =3D "orangepi:red:status";
> +			gpios =3D <&pio 0 15 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	r_gpio_keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sw_r_opc>;

Ditto

> +
> +		sw4 {
> +			label =3D "sw4";
> +			linux,code =3D <BTN_0>;
> +			gpios =3D <&r_pio 0 3 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&ehci2 {
> +	status =3D "okay";
> +};
> +
> +&ehci3 {
> +	status =3D "okay";
> +};
> +
> +&ir {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&ir_pins_a>;
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins_a>, <&mmc0_cd_pin>;

Ditto

> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +	cd-inverted;

Do you need both the GPIO flag and the cd-inverted one?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--75ndxishggcqllbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbsTwAAoJEBx+YmzsjxAgLlcP/j1xsc18MCcOBb1G4/KtLlzI
n00FsAN6m1KIAmHvLL5ta6XQw8xaBsbH8gTz250zOwO1aI+OiO1ygvZZFwx11e4z
JUqkRHjtpsmg8yWQszStqSq7M6jCjw4Xa4HwfzZaJP3pC1FlilGOovp67Dr+mMxO
bmbJLUzyyqkq/x9cSwraJ9Gb8SbMI7erNdyZcviUgi6966zPN5CqhfB0JQTxxwnL
JxHB0w/njsWxmn7W4/M+hrLIwXZ3rQijjcBbQWVs0GbsUbM/xpRP99WPPhUKBqDG
XMYf+6Fb9uB75XOTrHB57yOQCqZbrtuA3y+9utjIa4pXJjR0k60+7QwwaLIuTOuQ
BOWnJB6xJXdBFVlODTmroa12vEgwasqpt5FF1ePlFMIxXoNWg4IDMYtUEipWCRLg
OnomE3wTkelaYGWlKLBEinV+eQb7RJZ3LfThMXG8d889CrD+Rwcm9PMAboViqI1t
CeZagmFTOA/PmOkfg3okWPqtnP2XEvQ3qX4y7C4qQPn1Fxpdek3KiY03LL0ln6MY
Z11UlFogPq4b+sZE2UbeNF93urbbZ8D9ry1m2QbN/HFM+JFRA9nFq4g1ijF6B6et
O/EPz7i46lqQknqB+yJk/LekSE6hxPUarOX67bV92wa6T8t8ewywJ1TFwwUSBcve
mOQttk4dJRChVWVf8kQz
=/9SC
-----END PGP SIGNATURE-----

--75ndxishggcqllbq--


--===============6725974411921882029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6725974411921882029==--
