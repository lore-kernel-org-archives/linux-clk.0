Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
References: <20180924164937.36536-1-chris.brandt@renesas.com> <20180924164937.36536-4-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 11:27:06 +0200
Message-ID: <CAMuHMdXRWRvxNb12GPDi-agEFhLg3_Cnukm6LwapFdaT8Fpddg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: renesas: r7s9210: Move table update to
 separate function
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 24, 2018 at 6:50 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Same functionality, just easier to read.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/clk/renesas/r7s9210-cpg-mssr.c | 94 ++++++++++++++++++----------------
>  1 file changed, 49 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> index 7ab9030ef8b9..f9c22b61883b 100644
> --- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> @@ -97,6 +97,53 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
>
>  };
>
> +/* The clock dividers in the table vary based on DT and register settings */
> +static void r7s9210_update_clk_table(struct clk *extal_clk, void __iomem *base)

Can be __init.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
