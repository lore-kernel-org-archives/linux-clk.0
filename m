Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35669 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755843AbcCXOLN (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 24 Mar 2016 10:11:13 -0400
MIME-Version: 1.0
In-Reply-To: <1458824442-20279-3-git-send-email-wsa@the-dreams.de>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
	<1458824442-20279-3-git-send-email-wsa@the-dreams.de>
Date: Thu, 24 Mar 2016 15:11:11 +0100
Message-ID: <CAMuHMdWWUL6+4_vMX6QAddUyy+kbPWxq2fyRQG_Nz-LG_bmzLg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: shmobile: r8a7795: add OSC and RINT clocks
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
> And put LAST_DT_CORE_CLK to a place where it won't be missed on updates.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Since RFC, moved CLK_RINT to the end and reworked LAST_DT_CORE_CLK

Ugh... (see below)

>  drivers/clk/renesas/r8a7795-cpg-mssr.c       | 8 ++++----
>  include/dt-bindings/clock/r8a7795-cpg-mssr.h | 2 ++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index a9f933055663cb..d305bcd3ef6619 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -28,11 +28,8 @@
>
>
>  enum clk_ids {
> -       /* Core Clock Outputs exported to DT */
> -       LAST_DT_CORE_CLK = R8A7795_CLK_OSC,
> -
>         /* External Input Clocks */
> -       CLK_EXTAL,
> +       CLK_EXTAL = LAST_DT_CORE_CLK + 1,
>         CLK_EXTALR,
>
>         /* Internal Core Clocks */
> @@ -116,6 +113,9 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>         DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
>         DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
>         DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
> +
> +       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, 0x0240, 8),
> +       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, 0x0240, 32),
>  };
>
>  static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
> diff --git a/include/dt-bindings/clock/r8a7795-cpg-mssr.h b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
> index e864aae0a2561c..274c2728e6dff5 100644
> --- a/include/dt-bindings/clock/r8a7795-cpg-mssr.h
> +++ b/include/dt-bindings/clock/r8a7795-cpg-mssr.h
> @@ -59,5 +59,7 @@
>  #define R8A7795_CLK_CPEX               44
>  #define R8A7795_CLK_R                  45
>  #define R8A7795_CLK_OSC                        46
> +#define R8A7795_CLK_RINT               47
> +#define LAST_DT_CORE_CLK               R8A7795_CLK_RINT

LAST_DT_CORE_CLK is not part of the DT bindings, but part of the internal
driver implementation. Please don't move it.

Furthermore, why do you export R8A7795_CLK_RINT?
it's nowhere referenced from DT.

I think it belongs under "Internal Core Clocks" in r8a7795-cpg-mssr.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
