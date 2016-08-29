Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160825190518.20764-1-chris.brandt@renesas.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 15:18:10 +0200
Message-ID: <CAMuHMdWiPfZq=VgWhFRaQBoazLGSDo3+AB_cUG5hMhPxzypLAA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rz: Select EXTAL vs USB clock
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Thu, Aug 25, 2016 at 9:05 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Instead of hard coding EXTAL only, check if EXTAL was specified. If not,
> then assume the USB clock is used as the main system clock.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

What's the rationale behind this change?

According to the schematics, all of Genmai, RSK, and GR-Peach have both EXTAL
and USB_X1 populated. So they can only use EXTAL, both with and without your
patch.

But both Genmai and RSK have a DIP switch to control MD_CLK, and select the
clock to use, while GR-Peach has MD_CLK hardwired to GND.

> ---
>  drivers/clk/renesas/clk-rz.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
> index f6312c6..466b9fc 100644
> --- a/drivers/clk/renesas/clk-rz.c
> +++ b/drivers/clk/renesas/clk-rz.c
> @@ -37,13 +37,29 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
>         static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
>
>         if (strcmp(name, "pll") == 0) {
> -               /* FIXME: cpg_mode should be read from GPIO. But no GPIO support yet */
> -               unsigned cpg_mode = 0; /* hardcoded to EXTAL for now */
> -               const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
> -
> -               mult = cpg_mode ? (32 / 4) : 30;
> -
> -               return clk_register_fixed_factor(NULL, name, parent_name, 0, mult, 1);
> +               u32 freq = 0;
> +               struct device_node *np;
> +
> +               /* If a clock-frequency for extal was specified, assume EXTAL boot */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
