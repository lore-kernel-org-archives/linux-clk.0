Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 4 May 2017 16:39:50 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 10/10] ARM: dts: sun8i: Add board dts file for Banana
 Pi M2 Ultra
Message-ID: <20170504143950.xqx2st42xtgl5nsq@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-11-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-11-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0731036032951698099=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0731036032951698099==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bswfwok7jnut67sp"
Content-Disposition: inline


--bswfwok7jnut67sp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 09:50:06PM +0800, Icenowy Zheng wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Banana Pi M2 Ultra is an SBC based on the Allwinner R40 SoC. The
> form factor and position of various connectors, leds and buttons is
> similar to the Banana Pi M1+, Banana Pi M3, and is exactly the same
> as the latest Banana Pi M64.
>=20
> It features:
>=20
>   - X-Powers AXP221s PMIC connected to i2c0
>   - 2 GB DDR3 DRAM
>   - 8 GB eMMC
>   - micro SD card slot
>   - DC power jack
>   - HDMI output
>   - MIPI DSI connector
>   - 2x USB 2.0 hosts
>   - 1x USB 2.0 OTG
>   - gigabit ethernet with Realtek RTL8211E transceiver
>   - WiFi/Bluetooth with AP6212 chip, with external antenna connector
>   - SATA and power connectors for native SATA support
>   - camera sensor connector
>   - consumer IR receiver
>   - audio out headphone jack
>   - onboard microphone
>   - red, green, and blue LEDs
>   - debug UART pins
>   - Li-Po battery connector
>   - Raspberry Pi B+ compatible GPIO header
>   - power, reset, and boot control buttons
>=20
> This patch adds a dts file that enables debug UART and MMC support.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm/boot/dts/Makefile                        |   1 +
>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 161 ++++++++++++++++=
++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9c5e1d944d1c..07a662494eed 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -905,6 +905,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-h3-orangepi-plus.dtb \
>  	sun8i-h3-orangepi-plus2e.dtb \
>  	sun8i-r16-parrot.dtb \
> +	sun8i-r40-bananapi-m2-ultra.dtb \
>  	sun8i-v3s-licheepi-zero.dtb
>  dtb-$(CONFIG_MACH_SUN9I) +=3D \
>  	sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm=
/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> new file mode 100644
> index 000000000000..1d824830a1ad
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> @@ -0,0 +1,161 @@
> +/*
> + * Copyright (C) 2017 Chen-Yu Tsai <wens@csie.org>
> + * Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.xyz>
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
> +#include "sun8i-r40.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model =3D "Banana Pi BPI-M2-Ultra";
> +	compatible =3D "sinovoip,bpi-m2-ultra", "allwinner,sun8i-r40";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
> +	};
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	axp22x: pmic@68 {
> +		compatible =3D "x-powers,axp221";
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +#include "axp22x.dtsi"
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <2700000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "avcc";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-name =3D "vcc-3v0";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1300000>;
> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1000000>;
> +	regulator-max-microvolt =3D <1300000>;
> +	regulator-name =3D "vdd-sys";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt =3D <1500000>;
> +	regulator-max-microvolt =3D <1500000>;
> +	regulator-name =3D "vcc-dram";
> +};
> +
> +&reg_dldo1 {
> +	regulator-min-microvolt =3D <1800000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-wifi-io";
> +};
> +
> +&reg_dldo2 {
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-wifi";
> +};
> +
> +&mmc0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc0_pins>;

If there is multiple options, then it should be suffixed. If there's
only a single option, then it should be set in the DTSI. Either way,
this is wrong.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bswfwok7jnut67sp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCz0yAAoJEBx+YmzsjxAg5BMQALWmQ43U/GZ+yI6ehrjcloeo
gN1NejuquK9sjZc6np+8v5iw8W0EROCbu8DJRAgZfv88jpSm84mhUyJBDpYEDOmK
JDREovgQ4m3C+qrjm4ZRZkj54RfG+s7RX3uLm1G3eRHHiBn35UeSbu4bwjYSpX1+
iSFp+C7P0RUeHKFKc7xn6ypws7pj0J2ommIt0I2ZrdEr2t/9+IgrD3pvgTllfIHX
gwgW8XWo7nNvYxrYg6TLxkDioEe9+Wg9sV6FKbbNP09pUq4YIJh+6XPS12zwY8Xj
71m6C1rLXKgh36UkFUfIg1mJEvHmSfU3nIYNtDyvdhEd2Mqci/JCvaieGHp6j6ne
ELYficO992XVGE/Q0pUPBLltYNCVd6ov6Pd46wKOPZ6O+sTpiaNQC9Tyr88Z+nOi
ShrixvlRuVYefLtvXRSpZIcr4ebW9xG1jqXYEcLS8pWPmVEmWzd15VFF9XlQlP6V
R86tp/xv/+ulh2SnoksbrgmYwu65oTD7W/2rjOS7TC27lLzjJAastWsyB0RJugGF
/U+pc8FyUxJhIA9HDSzYb9RCl/v8T5MFxp+ljTXbyu3QdM9md9nF52MCTCzvxDhP
H8pZ06mdLV48TG+L51uLaX+rFW7A7ZZhMc6cjyESt1M/rrV4h66yr4WGJz/YddOE
M7FaNIlYcPK7HlzTeE+L
=IXCq
-----END PGP SIGNATURE-----

--bswfwok7jnut67sp--


--===============0731036032951698099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0731036032951698099==--
