Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: elaine.zhang@rock-chips.com, mturquette@baylibre.com, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] ARM: dts: add basic support for Rockchip RK1108 SOC
Date: Tue, 08 Nov 2016 14:20:17 +0100
Message-ID: <2018991.LuBz7Cl7BQ@diego>
In-Reply-To: <0516ad0b-bfbe-ec80-fdb6-e118dab3e758@rock-chips.com>
References: <1478175975-11779-1-git-send-email-andy.yan@rock-chips.com> <1788707.rfxhNfegGu@phil> <0516ad0b-bfbe-ec80-fdb6-e118dab3e758@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 8. November 2016, 20:31:55 schrieb Andy Yan:
> Hi Heiko:
>=20
> On 2016=E5=B9=B411=E6=9C=8804=E6=97=A5 16:00, Heiko Stuebner wrote:
> > Am Donnerstag, 3. November 2016, 20:40:48 CET schrieb Andy Yan:

> >> +=09gic: interrupt-controller@32010000 {
> >> +=09=09compatible =3D "arm,cortex-a15-gic";
> >=20
> > compatible =3D "arm,gic-400"; ?
> >=20
> >> +=09=09interrupt-controller;
> >> +=09=09#interrupt-cells =3D <3>;
> >> +=09=09#address-cells =3D <0>;
> >> +
> >> +=09=09reg =3D <0x32011000 0x1000>,
> >> +=09=09      <0x32012000 0x1000>;
> >=20
> > please provide all 4 register areas and also the interrupt (
>=20
>      I only found 2 register areas in our rockchip linux 3.10 source
> code. And haven't found the interrupt. From the arm,gic bindings, the=

> interrupt property is optional. So am not sure if we
> really need it here.

Devicetree is a hardware description, so it's not a factor if we "need"=
 it but=20
only if it is present in the hardware. And we really want this informat=
ion to=20
be complete, as these additional areas are necessary if someone wants t=
o use=20
the virtualization extensions the cortext-A7 does contain.

The gic is a very standard component and the gic400 used here should de=
finitly=20
have those two additional areas as well as the interrupt.

I think the memory areas are pretty standard and should be for the rk11=
08:
reg =3D <0x32011000 0x1000>,
      <0x32012000 0x1000>,
      <0x32014000 0x2000>,
      <0x32016000 0x2000>;

The TRM talks about 128 SPI and 3 PPI interrupts but the irq-list does =
not=20
contain them, so this seems to be an error in the TRM, as the gic inter=
rupt=20
should be one of those PPI interrupts.


Heiko
