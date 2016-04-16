Return-Path: <keguang.zhang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1460115779-13141-1-git-send-email-keguang.zhang@gmail.com>
References: <1460115779-13141-1-git-send-email-keguang.zhang@gmail.com>
From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Sat, 16 Apr 2016 17:41:33 +0800
Message-ID: <CAJhJPsWoN3sZwwUS27XduhV=mGVO5eDwRa-ieanAWwvNByUHHA@mail.gmail.com>
Subject: Re: [PATCH V2 1/7] clk: Loongson1: Update clocks of Loongson1B
To: linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Content-Type: multipart/alternative; boundary=089e013d12baf61f7b053096ef4c
List-ID: <linux-clk.vger.kernel.org>

--089e013d12baf61f7b053096ef4c
Content-Type: text/plain; charset=UTF-8

Dear Stephen,
Could you check this patch?
Thanks!

2016-04-08 19:42 GMT+08:00 Keguang Zhang <keguang.zhang@gmail.com>:

> From: Kelvin Cheung <keguang.zhang@gmail.com>
>
> - Rename the file to clk-loongson1.c
> - Add AC97, DMA and NAND clock
> - Update clock names
> - Remove superfluous error messages
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
>
> ---
> V2:
>    Regenerate the patch to make it review-able.
> ---
>  drivers/clk/Makefile                        |  2 +-
>  drivers/clk/{clk-ls1x.c => clk-loongson1.c} | 25 +++++++++++++------------
>  2 files changed, 14 insertions(+), 13 deletions(-)
>  rename drivers/clk/{clk-ls1x.c => clk-loongson1.c} (86%)
>
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 46869d6..5845b2c 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -25,7 +25,7 @@ obj-$(CONFIG_COMMON_CLK_CS2000_CP)    += clk-cs2000-cp.o
>  obj-$(CONFIG_ARCH_CLPS711X)            += clk-clps711x.o
>  obj-$(CONFIG_ARCH_EFM32)               += clk-efm32gg.o
>  obj-$(CONFIG_ARCH_HIGHBANK)            += clk-highbank.o
> -obj-$(CONFIG_MACH_LOONGSON32)          += clk-ls1x.o
> +obj-$(CONFIG_MACH_LOONGSON32)          += clk-loongson1.o
>  obj-$(CONFIG_COMMON_CLK_MAX_GEN)       += clk-max-gen.o
>  obj-$(CONFIG_COMMON_CLK_MAX77686)      += clk-max77686.o
>  obj-$(CONFIG_COMMON_CLK_MAX77802)      += clk-max77802.o
> diff --git a/drivers/clk/clk-ls1x.c b/drivers/clk/clk-loongson1.c
> similarity index 86%
> rename from drivers/clk/clk-ls1x.c
> rename to drivers/clk/clk-loongson1.c
> index d4c6198..ce2135c 100644
> --- a/drivers/clk/clk-ls1x.c
> +++ b/drivers/clk/clk-loongson1.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2012 Zhang, Keguang <keguang.zhang@gmail.com>
> + * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
>   *
>   * This program is free software; you can redistribute  it and/or modify
> it
>   * under  the terms of  the GNU General  Public License as published by
> the
> @@ -58,11 +58,9 @@ static struct clk *__init clk_register_pll(struct
> device *dev,
>         struct clk_init_data init;
>
>         /* allocate the divider */
> -       hw = kzalloc(sizeof(struct clk_hw), GFP_KERNEL);
> -       if (!hw) {
> -               pr_err("%s: could not allocate clk_hw\n", __func__);
> +       hw = kzalloc(sizeof(*hw), GFP_KERNEL);
> +       if (!hw)
>                 return ERR_PTR(-ENOMEM);
> -       }
>
>         init.name = name;
>         init.ops = &ls1x_pll_clk_ops;
> @@ -80,9 +78,9 @@ static struct clk *__init clk_register_pll(struct device
> *dev,
>         return clk;
>  }
>
> -static const char * const cpu_parents[] = { "cpu_clk_div", "osc_33m_clk",
> };
> -static const char * const ahb_parents[] = { "ahb_clk_div", "osc_33m_clk",
> };
> -static const char * const dc_parents[] = { "dc_clk_div", "osc_33m_clk", };
> +static const char *const cpu_parents[] = { "cpu_clk_div", "osc_33m_clk",
> };
> +static const char *const ahb_parents[] = { "ahb_clk_div", "osc_33m_clk",
> };
> +static const char *const dc_parents[] = { "dc_clk_div", "osc_33m_clk", };
>
>  void __init ls1x_clk_init(void)
>  {
> @@ -147,6 +145,7 @@ void __init ls1x_clk_init(void)
>                                CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PLL_DIV,
>                                BYPASS_DDR_SHIFT, BYPASS_DDR_WIDTH, 0,
> &_lock);
>         clk_register_clkdev(clk, "ahb_clk", NULL);
> +       clk_register_clkdev(clk, "ls1x-dma", NULL);
>         clk_register_clkdev(clk, "stmmaceth", NULL);
>
>         /* clock derived from AHB clk */
> @@ -154,9 +153,11 @@ void __init ls1x_clk_init(void)
>         clk = clk_register_fixed_factor(NULL, "apb_clk", "ahb_clk", 0, 1,
>                                         DIV_APB);
>         clk_register_clkdev(clk, "apb_clk", NULL);
> -       clk_register_clkdev(clk, "ls1x_i2c", NULL);
> -       clk_register_clkdev(clk, "ls1x_pwmtimer", NULL);
> -       clk_register_clkdev(clk, "ls1x_spi", NULL);
> -       clk_register_clkdev(clk, "ls1x_wdt", NULL);
> +       clk_register_clkdev(clk, "ls1x-ac97", NULL);
> +       clk_register_clkdev(clk, "ls1x-i2c", NULL);
> +       clk_register_clkdev(clk, "ls1x-nand", NULL);
> +       clk_register_clkdev(clk, "ls1x-pwmtimer", NULL);
> +       clk_register_clkdev(clk, "ls1x-spi", NULL);
> +       clk_register_clkdev(clk, "ls1x-wdt", NULL);
>         clk_register_clkdev(clk, "serial8250", NULL);
>  }
> --
> 1.9.1
>
>


-- 
Best regards,

Kelvin Cheung

--089e013d12baf61f7b053096ef4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear=C2=A0Stephen,<div><span style=3D"font-size:14px">Coul=
d you check this patch?</span></div><div><span style=3D"font-size:14px">Tha=
nks!</span></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2016-04-08 19:42 GMT+08:00 Keguang Zhang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:keguang.zhang@gmail.com" target=3D"_blank">keguang.zhang@gmail.com</a=
>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">From: Kelvin Cheung &lt;<a =
href=3D"mailto:keguang.zhang@gmail.com">keguang.zhang@gmail.com</a>&gt;<br>
<br>
- Rename the file to clk-loongson1.c<br>
- Add AC97, DMA and NAND clock<br>
- Update clock names<br>
- Remove superfluous error messages<br>
<br>
Signed-off-by: Kelvin Cheung &lt;<a href=3D"mailto:keguang.zhang@gmail.com"=
>keguang.zhang@gmail.com</a>&gt;<br>
<br>
---<br>
V2:<br>
=C2=A0 =C2=A0Regenerate the patch to make it review-able.<br>
---<br>
=C2=A0drivers/clk/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/clk/{clk-ls1x.c =3D&gt; clk-loongson1.c} | 25 +++++++++++++--=
----------<br>
=C2=A02 files changed, 14 insertions(+), 13 deletions(-)<br>
=C2=A0rename drivers/clk/{clk-ls1x.c =3D&gt; clk-loongson1.c} (86%)<br>
<br>
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile<br>
index 46869d6..5845b2c 100644<br>
--- a/drivers/clk/Makefile<br>
+++ b/drivers/clk/Makefile<br>
@@ -25,7 +25,7 @@ obj-$(CONFIG_COMMON_CLK_CS2000_CP)=C2=A0 =C2=A0 +=3D clk-=
cs2000-cp.o<br>
=C2=A0obj-$(CONFIG_ARCH_CLPS711X)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D clk-clps711x.o<br>
=C2=A0obj-$(CONFIG_ARCH_EFM32)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+=3D clk-efm32gg.o<br>
=C2=A0obj-$(CONFIG_ARCH_HIGHBANK)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
+=3D clk-highbank.o<br>
-obj-$(CONFIG_MACH_LOONGSON32)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D clk-l=
s1x.o<br>
+obj-$(CONFIG_MACH_LOONGSON32)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D clk-l=
oongson1.o<br>
=C2=A0obj-$(CONFIG_COMMON_CLK_MAX_GEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D clk-m=
ax-gen.o<br>
=C2=A0obj-$(CONFIG_COMMON_CLK_MAX77686)=C2=A0 =C2=A0 =C2=A0 +=3D clk-max776=
86.o<br>
=C2=A0obj-$(CONFIG_COMMON_CLK_MAX77802)=C2=A0 =C2=A0 =C2=A0 +=3D clk-max778=
02.o<br>
diff --git a/drivers/clk/clk-ls1x.c b/drivers/clk/clk-loongson1.c<br>
similarity index 86%<br>
rename from drivers/clk/clk-ls1x.c<br>
rename to drivers/clk/clk-loongson1.c<br>
index d4c6198..ce2135c 100644<br>
--- a/drivers/clk/clk-ls1x.c<br>
+++ b/drivers/clk/clk-loongson1.c<br>
@@ -1,5 +1,5 @@<br>
=C2=A0/*<br>
- * Copyright (c) 2012 Zhang, Keguang &lt;<a href=3D"mailto:keguang.zhang@g=
mail.com">keguang.zhang@gmail.com</a>&gt;<br>
+ * Copyright (c) 2012-2016 Zhang, Keguang &lt;<a href=3D"mailto:keguang.zh=
ang@gmail.com">keguang.zhang@gmail.com</a>&gt;<br>
=C2=A0 *<br>
=C2=A0 * This program is free software; you can redistribute=C2=A0 it and/o=
r modify it<br>
=C2=A0 * under=C2=A0 the terms of=C2=A0 the GNU General=C2=A0 Public Licens=
e as published by the<br>
@@ -58,11 +58,9 @@ static struct clk *__init clk_register_pll(struct device=
 *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_init_data init;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* allocate the divider */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D kzalloc(sizeof(struct clk_hw), GFP_KERNE=
L);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hw) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;%s: co=
uld not allocate clk_hw\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D kzalloc(sizeof(*hw), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(-ENO=
MEM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://init.name" rel=3D"noreferrer"=
 target=3D"_blank">init.name</a> =3D name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init.ops =3D &amp;ls1x_pll_clk_ops;<br>
@@ -80,9 +78,9 @@ static struct clk *__init clk_register_pll(struct device =
*dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return clk;<br>
=C2=A0}<br>
<br>
-static const char * const cpu_parents[] =3D { &quot;cpu_clk_div&quot;, &qu=
ot;osc_33m_clk&quot;, };<br>
-static const char * const ahb_parents[] =3D { &quot;ahb_clk_div&quot;, &qu=
ot;osc_33m_clk&quot;, };<br>
-static const char * const dc_parents[] =3D { &quot;dc_clk_div&quot;, &quot=
;osc_33m_clk&quot;, };<br>
+static const char *const cpu_parents[] =3D { &quot;cpu_clk_div&quot;, &quo=
t;osc_33m_clk&quot;, };<br>
+static const char *const ahb_parents[] =3D { &quot;ahb_clk_div&quot;, &quo=
t;osc_33m_clk&quot;, };<br>
+static const char *const dc_parents[] =3D { &quot;dc_clk_div&quot;, &quot;=
osc_33m_clk&quot;, };<br>
<br>
=C2=A0void __init ls1x_clk_init(void)<br>
=C2=A0{<br>
@@ -147,6 +145,7 @@ void __init ls1x_clk_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLK_SET_RATE_NO_REPARENT, LS1X_CLK_PL=
L_DIV,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BYPASS_DDR_SHIFT, BYPASS_DDR_WIDTH, 0=
, &amp;_lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;ahb_clk&quot;, N=
ULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x-dma&quot;, =
NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;stmmaceth&quot;,=
 NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* clock derived from AHB clk */<br>
@@ -154,9 +153,11 @@ void __init ls1x_clk_init(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk =3D clk_register_fixed_factor(NULL, &quot;a=
pb_clk&quot;, &quot;ahb_clk&quot;, 0, 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_APB)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;apb_clk&quot;, N=
ULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x_i2c&quot;, =
NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x_pwmtimer&qu=
ot;, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x_spi&quot;, =
NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x_wdt&quot;, =
NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x-ac97&quot;,=
 NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x-i2c&quot;, =
NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x-nand&quot;,=
 NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x-pwmtimer&qu=
ot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x-spi&quot;, =
NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_register_clkdev(clk, &quot;ls1x-wdt&quot;, =
NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_register_clkdev(clk, &quot;serial8250&quot;=
, NULL);<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><di=
v><div dir=3D"ltr"><div>Best regards,<br><br>Kelvin Cheung<br></div></div><=
/div></div></div></div></div>
</div></div>

--089e013d12baf61f7b053096ef4c--
