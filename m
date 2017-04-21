Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
References: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Apr 2017 15:59:10 +0200
Message-ID: <CAMuHMdWfouuGZqPGV7_-cXUmYe-SXd9popja8T43V5hPP+DQQw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Add Z clock divider support
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Kaneko-san, and Mike, Stephen (see below),

On Wed, Apr 19, 2017 at 7:46 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds Z clock divider support for R-Car Gen3 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

I gave this patch a try on Salvator-X.  On both R-Car H3 and M3-W,
/sys/kernel/debug/clk/clk_summary reports:

       .pll0                              0            0  2999999880
       0 0
          z                               0            0  3000000000
       0 0

The Z clock runs at 1.5 GHz, so the numbers are off by a factor of two.
It seems the PLL post-divider of 1/2 is not taken into account.

> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c

> +static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
> +                                          unsigned long parent_rate)
> +{
> +       struct cpg_z_clk *zclk = to_z_clk(hw);
> +       unsigned int mult;
> +       unsigned int val;
> +       unsigned long rate;
> +
> +       val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
> +           >> CPG_FRQCRC_ZFC_SHIFT;
> +       mult = 32 - val;
> +
> +       rate = div_u64((u64)parent_rate * mult + 16, 32);
> +       /* Round to closest value at 100MHz unit */
> +       rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);

Mike, Stephen: what's your opinion about such rounding tricks?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
