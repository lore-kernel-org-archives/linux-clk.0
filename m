Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180821220233.9202-1-wsa+renesas@sang-engineering.com> <20180821220233.9202-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180821220233.9202-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 11:24:09 +0200
Message-ID: <CAMuHMdWcrpzit40X_z_hJrCSgupnnucPF0nciPiAiJP8EOX+TA@mail.gmail.com>
Subject: Re: [PATCH 01/11] clk: renesas: use SPDX identifier for Renesas drivers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram,

On Wed, Aug 22, 2018 at 12:02 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  drivers/clk/renesas/clk-div6.c            | 5 +----
>  drivers/clk/renesas/r8a7795-cpg-mssr.c    | 5 +----
>  drivers/clk/renesas/r8a7796-cpg-mssr.c    | 5 +----
>  drivers/clk/renesas/r8a77995-cpg-mssr.c   | 5 +----
>  drivers/clk/renesas/rcar-gen3-cpg.c       | 5 +----
>  drivers/clk/renesas/rcar-usb2-clock-sel.c | 5 +----
>  drivers/clk/renesas/renesas-cpg-mssr.c    | 5 +----
>  drivers/clk/renesas/renesas-cpg-mssr.h    | 5 +----
>  8 files changed, 8 insertions(+), 32 deletions(-)

Any specific reason you skipped all other files in that directory?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
