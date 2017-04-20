Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1492624001-3758-15-git-send-email-ykaneko0929@gmail.com>
References: <1492624001-3758-15-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2017 20:40:05 +0200
Message-ID: <CAMuHMdVGB1Rm0uRhbkbfEJkx2HA8T4nSB8XPJ+3k-9vqisM6ZA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add Sound SRC clock
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Kaneko-san,

On Wed, Apr 19, 2017 at 7:46 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>
> This patch adds SCU(all), SCU(SRC{0,1,2,3,4,5,6,7,8,9}), SCU(CTU00,
> CTU01, CTU02, CTU03, MIX0) and SCU (CTU10, CTU11, CTU12, CTU13, MIX1)
> clocks for R8A7796 SoC.
>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I.e. will queue in clk-renesas-for-v4.13.

> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -219,6 +219,19 @@ enum clk_ids {
>         DEF_MOD("ssi2",                 1013,   MOD_CLK_ID(1005)),
>         DEF_MOD("ssi1",                 1014,   MOD_CLK_ID(1005)),
>         DEF_MOD("ssi0",                 1015,   MOD_CLK_ID(1005)),
> +       DEF_MOD("scu-all",              1017,   R8A7796_CLK_S3D4),

I cannot verify the parent clock, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
