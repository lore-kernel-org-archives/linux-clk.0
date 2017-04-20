Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1492624001-3758-4-git-send-email-ykaneko0929@gmail.com>
References: <1492624001-3758-4-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2017 20:52:49 +0200
Message-ID: <CAMuHMdUx3y16UpCY=RvnQTVb_qzQH_M-qYODG24vf05ki2yCtw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Add USB-DMAC ch3 clock
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
> This patch supports the clock of USB-DMAC ch3 module added from R8A7795
> ES2.0 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I.e. will queue in clk-renesas-for-v4.13.

> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -142,8 +142,10 @@ enum clk_ids {
>         DEF_MOD("sdif0",                 314,   R8A7795_CLK_SD0),
>         DEF_MOD("pcie1",                 318,   R8A7795_CLK_S3D1),
>         DEF_MOD("pcie0",                 319,   R8A7795_CLK_S3D1),
> +       DEF_MOD("usb-dmac30",            326,   R8A7795_CLK_S3D1),
>         DEF_MOD("usb3-if1",              327,   R8A7795_CLK_S3D1), /* ES1.x */
>         DEF_MOD("usb3-if0",              328,   R8A7795_CLK_S3D1),
> +       DEF_MOD("usb-dmac31",            329,   R8A7795_CLK_S3D1),

I cannot verify their parent clocks, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
