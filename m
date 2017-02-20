Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170218213936.142813519@cogentembedded.com>
References: <20170218213936.142813519@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Feb 2017 09:38:39 +0100
Message-ID: <CAMuHMdV1x2voYKnMKv8x3XvmGwBA8SgwkhJZcnkycypdPhVjzA@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: cpg-mssr: r8a7796: add IMR clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Sat, Feb 18, 2017 at 10:39 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the IMR[0-1] clocks to the R8A7796 CPG/MSSR driver.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- linux.orig/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ linux/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -179,6 +179,8 @@ static const struct mssr_mod_clk r8a7796
>         DEF_MOD("vin1",                  810,   R8A7796_CLK_S0D2),
>         DEF_MOD("vin0",                  811,   R8A7796_CLK_S0D2),
>         DEF_MOD("etheravb",              812,   R8A7796_CLK_S0D6),
> +       DEF_MOD("imr1",                  822,   R8A7796_CLK_S2D1),
> +       DEF_MOD("imr0",                  823,   R8A7796_CLK_S2D1),

According to R-Car Gen3 Hardware Users Manual Rev.0.53E, the parent
clock is S0D2, like on H3 ES2.0.

Will queue in clk-renesas-for-v4.12 with corrected parent clock.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
