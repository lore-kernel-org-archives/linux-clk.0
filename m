Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170213210619.208900184@cogentembedded.com>
References: <20170213210619.208900184@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Feb 2017 09:31:44 +0100
Message-ID: <CAMuHMdUoEG7XYUUKugmhFtpLZggSOQ=5tkRh9yZUT5yPpn+i1Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: renesas: cpg-mssr: r8a7795: add IMR clocks
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 13, 2017 at 10:06 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the IMR[0-3] clocks to the R8A7795 CPG/MSSR driver.
>
> Based on the original (and large) patch by Konstantin Kozhevnikov
> <Konstantin.Kozhevnikov@cogentembedded.com>.
>
> Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I cannot verify the parent clocks for H3 ES1.x, but they match the parent clocks
for the VSPs.

Will queue in clk-renesas-for-v4.12.

> ---
> This patch is against the 'clk-next' branch of CLK group's 'linux.git' repo.
>
>  drivers/clk/renesas/r8a7795-cpg-mssr.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> Index: linux/drivers/clk/renesas/r8a7795-cpg-mssr.c
> ===================================================================
> --- linux.orig/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ linux/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -208,6 +208,10 @@ static const struct mssr_mod_clk r8a7795
>         DEF_MOD("vin0",                  811,   R8A7795_CLK_S2D1),
>         DEF_MOD("etheravb",              812,   R8A7795_CLK_S3D2),
>         DEF_MOD("sata0",                 815,   R8A7795_CLK_S3D2),
> +       DEF_MOD("imr3",                  820,   R8A7795_CLK_S2D1),
> +       DEF_MOD("imr2",                  821,   R8A7795_CLK_S2D1),
> +       DEF_MOD("imr1",                  822,   R8A7795_CLK_S2D1),
> +       DEF_MOD("imr0",                  823,   R8A7795_CLK_S2D1),
>         DEF_MOD("gpio7",                 905,   R8A7795_CLK_CP),
>         DEF_MOD("gpio6",                 906,   R8A7795_CLK_CP),
>         DEF_MOD("gpio5",                 907,   R8A7795_CLK_CP),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
