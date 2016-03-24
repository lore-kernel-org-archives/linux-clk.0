Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33623 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818AbcCXOQD (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 24 Mar 2016 10:16:03 -0400
MIME-Version: 1.0
In-Reply-To: <1458824442-20279-4-git-send-email-wsa@the-dreams.de>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
	<1458824442-20279-4-git-send-email-wsa@the-dreams.de>
Date: Thu, 24 Mar 2016 15:16:02 +0100
Message-ID: <CAMuHMdW1zTwLbgEVZD+VOEy934yUEp90pEv-ju_1+dd5RjLp-A@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: shmobile: r8a7795: add R clk
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram,

On Thu, Mar 24, 2016 at 2:00 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> R can select between two parents. We deal with it like this: During
> initialization, check if EXTALR is populated. If so, use it for R. If
> not, use R_Internal. clk_mux doesn't help here because we don't want to
> switch parents depending on the clock rate. The clock rate (and source)
> should stay constant for the watchdog, so I think a setup like this
> during initialization makes sense.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Since RFC, remove FIXME by using clk_get_rate() via clk.h
>
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index d305bcd3ef6619..c260da5e70e116 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c

> @@ -114,8 +117,11 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>         DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
>         DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
>
> -       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, 0x0240, 8),
> -       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, 0x0240, 32),
> +       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR, 8),
> +       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, CPG_RCKCR, 32),
> +
> +       /* must come after EXTALR because we need its rate */

must come after r_int because we need that clock as a possible parent?

> +       DEF_BASE("r",           R8A7795_CLK_R, CLK_TYPE_GEN3_R, R8A7795_CLK_RINT),
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
