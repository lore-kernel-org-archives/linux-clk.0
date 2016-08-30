Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160830031358.19468-1-chris.brandt@renesas.com>
References: <20160825190518.20764-1-chris.brandt@renesas.com> <20160830031358.19468-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Aug 2016 09:23:06 +0200
Message-ID: <CAMuHMdUEK47vKF2qO-_p4i0xEqnWG9Vu2AH_1f=eQ_mz4mwDjA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: rz: Select EXTAL vs USB clock
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Tue, Aug 30, 2016 at 5:13 AM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Check the MD_CLK pin to determine the current clock mode in order to set
> the pll clock parent correctly.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> ---
> v2:
> * Switched to reading MD_CLK pin to determine mode
> ---
>  drivers/clk/renesas/clk-rz.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
> index f6312c6..2fc8aae 100644
> --- a/drivers/clk/renesas/clk-rz.c
> +++ b/drivers/clk/renesas/clk-rz.c
> @@ -25,6 +25,9 @@ struct rz_cpg {
>  #define CPG_FRQCR      0x10
>  #define CPG_FRQCR2     0x14
>
> +#define PPR0 0xFCFE3200
> +#define PIBC0 0xFCFE7000
> +
>  /* -----------------------------------------------------------------------------
>   * Initialization
>   */
> @@ -37,10 +40,20 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
>         static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
>
>         if (strcmp(name, "pll") == 0) {
> -               /* FIXME: cpg_mode should be read from GPIO. But no GPIO support yet */
> -               unsigned cpg_mode = 0; /* hardcoded to EXTAL for now */
> -               const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
> -
> +               unsigned int cpg_mode;
> +               const char *parent_name;
> +               void __iomem *ppr0, *pibc0;
> +
> +               /* MD_CLK is on P0_2 */
> +               ppr0 = ioremap_nocache(PPR0, 2);
> +               pibc0 = ioremap_nocache(PIBC0, 2);
> +               BUG_ON(!ppr0 || !pibc0);
> +               iowrite16(4, pibc0);    /* Enable input buffer */
> +               cpg_mode = ioread16(ppr0) & 4;
> +               iounmap(ppr0);
> +               iounmap(pibc0);
> +
> +               parent_name = cpg_mode ? "usb_x1" : "extal";

If you would use "cpg_mode = (ioread16(ppr0) >> 2) & 1;", the value of
cpg_mode would be in sync with Table 6.2. Then you can avoid relying on actual
clock names in DT, and keep

    parent_name = of_clk_get_parent_name(np, cpg_mode);

The bindings already dictate the parent clocks must match clock modes in the
datasheet, i.e. Table 6.2.

For easier maintenance, I would factor out reading the mode pins in a separate
function. When a proper GPIO driver is added, the function can be removed,
and its callsite updated.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
