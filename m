Return-Path: <keguang.zhang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160819000244.GK361@codeaurora.org>
References: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
 <1470999108-9851-2-git-send-email-keguang.zhang@gmail.com> <20160819000244.GK361@codeaurora.org>
From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Sun, 18 Sep 2016 18:56:28 +0800
Message-ID: <CAJhJPsUvNmmo-z7pz3TJEB7TTK2sGACbcSaRJUuZib8t+n2yeQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: Loongson1: Refactor Loongson1 clock
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/alternative; boundary=089e010d89ea5e959a053cc60d2a
List-ID: <linux-clk.vger.kernel.org>

--089e010d89ea5e959a053cc60d2a
Content-Type: text/plain; charset=UTF-8

2016-08-19 8:02 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:

> On 08/12, Keguang Zhang wrote:
> > @@ -91,3 +90,4 @@ obj-$(CONFIG_COMMON_CLK_VERSATILE)  += versatile/
> >  obj-$(CONFIG_X86)                    += x86/
> >  obj-$(CONFIG_ARCH_ZX)                        += zte/
> >  obj-$(CONFIG_ARCH_ZYNQ)                      += zynq/
> > +obj-$(CONFIG_MACH_LOONGSON32)                += loongson1/
>
> Please keep this sorted alphabetically.
>

will do.


>
> > diff --git a/drivers/clk/loongson1/clk.c b/drivers/clk/loongson1/clk.c
> > new file mode 100644
> > index 0000000..367b84a
> > --- /dev/null
> > +++ b/drivers/clk/loongson1/clk.c
> > @@ -0,0 +1,52 @@
> > +/*
> > + * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
> > + *
> > + * This program is free software; you can redistribute  it and/or
> modify it
> > + * under  the terms of  the GNU General  Public License as published by
> the
> > + * Free Software Foundation;  either version 2 of the  License, or (at
> your
> > + * option) any later version.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/slab.h>
> > +
> > +int ls1x_pll_clk_enable(struct clk_hw *hw)
> > +{
> > +     return 0;
> > +}
> > +
> > +void ls1x_pll_clk_disable(struct clk_hw *hw)
> > +{
> > +}
>
> Why do we need empty functions?
>

will do.


> > +
> > +struct clk *__init clk_register_pll(struct device *dev,
> > +                                 const char *name,
> > +                                 const char *parent_name,
> > +                                 const struct clk_ops *ops,
> > +                                 unsigned long flags)
> > +{
> > +     struct clk_hw *hw;
> > +     struct clk *clk;
> > +     struct clk_init_data init;
> > +
> > +     /* allocate the divider */
> > +     hw = kzalloc(sizeof(*hw), GFP_KERNEL);
> > +     if (!hw)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     init.name = name;
> > +     init.ops = ops;
> > +     init.flags = flags | CLK_IS_BASIC;
> > +     init.parent_names = (parent_name ? &parent_name : NULL);
> > +     init.num_parents = (parent_name ? 1 : 0);
> > +     hw->init = &init;
> > +
> > +     /* register the clock */
> > +     clk = clk_register(dev, hw);
>
> Please rebase this on clk: ls1x: Migrate to clk_hw based OF and
> registration APIs. I've put that into clk-next.
>

will do.


> > +
> > +     if (IS_ERR(clk))
> > +             kfree(hw);
> > +
> > +     return clk;
> > +}
> > +
> > diff --git a/drivers/clk/loongson1/clk.h b/drivers/clk/loongson1/clk.h
> > new file mode 100644
> > index 0000000..aa880e6
> > --- /dev/null
> > +++ b/drivers/clk/loongson1/clk.h
> > @@ -0,0 +1,21 @@
> > +/*
> > + * Copyright (c) 2012-2016 Zhang, Keguang <keguang.zhang@gmail.com>
> > + *
> > + * This program is free software; you can redistribute  it and/or
> modify it
> > + * under  the terms of  the GNU General  Public License as published by
> the
> > + * Free Software Foundation;  either version 2 of the  License, or (at
> your
> > + * option) any later version.
> > + */
> > +
> > +#ifndef __LOONGSON1_CLK_H
> > +#define __LOONGSON1_CLK_H
>
> Forward declare struct clk_hw, struct device, struct clk_ops
> here.
>
> > +
> > +int ls1x_pll_clk_enable(struct clk_hw *hw);
> > +void ls1x_pll_clk_disable(struct clk_hw *hw);
> > +struct clk *__init clk_register_pll(struct device *dev,
>
> __init is unnecessary in header files.
>

will do.


> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
>



-- 
Best regards,

Kelvin Cheung

--089e010d89ea5e959a053cc60d2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2016-08-19 8:02 GMT+08:00 Stephen Boyd <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sboyd@codeaurora.org" target=3D"_blank">sboyd@codeaurora.org</a>&gt=
;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail-">On 08/12, Keguang Zhang wrote:<br>
&gt; @@ -91,3 +90,4 @@ obj-$(CONFIG_COMMON_CLK_<wbr>VERSATILE)=C2=A0 +=3D v=
ersatile/<br>
&gt;=C2=A0 obj-$(CONFIG_X86)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 +=3D x86/<br>
&gt;=C2=A0 obj-$(CONFIG_ARCH_ZX)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D zte/<br>
&gt;=C2=A0 obj-$(CONFIG_ARCH_ZYNQ)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D zynq/<br>
&gt; +obj-$(CONFIG_MACH_LOONGSON32)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 +=3D loongson1/<br>
<br>
</span>Please keep this sorted alphabetically.<br></blockquote><div><br></d=
iv><div>will do.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<div><div class=3D"gmail-h5"><br>
&gt; diff --git a/drivers/clk/loongson1/clk.c b/drivers/clk/loongson1/clk.c=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000..367b84a<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/clk/loongson1/clk.c<br>
&gt; @@ -0,0 +1,52 @@<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2012-2016 Zhang, Keguang &lt;<a href=3D"mailto:kegua=
ng.zhang@gmail.com">keguang.zhang@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute=C2=A0 it and/o=
r modify it<br>
&gt; + * under=C2=A0 the terms of=C2=A0 the GNU General=C2=A0 Public Licens=
e as published by the<br>
&gt; + * Free Software Foundation;=C2=A0 either version 2 of the=C2=A0 Lice=
nse, or (at your<br>
&gt; + * option) any later version.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/clk-provider.h&gt;<br>
&gt; +#include &lt;linux/slab.h&gt;<br>
&gt; +<br>
&gt; +int ls1x_pll_clk_enable(struct clk_hw *hw)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +void ls1x_pll_clk_disable(struct clk_hw *hw)<br>
&gt; +{<br>
&gt; +}<br>
<br>
</div></div>Why do we need empty functions?<br></blockquote><div><br>will d=
o.<br><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div><div class=3D"gmail-h5"><br>
&gt; +<br>
&gt; +struct clk *__init clk_register_pll(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *parent_name,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct clk_ops *ops,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk_init_data init;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* allocate the divider */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw =3D kzalloc(sizeof(*hw), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!hw)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<a href=3D"http://init.name" rel=3D"noreferrer" t=
arget=3D"_blank">init.name</a> =3D name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.ops =3D ops;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.flags =3D flags | CLK_IS_BASIC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.parent_names =3D (parent_name ? &amp;parent_=
name : NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.num_parents =3D (parent_name ? 1 : 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw-&gt;init =3D &amp;init;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* register the clock */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk =3D clk_register(dev, hw);<br>
<br>
</div></div>Please rebase this on clk: ls1x: Migrate to clk_hw based OF and=
<br>
registration APIs. I&#39;ve put that into clk-next.<br></blockquote><div><b=
r>will do.<br><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(hw);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return clk;<br>
&gt; +}<br>
&gt; +<br>
&gt; diff --git a/drivers/clk/loongson1/clk.h b/drivers/clk/loongson1/clk.h=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000..aa880e6<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/clk/loongson1/clk.h<br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +/*<br>
&gt; + * Copyright (c) 2012-2016 Zhang, Keguang &lt;<a href=3D"mailto:kegua=
ng.zhang@gmail.com">keguang.zhang@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute=C2=A0 it and/o=
r modify it<br>
&gt; + * under=C2=A0 the terms of=C2=A0 the GNU General=C2=A0 Public Licens=
e as published by the<br>
&gt; + * Free Software Foundation;=C2=A0 either version 2 of the=C2=A0 Lice=
nse, or (at your<br>
&gt; + * option) any later version.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __LOONGSON1_CLK_H<br>
&gt; +#define __LOONGSON1_CLK_H<br>
<br>
</span>Forward declare struct clk_hw, struct device, struct clk_ops<br>
here.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +int ls1x_pll_clk_enable(struct clk_hw *hw);<br>
&gt; +void ls1x_pll_clk_disable(struct clk_hw *hw);<br>
&gt; +struct clk *__init clk_register_pll(struct device *dev,<br>
<br>
</span>__init is unnecessary in header files.<br></blockquote><div><br>will=
 do.<br><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,<br>
a Linux Foundation Collaborative Project<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div>Best regards,<br><br>Kelvin Cheung<br><=
/div></div></div></div></div></div></div></div></div>
</div></div>

--089e010d89ea5e959a053cc60d2a--
