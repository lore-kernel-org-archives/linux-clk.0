Return-Path: <keguang.zhang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1463043564-21559-1-git-send-email-gnaygnil@gmail.com>
References: <1463043564-21559-1-git-send-email-gnaygnil@gmail.com>
From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Thu, 12 May 2016 18:01:57 +0800
Message-ID: <CAJhJPsV9HN=sgkg59ZvKiQ73ZmwRdZwQGvhwwf38jBzW7zUh+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: add Loongson1C clock support
To: Yang Ling <gnaygnil@gmail.com>
Cc: ralf <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Huacai Chen <chenhc@lemote.com>, linux-mips@linux-mips.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org
Content-Type: multipart/alternative; boundary=047d7bb04118ce2fb10532a240dc
List-ID: <linux-clk.vger.kernel.org>

--047d7bb04118ce2fb10532a240dc
Content-Type: text/plain; charset=UTF-8

Hi Ling,
The file clk-ls1x.c will be renamed to clk-loongson1.c.
You'd better rebase your changes base on the following patch.
https://patchwork.linux-mips.org/patch/13035/

2016-05-12 16:59 GMT+08:00 Yang Ling <gnaygnil@gmail.com>:

> This adds clock support to Loongson1C SoC using the common clock
> infrastructure.
>
> Signed-off-by: Yang Ling <gnaygnil@gmail.com>
> ---
>  arch/mips/include/asm/mach-loongson32/regs-clk.h | 33 ++++++++++++
>  drivers/clk/clk-ls1x.c                           | 69
> +++++++++++++++++++++---
>  2 files changed, 95 insertions(+), 7 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson32/regs-clk.h
> b/arch/mips/include/asm/mach-loongson32/regs-clk.h
> index 1f5a715..2cef0e2 100644
> --- a/arch/mips/include/asm/mach-loongson32/regs-clk.h
> +++ b/arch/mips/include/asm/mach-loongson32/regs-clk.h
> @@ -1,5 +1,7 @@
>  /*
>   * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
> + * Copyright (c) 2015 Tang Haifeng <tanghaifeng-gz@loongson.cn>
> + * Copyright (c) 2016 Ling Yang <gnaygnil@gmail.com>
>   *
>   * Loongson 1 Clock Register Definitions.
>   *
> @@ -19,6 +21,7 @@
>  #define LS1X_CLK_PLL_DIV               LS1X_CLK_REG(0x4)
>
>  /* Clock PLL Divisor Register Bits */
> +#if defined(CONFIG_LOONGSON1_LS1B)
>  #define DIV_DC_EN                      (0x1 << 31)
>  #define DIV_DC_RST                     (0x1 << 30)
>  #define DIV_CPU_EN                     (0x1 << 25)
> @@ -48,4 +51,34 @@
>  #define BYPASS_DDR_WIDTH               1
>  #define BYPASS_CPU_WIDTH               1
>
> +#elif defined(CONFIG_LOONGSON1_LS1C)
> +
> +#define PLL_VALID                      (0x1 << 31)
> +#define FRAC_N                         (0xff << 16)
> +#define RST_TIME                       (0x3 << 2)
> +#define SDRAM_DIV                      (0x3 << 0)
> +
> +#define DIV_DC_EN                      (0x1 << 31)
> +#define DIV_DC                         (0x7f << 24)
> +#define DIV_CAM_EN                     (0x1 << 23)
> +#define DIV_CAM                                (0x7f << 16)
> +#define DIV_CPU_EN                     (0x1 << 15)
> +#define DIV_CPU                                (0x7f << 8)
> +#define DIV_DC_SEL_EN                  (0x1 << 5)
> +#define DIV_DC_SEL                     (0x1 << 4)
> +#define DIV_CAM_SEL_EN                 (0x1 << 3)
> +#define DIV_CAM_SEL                    (0x1 << 2)
> +#define DIV_CPU_SEL_EN                 (0x1 << 1)
> +#define DIV_CPU_SEL                    (0x1 << 0)
> +
> +#define DIV_DC_SHIFT                    24
> +#define DIV_CAM_SHIFT                   16
> +#define DIV_CPU_SHIFT                   8
> +
> +#define DIV_DC_WIDTH                    7
> +#define DIV_CPU_WIDTH                   7
> +#define DIV_DDR_WIDTH                   7
> +
> +#endif
> +
>  #endif /* __ASM_MACH_LOONGSON32_REGS_CLK_H */
> diff --git a/drivers/clk/clk-ls1x.c b/drivers/clk/clk-ls1x.c
> index d4c6198..746e653 100644
> --- a/drivers/clk/clk-ls1x.c
> +++ b/drivers/clk/clk-ls1x.c
> @@ -1,5 +1,7 @@
>  /*
>   * Copyright (c) 2012 Zhang, Keguang <keguang.zhang@gmail.com>
> + * Copyright (c) 2015 Tang Haifeng <tanghaifeng-gz@loongson.cn>
> + * Copyright (c) 2016 Ling Yang <gnaygnil@gmail.com>
>   *
>   * This program is free software; you can redistribute  it and/or modify
> it
>   * under  the terms of  the GNU General  Public License as published by
> the
> @@ -15,8 +17,13 @@
>
>  #include <loongson1.h>
>
> +#if defined(CONFIG_LOONGSON1_LS1B)
>  #define OSC            (33 * 1000000)
>  #define DIV_APB                2
> +#elif defined(CONFIG_LOONGSON1_LS1C)
> +#define OSC            (24 * 1000000)
> +#define DIV_APB                1
> +#endif
>
>  static DEFINE_SPINLOCK(_lock);
>
> @@ -35,9 +42,15 @@ static unsigned long ls1x_pll_recalc_rate(struct clk_hw
> *hw,
>         u32 pll, rate;
>
>         pll = __raw_readl(LS1X_CLK_PLL_FREQ);
> +#if defined(CONFIG_LOONGSON1_LS1B)
>         rate = 12 + (pll & 0x3f) + (((pll >> 8) & 0x3ff) >> 10);
>         rate *= OSC;
>         rate >>= 1;
> +#elif defined(CONFIG_LOONGSON1_LS1C)
> +       rate = ((pll >> 8) & 0xff) + ((pll >> 16) & 0xff);
> +       rate *= OSC;
> +       rate >>= 2;
> +#endif
>
>         return rate;
>  }
> @@ -80,22 +93,25 @@ static struct clk *__init clk_register_pll(struct
> device *dev,
>         return clk;
>  }
>
> -static const char * const cpu_parents[] = { "cpu_clk_div", "osc_33m_clk",
> };
> -static const char * const ahb_parents[] = { "ahb_clk_div", "osc_33m_clk",
> };
> -static const char * const dc_parents[] = { "dc_clk_div", "osc_33m_clk", };
> +static const char * const cpu_parents[] = { "cpu_clk_div", "osc_clk", };
> +static const char * const ahb_parents[] = { "ahb_clk_div", "osc_clk", };
> +static const char * const dc_parents[] = { "dc_clk_div", "osc_clk", };
>
>  void __init ls1x_clk_init(void)
>  {
>         struct clk *clk;
> +       u32 reg;
> +       u32 div;
>
> -       clk = clk_register_fixed_rate(NULL, "osc_33m_clk", NULL,
> CLK_IS_ROOT,
> +       clk = clk_register_fixed_rate(NULL, "osc_clk", NULL, CLK_IS_ROOT,
>                                       OSC);
> -       clk_register_clkdev(clk, "osc_33m_clk", NULL);
> +       clk_register_clkdev(clk, "osc_clk", NULL);
>
> -       /* clock derived from 33 MHz OSC clk */
> -       clk = clk_register_pll(NULL, "pll_clk", "osc_33m_clk", 0);
> +       /* clock derived from OSC clk */
> +       clk = clk_register_pll(NULL, "pll_clk", "osc_clk", 0);
>         clk_register_clkdev(clk, "pll_clk", NULL);
>
> +#if defined(CONFIG_LOONGSON1_LS1B)
>         /* clock derived from PLL clk */
>         /*                                 _____
>          *         _______________________|     |
> @@ -114,7 +130,23 @@ void __init ls1x_clk_init(void)
>                                CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
>                                BYPASS_CPU_SHIFT, BYPASS_CPU_WIDTH, 0,
> &_lock);
>         clk_register_clkdev(clk, "cpu_clk", NULL);
> +#elif defined(CONFIG_LOONGSON1_LS1C)
> +       reg = __raw_readl(LS1X_CLK_PLL_DIV);
> +       if (reg & DIV_CPU_SEL) {
> +               if (reg & DIV_CPU_EN) {
> +                       clk = clk_register_divider(NULL, "cpu_clk",
> "pll_clk",
> +                                       CLK_SET_RATE_PARENT,
> LS1X_CLK_PLL_DIV,
> +                                       DIV_CPU_SHIFT, DIV_CPU_WIDTH,
> +                                       CLK_DIVIDER_ONE_BASED, &_lock);
> +               } else {
> +                       clk = clk_register_fixed_factor(NULL, "cpu_clk",
> +                                                       "pll_clk", 0, 1,
> 2);
> +               }
> +       }
> +       clk_register_clkdev(clk, "cpu_clk", NULL);
> +#endif
>
> +#if defined(CONFIG_LOONGSON1_LS1B)
>         /*                                 _____
>          *         _______________________|     |
>          * OSC ___/                       | MUX |___ DC  CLK
> @@ -130,7 +162,14 @@ void __init ls1x_clk_init(void)
>                                CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
>                                BYPASS_DC_SHIFT, BYPASS_DC_WIDTH, 0,
> &_lock);
>         clk_register_clkdev(clk, "dc_clk", NULL);
> +#elif defined(CONFIG_LOONGSON1_LS1C)
> +       clk = clk_register_divider(NULL, "dc_clk", "pll_clk",
> +                       CLK_SET_RATE_PARENT, LS1X_CLK_PLL_DIV,
> DIV_DC_SHIFT,
> +                       DIV_DC_WIDTH, CLK_DIVIDER_ONE_BASED, &_lock);
> +       clk_register_clkdev(clk, "dc_clk", NULL);
> +#endif
>
> +#if defined(CONFIG_LOONGSON1_LS1B)
>         /*                                 _____
>          *         _______________________|     |
>          * OSC ___/                       | MUX |___ DDR CLK
> @@ -146,6 +185,22 @@ void __init ls1x_clk_init(void)
>                                ARRAY_SIZE(ahb_parents),
>                                CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
>                                BYPASS_DDR_SHIFT, BYPASS_DDR_WIDTH, 0,
> &_lock);
> +#elif defined(CONFIG_LOONGSON1_LS1C)
> +       reg = __raw_readl(LS1X_CLK_PLL_FREQ) & SDRAM_DIV;
> +       switch (reg) {
> +       case 0:
> +               div = 2;
> +               break;
> +       case 1:
> +               div = 4;
> +               break;
> +       case 2:
> +       case 3:
> +               div = 3;
> +               break;
> +       }
> +       clk = clk_register_fixed_factor(NULL, "ahb_clk", "cpu_clk", 0, 1,
> div);
> +#endif
>         clk_register_clkdev(clk, "ahb_clk", NULL);
>         clk_register_clkdev(clk, "stmmaceth", NULL);
>
> --
> 1.9.1
>
>
>


-- 
Best regards,

Kelvin Cheung

--047d7bb04118ce2fb10532a240dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ling,<div>The file=C2=A0<span style=3D"font-size:14px">=
clk-ls1x.c will be renamed to=C2=A0</span><span style=3D"font-size:14px">cl=
k-loongson1.c.</span></div><div><span style=3D"font-size:14px">You&#39;d be=
tter rebase your changes base on the following patch.</span></div><div><spa=
n style=3D"font-size:14px"><a href=3D"https://patchwork.linux-mips.org/patc=
h/13035/">https://patchwork.linux-mips.org/patch/13035/</a></span></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">2016-05-12 16:59 GMT=
+08:00 Yang Ling <span dir=3D"ltr">&lt;<a href=3D"mailto:gnaygnil@gmail.com=
" target=3D"_blank">gnaygnil@gmail.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">This adds clock support to Loongson1C SoC using the common cl=
ock<br>
infrastructure.<br>
<br>
Signed-off-by: Yang Ling &lt;<a href=3D"mailto:gnaygnil@gmail.com">gnaygnil=
@gmail.com</a>&gt;<br>
---<br>
=C2=A0arch/mips/include/asm/mach-loongson32/regs-clk.h | 33 ++++++++++++<br=
>
=C2=A0drivers/clk/clk-ls1x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 69 ++++++++++++++++++=
+++---<br>
=C2=A02 files changed, 95 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/arch/mips/include/asm/mach-loongson32/regs-clk.h b/arch/mips/i=
nclude/asm/mach-loongson32/regs-clk.h<br>
index 1f5a715..2cef0e2 100644<br>
--- a/arch/mips/include/asm/mach-loongson32/regs-clk.h<br>
+++ b/arch/mips/include/asm/mach-loongson32/regs-clk.h<br>
@@ -1,5 +1,7 @@<br>
=C2=A0/*<br>
=C2=A0 * Copyright (c) 2011 Zhang, Keguang &lt;<a href=3D"mailto:keguang.zh=
ang@gmail.com">keguang.zhang@gmail.com</a>&gt;<br>
+ * Copyright (c) 2015 Tang Haifeng &lt;<a href=3D"mailto:tanghaifeng-gz@lo=
ongson.cn">tanghaifeng-gz@loongson.cn</a>&gt;<br>
+ * Copyright (c) 2016 Ling Yang &lt;<a href=3D"mailto:gnaygnil@gmail.com">=
gnaygnil@gmail.com</a>&gt;<br>
=C2=A0 *<br>
=C2=A0 * Loongson 1 Clock Register Definitions.<br>
=C2=A0 *<br>
@@ -19,6 +21,7 @@<br>
=C2=A0#define LS1X_CLK_PLL_DIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0LS1X_CLK_REG(0x4)<br>
<br>
=C2=A0/* Clock PLL Divisor Register Bits */<br>
+#if defined(CONFIG_LOONGSON1_LS1B)<br>
=C2=A0#define DIV_DC_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 31)<br>
=C2=A0#define DIV_DC_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 30)<br>
=C2=A0#define DIV_CPU_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 25)<br>
@@ -48,4 +51,34 @@<br>
=C2=A0#define BYPASS_DDR_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01<br>
=C2=A0#define BYPASS_CPU_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01<br>
<br>
+#elif defined(CONFIG_LOONGSON1_LS1C)<br>
+<br>
+#define PLL_VALID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 31)<br>
+#define FRAC_N=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xff &lt;&lt; 16)<br>
+#define RST_TIME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x3 &lt;&lt; 2)<br>
+#define SDRAM_DIV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0x3 &lt;&lt; 0)<br>
+<br>
+#define DIV_DC_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (0x1 &lt;&lt; 31)<br>
+#define DIV_DC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x7f &lt;&lt; 24)<br>
+#define DIV_CAM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 23)<br>
+#define DIV_CAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x7f &lt;&lt; 16)<br>
+#define DIV_CPU_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 15)<br>
+#define DIV_CPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x7f &lt;&lt; 8)<br>
+#define DIV_DC_SEL_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (0x1 &lt;&lt; 5)<br>
+#define DIV_DC_SEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x1 &lt;&lt; 4)<br>
+#define DIV_CAM_SEL_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 3)<br>
+#define DIV_CAM_SEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (0x1 &lt;&lt; 2)<br>
+#define DIV_CPU_SEL_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(0x1 &lt;&lt; 1)<br>
+#define DIV_CPU_SEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (0x1 &lt;&lt; 0)<br>
+<br>
+#define DIV_DC_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 24<br>
+#define DIV_CAM_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A016<br>
+#define DIV_CPU_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A08<br>
+<br>
+#define DIV_DC_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 7<br>
+#define DIV_CPU_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A07<br>
+#define DIV_DDR_WIDTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A07<br>
+<br>
+#endif<br>
+<br>
=C2=A0#endif /* __ASM_MACH_LOONGSON32_REGS_CLK_H */<br>
diff --git a/drivers/clk/clk-ls1x.c b/drivers/clk/clk-ls1x.c<br>
index d4c6198..746e653 100644<br>
--- a/drivers/clk/clk-ls1x.c<br>
+++ b/drivers/clk/clk-ls1x.c<br>
@@ -1,5 +1,7 @@<br>
=C2=A0/*<br>
=C2=A0 * Copyright (c) 2012 Zhang, Keguang &lt;<a href=3D"mailto:keguang.zh=
ang@gmail.com">keguang.zhang@gmail.com</a>&gt;<br>
+ * Copyright (c) 2015 Tang Haifeng &lt;<a href=3D"mailto:tanghaifeng-gz@lo=
ongson.cn">tanghaifeng-gz@loongson.cn</a>&gt;<br>
+ * Copyright (c) 2016 Ling Yang &lt;<a href=3D"mailto:gnaygnil@gmail.com">=
gnaygnil@gmail.com</a>&gt;<br>
=C2=A0 *<br>
=C2=A0 * This program is free software; you can redistribute=C2=A0 it and/o=
r modify it<br>
=C2=A0 * under=C2=A0 the terms of=C2=A0 the GNU General=C2=A0 Public Licens=
e as published by the<br>
@@ -15,8 +17,13 @@<br>
<br>
=C2=A0#include &lt;loongson1.h&gt;<br>
<br>
+#if defined(CONFIG_LOONGSON1_LS1B)<br>
=C2=A0#define OSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (33 * 1000000)<b=
r>
=C2=A0#define DIV_APB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2<br>
+#elif defined(CONFIG_LOONGSON1_LS1C)<br>
+#define OSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (24 * 1000000)<br>
+#define DIV_APB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<b=
r>
+#endif<br>
<br>
=C2=A0static DEFINE_SPINLOCK(_lock);<br>
<br>
@@ -35,9 +42,15 @@ static unsigned long ls1x_pll_recalc_rate(struct clk_hw =
*hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 pll, rate;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pll =3D __raw_readl(LS1X_CLK_PLL_FREQ);<br>
+#if defined(CONFIG_LOONGSON1_LS1B)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rate =3D 12 + (pll &amp; 0x3f) + (((pll &gt;&gt=
; 8) &amp; 0x3ff) &gt;&gt; 10);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rate *=3D OSC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rate &gt;&gt;=3D 1;<br>
+#elif defined(CONFIG_LOONGSON1_LS1C)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rate =3D ((pll &gt;&gt; 8) &amp; 0xff) + ((pll =
&gt;&gt; 16) &amp; 0xff);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rate *=3D OSC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rate &gt;&gt;=3D 2;<br>
+#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rate;<br>
=C2=A0}<br>
@@ -80,22 +93,25 @@ static struct clk *__init clk_register_pll(struct devic=
e *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clk;<br>
=C2=A0}<br>
<br>
-static const char * const cpu_parents[] =3D { &quot;cpu_clk_div&quot;, &qu=
ot;osc_33m_clk&quot;, };<br>
-static const char * const ahb_parents[] =3D { &quot;ahb_clk_div&quot;, &qu=
ot;osc_33m_clk&quot;, };<br>
-static const char * const dc_parents[] =3D { &quot;dc_clk_div&quot;, &quot=
;osc_33m_clk&quot;, };<br>
+static const char * const cpu_parents[] =3D { &quot;cpu_clk_div&quot;, &qu=
ot;osc_clk&quot;, };<br>
+static const char * const ahb_parents[] =3D { &quot;ahb_clk_div&quot;, &qu=
ot;osc_clk&quot;, };<br>
+static const char * const dc_parents[] =3D { &quot;dc_clk_div&quot;, &quot=
;osc_clk&quot;, };<br>
<br>
=C2=A0void __init ls1x_clk_init(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk *clk;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 div;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_rate(NULL, &quot;osc=
_33m_clk&quot;, NULL, CLK_IS_ROOT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_rate(NULL, &quot;osc=
_clk&quot;, NULL, CLK_IS_ROOT,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OSC);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;osc_33m_clk&quot=
;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;osc_clk&quot;, N=
ULL);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clock derived from 33 MHz OSC clk */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_pll(NULL, &quot;pll_clk&qu=
ot;, &quot;osc_33m_clk&quot;, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clock derived from OSC clk */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_pll(NULL, &quot;pll_clk&qu=
ot;, &quot;osc_clk&quot;, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;pll_clk&quot;, N=
ULL);<br>
<br>
+#if defined(CONFIG_LOONGSON1_LS1B)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* clock derived from PLL clk */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__=
___<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0______=
_________________|=C2=A0 =C2=A0 =C2=A0|<br>
@@ -114,7 +130,23 @@ void __init ls1x_clk_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PL=
L_DIV,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BYPASS_CPU_SHIFT, BYPASS_CPU_WIDTH, 0=
, &amp;_lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;cpu_clk&quot;, N=
ULL);<br>
+#elif defined(CONFIG_LOONGSON1_LS1C)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D __raw_readl(LS1X_CLK_PLL_DIV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg &amp; DIV_CPU_SEL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg &amp; DIV_C=
PU_EN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clk =3D clk_register_divider(NULL, &quot;cpu_clk&quot;, &quot;pll=
_clk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_SET_R=
ATE_PARENT, LS1X_CLK_PLL_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_CPU_S=
HIFT, DIV_CPU_WIDTH,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_DIVID=
ER_ONE_BASED, &amp;_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clk =3D clk_register_fixed_factor(NULL, &quot;cpu_clk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pll_clk&quot;, 0, 1, =
2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;cpu_clk&quot;, N=
ULL);<br>
+#endif<br>
<br>
+#if defined(CONFIG_LOONGSON1_LS1B)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__=
___<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0______=
_________________|=C2=A0 =C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* OSC ___/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| MUX |___ DC=C2=A0 CLK=
<br>
@@ -130,7 +162,14 @@ void __init ls1x_clk_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PL=
L_DIV,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BYPASS_DC_SHIFT, BYPASS_DC_WIDTH, 0, =
&amp;_lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;dc_clk&quot;, NU=
LL);<br>
+#elif defined(CONFIG_LOONGSON1_LS1C)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_divider(NULL, &quot;dc_clk=
&quot;, &quot;pll_clk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CLK_SET_RATE_PARENT, LS1X_CLK_PLL_DIV, DIV_DC_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DIV_DC_WIDTH, CLK_DIVIDER_ONE_BASED, &amp;_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;dc_clk&quot;, NU=
LL);<br>
+#endif<br>
<br>
+#if defined(CONFIG_LOONGSON1_LS1B)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__=
___<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0______=
_________________|=C2=A0 =C2=A0 =C2=A0|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* OSC ___/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| MUX |___ DDR CLK<br>
@@ -146,6 +185,22 @@ void __init ls1x_clk_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(ahb_parents),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PL=
L_DIV,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BYPASS_DDR_SHIFT, BYPASS_DDR_WIDTH, 0=
, &amp;_lock);<br>
+#elif defined(CONFIG_LOONGSON1_LS1C)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D __raw_readl(LS1X_CLK_PLL_FREQ) &amp; SD=
RAM_DIV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D clk_register_fixed_factor(NULL, &quot;a=
hb_clk&quot;, &quot;cpu_clk&quot;, 0, 1, div);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;ahb_clk&quot;, N=
ULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;stmmaceth&quot;,=
 NULL);<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><di=
v><div dir=3D"ltr"><div>Best regards,<br><br>Kelvin Cheung<br></div></div><=
/div></div></div></div></div>
</div></div>

--047d7bb04118ce2fb10532a240dc--
