Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <87a7ouqdnm.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7ouqdnm.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Sep 2018 11:07:40 +0200
Message-ID: <CAMuHMdUUW2PW2s3enOV+nr4_gBMTFuQ2tBLXd0wrD_Jot+F-BQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: convert to SPDX identifiers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Morimoto-san,

On Fri, Sep 7, 2018 at 3:57 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> ---
>  drivers/clk/renesas/Kconfig               |  2 ++
>  drivers/clk/renesas/clk-div6.c            |  5 +----
>  drivers/clk/renesas/clk-emev2.c           | 14 +-------------
>  drivers/clk/renesas/clk-mstp.c            |  5 +----
>  drivers/clk/renesas/clk-r8a73a4.c         |  5 +----
>  drivers/clk/renesas/clk-r8a7740.c         |  5 +----
>  drivers/clk/renesas/clk-r8a7778.c         |  5 +----
>  drivers/clk/renesas/clk-r8a7779.c         |  5 +----
>  drivers/clk/renesas/clk-rcar-gen2.c       |  5 +----
>  drivers/clk/renesas/clk-rz.c              |  5 +----
>  drivers/clk/renesas/clk-sh73a0.c          |  5 +----
>  drivers/clk/renesas/r8a7743-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a7745-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a7790-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a7791-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a7792-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a7794-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a7795-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a7796-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/r8a77970-cpg-mssr.c   |  5 +----
>  drivers/clk/renesas/r8a77995-cpg-mssr.c   |  5 +----
>  drivers/clk/renesas/rcar-gen2-cpg.c       |  5 +----
>  drivers/clk/renesas/rcar-gen2-cpg.h       |  7 ++-----
>  drivers/clk/renesas/rcar-gen3-cpg.c       |  5 +----
>  drivers/clk/renesas/rcar-gen3-cpg.h       |  7 ++-----
>  drivers/clk/renesas/rcar-usb2-clock-sel.c |  5 +----
>  drivers/clk/renesas/renesas-cpg-mssr.c    |  5 +----
>  drivers/clk/renesas/renesas-cpg-mssr.h    |  7 ++-----
>  include/linux/clk/renesas.h               |  8 ++------
>  29 files changed, 34 insertions(+), 126 deletions(-)

This duplicates some of the work by Wolfram, which was already applied:

commit e848c2ea117f222b62715d5c4e1714ec4e0aa647
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date:   Wed Aug 22 00:02:14 2018 +0200

    clk: renesas: use SPDX identifier for Renesas drivers

    Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
    Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
    Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Signed-off-by: Stephen Boyd <sboyd@kernel.org>

 drivers/clk/renesas/clk-div6.c            | 5 +----
 drivers/clk/renesas/r8a7795-cpg-mssr.c    | 5 +----
 drivers/clk/renesas/r8a7796-cpg-mssr.c    | 5 +----
 drivers/clk/renesas/r8a77995-cpg-mssr.c   | 5 +----
 drivers/clk/renesas/rcar-gen3-cpg.c       | 5 +----
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 5 +----
 drivers/clk/renesas/renesas-cpg-mssr.c    | 5 +----
 drivers/clk/renesas/renesas-cpg-mssr.h    | 5 +----
 8 files changed, 8 insertions(+), 32 deletions(-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
