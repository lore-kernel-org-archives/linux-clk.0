Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <9008a12c-e5c8-9289-c47b-50ea9e049c67@cogentembedded.com>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <9008a12c-e5c8-9289-c47b-50ea9e049c67@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Feb 2018 20:18:24 +0100
Message-ID: <CAMuHMdVScQSc6O10XuA9jcmGpn6ifSRQpF6-Kauz=yc56zyNWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: cpg-mssr: add R8A77980 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Wed, Jan 31, 2018 at 9:31 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add R-Car V3H (R8A77980) Clock Pulse Generator / Module Standby and
> Software Reset support,  using the CPG/MSSR driver core and the common
> R-Car Gen3 code.
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- /dev/null
> +++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * r8a77980 Clock Pulse Generator / Module Standby and Software Reset
> + *
> + * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018 Cogent Embedded, Inc.
> + *
> + * Based on r8a7795-cpg-mssr.c
> + *
> + * Copyright (C) 2016 Renesas Electronics Corp.

Interesting, the above copyright line isn't present in r8a7795-cpg-mssr.c?

> +static const struct mssr_mod_clk r8a77980_mod_clks[] __initconst = {
> +       DEF_MOD("tmu4",                  121,   R8A77980_CLK_S0D6),
> +       DEF_MOD("tmu3",                  122,   R8A77980_CLK_S0D6),
> +       DEF_MOD("tmu2",                  123,   R8A77980_CLK_S0D6),
> +       DEF_MOD("tmu1",                  124,   R8A77980_CLK_S0D6),
> +       DEF_MOD("tmu0",                  125,   R8A77980_CLK_CP),
> +       DEF_MOD("scif4",                 203,   R8A77980_CLK_S3D4),
> +       DEF_MOD("scif3",                 204,   R8A77980_CLK_S3D4),
> +       DEF_MOD("scif1",                 206,   R8A77980_CLK_S3D4),
> +       DEF_MOD("scif0",                 207,   R8A77980_CLK_S3D4),
> +       DEF_MOD("msiof3",                208,   R8A77980_CLK_MSO),
> +       DEF_MOD("msiof2",                209,   R8A77980_CLK_MSO),
> +       DEF_MOD("msiof1",                210,   R8A77980_CLK_MSO),
> +       DEF_MOD("msiof0",                211,   R8A77980_CLK_MSO),
> +       DEF_MOD("sys-dmac2",             217,   R8A77980_CLK_S0D3),
> +       DEF_MOD("sys-dmac1",             218,   R8A77980_CLK_S0D3),
> +       DEF_MOD("tpu0",                  304,   R8A77980_CLK_S3D4),
> +       DEF_MOD("sdif",                  314,   R8A77980_CLK_SD0), /* OK */

Please remove the "OK" comment.

> +       DEF_MOD("pciec0",                319,   R8A77980_CLK_S3D1),
> +       DEF_MOD("intc-ex",               407,   R8A77980_CLK_CP), /* OK */

Please remove the "OK" comment.

> +       DEF_MOD("intc-ap",               408,   R8A77980_CLK_S0D3),
> +       DEF_MOD("hscif3",                517,   R8A77980_CLK_S3D1),
> +       DEF_MOD("hscif2",                518,   R8A77980_CLK_S3D1),
> +       DEF_MOD("hscif1",                519,   R8A77980_CLK_S3D1),
> +       DEF_MOD("hscif0",                520,   R8A77980_CLK_S3D1),
> +       DEF_MOD("imp4",                  521,   R8A77980_CLK_S1D1), /* OK? */

Please remove the "OK" comment.

I couldn't verify all parent clocks though, especially for multimedia-related
blocks.

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
