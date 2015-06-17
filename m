Return-Path: <lho@apm.com>
MIME-Version: 1.0
In-Reply-To: <1434525703-3936-1-git-send-email-matthias.bgg@gmail.com>
References: <1434525703-3936-1-git-send-email-matthias.bgg@gmail.com>
Date: Wed, 17 Jun 2015 12:56:52 -0700
Message-ID: <CAPw-ZTkrEVJ=9jBHUsqxab0KJaOW38xq_0mu6oeY3hnSu44Y=g@mail.gmail.com>
Subject: Re: [PATCH] clk: xgene: Delete duplicated name field
From: Loc Ho <lho@apm.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, sboyd@codeaurora.org,
	Kumar Sankaran <ksankaran@apm.com>, Vinayak Kale <vkale@apm.com>, Feng Kan <fkan@apm.co>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary=089e0158b6d89afabf0518bc173c
List-ID: <linux-clk.vger.kernel.org>

--089e0158b6d89afabf0518bc173c
Content-Type: text/plain; charset=UTF-8

Hi,

The change looks fine to me. Though, it seems like linux-next has an
slightly modified version as a few lines didn't apply correctly.

-Loc

On Wed, Jun 17, 2015 at 12:21 AM, Matthias Brugger <matthias.bgg@gmail.com>
wrote:

> X-Gene clocks implement it's name in the clock private struct.
> This is a duplication of the name field. We can delete the field
> and rely on the common implementation to retrieve the name.
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/clk/clk-xgene.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
> index dd8a62d..4798896 100644
> --- a/drivers/clk/clk-xgene.c
> +++ b/drivers/clk/clk-xgene.c
> @@ -60,7 +60,6 @@ enum xgene_pll_type {
>
>  struct xgene_clk_pll {
>         struct clk_hw   hw;
> -       const char      *name;
>         void __iomem    *reg;
>         spinlock_t      *lock;
>         u32             pll_offset;
> @@ -75,7 +74,7 @@ static int xgene_clk_pll_is_enabled(struct clk_hw *hw)
>         u32 data;
>
>         data = xgene_clk_read(pllclk->reg + pllclk->pll_offset);
> -       pr_debug("%s pll %s\n", pllclk->name,
> +       pr_debug("%s pll %s\n", __clk_get_name(hw->clk),
>                 data & REGSPEC_RESET_F1_MASK ? "disabled" : "enabled");
>
>         return data & REGSPEC_RESET_F1_MASK ? 0 : 1;
> @@ -113,7 +112,7 @@ static unsigned long xgene_clk_pll_recalc_rate(struct
> clk_hw *hw,
>                 fref = parent_rate / nref;
>                 fvco = fref * nfb;
>         }
> -       pr_debug("%s pll recalc rate %ld parent %ld\n", pllclk->name,
> +       pr_debug("%s pll recalc rate %ld parent %ld\n",
> __clk_get_name(hw->clk),
>                 fvco / nout, parent_rate);
>
>         return fvco / nout;
> @@ -146,7 +145,6 @@ static struct clk *xgene_register_clk_pll(struct
> device *dev,
>         init.parent_names = parent_name ? &parent_name : NULL;
>         init.num_parents = parent_name ? 1 : 0;
>
> -       apmclk->name = name;
>         apmclk->reg = reg;
>         apmclk->lock = lock;
>         apmclk->pll_offset = pll_offset;
> @@ -210,7 +208,6 @@ struct xgene_dev_parameters {
>
>  struct xgene_clk {
>         struct clk_hw   hw;
> -       const char      *name;
>         spinlock_t      *lock;
>         struct xgene_dev_parameters     param;
>  };
> @@ -227,7 +224,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
>                 spin_lock_irqsave(pclk->lock, flags);
>
>         if (pclk->param.csr_reg != NULL) {
> -               pr_debug("%s clock enabled\n", pclk->name);
> +               pr_debug("%s clock enabled\n", __clk_get_name(hw->clk));
>                 /* First enable the clock */
>                 data = xgene_clk_read(pclk->param.csr_reg +
>                                         pclk->param.reg_clk_offset);
> @@ -235,7 +232,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
>                 xgene_clk_write(data, pclk->param.csr_reg +
>                                         pclk->param.reg_clk_offset);
>                 pr_debug("%s clock PADDR base 0x%016LX clk offset 0x%08X
> mask 0x%08X value 0x%08X\n",
> -                       pclk->name, __pa(pclk->param.csr_reg),
> +                       __clk_get_name(hw->clk), __pa(pclk->param.csr_reg),
>                         pclk->param.reg_clk_offset,
> pclk->param.reg_clk_mask,
>                         data);
>
> @@ -246,7 +243,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
>                 xgene_clk_write(data, pclk->param.csr_reg +
>                                         pclk->param.reg_csr_offset);
>                 pr_debug("%s CSR RESET PADDR base 0x%016LX csr offset
> 0x%08X mask 0x%08X value 0x%08X\n",
> -                       pclk->name, __pa(pclk->param.csr_reg),
> +                       __clk_get_name(hw->clk), __pa(pclk->param.csr_reg),
>                         pclk->param.reg_csr_offset,
> pclk->param.reg_csr_mask,
>                         data);
>         }
> @@ -267,7 +264,7 @@ static void xgene_clk_disable(struct clk_hw *hw)
>                 spin_lock_irqsave(pclk->lock, flags);
>
>         if (pclk->param.csr_reg != NULL) {
> -               pr_debug("%s clock disabled\n", pclk->name);
> +               pr_debug("%s clock disabled\n", __clk_get_name(hw->clk));
>                 /* First put the CSR in reset */
>                 data = xgene_clk_read(pclk->param.csr_reg +
>                                         pclk->param.reg_csr_offset);
> @@ -293,10 +290,10 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)
>         u32 data = 0;
>
>         if (pclk->param.csr_reg != NULL) {
> -               pr_debug("%s clock checking\n", pclk->name);
> +               pr_debug("%s clock checking\n", __clk_get_name(hw->clk));
>                 data = xgene_clk_read(pclk->param.csr_reg +
>                                         pclk->param.reg_clk_offset);
> -               pr_debug("%s clock is %s\n", pclk->name,
> +               pr_debug("%s clock is %s\n", __clk_get_name(hw->clk),
>                         data & pclk->param.reg_clk_mask ? "enabled" :
>                                                         "disabled");
>         }
> @@ -319,11 +316,13 @@ static unsigned long xgene_clk_recalc_rate(struct
> clk_hw *hw,
>                 data &= (1 << pclk->param.reg_divider_width) - 1;
>
>                 pr_debug("%s clock recalc rate %ld parent %ld\n",
> -                       pclk->name, parent_rate / data, parent_rate);
> +                       __clk_get_name(hw->clk),
> +                       parent_rate / data, parent_rate);
> +
>                 return parent_rate / data;
>         } else {
>                 pr_debug("%s clock recalc rate %ld parent %ld\n",
> -                       pclk->name, parent_rate, parent_rate);
> +                       __clk_get_name(hw->clk), parent_rate, parent_rate);
>                 return parent_rate;
>         }
>  }
> @@ -355,7 +354,7 @@ static int xgene_clk_set_rate(struct clk_hw *hw,
> unsigned long rate,
>                 data |= divider;
>                 xgene_clk_write(data, pclk->param.divider_reg +
>                                         pclk->param.reg_divider_offset);
> -               pr_debug("%s clock set rate %ld\n", pclk->name,
> +               pr_debug("%s clock set rate %ld\n",
> __clk_get_name(hw->clk),
>                         parent_rate / divider_save);
>         } else {
>                 divider_save = 1;
> @@ -417,7 +416,6 @@ static struct clk *xgene_register_clk(struct device
> *dev,
>         init.parent_names = parent_name ? &parent_name : NULL;
>         init.num_parents = parent_name ? 1 : 0;
>
> -       apmclk->name = name;
>         apmclk->lock = lock;
>         apmclk->hw.init = &init;
>         apmclk->param = *parameters;
> --
> 1.9.1
>
>

--089e0158b6d89afabf0518bc173c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">The change looks fine to me. T=
hough, it seems like linux-next has an slightly modified version as a few l=
ines didn&#39;t apply correctly.</div><div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif">-Loc</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jun 17, 2015 at 12:=
21 AM, Matthias Brugger <span dir=3D"ltr">&lt;<a href=3D"mailto:matthias.bg=
g@gmail.com" target=3D"_blank">matthias.bgg@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">X-Gene clocks implement it&#39;s name in=
 the clock private struct.<br>
This is a duplication of the name field. We can delete the field<br>
and rely on the common implementation to retrieve the name.<br>
<br>
Signed-off-by: Matthias Brugger &lt;<a href=3D"mailto:matthias.bgg@gmail.co=
m">matthias.bgg@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/clk/clk-xgene.c | 28 +++++++++++++---------------<br>
=C2=A01 file changed, 13 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c<br>
index dd8a62d..4798896 100644<br>
--- a/drivers/clk/clk-xgene.c<br>
+++ b/drivers/clk/clk-xgene.c<br>
@@ -60,7 +60,6 @@ enum xgene_pll_type {<br>
<br>
=C2=A0struct xgene_clk_pll {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_hw=C2=A0 =C2=A0hw;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char=C2=A0 =C2=A0 =C2=A0 *name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem=C2=A0 =C2=A0 *reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spinlock_t=C2=A0 =C2=A0 =C2=A0 *lock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pll_offset;<br>
@@ -75,7 +74,7 @@ static int xgene_clk_pll_is_enabled(struct clk_hw *hw)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 data;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D xgene_clk_read(pllclk-&gt;reg + pllclk=
-&gt;pll_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s pll %s\n&quot;, pllclk-&gt;na=
me,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s pll %s\n&quot;, __clk_get_nam=
e(hw-&gt;clk),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data &amp; REGSPEC_=
RESET_F1_MASK ? &quot;disabled&quot; : &quot;enabled&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return data &amp; REGSPEC_RESET_F1_MASK ? 0 : 1=
;<br>
@@ -113,7 +112,7 @@ static unsigned long xgene_clk_pll_recalc_rate(struct c=
lk_hw *hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fref =3D parent_rat=
e / nref;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fvco =3D fref * nfb=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s pll recalc rate %ld parent %l=
d\n&quot;, pllclk-&gt;name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s pll recalc rate %ld parent %l=
d\n&quot;, __clk_get_name(hw-&gt;clk),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fvco / nout, parent=
_rate);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fvco / nout;<br>
@@ -146,7 +145,6 @@ static struct clk *xgene_register_clk_pll(struct device=
 *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init.parent_names =3D parent_name ? &amp;parent=
_name : NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init.num_parents =3D parent_name ? 1 : 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0apmclk-&gt;name =3D name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 apmclk-&gt;reg =3D reg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 apmclk-&gt;lock =3D lock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 apmclk-&gt;pll_offset =3D pll_offset;<br>
@@ -210,7 +208,6 @@ struct xgene_dev_parameters {<br>
<br>
=C2=A0struct xgene_clk {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_hw=C2=A0 =C2=A0hw;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char=C2=A0 =C2=A0 =C2=A0 *name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spinlock_t=C2=A0 =C2=A0 =C2=A0 *lock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct xgene_dev_parameters=C2=A0 =C2=A0 =C2=A0=
param;<br>
=C2=A0};<br>
@@ -227,7 +224,7 @@ static int xgene_clk_enable(struct clk_hw *hw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(p=
clk-&gt;lock, flags);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pclk-&gt;param.csr_reg !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock enabled\n&quot;, pclk-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock enabled\n&quot;, __clk_get_name(hw-&gt;clk));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* First enable the=
 clock */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D xgene_clk_=
read(pclk-&gt;param.csr_reg +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pclk-&gt=
;param.reg_clk_offset);<br>
@@ -235,7 +232,7 @@ static int xgene_clk_enable(struct clk_hw *hw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xgene_clk_write(dat=
a, pclk-&gt;param.csr_reg +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pclk-&gt=
;param.reg_clk_offset);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s c=
lock PADDR base 0x%016LX clk offset 0x%08X mask 0x%08X value 0x%08X\n&quot;=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pclk-&gt;name, __pa(pclk-&gt;param.csr_reg),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__clk_get_name(hw-&gt;clk), __pa(pclk-&gt;param.csr_reg),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pclk-&gt;param.reg_clk_offset, pclk-&gt;param.reg_clk_mask,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 data);<br>
<br>
@@ -246,7 +243,7 @@ static int xgene_clk_enable(struct clk_hw *hw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xgene_clk_write(dat=
a, pclk-&gt;param.csr_reg +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pclk-&gt=
;param.reg_csr_offset);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s C=
SR RESET PADDR base 0x%016LX csr offset 0x%08X mask 0x%08X value 0x%08X\n&q=
uot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pclk-&gt;name, __pa(pclk-&gt;param.csr_reg),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__clk_get_name(hw-&gt;clk), __pa(pclk-&gt;param.csr_reg),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pclk-&gt;param.reg_csr_offset, pclk-&gt;param.reg_csr_mask,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 data);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -267,7 +264,7 @@ static void xgene_clk_disable(struct clk_hw *hw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsave(p=
clk-&gt;lock, flags);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pclk-&gt;param.csr_reg !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock disabled\n&quot;, pclk-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock disabled\n&quot;, __clk_get_name(hw-&gt;clk));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* First put the CS=
R in reset */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D xgene_clk_=
read(pclk-&gt;param.csr_reg +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pclk-&gt=
;param.reg_csr_offset);<br>
@@ -293,10 +290,10 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 data =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pclk-&gt;param.csr_reg !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock checking\n&quot;, pclk-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock checking\n&quot;, __clk_get_name(hw-&gt;clk));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D xgene_clk_=
read(pclk-&gt;param.csr_reg +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pclk-&gt=
;param.reg_clk_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock is %s\n&quot;, pclk-&gt;name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock is %s\n&quot;, __clk_get_name(hw-&gt;clk),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 data &amp; pclk-&gt;param.reg_clk_mask ? &quot;enabled&quot; :<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;disabled&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -319,11 +316,13 @@ static unsigned long xgene_clk_recalc_rate(struct clk=
_hw *hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data &amp;=3D (1 &l=
t;&lt; pclk-&gt;param.reg_divider_width) - 1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s c=
lock recalc rate %ld parent %ld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pclk-&gt;name, parent_rate / data, parent_rate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__clk_get_name(hw-&gt;clk),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0parent_rate / data, parent_rate);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return parent_rate =
/ data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_debug(&quot;%s c=
lock recalc rate %ld parent %ld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pclk-&gt;name, parent_rate, parent_rate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__clk_get_name(hw-&gt;clk), parent_rate, parent_rate);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return parent_rate;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
@@ -355,7 +354,7 @@ static int xgene_clk_set_rate(struct clk_hw *hw, unsign=
ed long rate,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data |=3D divider;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xgene_clk_write(dat=
a, pclk-&gt;param.divider_reg +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pclk-&gt=
;param.reg_divider_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock set rate %ld\n&quot;, pclk-&gt;name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s c=
lock set rate %ld\n&quot;, __clk_get_name(hw-&gt;clk),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 parent_rate / divider_save);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 divider_save =3D 1;=
<br>
@@ -417,7 +416,6 @@ static struct clk *xgene_register_clk(struct device *de=
v,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init.parent_names =3D parent_name ? &amp;parent=
_name : NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 init.num_parents =3D parent_name ? 1 : 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0apmclk-&gt;name =3D name;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 apmclk-&gt;lock =3D lock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 apmclk-&gt;hw.init =3D &amp;init;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 apmclk-&gt;param =3D *parameters;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div></div>

--089e0158b6d89afabf0518bc173c--
