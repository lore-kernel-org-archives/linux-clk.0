Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1492624001-3758-7-git-send-email-ykaneko0929@gmail.com>
References: <1492624001-3758-7-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2017 20:29:00 +0200
Message-ID: <CAMuHMdUPqSp8rb58uLtuBGYA1VWOUVfdAFCbeUD4YZ=_g6WxmQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7796: Add EHCI/OHCI clocks
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
> This patch adds EHCI/OHCI{0,1} clocks for R8A7796 SoC.
>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I.e. will queue in clk-renesas-for-v4.13.

> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -165,6 +165,8 @@ enum clk_ids {
>         DEF_MOD("vspd0",                 623,   R8A7796_CLK_S0D2),
>         DEF_MOD("vspb",                  626,   R8A7796_CLK_S0D1),
>         DEF_MOD("vspi0",                 631,   R8A7796_CLK_S0D1),
> +       DEF_MOD("ehci1",                 702,   R8A7796_CLK_S3D4),
> +       DEF_MOD("ehci0",                 703,   R8A7796_CLK_S3D4),

I cannot confirm the parent clock, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
