Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20180216152807.1629038-1-arnd@arndb.de>
References: <20180216152807.1629038-1-arnd@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:25:12 +0100
Message-ID: <CAMuHMdXgFcDkGAZuMviYAo6K-KOx5bBSRewed9AUWD+osfG2bw@mail.gmail.com>
Subject: Re: [PATCH] clk: fix false-positive Wmaybe-uninitialized warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, stable <stable@vger.kernel.org>,
	Andi Kleen <ak@linux.intel.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Arnd,

On Fri, Feb 16, 2018 at 4:27 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> When we build this driver with on x86-32, gcc produces a false-positive warning:
>
> drivers/clk/renesas/clk-sh73a0.c: In function 'sh73a0_cpg_clocks_init':
> drivers/clk/renesas/clk-sh73a0.c:155:10: error: 'parent_name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    return clk_register_fixed_factor(NULL, name, parent_name, 0,
>
> We can work around that warning by adding a fake initialization, I tried
> and failed to come up with any better workaround. This is currently one
> of few remaining warnings for a 4.14.y randconfig build, so it would be
> good to also have it backported at least to that version. Older versions
> have more randconfig warnings, so we might not care.
>
> I had not noticed this earlier, because one patch in my randconfig test
> tree removes the '-ffreestanding' option on x86-32, and that avoids
> the warning. The -ffreestanding flag was originally global but moved
> into arch/i386 by Andi Kleen in commit 6edfba1b33c7 ("[PATCH] x86_64:
> Don't define string functions to builtin") as a 'temporary workaround'.
>
> Like many temporary hacks, this turned out to be rather long-lived, from
> all I can tell we still need a simple fix to asm/string_32.h before it
> can be removed, but I'm not sure about how to best do that.
>
> Cc: stable@vger.kernel.org
> Cc: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, this is a known false positive.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/clk/renesas/clk-sh73a0.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
> index eea38f6ea77e..3892346c4fcc 100644
> --- a/drivers/clk/renesas/clk-sh73a0.c
> +++ b/drivers/clk/renesas/clk-sh73a0.c
> @@ -46,7 +46,7 @@ struct div4_clk {
>         unsigned int shift;
>  };
>
> -static struct div4_clk div4_clks[] = {
> +static const struct div4_clk div4_clks[] = {

This change is not part of the fix...

>         { "zg", "pll0", CPG_FRQCRA, 16 },
>         { "m3", "pll1", CPG_FRQCRA, 12 },
>         { "b",  "pll1", CPG_FRQCRA,  8 },
> @@ -79,7 +79,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
>  {
>         const struct clk_div_table *table = NULL;
>         unsigned int shift, reg, width;
> -       const char *parent_name;
> +       const char *parent_name = NULL;
>         unsigned int mult = 1;
>         unsigned int div = 1;
>
> @@ -135,7 +135,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
>                 shift = 24;
>                 width = 5;
>         } else {
> -               struct div4_clk *c;
> +               const struct div4_clk *c;

... and neither is this one.

>
>                 for (c = div4_clks; c->name; c++) {
>                         if (!strcmp(name, c->name)) {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
