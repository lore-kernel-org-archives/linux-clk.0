Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35443 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751507AbeFWOuF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Jun 2018 10:50:05 -0400
MIME-Version: 1.0
References: <20180622124540.56203-1-icenowy@aosc.io> <20180622124540.56203-4-icenowy@aosc.io>
 <CAGRGNgUuEjmEcvJ3OUcQ9_6bPs9fDvKzUFm_NfCsYyjxVOVw3A@mail.gmail.com> <3BDC9318-95A5-41BA-801E-6E0814249AFB@aosc.io>
In-Reply-To: <3BDC9318-95A5-41BA-801E-6E0814249AFB@aosc.io>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Sun, 24 Jun 2018 00:49:50 +1000
Message-ID: <CAGRGNgUkVjEmhQS4pTezfhmiOQkCERV-w=aA+i4oLN7C8k4Vnw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v2 5/7] arm64: allwinner: a64: add necessary
 device tree nodes for DE2 CCU
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, jagan@amarulasolutions.com,
        jernej.skrabec@siol.net, devicetree <devicetree@vger.kernel.org>,
        "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Icenowy,

On Sun, Jun 24, 2018 at 12:34 AM Icenowy Zheng <icenowy@aosc.io> wrote:
>
>
>
> =E4=BA=8E 2018=E5=B9=B46=E6=9C=8823=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
10:06:27, Julian Calaby <julian.calaby@gmail.com> =E5=86=99=E5=88=B0:
> >Hi Icenowy,
> >
> >On Fri, Jun 22, 2018 at 10:49 PM Icenowy Zheng <icenowy@aosc.io> wrote:
> >>
> >> As we have all necessary parts to enable the DE2 CCU on the Allwinner
> >> A64 SoC, add the needed device tree nodes, including the DE2 CCU
> >itself
> >> and the DE2 bus.
> >>
> >> The "mixer0-lcd0" simplefb device node is updated to use the DE2 CCU.
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> ---
> >> Changes in v2:
> >> - Drop SRAM controller device tree node addition (as it's already
> >added
> >>   as part of syscon change.)
> >> - Fix the clock reference in LCD SimpleFB.
> >>
> >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 30
> >+++++++++++++++----
> >>  1 file changed, 24 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> index ff2ddde1e117..318c4ba8ae9f 100644
> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >> @@ -58,17 +60,12 @@
> >>                 #size-cells =3D <1>;
> >>                 ranges;
> >>
> >> -/*
> >> - * The pipeline mixer0-lcd0 depends on clock CLK_MIXER0 from DE2
> >CCU.
> >> - * However there is no support for this clock on A64 yet, so we
> >depend
> >> - * on the upstream clocks here to keep them (and thus CLK_MIXER0)
> >up.
> >> - */
> >>                 simplefb_lcd: framebuffer-lcd {
> >>                         compatible =3D "allwinner,simple-framebuffer",
> >>                                      "simple-framebuffer";
> >>                         allwinner,pipeline =3D "mixer0-lcd0";
> >>                         clocks =3D <&ccu CLK_TCON0>,
> >> -                                <&ccu CLK_DE>, <&ccu CLK_BUS_DE>;
> >> +                                <&display_clocks CLK_MIXER0>;
> >
> >Doesn't this technically break simplefb if this DT is used with a
> >Linux that doesn't have the display clock driver?
>
> 1. DT doesn't care forware compatibility.

Ah, fair enough, that answers my question.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
