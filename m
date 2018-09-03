Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com> <4f401a77-ae41-5a6e-3e10-51dad300e183@cogentembedded.com>
In-Reply-To: <4f401a77-ae41-5a6e-3e10-51dad300e183@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Sep 2018 09:43:21 +0200
Message-ID: <CAMuHMdVA1VXzouJcz2-cJUStsirErt4ROEszRZ9tPLXFzsSROw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r8a77970: add SD0H/SD0 clocks for SDHI
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Sergei,

On Sat, Sep 1, 2018 at 10:12 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On R-Car V3M (AKA R8A77970), the SD0CKCR is laid out differently than on
> the other R-Car gen3 SoCs. In fact, the layout is the same as on R-Car gen2
> SoCs, so we'll need to copy the divisor tables from the R-Car gen2 driver.
> We'll also need to support the SoC specific clock types, thus we're adding
> CLK_TYPE_GEN3_SOC_BASE at the end of 'enum rcar_gen3_clk_types', declare
> SD0H/SDH clocks in 'enum r8a77970_clk_types', and handle those clocks in
> the overridden cpg_clk_register() method; then, finally, add the SD-IF
> module clock (derived from the SD0 clock).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'clk-renesas' branch of Geert's 'renesas-drivers.git'
> repo.
>
> Changes in version 2:
> - made r8a77970_cpg_clk_register() *static*;
> - #define'd CPG_SD0CKCR and used it instead of the bare number.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20, with s/add/Add/ in the
oneline-summary,
and

> +static struct clk * __init r8a77970_cpg_clk_register(struct device *dev,

... the TAB after "static" replaced by a space.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
