Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 22 Sep 2015 14:47:08 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 5/5] ARM: sun5i: Add C.H.I.P DTS
Message-ID: <20150922124708.GZ4684@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
 <1442566130-3497-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64E-gQu1U_qi2fTWiCmfgMdMR4X6yLUerV21d3E1uQ1cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UqCbVBp1ux8j3oph"
In-Reply-To: <CAGb2v64E-gQu1U_qi2fTWiCmfgMdMR4X6yLUerV21d3E1uQ1cw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--UqCbVBp1ux8j3oph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2015 at 12:41:07AM +0800, Chen-Yu Tsai wrote:
> On Fri, Sep 18, 2015 at 4:48 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The C.H.I.P. is a small SBC with an Allwinner R8, 8GB of NAND, 512MB of
> > RAM, USB host and OTG, a wifi / bluetooth combo chip, an audio/video ja=
ck
> > and two connectors to plug additional boards on top of it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/Makefile          |   3 +-
> >  arch/arm/boot/dts/sun5i-r8-chip.dts | 261 ++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 263 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/boot/dts/sun5i-r8-chip.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index b276174b670a..7efd37b907f1 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -599,7 +599,8 @@ dtb-$(CONFIG_MACH_SUN5I) +=3D \
> >         sun5i-a13-inet-98v-rev2.dtb \
> >         sun5i-a13-olinuxino.dtb \
> >         sun5i-a13-olinuxino-micro.dtb \
> > -       sun5i-a13-utoo-p66.dtb
> > +       sun5i-a13-utoo-p66.dtb \
> > +       sun5i-r8-chip.dtb
> >  dtb-$(CONFIG_MACH_SUN6I) +=3D \
> >         sun6i-a31-app4-evb1.dtb \
> >         sun6i-a31-colombus.dtb \
> > diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/su=
n5i-r8-chip.dts
> > new file mode 100644
> > index 000000000000..6cb3c4f1cd61
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
> > @@ -0,0 +1,261 @@
> > +/*
> > + * Copyright 2015 Free Electrons
> > + * Copyright 2015 NextThing Co
> > + *
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
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
> > +/dts-v1/;
> > +#include "sun5i-a13.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +       model =3D "NextThing C.H.I.P.";
> > +       compatible =3D "nextthing,chip", "allwinner,sun5i-r8";
> > +
> > +       aliases {
> > +               i2c0 =3D &i2c0;
> > +               i2c1 =3D &i2c1;
> > +               i2c2 =3D &i2c2;
> > +               serial0 =3D &uart1;
> > +               serial1 =3D &uart3;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path =3D "serial0:115200n8";
> > +       };
> > +
> > +       dram_vcc: dram_vcc {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "dram-vcc";
> > +               regulator-min-microvolt =3D <1600000>;
> > +               regulator-max-microvolt =3D <1600000>;
> > +               vin-supply =3D <&ipsout>;
> > +               regulator-always-on;
> > +       };
>=20
> Do we need this if it's not controllable?

Probably not, except if we want a comprehensive regulator tree.

> > +
> > +       ipsout: ipsout {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "ipsout";
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               regulator-always-on;
> > +       };
>=20
> This isn't needed. What we might want is a proper representation
> of the AXP209's power supply.

Probably.

> > +
> > +       usb0_vbus: usb0_vbus {
> > +               compatible =3D "regulator-fixed";
> > +               pinctrl-names =3D "default";
> > +               pinctrl-0 =3D <&chip_vbus_pin>;
> > +
> > +               regulator-name =3D "vbus-usb0";
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               vin-supply =3D <&vcc_5v0>;
> > +               gpio =3D <&pio 1 10 GPIO_ACTIVE_HIGH>; /* PB10 */
> > +               enable-active-high;
> > +       };
> > +
> > +       vcc_3v3: vcc3v3 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc-3v3";
> > +               regulator-min-microvolt =3D <3300000>;
> > +               regulator-max-microvolt =3D <3300000>;
> > +               vin-supply =3D <&ipsout>;
> > +               regulator-always-on;
> > +       };
> > +
> > +       vcc_5v0: vcc5v0 {
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "vcc-5v0";
> > +               regulator-min-microvolt =3D <5000000>;
> > +               regulator-max-microvolt =3D <5000000>;
> > +               vin-supply =3D <&ipsout>;
> > +               regulator-always-on;
> > +       };
>=20
> We have these in sunxi-common-regulators.dtsi.

True, I'll change that.

>=20
> > +};
> > +
> > +&ehci0 {
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c0 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c0_pins_a>;
> > +       status =3D "okay";
> > +
> > +       axp209: pmic@34 {
> > +               reg =3D <0x34>;
> > +
> > +               /*
> > +                * The interrupt is routed through the "External Fast
> > +                 * Interrupt Request" pin (ball G13 of the module)
> > +                 * directly to the main interrupt controller, without
> > +                 * any other controller interfering.
> > +                */
> > +               interrupts =3D <0>;
> > +       };
> > +};
> > +
> > +#include "axp209.dtsi"
> > +
> > +/*
> > + * i2c1 is routed to the external pins and doesn't have any device
> > + * attached to it on the C.H.I.P itself.
> > + */
> > +&i2c1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c1_pins_a>;
> > +       status =3D "okay";
> > +};
> > +
> > +&i2c2 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&i2c2_pins_a>;
> > +       status =3D "okay";
> > +
> > +       xio: gpio@38 {
> > +               compatible =3D "nxp,pcf8574a";
> > +               reg =3D <0x38>;
> > +
> > +               gpio-controller;
> > +               #gpio-cells =3D <2>;
> > +
> > +               interrupt-parent =3D <&pio>;
> > +               interrupts =3D <6 0 IRQ_TYPE_EDGE_FALLING>;
> > +               interrupt-controller;
> > +               #interrupt-cells =3D <2>;
> > +       };
> > +};
> > +
> > +&mmc0 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&mmc0_pins_a>;
> > +       vmmc-supply =3D <&vcc_3v3>;
> > +       bus-width =3D <4>;
> > +       non-removable;
> > +       status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> > +       status =3D "okay";
> > +};
> > +
> > +&otg_sram {
> > +       status =3D "okay";
> > +};
> > +
> > +&pio {
> > +       chip_vbus_pin: chip_vbus_pin@0 {
> > +               allwinner,pins =3D "PB10";
> > +               allwinner,function =3D "gpio_out";
> > +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > +               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > +       };
> > +
> > +       chip_id_det_pin: chip_id_det_pin@0 {
> > +               allwinner,pins =3D "PG2";
> > +               allwinner,function =3D "gpio_in";
> > +               allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> > +               allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> > +       };
> > +};
> > +
> > +&reg_dcdc2 {
> > +       regulator-min-microvolt =3D <1000000>;
> > +       regulator-max-microvolt =3D <1400000>;
> > +       regulator-name =3D "cpuvdd";
> > +       regulator-always-on;
> > +};
> > +
> > +&reg_dcdc3 {
> > +       regulator-min-microvolt =3D <1000000>;
> > +       regulator-max-microvolt =3D <1300000>;
> > +       regulator-name =3D "corevdd";
> > +       regulator-always-on;
> > +};
> > +
> > +&reg_ldo1 {
> > +       regulator-name =3D "rtcvdd";
> > +};
> > +
> > +&reg_ldo2 {
> > +       regulator-min-microvolt =3D <2700000>;
> > +       regulator-max-microvolt =3D <3300000>;
>=20
> Maybe just fix this to 3.0V?

Those are constraints that the board can accept. We have that
information, why lie about it?

>=20
> > +       regulator-name =3D "avcc";
> > +       regulator-always-on;
> > +};
> > +
> > +&reg_ldo5 {
> > +       regulator-min-microvolt =3D <1800000>;
> > +       regulator-max-microvolt =3D <1800000>;
> > +       regulator-name =3D "vcc-1v8";
>=20
> A comment here saying this is found on the header, and to be used
> by overlays would be nice.

There's open schematics for that kind of information.

> > +};
> > +
> > +&uart1 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&uart1_pins_b>;
> > +       status =3D "okay";
> > +};
> > +
> > +&uart3 {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&uart3_pins_a>,
> > +                   <&uart3_pins_cts_rts_a>;
> > +       status =3D "okay";
> > +};
> > +
> > +&usb_otg {
> > +       dr_mode =3D "otg";
> > +       status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&chip_id_det_pin>;
> > +       status =3D "okay";
> > +
> > +       usb0_id_det-gpio =3D <&pio 6 2 GPIO_ACTIVE_HIGH>; /* PG2 */
>=20
> Better leave a comment here saying VBUS detection requires AXP209
> usb-power-supply support.

Does it? It can be powered by a battery, with or without VBUS, and
that wouldn't be tied to the fact that the power-supply is USB or
something else.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--UqCbVBp1ux8j3oph
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWAU3MAAoJEBx+YmzsjxAgDdoQAKX07tazECRcU+rYoQ8Coxjf
2aiSTnIu18uxKD5kXI/1dimQy3WQWb62oOKRXQXsXjWOekU5t4uk7lQjzUkPzTdQ
6Yx5URSBWWCftNdIvyPCVY44F8DnOJ2vFaOLkHuCTF0m3gnJomjwIvVmhG+STGci
JcEgLGSMWzYzBeVVFU3MHxqW7YOO52oWEl85Va2J4colDVpDO38WN9meJqfOfvMV
4riwIseUvvxk3RPSoU91Dcw9OR10v69809ud/AnskQEambSmQKEjTblhvOSPrySQ
AU8FwLh3xdchE1y8d2Isx4XdVo40KM7W83JKFeHI9U2UgHuUmBA7IAZdADBqBU/R
ki+oox4fNb+fkpuN0DR19AzamubYqvQ4m5o+V8zZ2680RNe/kLku+K1w8jscDczo
4URJveKrOQbNPfcLhfH83StUY3bBcQ2CUbvPf3oju+eQORuPSl/vQN+9KAHRLOq3
JDVs9zKUEH9ycv/A95bpumHBvmh8G/NhZL6JrefjeRGMj7NuD9Idi/UGdnQxqSKC
y2bF5k8L9du4qiFdRqYCrh05h2qn2vGIab7wDkRqusY/oIdhJFcV9ZhKywxNp66e
DBHgCj4GqOXhlbVFXfAXzPsrxN0pY7z6GC1woSdndlOovfZDBMadbimvN6KIlyzI
dTlrzVjSnY1kcfxY71O4
=eQIS
-----END PGP SIGNATURE-----

--UqCbVBp1ux8j3oph--
