Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
References: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Aug 2017 09:23:51 +0200
Message-ID: <CAMuHMdV0garQZ-5tinC_95UVb172mfW5saff8axnMRAy8KUtCQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: renesas: Add R-Car D3 support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 20, 2017 at 2:40 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series adds support for clocks on the R-Car D3 SoC.
>
> As usual, this is meant to be queued up in clk-renesas-for-v4.14.

Done.

> Geert Uytterhoeven (4):
>   clk: renesas: Add r8a77995 CPG Core Clock Definitions
>   clk: renesas: rcar-gen3: Add divider support for PLL1 and PLL3
>   clk: renesas: rcar-gen3: Add support for SCCG/Clean peripheral clocks
>   clk: renesas: cpg-mssr: Add R8A77995 support
>
>  .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-
>  drivers/clk/renesas/Kconfig                        |   5 +
>  drivers/clk/renesas/Makefile                       |   1 +
>  drivers/clk/renesas/r8a7795-cpg-mssr.c             |  34 +--
>  drivers/clk/renesas/r8a7796-cpg-mssr.c             |  34 +--
>  drivers/clk/renesas/r8a77995-cpg-mssr.c            | 236 +++++++++++++++++++++
>  drivers/clk/renesas/rcar-gen3-cpg.c                |  22 +-
>  drivers/clk/renesas/rcar-gen3-cpg.h                |  15 +-
>  drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
>  drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
>  include/dt-bindings/clock/r8a77995-cpg-mssr.h      |  57 +++++
>  11 files changed, 375 insertions(+), 39 deletions(-)
>  create mode 100644 drivers/clk/renesas/r8a77995-cpg-mssr.c
>  create mode 100644 include/dt-bindings/clock/r8a77995-cpg-mssr.h

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
