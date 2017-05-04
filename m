Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 4 May 2017 16:31:12 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 09/10] ARM: dts: sun8i: Add basic dtsi file for
 Allwinner R40
Message-ID: <20170504143112.upqknjei57oaw2w4@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-10-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-10-icenowy@aosc.io>
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
Content-Type: multipart/mixed; boundary="===============0960114616815542815=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0960114616815542815==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v66stlbtqwct6dbx"
Content-Disposition: inline


--v66stlbtqwct6dbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 09:50:05PM +0800, Icenowy Zheng wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The Allwinner R40 SoC is marketed as the successor to the A20 SoC.
> The R40 is a smaller chip than the A20, but features the same set
> of programmable pins, with a couple extra pins and some new pin
> functions. The chip features 4 Cortex-A7 cores and a Mali-400 MP2
> GPU. It retains most if not all features from the A20, while adding
> some new features, such as MIPI DSI output, or updating various
> hardware blocks, such as DE 2.0.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 404 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 404 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r40.dtsi
>=20
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r=
40.dtsi
> new file mode 100644
> index 000000000000..20d4705a8206
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -0,0 +1,404 @@
> +/*
> + * Copyright 2017 Chen-Yu Tsai <wens@csie.org>
> + * Copyright 2017 Icenowy Zheng <icenowy@aosc.xyz>
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
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun8i-r40-ccu.h>
> +#include <dt-bindings/reset/sun8i-r40-ccu.h>
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	interrupt-parent =3D <&gic>;
> +
> +	aliases {
> +	};
> +
> +	chosen {
> +	};

These two are probably useless...

> +	clocks {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		osc24M: osc24M {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <24000000>;
> +		};
> +
> +		osc32k: osc32k {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <32768>;
> +			clock-output-names =3D "osc32k";
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			compatible =3D "arm,cortex-a7";
> +			device_type =3D "cpu";
> +			reg =3D <0>;
> +		};
> +
> +		cpu@1 {
> +			compatible =3D "arm,cortex-a7";
> +			device_type =3D "cpu";
> +			reg =3D <1>;
> +		};
> +
> +		cpu@2 {
> +			compatible =3D "arm,cortex-a7";
> +			device_type =3D "cpu";
> +			reg =3D <2>;
> +		};
> +
> +		cpu@3 {
> +			compatible =3D "arm,cortex-a7";
> +			device_type =3D "cpu";
> +			reg =3D <3>;
> +		};
> +	};
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x40000000 0x80000000>;
> +	};

This one too.

> +	soc@1c00000 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		nmi_intc: interrupt-controller@1c00030 {
> +			compatible =3D "allwinner,sun7i-a20-sc-nmi";
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			reg =3D <0x01c00030 0x0c>;
> +			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		mmc0: mmc@1c0f000 {
> +			compatible =3D "allwinner,sun50i-a64-mmc";
> +			reg =3D <0x01c0f000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC0>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency =3D <150000000>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		mmc1: mmc@1c10000 {
> +			compatible =3D "allwinner,sun50i-a64-mmc";
> +			reg =3D <0x01c10000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC1>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency =3D <150000000>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		mmc2: mmc@1c11000 {
> +			compatible =3D "allwinner,sun50i-a64-emmc";
> +			reg =3D <0x01c11000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC2>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency =3D <200000000>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		mmc3: mmc@1c12000 {
> +			compatible =3D "allwinner,sun50i-a64-mmc";

This needs a specific compatible.

> +			reg =3D <0x01c12000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_MMC3>, <&ccu CLK_MMC3>;
> +			clock-names =3D "ahb", "mmc";
> +			resets =3D <&ccu RST_BUS_MMC3>;
> +			reset-names =3D "ahb";
> +			interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency =3D <150000000>;

Did you actually test those frequencies?


> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		ccu: clock@1c20000 {
> +			compatible =3D "allwinner,sun8i-r40-ccu";
> +			reg =3D <0x01c20000 0x400>;
> +			clocks =3D <&osc24M>, <&osc32k>;
> +			clock-names =3D "hosc", "losc";

This is very likely to be fed from the RTC.

> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		pio: pinctrl@1c20800 {
> +			compatible =3D "allwinner,sun8i-r40-pinctrl";
> +			reg =3D <0x01c20800 0x400>;
> +			interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> +			clock-names =3D "apb", "hosc", "losc";

Here too.

> +			gpio-controller;
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			#gpio-cells =3D <3>;
> +
> +			i2c0_pins: twi0@0 {
> +				pins =3D "PB0", "PB1";
> +				function =3D "i2c0";
> +			};
> +
> +			mmc0_pins: mmc0@0 {
> +				pins =3D "PF0", "PF1", "PF2",
> +				       "PF3", "PF4", "PF5";
> +				function =3D "mmc0";
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc1_pins: mmc1@0 {
> +				pins =3D "PG0", "PG1", "PG2",
> +				       "PG3", "PG4", "PG5";
> +				function =3D "mmc1";
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};
> +
> +			mmc2_pins: mmc2@0 {
> +				pins =3D "PC5", "PC6", "PC7", "PC8", "PC9",
> +				       "PC10", "PC11", "PC12", "PC13", "PC14",
> +				       "PC15", "PC24";
> +				function =3D "mmc2";
> +				drive-strength =3D <30>;
> +				bias-pull-up;
> +			};

This implies an 8 bit bus width, which is not that common, and not
your default in the MMC driver either.

> +			uart0_pins_0: uart0@0 {
> +				pins =3D "PB22", "PB23";
> +				function =3D "uart0";
> +			};
> +		};
> +
> +		uart0: serial@1c28000 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c28000 0x400>;
> +			interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART0>;
> +			resets =3D <&ccu RST_BUS_UART0>;
> +			status =3D "disabled";
> +		};
> +
> +		uart1: serial@1c28400 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c28400 0x400>;
> +			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART1>;
> +			resets =3D <&ccu RST_BUS_UART1>;
> +			status =3D "disabled";
> +		};
> +
> +		uart2: serial@1c28800 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c28800 0x400>;
> +			interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART2>;
> +			resets =3D <&ccu RST_BUS_UART2>;
> +			status =3D "disabled";
> +		};
> +
> +		uart3: serial@1c28c00 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c28c00 0x400>;
> +			interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART3>;
> +			resets =3D <&ccu RST_BUS_UART3>;
> +			status =3D "disabled";
> +		};
> +
> +		uart4: serial@1c29000 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c29000 0x400>;
> +			interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART4>;
> +			resets =3D <&ccu RST_BUS_UART4>;
> +			status =3D "disabled";
> +		};
> +
> +		uart5: serial@1c29400 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c29400 0x400>;
> +			interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART5>;
> +			resets =3D <&ccu RST_BUS_UART5>;
> +			status =3D "disabled";
> +		};
> +
> +		uart6: serial@1c29800 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c29800 0x400>;
> +			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART6>;
> +			resets =3D <&ccu RST_BUS_UART6>;
> +			status =3D "disabled";
> +		};
> +
> +		uart7: serial@1c29c00 {
> +			compatible =3D "snps,dw-apb-uart";
> +			reg =3D <0x01c29c00 0x400>;
> +			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&ccu CLK_BUS_UART7>;
> +			resets =3D <&ccu RST_BUS_UART7>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c0: i2c@1c2ac00 {
> +			compatible =3D "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x01c2ac00 0x400>;
> +			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C0>;
> +			resets =3D <&ccu RST_BUS_I2C0>;
> +			pinctrl-0 =3D <&i2c0_pins>;
> +			pinctrl-names =3D "default";
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c1: i2c@1c2b000 {
> +			compatible =3D "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x01c2b000 0x400>;
> +			interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C1>;
> +			resets =3D <&ccu RST_BUS_I2C1>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c2: i2c@1c2b400 {
> +			compatible =3D "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x01c2b400 0x400>;
> +			interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C2>;
> +			resets =3D <&ccu RST_BUS_I2C2>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c3: i2c@1c2b800 {
> +			compatible =3D "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x01c2b800 0x400>;
> +			interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C3>;
> +			resets =3D <&ccu RST_BUS_I2C3>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		i2c4: i2c@1c2c000 {
> +			compatible =3D "allwinner,sun6i-a31-i2c";
> +			reg =3D <0x01c2c000 0x400>;
> +			interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_I2C4>;
> +			resets =3D <&ccu RST_BUS_I2C4>;
> +			status =3D "disabled";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +
> +		gic: interrupt-controller@1c81000 {
> +			compatible =3D "arm,cortex-a7-gic", "arm,cortex-a15-gic";
> +			reg =3D <0x01c81000 0x1000>,
> +			      <0x01c82000 0x1000>,
> +			      <0x01c84000 0x2000>,
> +			      <0x01c86000 0x2000>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <3>;
> +			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HI=
GH)>;
> +		};
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv7-timer";
> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LO=
W)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency =3D <24000000>;
> +		arm,cpu-registers-not-fw-configured;

Is it true? U-boot doesn't setup those already?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--v66stlbtqwct6dbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCzssAAoJEBx+YmzsjxAgkyUP/RUcE0xN7boYxApixZ0PgQz4
oOHhdgt4UTYFNP1iQL6CQZuHWZrZBsVAILlSZkSeauoldtH0nH7A6gEj2m5p5nH2
SRD8b/cAph7ayjpOrIptT0zNjtzc7kBx86EtfM4Bt+yUgwucaZ0ohiAxgEjjZ7Nt
Ec+c5MlwFh1z/RKsIoKfnWQCWqeqHjCHGaTcG0FoUQdQypd4hjKnetJarv05/W18
AlQplMnxEaUpRj3PWLXwDrAf911Jf18yXH190/DczuecuChcaLZxSZgNN0yHja/1
v/CnnZnDfMiUAm4sxdlBNcqqdKLqYkAUow0m5IpBRTgM1qYellianruOhpC7OzHN
clBXyjiQAPSg8cBEpJVWD/EBve/aVgwUyercZS1pRtb4aOyjgtV2HL4WHt1NZVYH
UYSBaU1hOIeM8gPitWPXVSPgcJbu+vRx7nOTMm6PDwnAs28xsrp6AUSduugD2pFz
lxnphFJCKjtZYIrGKF51179nUGfYbk8gnHLsblQWQNEfwyxTOSh7bOuiH9jDVRZE
lKQ6T2lHqktbwb3H1LnhHLwH2r5YB1QsLLwI6HmkrIQ5px3v5v3VVst0HW0bTZFi
NG51wNQ9ZwCNgFqmRvvPSQOZmcWkiNJyU+mQl+MGJ8BBQzbhh1l9bdyUslujw75R
GDdjCI8PJXxf98aukmP7
=qxoF
-----END PGP SIGNATURE-----

--v66stlbtqwct6dbx--


--===============0960114616815542815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0960114616815542815==--
