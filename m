Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20160909201029.24530-4-maxime.ripard@free-electrons.com>
References: <20160909201029.24530-1-maxime.ripard@free-electrons.com> <20160909201029.24530-4-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 10 Sep 2016 10:21:37 +0800
Message-ID: <CAGb2v64vBk0v37KGnyasfw+QZ8VGxbN_9yr1yVUNcHGsZhhb0w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: add Allwinner A64 SoC .dtsi
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Andre Przywara <andre.przywara@arm.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Sep 10, 2016 at 4:10 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> From: Andre Przywara <andre.przywara@arm.com>
>
> The Allwinner A64 SoC is a low-cost chip with 4 ARM Cortex-A53 cores
> and the typical tablet / TV box peripherals.
> The SoC is based on the (32-bit) Allwinner H3 chip, sharing most of
> the peripherals and the memory map.
> Although the cores are proper 64-bit ones, the whole SoC is actually
> limited to 4GB (including all the supported DRAM), so we use 32-bit
> address and size cells. This has the nice feature of us being able to
> reuse the DT for 32-bit kernels as well.
> This .dtsi lists the hardware that we support so far.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> [Maxime: Convert to CCU binding, drop the MMC support for now]
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.txt |   1 +
>  MAINTAINERS                                     |   1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi   | 279 ++++++++++++++++++=
++++++
>  3 files changed, 281 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentat=
ion/devicetree/bindings/arm/sunxi.txt
> index 7e79fcc36b0d..7e59d8ba86af 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -14,3 +14,4 @@ using one of the following compatible strings:
>    allwinner,sun8i-a83t
>    allwinner,sun8i-h3
>    allwinner,sun9i-a80
> +  allwinner,sun50i-a64
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 20bb1d00098c..c8c0c85c113f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -982,6 +982,7 @@ M:  Chen-Yu Tsai <wens@csie.org>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
>  N:     sun[x456789]i
> +F:     arch/arm64/boot/dts/allwinner/
>
>  ARM/Allwinner SoC Clock Support
>  M:     Emilio L=C3=B3pez <emilio@elopez.com.ar>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> new file mode 100644
> index 000000000000..028cdbee20aa
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -0,0 +1,279 @@
> +/*
> + * Copyright (C) 2016 ARM Ltd.
> + * based on the Allwinner H3 dtsi:
> + *    Copyright (C) 2015 Jens Kuske <jenskuske@gmail.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of th=
e
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
> +#include <dt-bindings/clock/sun50i-a64-ccu.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/sun4i-a10.h>
> +#include <dt-bindings/reset/sun50i-a64-ccu.h>
> +
> +/ {
> +       interrupt-parent =3D <&gic>;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +
> +       cpus {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               cpu@0 {
> +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> +                       device_type =3D "cpu";
> +                       reg =3D <0>;
> +                       enable-method =3D "psci";
> +               };
> +
> +               cpu@1 {
> +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> +                       device_type =3D "cpu";
> +                       reg =3D <1>;
> +                       enable-method =3D "psci";
> +               };
> +
> +               cpu@2 {
> +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> +                       device_type =3D "cpu";
> +                       reg =3D <2>;
> +                       enable-method =3D "psci";
> +               };
> +
> +               cpu@3 {
> +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> +                       device_type =3D "cpu";
> +                       reg =3D <3>;
> +                       enable-method =3D "psci";
> +               };
> +       };
> +
> +       osc24M: osc24M_clk {
> +               #clock-cells =3D <0>;
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <24000000>;
> +               clock-output-names =3D "osc24M";
> +       };
> +
> +       osc32k: osc32k_clk {
> +               #clock-cells =3D <0>;
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <32768>;
> +               clock-output-names =3D "osc32k";
> +       };
> +
> +       pmu {
> +               compatible =3D "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
> +               interrupts =3D <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-affinity =3D <&cpu0>,
> +                                    <&cpu1>,
> +                                    <&cpu2>,
> +                                    <&cpu3>;
> +       };
> +
> +       psci {
> +               compatible =3D "arm,psci-0.2";
> +               method =3D "smc";
> +       };
> +
> +       timer {
> +               compatible =3D "arm,armv8-timer";
> +               interrupts =3D <GIC_PPI 13
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 14
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 11
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 10
> +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +       };
> +
> +       soc {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               ccu: clock@01c20000 {
> +                       compatible =3D "allwinner,sun50i-a64-ccu";
> +                       reg =3D <0x01c20000 0x400>;
> +                       clocks =3D <&osc24M>, <&osc32k>;
> +                       clock-names =3D "hosc", "losc";
> +                       #clock-cells =3D <1>;
> +                       #reset-cells =3D <1>;
> +               };
> +
> +               pio: pinctrl@1c20800 {
> +                       compatible =3D "allwinner,sun50i-a64-pinctrl";
> +                       reg =3D <0x01c20800 0x400>;
> +                       interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_PIO>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <3>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +
> +                       i2c1_pins: i2c1_pins {
> +                               allwinner,pins =3D "PH2", "PH3";
> +                               allwinner,function =3D "i2c1";


> +                               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>=
;
> +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL=
>;

Since we figured out these properties are optional, I suggest we just drop =
them.
Otherwise

Acked-by: Chen-Yu Tsai <wens@csie.org>

> +                       };
> +
> +                       uart0_pins_a: uart0@0 {
> +                               allwinner,pins =3D "PB8", "PB9";
> +                               allwinner,function =3D "uart0";
> +                               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>=
;
> +                               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL=
>;
> +                       };
> +               };
> +
> +               uart0: serial@1c28000 {
> +                       compatible =3D "snps,dw-apb-uart";
> +                       reg =3D <0x01c28000 0x400>;
> +                       interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg-shift =3D <2>;
> +                       reg-io-width =3D <4>;
> +                       clocks =3D <&ccu CLK_BUS_UART0>;
> +                       resets =3D <&ccu RST_BUS_UART0>;
> +                       status =3D "disabled";
> +               };
> +
> +               uart1: serial@1c28400 {
> +                       compatible =3D "snps,dw-apb-uart";
> +                       reg =3D <0x01c28400 0x400>;
> +                       interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg-shift =3D <2>;
> +                       reg-io-width =3D <4>;
> +                       clocks =3D <&ccu CLK_BUS_UART1>;
> +                       resets =3D <&ccu RST_BUS_UART1>;
> +                       status =3D "disabled";
> +               };
> +
> +               uart2: serial@1c28800 {
> +                       compatible =3D "snps,dw-apb-uart";
> +                       reg =3D <0x01c28800 0x400>;
> +                       interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg-shift =3D <2>;
> +                       reg-io-width =3D <4>;
> +                       clocks =3D <&ccu CLK_BUS_UART2>;
> +                       resets =3D <&ccu RST_BUS_UART2>;
> +                       status =3D "disabled";
> +               };
> +
> +               uart3: serial@1c28c00 {
> +                       compatible =3D "snps,dw-apb-uart";
> +                       reg =3D <0x01c28c00 0x400>;
> +                       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg-shift =3D <2>;
> +                       reg-io-width =3D <4>;
> +                       clocks =3D <&ccu CLK_BUS_UART3>;
> +                       resets =3D <&ccu RST_BUS_UART3>;
> +                       status =3D "disabled";
> +               };
> +
> +               uart4: serial@1c29000 {
> +                       compatible =3D "snps,dw-apb-uart";
> +                       reg =3D <0x01c29000 0x400>;
> +                       interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +                       reg-shift =3D <2>;
> +                       reg-io-width =3D <4>;
> +                       clocks =3D <&ccu CLK_BUS_UART4>;
> +                       resets =3D <&ccu RST_BUS_UART4>;
> +                       status =3D "disabled";
> +               };
> +
> +               rtc: rtc@1f00000 {
> +                       compatible =3D "allwinner,sun6i-a31-rtc";
> +                       reg =3D <0x01f00000 0x54>;
> +                       interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               i2c0: i2c@1c2ac00 {
> +                       compatible =3D "allwinner,sun6i-a31-i2c";
> +                       reg =3D <0x01c2ac00 0x400>;
> +                       interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_I2C0>;
> +                       resets =3D <&ccu RST_BUS_I2C0>;
> +                       status =3D "disabled";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               i2c1: i2c@1c2b000 {
> +                       compatible =3D "allwinner,sun6i-a31-i2c";
> +                       reg =3D <0x01c2b000 0x400>;
> +                       interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_I2C1>;
> +                       resets =3D <&ccu RST_BUS_I2C1>;
> +                       status =3D "disabled";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               i2c2: i2c@1c2b400 {
> +                       compatible =3D "allwinner,sun6i-a31-i2c";
> +                       reg =3D <0x01c2b400 0x400>;
> +                       interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_I2C2>;
> +                       resets =3D <&ccu RST_BUS_I2C2>;
> +                       status =3D "disabled";
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               gic: interrupt-controller@1c81000 {
> +                       compatible =3D "arm,gic-400";
> +                       reg =3D <0x01c81000 0x1000>,
> +                             <0x01c82000 0x2000>,
> +                             <0x01c84000 0x2000>,
> +                             <0x01c86000 0x2000>;
> +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4)=
 | IRQ_TYPE_LEVEL_HIGH)>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <3>;
> +               };
> +       };
> +};
> --
> 2.9.3
>
