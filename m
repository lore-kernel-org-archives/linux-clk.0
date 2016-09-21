Return-Path: <keguang.zhang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160920155439.GA26095@ubuntu>
References: <20160920155439.GA26095@ubuntu>
From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Wed, 21 Sep 2016 16:46:59 +0800
Message-ID: <CAJhJPsX=iKY4kYq5vHr2ReMsC=MKQXU+qkZhRzVGWt_kXbVszg@mail.gmail.com>
Subject: Re: [PATCH v3] CLK: Add Loongson1C clock support
To: Yang Ling <gnaygnil@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mips@linux-mips.org
Content-Type: multipart/alternative; boundary=089e0122f07cd11d22053d009793
List-ID: <linux-clk.vger.kernel.org>

--089e0122f07cd11d22053d009793
Content-Type: text/plain; charset=UTF-8

2016-09-20 23:54 GMT+08:00 Yang Ling <gnaygnil@gmail.com>:

> This patch adds clock support to Loongson1C SoC.
>
> Signed-off-by: Yang Ling <gnaygnil@gmail.com>
>
> ---
> V3:
>  clk: loongson1c: Migrate to clk_hw based OF and registration APIs.
> ---
> V2:
>  Use loongson1 generic clock interface.
> ---
>  drivers/clk/loongson1/Makefile         |  1 +
>  drivers/clk/loongson1/clk-loongson1c.c | 97
> ++++++++++++++++++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 drivers/clk/loongson1/clk-loongson1c.c
>
> diff --git a/drivers/clk/loongson1/Makefile b/drivers/clk/loongson1/Makefi
> le
> index 5a162a1..b7f6a16 100644
> --- a/drivers/clk/loongson1/Makefile
> +++ b/drivers/clk/loongson1/Makefile
> @@ -1,2 +1,3 @@
>  obj-y                          += clk.o
>  obj-$(CONFIG_LOONGSON1_LS1B)   += clk-loongson1b.o
> +obj-$(CONFIG_LOONGSON1_LS1C)   += clk-loongson1c.o
> diff --git a/drivers/clk/loongson1/clk-loongson1c.c
> b/drivers/clk/loongson1/clk-loongson1c.c
> new file mode 100644
> index 0000000..3466f73
> --- /dev/null
> +++ b/drivers/clk/loongson1/clk-loongson1c.c
> @@ -0,0 +1,97 @@
> +/*
> + * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify
> it
> + * under  the terms of  the GNU General  Public License as published by
> the
> + * Free Software Foundation;  either version 2 of the  License, or (at
> your
> + * option) any later version.
> + */
> +
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +
> +#include <loongson1.h>
> +#include "clk.h"
> +
> +#define OSC            (24 * 1000000)
> +#define DIV_APB                1
> +
> +static DEFINE_SPINLOCK(_lock);
> +
> +static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
> +                                         unsigned long parent_rate)
> +{
> +       u32 pll, rate;
> +
> +       pll = __raw_readl(LS1X_CLK_PLL_FREQ);
> +       rate = ((pll >> 8) & 0xff) + ((pll >> 16) & 0xff);
> +       rate *= OSC;
> +       rate >>= 2;
> +
> +       return rate;
> +}
> +
> +static const struct clk_ops ls1x_pll_clk_ops = {
> +       .recalc_rate = ls1x_pll_recalc_rate,
> +};
> +
> +static const struct clk_div_table ahb_div_table[] = {
> +       [0] = { .val = 0, .div = 2 },
> +       [1] = { .val = 1, .div = 4 },
> +       [2] = { .val = 2, .div = 3 },
> +       [3] = { .val = 3, .div = 3 },
> +};
> +
> +void __init ls1x_clk_init(void)
> +{
> +       struct clk_hw *hw;
> +
> +       hw = clk_hw_register_fixed_rate(NULL, "osc_clk", NULL, 0, OSC);
> +       clk_hw_register_clkdev(hw, "osc_clk", NULL);
> +
> +       /* clock derived from 24 MHz OSC clk */
> +       hw = clk_hw_register_pll(NULL, "pll_clk", "osc_clk",
> +                               &ls1x_pll_clk_ops, 0);
> +       clk_hw_register_clkdev(hw, "pll_clk", NULL);
> +
> +       hw = clk_hw_register_divider(NULL, "cpu_clk_div", "pll_clk",
> +                                  CLK_GET_RATE_NOCACHE, LS1X_CLK_PLL_DIV,
> +                                  DIV_CPU_SHIFT, DIV_CPU_WIDTH,
> +                                  CLK_DIVIDER_ONE_BASED |
> +                                  CLK_DIVIDER_ROUND_CLOSEST, &_lock);
> +       clk_hw_register_clkdev(hw, "cpu_clk_div", NULL);
> +       hw = clk_hw_register_fixed_factor(NULL, "cpu_clk", "cpu_clk_div",
> +                                       0, 1, 1);
> +       clk_hw_register_clkdev(hw, "cpu_clk", NULL);
> +
> +       hw = clk_hw_register_divider(NULL, "dc_clk_div", "pll_clk",
> +                                  0, LS1X_CLK_PLL_DIV, DIV_DC_SHIFT,
> +                                  DIV_DC_WIDTH, CLK_DIVIDER_ONE_BASED,
> &_lock);
> +       clk_hw_register_clkdev(hw, "dc_clk_div", NULL);
> +       hw = clk_hw_register_fixed_factor(NULL, "dc_clk", "dc_clk_div",
> +                                       0, 1, 1);
> +       clk_hw_register_clkdev(hw, "dc_clk", NULL);
> +
> +       hw = clk_hw_register_divider_table(NULL, "ahb_clk_div",
> "cpu_clk_div",
> +                               0, LS1X_CLK_PLL_FREQ, DIV_DDR_SHIFT,
> +                               DIV_DDR_WIDTH, CLK_DIVIDER_ALLOW_ZERO,
> +                               ahb_div_table, &_lock);
> +       clk_hw_register_clkdev(hw, "ahb_clk_div", NULL);
> +       hw = clk_hw_register_fixed_factor(NULL, "ahb_clk", "ahb_clk_div",
> +                                       0, 1, 1);
> +       clk_hw_register_clkdev(hw, "ahb_clk", NULL);
> +       clk_hw_register_clkdev(hw, "ls1x-dma", NULL);
> +       clk_hw_register_clkdev(hw, "stmmaceth", NULL);
> +
> +       /* clock derived from AHB clk */
> +       hw = clk_hw_register_fixed_factor(NULL, "apb_clk", "ahb_clk", 0,
> 1,
> +                                       DIV_APB);
> +       clk_hw_register_clkdev(hw, "apb_clk", NULL);
> +       clk_hw_register_clkdev(hw, "ls1x-ac97", NULL);
> +       clk_hw_register_clkdev(hw, "ls1x-i2c", NULL);
> +       clk_hw_register_clkdev(hw, "ls1x-nand", NULL);
> +       clk_hw_register_clkdev(hw, "ls1x-pwmtimer", NULL);
> +       clk_hw_register_clkdev(hw, "ls1x-spi", NULL);
> +       clk_hw_register_clkdev(hw, "ls1x-wdt", NULL);
> +       clk_hw_register_clkdev(hw, "serial8250", NULL);
> +}
> --
> 1.9.1
>
>
Acked-by: Keguang Zhang <keguang.zhang@gmail.com>

--089e0122f07cd11d22053d009793
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">2016=
-09-20 23:54 GMT+08:00 Yang Ling <span dir=3D"ltr">&lt;<a href=3D"mailto:gn=
aygnil@gmail.com" target=3D"_blank">gnaygnil@gmail.com</a>&gt;</span>:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">This patch adds clock supp=
ort to Loongson1C SoC.<br>
<br>
Signed-off-by: Yang Ling &lt;<a href=3D"mailto:gnaygnil@gmail.com" target=
=3D"_blank">gnaygnil@gmail.com</a>&gt;<br>
<br>
---<br>
V3:<br>
=C2=A0clk: loongson1c: Migrate to clk_hw based OF and registration APIs.<br=
>
---<br>
V2:<br>
=C2=A0Use loongson1 generic clock interface.<br>
---<br>
=C2=A0drivers/clk/loongson1/Makefil<wbr>e=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
=C2=A0drivers/clk/loongson1/clk-loo<wbr>ngson1c.c | 97 ++++++++++++++++++++=
++++++++++<wbr>++++<br>
=C2=A02 files changed, 98 insertions(+)<br>
=C2=A0create mode 100644 drivers/clk/loongson1/clk-loon<wbr>gson1c.c<br>
<br>
diff --git a/drivers/clk/loongson1/Makefi<wbr>le b/drivers/clk/loongson1/Ma=
kefi<wbr>le<br>
index 5a162a1..b7f6a16 100644<br>
--- a/drivers/clk/loongson1/Makefi<wbr>le<br>
+++ b/drivers/clk/loongson1/Makefi<wbr>le<br>
@@ -1,2 +1,3 @@<br>
=C2=A0obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D clk.o<br>
=C2=A0obj-$(CONFIG_LOONGSON1_LS1B)=C2=A0 =C2=A0+=3D clk-loongson1b.o<br>
+obj-$(CONFIG_LOONGSON1_LS1C)=C2=A0 =C2=A0+=3D clk-loongson1c.o<br>
diff --git a/drivers/clk/loongson1/clk-lo<wbr>ongson1c.c b/drivers/clk/loon=
gson1/clk-lo<wbr>ongson1c.c<br>
new file mode 100644<br>
index 0000000..3466f73<br>
--- /dev/null<br>
+++ b/drivers/clk/loongson1/clk-lo<wbr>ongson1c.c<br>
@@ -0,0 +1,97 @@<br>
+/*<br>
+ * Copyright (c) 2016 Yang Ling &lt;<a href=3D"mailto:gnaygnil@gmail.com" =
target=3D"_blank">gnaygnil@gmail.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute=C2=A0 it and/or mod=
ify it<br>
+ * under=C2=A0 the terms of=C2=A0 the GNU General=C2=A0 Public License as =
published by the<br>
+ * Free Software Foundation;=C2=A0 either version 2 of the=C2=A0 License, =
or (at your<br>
+ * option) any later version.<br>
+ */<br>
+<br>
+#include &lt;linux/clkdev.h&gt;<br>
+#include &lt;linux/clk-provider.h&gt;<br>
+<br>
+#include &lt;loongson1.h&gt;<br>
+#include &quot;clk.h&quot;<br>
+<br>
+#define OSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (24 * 1000000)<br>
+#define DIV_APB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<b=
r>
+<br>
+static DEFINE_SPINLOCK(_lock);<br>
+<br>
+static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0un=
signed long parent_rate)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pll, rate;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pll =3D __raw_readl(LS1X_CLK_PLL_FREQ)<wbr>;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rate =3D ((pll &gt;&gt; 8) &amp; 0xff) + ((pll =
&gt;&gt; 16) &amp; 0xff);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rate *=3D OSC;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rate &gt;&gt;=3D 2;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rate;<br>
+}<br>
+<br>
+static const struct clk_ops ls1x_pll_clk_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.recalc_rate =3D ls1x_pll_recalc_rate,<br>
+};<br>
+<br>
+static const struct clk_div_table ahb_div_table[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[0] =3D { .val =3D 0, .div =3D 2 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[1] =3D { .val =3D 1, .div =3D 4 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[2] =3D { .val =3D 2, .div =3D 3 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[3] =3D { .val =3D 3, .div =3D 3 },<br>
+};<br>
+<br>
+void __init ls1x_clk_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_rate(NUL<wbr>L, &q=
uot;osc_clk&quot;, NULL, 0, OSC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;osc_clk&quot;,=
 NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clock derived from 24 MHz OSC clk */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_pll(NULL, &quot;pll_clk&=
quot;, &quot;osc_clk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ls1x_pll_clk_ops, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;pll_clk&quot;,=
 NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_divider(NULL, &quot;cpu_=
clk_div&quot;, &quot;pll_clk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLK_GET_RATE_NOCACHE, LS1X_CL=
K_PLL_DIV,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_CPU_SHIFT, DIV_CPU_WIDTH,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLK_DIVIDER_ONE_BASED |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLK_DIVIDER_ROUND_CLOSEST, &a=
mp;_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;cpu_clk_div&qu=
ot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(N<wbr>ULL, =
&quot;cpu_clk&quot;, &quot;cpu_clk_div&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 1, 1);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;cpu_clk&quot;,=
 NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_divider(NULL, &quot;dc_c=
lk_div&quot;, &quot;pll_clk&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, LS1X_CLK_PLL_DIV, DIV_DC_S=
HIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_DC_WIDTH, CLK_DIVIDER_ONE=
_BASED, &amp;_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;dc_clk_div&quo=
t;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(N<wbr>ULL, =
&quot;dc_clk&quot;, &quot;dc_clk_div&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 1, 1);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;dc_clk&quot;, =
NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_divider_table(<wbr>NULL,=
 &quot;ahb_clk_div&quot;, &quot;cpu_clk_div&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, LS1X_CLK_PLL_FREQ, DIV_DDR_SHIFT,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_DDR_WIDTH, CLK_DIVIDER_ALLOW_ZERO=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ahb_div_table, &amp;_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ahb_clk_div&qu=
ot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(N<wbr>ULL, =
&quot;ahb_clk&quot;, &quot;ahb_clk_div&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 1, 1);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ahb_clk&quot;,=
 NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ls1x-dma&quot;=
, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;stmmaceth&quot=
;, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clock derived from AHB clk */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(N<wbr>ULL, =
&quot;apb_clk&quot;, &quot;ahb_clk&quot;, 0, 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_APB);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;apb_clk&quot;,=
 NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ls1x-ac97&quot=
;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ls1x-i2c&quot;=
, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ls1x-nand&quot=
;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ls1x-pwmtimer&=
quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ls1x-spi&quot;=
, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;ls1x-wdt&quot;=
, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_hw_register_clkdev(hw, &quot;serial8250&quo=
t;, NULL);<br>
+}<br>
<span><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br>Acked-by: Keguang Zhang &lt;<a href=3D=
"mailto:keguang.zhang@gmail.com">keguang.zhang@gmail.com</a>&gt;<br></div><=
/div>

--089e0122f07cd11d22053d009793--
