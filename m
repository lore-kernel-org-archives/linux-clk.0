Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:34879 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753349AbcCVJcS (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 22 Mar 2016 05:32:18 -0400
MIME-Version: 1.0
In-Reply-To: <1458587984-6313-5-git-send-email-wsa@the-dreams.de>
References: <1458587984-6313-1-git-send-email-wsa@the-dreams.de>
	<1458587984-6313-5-git-send-email-wsa@the-dreams.de>
Date: Tue, 22 Mar 2016 10:32:16 +0100
Message-ID: <CAMuHMdW0o9Po8pmJx8=xDi5VQc6ToqrENOHCOr64RffcUNPdSQ@mail.gmail.com>
Subject: Re: [RFC 4/5] WIP: clk: shmobile: r8a7795: add R clk
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Wolfram,

On Mon, Mar 21, 2016 at 8:19 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> This is a sketch how I think R clk should be handled. During
> initialization, check if EXTALR is populated. If so, use it as R. If
> not, use R_Internal. clk_mux doesn't help here because we don't want to
> switch parents depending on the clock rate. The clock rate (and source)
> should stay constant for the watchdog, so I think a setup like this
> during initialization makes sense.
>
> We still need a good way to find out if EXTALR is populated, though.
> I still hope I overlook something obvious...
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/clk/shmobile/r8a7795-cpg-mssr.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> index 4dda7f2ed0bcb6..353ea229d73fc5 100644
> --- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> @@ -26,6 +26,7 @@
>
>  #include "renesas-cpg-mssr.h"
>
> +#define CPG_RCKCR      0x240
>
>  enum clk_ids {
>         /* Core Clock Outputs exported to DT */
> @@ -63,6 +64,7 @@ enum r8a7795_clk_types {
>         CLK_TYPE_GEN3_PLL3,
>         CLK_TYPE_GEN3_PLL4,
>         CLK_TYPE_GEN3_SD,
> +       CLK_TYPE_GEN3_R,
>  };
>
>  #define DEF_GEN3_SD(_name, _id, _parent, _offset)      \
> @@ -117,8 +119,11 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>         DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
>         DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
>
> -       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, 0x0240, 8),
> -       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, 0x0240, 32),
> +       DEF_DIV6_RO("osc",      R8A7795_CLK_OSC,   CLK_EXTAL, CPG_RCKCR, 8),
> +       DEF_DIV6_RO("r_int",    R8A7795_CLK_RINT,  CLK_EXTAL, CPG_RCKCR, 32),
> +
> +       /* must come after EXTALR because we need its rate */
> +       DEF_BASE("r",           R8A7795_CLK_R, CLK_TYPE_GEN3_R, R8A7795_CLK_RINT),
>  };
>
>  static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
> @@ -584,6 +589,18 @@ struct clk * __init r8a7795_cpg_clk_register(struct device *dev,
>         case CLK_TYPE_GEN3_SD:
>                 return cpg_sd_clk_register(core, base, __clk_get_name(parent));
>
> +       case CLK_TYPE_GEN3_R:
> +               /* RINT is default. Only if EXTALR is populated, we switch to it */
> +               value = readl(base + CPG_RCKCR) & 0x3f;
> +
> +               if (0) { /* FIXME: how to check if EXTALR rate is > 0? */

Can't you just get its rate?
Please cc linux-clk for questions like this.

> +                       parent = clks[CLK_EXTALR];
> +                       value |= BIT(15);
> +               }
> +
> +               writel(value, base + CPG_RCKCR);
> +               break;
> +
>         default:
>                 return ERR_PTR(-EINVAL);
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
