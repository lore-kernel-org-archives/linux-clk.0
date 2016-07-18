Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1468380049-5712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1468380049-5712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jul 2016 12:53:42 +0200
Message-ID: <CAMuHMdWkD96cVe14ps8B0BbRUzA7pQuMogat25PehnDaoqhS=w@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a7795: Fix SD clocks
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Dirk Behme <dirk.behme@de.bosch.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Shimoda-san,

On Wed, Jul 13, 2016 at 5:20 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> According to the datasheet, SDn clocks are from the SDSRC clock. And
> the SDSRC has a 1/2 divider. So, we should have ".sdsrc" as an internal
> core clock. Otherwise, since the sdhi driver will calculate clock for
> a sd card using the wrong parent clock rate, and then performance will
> be not good.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 90c073e53909da85 ("clk: shmobile: r8a7795: Add SD divider support")
although this won't apply to v4.6 as-is, due to the move from
drivers/clk/shmobile/
to drivers/clk/renesas, and s/DEF_SD/DEF_GEN3_SD/.

This causes the following changes:

--- clk_summary.old     2016-07-18 12:45:07.788501000 +0200
+++ clk_summary 2016-07-18 12:47:43.279660000 +0200
@@ -34,23 +34,24 @@
        .pll3                              0            0  1599999936
        0 0
        .pll2                              0            0  1199999952
        0 0
        .pll1                              1            1  1599999936
        0 0
-          .pll1_div2                      5            5   799999968
        0 0
+          .pll1_div2                      4            4   799999968
        0 0
              hdmi                         0            0    24999999
        0 0
                 hdmi0                     0            0    24999999
        0 0
                 hdmi1                     0            0    24999999
        0 0
              cl                           0            0    16666666
        0 0
-             sd3                          1            1    12500000
        0 0
-                sdif3                     1            2    12500000
        0 0
-             sd2                          0            0    99999996
        0 0
-                sdif2                     0            0    99999996
        0 0
-             sd1                          0            0    99999996
        0 0
-                sdif1                     0            0    99999996
        0 0
-             sd0                          1            1    12500000
        0 0
-                sdif0                     1            2    12500000
        0 0
              zx                           0            0   399999984
        0 0
              zt                           0            0   199999992
        0 0
              ztrd2                        0            0    66666664
        0 0
              ztr                          0            0   133333328
        0 0
+             .sdsrc                       2            2   399999984
        0 0
+                sd3                       1            1     6250000
        0 0
+                   sdif3                  1            2     6250000
        0 0
+                sd2                       0            0    49999998
        0 0
+                   sdif2                  0            0    49999998
        0 0
+                sd1                       0            0    49999998
        0 0
+                   sdif1                  0            0    49999998
        0 0
+                sd0                       1            1     6250000
        0 0
+                   sdif0                  1            2     6250000
        0 0
              .s3                          3            3   133333328
        0 0
                 s3d4                      5            9    33333332
        0 0
                    scu-all                0           12    33333332
        0 0

Note that I still have a Salvator-X with a 16.67 MHz i.s.o. 33.33 Mhz crystal.

Wolfram, Dirk: any comments?

Thanks!

> ---
>  drivers/clk/renesas/r8a7795-cpg-mssr.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> index ca5519c..5f99f7c 100644
> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -91,6 +91,7 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>         DEF_FIXED(".s1",        CLK_S1,            CLK_PLL1_DIV2,  3, 1),
>         DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
>         DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
> +       DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
>
>         /* Core Clock Outputs */
>         DEF_FIXED("ztr",        R8A7795_CLK_ZTR,   CLK_PLL1_DIV2,  6, 1),
> @@ -109,10 +110,10 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>         DEF_FIXED("s3d2",       R8A7795_CLK_S3D2,  CLK_S3,         2, 1),
>         DEF_FIXED("s3d4",       R8A7795_CLK_S3D4,  CLK_S3,         4, 1),
>
> -       DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_PLL1_DIV2, 0x0074),
> -       DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_PLL1_DIV2, 0x0078),
> -       DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_PLL1_DIV2, 0x0268),
> -       DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_PLL1_DIV2, 0x026c),
> +       DEF_GEN3_SD("sd0",      R8A7795_CLK_SD0,   CLK_SDSRC, 0x0074),
> +       DEF_GEN3_SD("sd1",      R8A7795_CLK_SD1,   CLK_SDSRC, 0x0078),
> +       DEF_GEN3_SD("sd2",      R8A7795_CLK_SD2,   CLK_SDSRC, 0x0268),
> +       DEF_GEN3_SD("sd3",      R8A7795_CLK_SD3,   CLK_SDSRC, 0x026c),
>
>         DEF_FIXED("cl",         R8A7795_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cp",         R8A7795_CLK_CP,    CLK_EXTAL,      2, 1),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
