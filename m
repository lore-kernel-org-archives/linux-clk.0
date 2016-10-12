Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <5042465.lGNbhCeBLl@wasted.cogentembedded.com>
References: <9246696.7P1aOyyQt4@wasted.cogentembedded.com> <5042465.lGNbhCeBLl@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Oct 2016 13:39:23 +0200
Message-ID: <CAMuHMdWrowTK8KxthrEO0DNHsBn-_PyY0GcRCc38wY6iynshiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: shmobile: r8a7743: add CPG clock index macros
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Fri, Oct 7, 2016 at 10:46 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add macros usable by the device tree sources to reference the R8A7743 CPG
> clocks  by index.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

It would be good to refer to the table and version of the datasheet
(i.e. Table 7.2b, I have Rev. 0.50 of the RZ/G series User's Manual).

> --- /dev/null
> +++ renesas/include/dt-bindings/clock/r8a7743-cpg-mssr.h
> @@ -0,0 +1,43 @@
> +/*
> + * Copyright (C) 2016 Cogent Embedded Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A7743_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A7743_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a7743 CPG Core Clocks */
> +#define R8A7743_CLK_Z          0
> +#define R8A7743_CLK_ZG         1
> +#define R8A7743_CLK_ZTR                2
> +#define R8A7743_CLK_ZTRD2      3
> +#define R8A7743_CLK_ZT         4
> +#define R8A7743_CLK_ZX         5
> +#define R8A7743_CLK_ZS         6
> +#define R8A7743_CLK_HP         7

In this particular case, I think we should leave holes in the numbering for
clocks that exist on r8a7791. That way we can easily reuse the driver on
r8a7791 later, and NULLify the entries for clocks that do not exist on r8a7743.

I.e. a one entry hole here, ...

> +#define R8A7743_CLK_B          8
> +#define R8A7743_CLK_LB         9
> +#define R8A7743_CLK_P          10
> +#define R8A7743_CLK_CL         11
> +#define R8A7743_CLK_M2         12

... a one entry hole here, ...

> +#define R8A7743_CLK_ZB3                13
> +#define R8A7743_CLK_ZB3D2      14
> +#define R8A7743_CLK_DDR                15
> +#define R8A7743_CLK_SDH                16
> +#define R8A7743_CLK_SD0                17
> +#define R8A7743_CLK_SD2                18
> +#define R8A7743_CLK_SD3                19
> +#define R8A7743_CLK_MMC0       20
> +#define R8A7743_CLK_MP         21

... and a two entry hole here.

> +#define R8A7743_CLK_QSPI       22
> +#define R8A7743_CLK_CP         23
> +#define R8A7743_CLK_RCAN       24
> +#define R8A7743_CLK_R          25
> +#define R8A7743_CLK_OSC                26
> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A7743_CPG_MSSR_H__ */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
