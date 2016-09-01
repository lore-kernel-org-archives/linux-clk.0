Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20160901131036.17241-1-chris.brandt@renesas.com>
References: <20160830031358.19468-1-chris.brandt@renesas.com> <20160901131036.17241-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Sep 2016 21:21:38 +0200
Message-ID: <CAMuHMdXd8WxTtpiQ5rujKKVP04oEriF62K9d3iTh1zVakVtTog@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: rz: Select EXTAL vs USB clock
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

On Thu, Sep 1, 2016 at 3:10 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Check the MD_CLK pin to determine the current clock mode in order to set
> the pll clock parent correctly.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for the update!

> ---
> v3:
> * move reading GPIO port into separate function
> v2:
> * Switched to reading MD_CLK pin to determine mode
> ---
>  drivers/clk/renesas/clk-rz.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/renesas/clk-rz.c b/drivers/clk/renesas/clk-rz.c
> index f6312c6..29a8638 100644
> --- a/drivers/clk/renesas/clk-rz.c
> +++ b/drivers/clk/renesas/clk-rz.c
> @@ -25,10 +25,34 @@ struct rz_cpg {
>  #define CPG_FRQCR      0x10
>  #define CPG_FRQCR2     0x14
>
> +#define PPR0 0xFCFE3200
> +#define PIBC0 0xFCFE7000
> +
> +#define MD_BOOT0(x) ((x >> 0) & 1)     /* P0_0 */
> +#define MD_BOOT1(x) ((x >> 1) & 1)     /* P0_1 */
> +#define MD_CLK(x)   ((x >> 2) & 1)     /* P0_2 */

Good idea to use a macro for that!
However, adding more (unused) macros may trigger more questions from reviewers,
cfr. below ;-)

> +#define MD_CLKS(x)  ((x >> 3) & 1)     /* P0_3 */
> +
>  /* -----------------------------------------------------------------------------
>   * Initialization
>   */
>
> +u16 rz_cpg_read_mode_pins(void)

static u16 __init rz_cpg_read_mode_pins(void)

Or do you intend to make this a global function?
There's also MD_BOOT2 at P7_0. To read that, you have to map and read a
different set of registers, though...

> +{
> +       void __iomem *ppr0, *pibc0;
> +       u16 modes;
> +
> +       ppr0 = ioremap_nocache(PPR0, 2);
> +       pibc0 = ioremap_nocache(PIBC0, 2);
> +       BUG_ON(!ppr0 || !pibc0);
> +       iowrite16(4, pibc0);    /* enable input buffer */
> +       modes = ioread16(ppr0);
> +       iounmap(ppr0);
> +       iounmap(pibc0);
> +
> +       return modes;
> +}
> +
>  static struct clk * __init
>  rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *name)
>  {
> @@ -37,10 +61,11 @@ rz_cpg_register_clock(struct device_node *np, struct rz_cpg *cpg, const char *na
>         static const unsigned frqcr_tab[4] = { 3, 2, 0, 1 };
>
>         if (strcmp(name, "pll") == 0) {
> -               /* FIXME: cpg_mode should be read from GPIO. But no GPIO support yet */
> -               unsigned cpg_mode = 0; /* hardcoded to EXTAL for now */

I'd just assign "MD_CLK(rz_cpg_read_mode_pins())" to cpg_mode here...

> -               const char *parent_name = of_clk_get_parent_name(np, cpg_mode);
> +               unsigned int cpg_mode;
> +               const char *parent_name;
>
> +               cpg_mode = MD_CLK(rz_cpg_read_mode_pins());
> +               parent_name = of_clk_get_parent_name(np, cpg_mode);

... and not bother splitting the lines, as they don't break the
80-chars-per-line
limit.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
