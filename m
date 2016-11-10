Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <2398984.AXNDaupAxO@wasted.cogentembedded.com>
References: <19700058.YBgRO3SXUI@wasted.cogentembedded.com> <2398984.AXNDaupAxO@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Nov 2016 13:50:29 +0100
Message-ID: <CAMuHMdUGhOhrWYJhFWGQbXNa62zAtoo_rq2dr-w0o_HEnQv60Q@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: add common R-Car Gen2 support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Tue, Nov 8, 2016 at 10:17 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the common R-Car  Gen2 (and RZ/G) Clock Pulse Generator / Module Standby
> and Software Reset support code, using the CPG/MSSR driver core.
>
> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
> <geert+renesas@glider.be>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> This patch is against the 'clk-next' branch of CLK group's 'linux.git' repo.
>
> Changes in version 4:
> - added a static variable for the PLL0 divisor and a parameter of the same kind
>   to rcar_gen2_cpg_init(), used that  variable in rcar_gen2_cpg_clk_register().

Thanks, I've verified correct operation by using your r8a7743 driver on
r8a7791/koelsch, and comparing /sys/kernel/debug/clk/clk_summary.

> Changes in version 3:
> - removed  the divisor logic from the PLL0 related code;
> - also mentioned R-Car V2H as not having the PLL0CR register.
>
> Changes in version 2:
> - added support  for non-existing PLL0CR;
> - removed the function reading the mode pins;
> - added/used the #define's for PLL0CR.STC;
> - used CPG_FRQCRC_ZFC_SHIFT to #define CPG_FRQCRC_ZFC_MASK;
> - removed rcar_gen2_read_modemr();
> - added Geert's tag.
>
>  drivers/clk/renesas/rcar-gen2-cpg.c |  370 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/renesas/rcar-gen2-cpg.h |   43 ++++
>  2 files changed, 413 insertions(+)
>
> Index: linux/drivers/clk/renesas/rcar-gen2-cpg.c
> ===================================================================
> --- /dev/null
> +++ linux/drivers/clk/renesas/rcar-gen2-cpg.c

> +static u32 cpg_mode __initdata;

cpg_mode is never set.

> +
> +struct clk * __init rcar_gen2_cpg_clk_register(struct device *dev,
> +                                              const struct cpg_core_clk *core,
> +                                              const struct cpg_mssr_info *info,
> +                                              struct clk **clks,
> +                                              void __iomem *base)
> +{

> +       switch (core->type) {

> +       case CLK_TYPE_GEN2_LB:
> +               div = cpg_mode & BIT(18) ? 36 : 24;

Hence div may be incorrect here (it wasn't for me)...

> +       case CLK_TYPE_GEN2_QSPI:
> +               div = (cpg_mode & (BIT(3) | BIT(2) | BIT(1))) == BIT(2) ?
> +                     8 : 10;

... and here (it was for me).

> +int __init rcar_gen2_cpg_init(const struct rcar_gen2_cpg_pll_config *config,
> +                             unsigned int pll0_div)

I'll add a "u32 mode" parameter here, and pass it from
r8a774[35]_cpg_mssr_init().

> +{
> +       cpg_pll_config = config;
> +       cpg_pll0_div = pll0_div;

cpg_mode = mode;

No need to resend, fixing it up myself.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
