Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 20 Oct 2016 19:49:35 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [linux-sunxi] [PATCH v4 7/9] arm64: dts: add Allwinner A64 SoC
 .dtsi
Message-ID: <20161020174935.ue54me3ber2o3xuq@lukather>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <41ac6bd7d95fcabcae23ed4356f5f72b3aaf282d.1476196031.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65X5Gzx7H_jgLt80MY8tOrwgLX_uYrHo49-mScPsanJ2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jefwn473kip65nfq"
In-Reply-To: <CAGb2v65X5Gzx7H_jgLt80MY8tOrwgLX_uYrHo49-mScPsanJ2g@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--jefwn473kip65nfq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 11:14:05PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 11, 2016 at 10:28 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > From: Andre Przywara <andre.przywara@arm.com>
> >
> > The Allwinner A64 SoC is a low-cost chip with 4 ARM Cortex-A53 cores
> > and the typical tablet / TV box peripherals.
> > The SoC is based on the (32-bit) Allwinner H3 chip, sharing most of
> > the peripherals and the memory map.
> > Although the cores are proper 64-bit ones, the whole SoC is actually
> > limited to 4GB (including all the supported DRAM), so we use 32-bit
> > address and size cells. This has the nice feature of us being able to
> > reuse the DT for 32-bit kernels as well.
> > This .dtsi lists the hardware that we support so far.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> > [Maxime: Convert to CCU binding, drop the MMC support for now]
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  Documentation/devicetree/bindings/arm/sunxi.txt |   1 +-
> >  MAINTAINERS                                     |   1 +-
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi   | 263 ++++++++++++++++=
+-
> >  3 files changed, 265 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >
> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Document=
ation/devicetree/bindings/arm/sunxi.txt
> > index 3975d0a0e4c2..4d6467cc2aa2 100644
> > --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> > +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> > @@ -14,4 +14,5 @@ using one of the following compatible strings:
> >    allwinner,sun8i-a83t
> >    allwinner,sun8i-h3
> >    allwinner,sun9i-a80
> > +  allwinner,sun50i-a64
> >    nextthing,gr8
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7be47efb2159..926879c05dc6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -983,6 +983,7 @@ L:  linux-arm-kernel@lists.infradead.org (moderated=
 for non-subscribers)
> >  S:     Maintained
> >  N:     sun[x456789]i
> >  F:     arch/arm/boot/dts/ntc-gr8*
> > +F:     arch/arm64/boot/dts/allwinner/
> >
> >  ARM/Allwinner SoC Clock Support
> >  M:     Emilio L=F3pez <emilio@elopez.com.ar>
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64=
/boot/dts/allwinner/sun50i-a64.dtsi
> > new file mode 100644
> > index 000000000000..0f75fec23dc9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -0,0 +1,263 @@
> > +/*
> > + * Copyright (C) 2016 ARM Ltd.
> > + * based on the Allwinner H3 dtsi:
> > + *    Copyright (C) 2015 Jens Kuske <jenskuske@gmail.com>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of =
the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include <dt-bindings/clock/sun50i-a64-ccu.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/pinctrl/sun4i-a10.h>
> > +#include <dt-bindings/reset/sun50i-a64-ccu.h>
> > +
> > +/ {
> > +       interrupt-parent =3D <&gic>;
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <1>;
> > +
> > +       cpus {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               cpu0: cpu@0 {
> > +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                       device_type =3D "cpu";
> > +                       reg =3D <0>;
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               cpu1: cpu@1 {
> > +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                       device_type =3D "cpu";
> > +                       reg =3D <1>;
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               cpu2: cpu@2 {
> > +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                       device_type =3D "cpu";
> > +                       reg =3D <2>;
> > +                       enable-method =3D "psci";
> > +               };
> > +
> > +               cpu3: cpu@3 {
> > +                       compatible =3D "arm,cortex-a53", "arm,armv8";
> > +                       device_type =3D "cpu";
> > +                       reg =3D <3>;
> > +                       enable-method =3D "psci";
> > +               };
> > +       };
> > +
> > +       osc24M: osc24M_clk {
> > +               #clock-cells =3D <0>;
> > +               compatible =3D "fixed-clock";
> > +               clock-frequency =3D <24000000>;
> > +               clock-output-names =3D "osc24M";
> > +       };
> > +
> > +       osc32k: osc32k_clk {
> > +               #clock-cells =3D <0>;
> > +               compatible =3D "fixed-clock";
> > +               clock-frequency =3D <32768>;
> > +               clock-output-names =3D "osc32k";
> > +       };
> > +
> > +       psci {
> > +               compatible =3D "arm,psci-0.2";
> > +               method =3D "smc";
> > +       };
> > +
> > +       timer {
> > +               compatible =3D "arm,armv8-timer";
> > +               interrupts =3D <GIC_PPI 13
> > +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> > +                            <GIC_PPI 14
> > +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> > +                            <GIC_PPI 11
> > +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> > +                            <GIC_PPI 10
> > +                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> > +       };
> > +
> > +       soc {
> > +               compatible =3D "simple-bus";
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <1>;
> > +               ranges;
> > +
> > +               ccu: clock@01c20000 {
> > +                       compatible =3D "allwinner,sun50i-a64-ccu";
> > +                       reg =3D <0x01c20000 0x400>;
> > +                       clocks =3D <&osc24M>, <&osc32k>;
> > +                       clock-names =3D "hosc", "losc";
> > +                       #clock-cells =3D <1>;
> > +                       #reset-cells =3D <1>;
> > +               };
> > +
> > +               pio: pinctrl@1c20800 {
> > +                       compatible =3D "allwinner,sun50i-a64-pinctrl";
> > +                       reg =3D <0x01c20800 0x400>;
> > +                       interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&ccu CLK_BUS_PIO>;
> > +                       gpio-controller;
> > +                       #gpio-cells =3D <3>;
> > +                       interrupt-controller;
> > +                       #interrupt-cells =3D <2>;
>=20
> I think this should be 3? <bank index flags>?
>=20
> > +
> > +                       i2c1_pins: i2c1_pins {
> > +                               allwinner,pins =3D "PH2", "PH3";
> > +                               allwinner,function =3D "i2c1";
> > +                       };
> > +
> > +                       uart0_pins_a: uart0@0 {
> > +                               allwinner,pins =3D "PB8", "PB9";
> > +                               allwinner,function =3D "uart0";
> > +                       };
> > +               };
> > +
> > +               uart0: serial@1c28000 {
> > +                       compatible =3D "snps,dw-apb-uart";
> > +                       reg =3D <0x01c28000 0x400>;
> > +                       interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +                       reg-shift =3D <2>;
> > +                       reg-io-width =3D <4>;
> > +                       clocks =3D <&ccu CLK_BUS_UART0>;
> > +                       resets =3D <&ccu RST_BUS_UART0>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               uart1: serial@1c28400 {
> > +                       compatible =3D "snps,dw-apb-uart";
> > +                       reg =3D <0x01c28400 0x400>;
> > +                       interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> > +                       reg-shift =3D <2>;
> > +                       reg-io-width =3D <4>;
> > +                       clocks =3D <&ccu CLK_BUS_UART1>;
> > +                       resets =3D <&ccu RST_BUS_UART1>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               uart2: serial@1c28800 {
> > +                       compatible =3D "snps,dw-apb-uart";
> > +                       reg =3D <0x01c28800 0x400>;
> > +                       interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> > +                       reg-shift =3D <2>;
> > +                       reg-io-width =3D <4>;
> > +                       clocks =3D <&ccu CLK_BUS_UART2>;
> > +                       resets =3D <&ccu RST_BUS_UART2>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               uart3: serial@1c28c00 {
> > +                       compatible =3D "snps,dw-apb-uart";
> > +                       reg =3D <0x01c28c00 0x400>;
> > +                       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > +                       reg-shift =3D <2>;
> > +                       reg-io-width =3D <4>;
> > +                       clocks =3D <&ccu CLK_BUS_UART3>;
> > +                       resets =3D <&ccu RST_BUS_UART3>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               uart4: serial@1c29000 {
> > +                       compatible =3D "snps,dw-apb-uart";
> > +                       reg =3D <0x01c29000 0x400>;
> > +                       interrupts =3D <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> > +                       reg-shift =3D <2>;
> > +                       reg-io-width =3D <4>;
> > +                       clocks =3D <&ccu CLK_BUS_UART4>;
> > +                       resets =3D <&ccu RST_BUS_UART4>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               rtc: rtc@1f00000 {
> > +                       compatible =3D "allwinner,sun6i-a31-rtc";
> > +                       reg =3D <0x01f00000 0x54>;
> > +                       interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> > +               };
>=20
> Should sort by address.
>=20
> You can keep my Ack after fixing these.

Indeed, fixed.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jefwn473kip65nfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCQOuAAoJEBx+YmzsjxAgBE8QAL/94iqGfKO1KmNqOCCcEYRL
YDj7BQ+PfMF0UHp0PU44HkROltErr1TlKbi+7E+LuTA2gdDB6CuS+en7pJGDGDpl
Z7liV11k1PytB1UpVzxbGynMrqzE/4UP9IWUa0/hGS7pQZDMhvfExaeck5F+uzfE
MrWuBoMvilFzIfb7DEyugHu5f2YvAb2OLnCA+iZ3iZToi/HFpu8e8dtrOO+iaSBa
DkdxXQpLwWSmRddchIyUopyiAn0uwSkk1wpFGp+JFwDU9A2ETZcEJyhk4YtlN+bN
Qhdhygd/sa5e4uEuDbw0v331Fkz063gKN6KfeKnIt3BTU4RxJ6Y9ttcBdJqk0ozn
KHha9LaY4b4OC74h5Dqwtq7sn3mYE2GWn9FGDkZ70d/HvPRPbWmaDgYWFIwCqKAC
Heriv4fYULhyr9i7SWZE2qX0CGQLE98tFra6RCWNvrQVzH4mEuj8EnOcpizrP9Ph
bzgRzHCrWChJ5vORxo8evlfI4C8rA3jAlnaAUEgwXt29qJ7o1TSQNq1zBETWNDXt
O85qDRgLB1NT0WrzLMmI2PgvH3CUQCmKhJ5n0CCh+J727cY42nN33r6VFQ5ruHmd
DfmdgOe10V2zu1vr7z+X6Hj0iu6M8XaTixw26p/rzHxu2msGxwO3l6OmM7EF3tvv
rUSeU9C29hJaH3U+MLGY
=5eS8
-----END PGP SIGNATURE-----

--jefwn473kip65nfq--
