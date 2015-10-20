Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 "Stephen Boyd" <sboyd@codeaurora.org>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Magnus Damm" <damm+renesas@opensource.se>,
 "Simon Horman" <horms+renesas@verge.net.au>,
 "Rob Herring" <robh+dt@kernel.org>, "Pawel Moll" <pawel.moll@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Ian Campbell" <ijc+devicetree@hellion.org.uk>,
 "Kumar Gala" <galak@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1444999760-15750-2-git-send-email-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, "Geert Uytterhoeven" <geert+renesas@glider.be>
References: <1444999760-15750-1-git-send-email-geert+renesas@glider.be>
 <1444999760-15750-2-git-send-email-geert+renesas@glider.be>
Message-ID: <20151020101536.20687.93727@quantum>
Subject: Re: [PATCH v4 1/5] [RFC] clk: shmobile: Add new Renesas CPG/MSSR DT bindings
Date: Tue, 20 Oct 2015 03:15:36 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Quoting Geert Uytterhoeven (2015-10-16 05:49:16)
> On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse
> Generator) and MSSR (Module Standby and Software Reset) blocks are
> intimately connected, and share the same register block.
> =

> Hence it makes sense to describe these two blocks using a
> single device node in DT, instead of using a hierarchical structure with
> multiple nodes, using a mix of generic and SoC-specific bindings.
> =

> These new DT bindings are intended to replace the existing DT bindings
> for CPG core clocks ("renesas,*-cpg-clocks", "renesas,cpg-div6-clock")
> and module clocks ("renesas,*-mstp-clocks"), at least for new SoCs.
> =

> This will make it easier to add module reset support later, which is
> currently not implemented, and difficult to achieve using the existing
> bindings due to the intertwined register layout.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for re-working the binding per our discussion at ELC-E. Please
feel free to add my Ack to patches #1 and #2.

Regards,
Mike

> ---
> v4:
>   - No changes,
> =

> v3:
>   - Integrate CPG and MSSR,
> =

> v2:
>   - Switch from MSTP to MSSR.
> ---
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt | 71 ++++++++++++++++=
++++++
>  include/dt-bindings/clock/renesas-cpg-mssr.h       | 15 +++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-m=
ssr.txt
>  create mode 100644 include/dt-bindings/clock/renesas-cpg-mssr.h
> =

> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt=
 b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> new file mode 100644
> index 0000000000000000..a56836aa2131a8db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
> @@ -0,0 +1,71 @@
> +* Renesas Clock Pulse Generator / Module Standby and Software Reset
> +
> +On Renesas ARM SoCs (SH/R-Mobile, R-Car, RZ), the CPG (Clock Pulse Gener=
ator)
> +and MSSR (Module Standby and Software Reset) blocks are intimately conne=
cted,
> +and share the same register block.
> +
> +They provide the following functionalities:
> +  - The CPG block generates various core clocks,
> +  - The MSSR block provides two functions:
> +      1. Module Standby, providing a Clock Domain to control the clock s=
upply
> +        to individual SoC devices,
> +      2. Reset Control, to perform a software reset of individual SoC de=
vices.
> +
> +Required Properties:
> +  - compatible: Must be one of:
> +      - "renesas,r8a7791-cpg-mssr" for the r8a7791 SoC
> +      - "renesas,r8a7795-cpg-mssr" for the r8a7795 SoC
> +
> +  - reg: Base address and length of the memory resource used by the CPG/=
MSSR
> +    block
> +
> +  - clocks: References to external parent clocks, one entry for each ent=
ry in
> +    clock-names
> +  - clock-names: List of external parent clock names. Valid names are:
> +      - "extal" (r8a7791, r8a7795)
> +      - "extalr" (r8a7795)
> +      - "usb_extal" (r8a7791)
> +
> +  - #clock-cells: Must be 2
> +      - For CPG core clocks, the two clock specifier cells must be "CPG_=
CORE"
> +       and a core clock reference, as defined in
> +       <dt-bindings/clock/*-cpg-mssr.h>.
> +      - For module clocks, the two clock specifier cells must be "CPG_MO=
D" and
> +       a module number, as defined in the datasheet.
> +
> +  - #power-domain-cells: Must be 0
> +      - SoC devices that are part of the CPG/MSSR Clock Domain and can be
> +       power-managed through Module Standby should refer to the CPG devi=
ce
> +       node in their "power-domains" property, as documented by the gene=
ric PM
> +       Domain bindings in
> +       Documentation/devicetree/bindings/power/power_domain.txt.
> +
> +
> +Examples
> +--------
> +
> +  - CPG device node:
> +
> +       cpg: clock-controller@e6150000 {
> +               compatible =3D "renesas,r8a7795-cpg-mssr";
> +               reg =3D <0 0xe6150000 0 0x1000>;
> +               clocks =3D <&extal_clk>, <&extalr_clk>;
> +               clock-names =3D "extal", "extalr";
> +               #clock-cells =3D <2>;
> +               #power-domain-cells =3D <0>;
> +       };
> +
> +
> +  - CPG/MSSR Clock Domain member device node:
> +
> +       scif2: serial@e6e88000 {
> +               compatible =3D "renesas,scif-r8a7795", "renesas,scif";
> +               reg =3D <0 0xe6e88000 0 64>;
> +               interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks =3D <&cpg CPG_MOD 310>;
> +               clock-names =3D "sci_ick";
> +               dmas =3D <&dmac1 0x13>, <&dmac1 0x12>;
> +               dma-names =3D "tx", "rx";
> +               power-domains =3D <&cpg>;
> +               status =3D "disabled";
> +       };
> diff --git a/include/dt-bindings/clock/renesas-cpg-mssr.h b/include/dt-bi=
ndings/clock/renesas-cpg-mssr.h
> new file mode 100644
> index 0000000000000000..569a3cc33ffb5bc7
> --- /dev/null
> +++ b/include/dt-bindings/clock/renesas-cpg-mssr.h
> @@ -0,0 +1,15 @@
> +/*
> + * Copyright (C) 2015 Renesas Electronics Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_RENESAS_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_RENESAS_CPG_MSSR_H__
> +
> +#define CPG_CORE                       0       /* Core Clock */
> +#define CPG_MOD                                1       /* Module Clock */
> +
> +#endif /* __DT_BINDINGS_CLOCK_RENESAS_CPG_MSSR_H__ */
> -- =

> 1.9.1
>=20
