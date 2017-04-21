Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1492624001-3758-2-git-send-email-ykaneko0929@gmail.com>
References: <1492624001-3758-2-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Apr 2017 16:04:14 +0200
Message-ID: <CAMuHMdWgF8SES7+D-jpkw6eG1cYv0UA5YdnJKV0SQ8Pcc06mRA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Add Z clock
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Kaneko-san,

On Wed, Apr 19, 2017 at 7:46 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds Z clock for R8A7795 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> This patch is based on the clk-next branch of linux-clk tree.
>
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index eaa98b4..a9ee68e 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -74,6 +74,7 @@ enum clk_ids {
>         DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
>
>         /* Core Clock Outputs */
> +       DEF_BASE("z",           R8A7795_CLK_Z,     CLK_TYPE_GEN3_Z, CLK_PLL0),

Adding an internal CLK_PLL0_DIV2 (cfr. CLK_PLL1_DIV2), and using that as
the parent clock may be the easiest fix for the wrong Z clock frequency.

However, it may complicate things when making PLL0 programmable, like is
done in the BSP.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
