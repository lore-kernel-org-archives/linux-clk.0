Return-Path: <jun.nie@linaro.org>
MIME-Version: 1.0
In-Reply-To: <146914521506.8780.17917409508909624041@resonance>
References: <1468834877-22534-1-git-send-email-jun.nie@linaro.org>
 <1468834877-22534-3-git-send-email-jun.nie@linaro.org> <146888730254.8780.1667996409080895941@resonance>
 <57908230.6060104@linaro.org> <146914521506.8780.17917409508909624041@resonance>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 27 Jul 2016 17:25:42 +0800
Message-ID: <CABymUCNgCZzGQWad631b7iAim=bDoT2o3kxG8ddYebdGm8+DdA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: zx: register ZX296718 clocks using common clock framework
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Content-Type: multipart/alternative; boundary=94eb2c05c4feff508805389a99ab
List-ID: <linux-clk.vger.kernel.org>

--94eb2c05c4feff508805389a99ab
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2016-07-22 7:53 GMT+08:00 Michael Turquette <mturquette@baylibre.com>:

> Quoting Jun Nie (2016-07-21 01:05:04)
> > On 2016=E5=B9=B407=E6=9C=8819=E6=97=A5 08:15, Michael Turquette wrote:
> > > Hi Jun Nie,
> > >
> > > Quoting Jun Nie (2016-07-18 02:41:17)
> > >> +Required properties:
> > >> +- compatible : shall be one of the following:
> > >> +       "zte,zx296718-topcrm":
> > >> +               zx296718 top clock selection, divider and gating
> > >> +
> > >> +       "zte,zx296718-lsp0crm" and
> > >> +       "zte,zx296718-lsp1crm":
> > >> +               zx296718 device level clock selection and gating
> > >> +
> > >> +- reg: Address and length of the register set
> > >
> > > clock-cells?
> >
> > Right, there are several clock controllers with sparse register regions=
.
> > So separate initialization is needed.
> >
> > >
> > >> +#include <linux/clk.h>
> > >
> > > Is clk.h needed? I don't see any clock consumer api's used in this
> > > driver.
> >
> > I can remove that.
> >
> > >
> > >> +struct zx_fixed_factor_clock top_ffactor_clk[] =3D {
> > >> +       FFACTOR(0, "clk4m",             "osc24m", 1, 6,  0),
> > >> +       FFACTOR(0, "clk2m",             "osc24m", 1, 12, 0),
> > >> +       /* pll cpu */
> > >> +       FFACTOR(0, "clk1600m",          "pll_cpu", 1, 1,
> CLK_SET_RATE_PARENT),
> > >> +       FFACTOR(0, "clk800m",           "pll_cpu", 1, 2,
> CLK_SET_RATE_PARENT),
> > >
> > > You have a lot of static data here, which is good. It can be expanded
> to
> > > fill out struct clk_init_data (as showed in my reply to patch #2) and
> > > then you can get rid of all of the registration functions.
>

Mike,

Are you OK if I wrap clk_gate as below? With this way, I can set id when
declaring the clk and fill the clk_provider hw pointer later with two line
of code automatically in probe function, instead of filling the provider
hw/id manually. Lots of line in driver is saved with defining clks in array
instead of separate declaration with names, long list of clk provider
contents is also saved, which also ease maintenance. Cons is that extra
memory is needed. Fixed factor, mux are in similar case.

struct zx_clk_gate {
         struct clk_gate gate;
         u16     id;
 };

static struct zx_clk_gate lsp0_gates =3D {
GATE(LSP0_SSP1_ID, "ssp1_wclk", "ssp1_div", LSP0_SSP1_CLK, 1,
CLK_SET_RATE_PARENT, 0),
GATE(LSP0_I2C4_ID, "i2c4_wclk", "i2c4_wclk_mux", LSP0_I2C4_CLK, 1,
CLK_SET_RATE_PARENT, 0),
...
};

struct zx_clk_gate *idx =3D &lsp0_gates[0];
for (i =3D 0; i < ARRARY_SIZE(lsp0_gates); i++) {
         if (idx->id)
                 hw_onecell_dat->hws[idx->id] =3D &idx->gate.hw;
}

 Jun

>
> > Yes, your reply to patch #2 does save registration functions. I will tr=
y
> > to follow that way. Thank you!
> >
> > >
> > >> diff --git a/include/dt-bindings/clock/zx296718-clock.h
> b/include/dt-bindings/clock/zx296718-clock.h
> > >> new file mode 100644
> > >> index 0000000..97d45e2
> > >> --- /dev/null
> > >> +++ b/include/dt-bindings/clock/zx296718-clock.h
> > >> @@ -0,0 +1,140 @@
> > >> +/*
> > >> + * Copyright (C) 2015 - 2016 ZTE Corporation.
> > >> + *
> > >> + * This program is free software; you can redistribute it and/or
> modify
> > >> + * it under the terms of the GNU General Public License version 2 a=
s
> > >> + * published by the Free Software Foundation.
> > >> + */
> > >> +#ifndef __DT_BINDINGS_CLOCK_ZX296718_H
> > >> +#define __DT_BINDINGS_CLOCK_ZX296718_H
> > >> +
> > >> +/* PLL */
> > >> +#define ZX296718_OSC           0
> > >> +#define ZX296718_PLL_CPU       1
> > >> +#define ZX296718_PLL_MAC       2
> > >> +#define ZX296718_PLL_MM0       3
> > >> +#define ZX296718_PLL_MM1       4
> > >> +#define ZX296718_PLL_VGA       5
> > >> +#define ZX296718_PLL_DDR       6
> > >> +#define ZX296718_PLL_AUDIO     7
> > >> +#define ZX296718_PLL_HSIC      8
> > >
> > > For some clock controllers I suggest to split this list of numbers in=
to
> > > a private header that is only used by the Linux driver, and another
> > > shared DT header that exposes only the clocks that will be consumed b=
y
> > > downstream drivers (usually just leaf gate clocks).
> > >
> > > This also means that you can hide the ugly NR_CLKS stuff in the C-onl=
y
> > > implementation and not add that Linux-specific data into the generic
> > > binding description. It's up to you though.
> >
> > NR_CLKS provides redundant info to drivers and generic binding
> > description. Maybe that's why you think it is ugly. But move clocks fro=
m
> > private header to DT binding header later will result redundant change
> > history and effort. If that's all situation, I prefer to expose all
> > information in DT binding header.
>
> Sure, that sounds fine to me.
>
> Regards,
> Mike
>
> >
> > >
> > > Regards,
> > > Mike
> > >
> >
>

--94eb2c05c4feff508805389a99ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2016-07-22 7:53 GMT+08:00 Michael Turquette <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:mturquette@baylibre.com" target=3D"_blank">mturquette@baylibre=
.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex">Quoting Jun Nie (2016-07-21 01:05:=
04)<br>
<div><div class=3D"h5">&gt; On 2016=E5=B9=B407=E6=9C=8819=E6=97=A5 08:15, M=
ichael Turquette wrote:<br>
&gt; &gt; Hi Jun Nie,<br>
&gt; &gt;<br>
&gt; &gt; Quoting Jun Nie (2016-07-18 02:41:17)<br>
&gt; &gt;&gt; +Required properties:<br>
&gt; &gt;&gt; +- compatible : shall be one of the following:<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;zte,zx296718-topcrm&quot;:<=
br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx296=
718 top clock selection, divider and gating<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;zte,zx296718-lsp0crm&quot; =
and<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;zte,zx296718-lsp1crm&quot;:=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zx296=
718 device level clock selection and gating<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +- reg: Address and length of the register set<br>
&gt; &gt;<br>
&gt; &gt; clock-cells?<br>
&gt;<br>
&gt; Right, there are several clock controllers with sparse register region=
s.<br>
&gt; So separate initialization is needed.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; +#include &lt;linux/clk.h&gt;<br>
&gt; &gt;<br>
&gt; &gt; Is clk.h needed? I don&#39;t see any clock consumer api&#39;s use=
d in this<br>
&gt; &gt; driver.<br>
&gt;<br>
&gt; I can remove that.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; +struct zx_fixed_factor_clock top_ffactor_clk[] =3D {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FFACTOR(0, &quot;clk4m&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;osc24m&quot;, 1, 6,=C2=
=A0 0),<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FFACTOR(0, &quot;clk2m&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;osc24m&quot;, 1, 12, 0),=
<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* pll cpu */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FFACTOR(0, &quot;clk1600m&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll_cpu&quot;, 1, 1, CLK_SET_RATE_=
PARENT),<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0FFACTOR(0, &quot;clk800m&quot;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;pll_cpu&quot;, 1, 2, CLK_SET=
_RATE_PARENT),<br>
&gt; &gt;<br>
&gt; &gt; You have a lot of static data here, which is good. It can be expa=
nded to<br>
&gt; &gt; fill out struct clk_init_data (as showed in my reply to patch #2)=
 and<br>
&gt; &gt; then you can get rid of all of the registration functions.<br></d=
iv></div></blockquote><div><br></div><div>Mike,</div><div><br></div><div>Ar=
e you OK if I wrap=C2=A0clk_gate as below? With this way, I can set id when=
 declaring the clk and fill the clk_provider hw pointer later with two line=
 of code automatically in probe function, instead of filling the provider h=
w/id manually. Lots of line in driver is saved with defining clks in array =
instead of separate declaration with names, long list of clk provider conte=
nts is also saved, which also ease maintenance. Cons is that extra memory i=
s needed. Fixed factor, mux are in similar case.</div><div><br></div><div><=
div>struct zx_clk_gate {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 clk_gate gate;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u16 =C2=A0 =C2=
=A0 id;</div><div>=C2=A0};</div></div><div><br></div><div>static struct zx_=
clk_gate lsp0_gates =3D {<br></div><div>GATE(LSP0_SSP1_ID, &quot;ssp1_wclk&=
quot;, &quot;ssp1_div&quot;, LSP0_SSP1_CLK, 1, CLK_SET_RATE_PARENT, 0),<br>=
</div><div>GATE(LSP0_I2C4_ID, &quot;i2c4_wclk&quot;, &quot;i2c4_wclk_mux&qu=
ot;, LSP0_I2C4_CLK, 1, CLK_SET_RATE_PARENT, 0),<br></div><div>...</div><div=
>};</div><div><br></div><div>struct zx_clk_gate *idx =3D &amp;lsp0_gates[0]=
;<br></div><div>for (i =3D 0; i &lt; ARRARY_SIZE(lsp0_gates); i++) {</div><=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (idx-&gt;id)</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw_onecell_dat-&gt;=
hws[idx-&gt;id] =3D &amp;idx-&gt;gate.hw;</div></div><div>}</div><div><br><=
/div><div>=C2=A0Jun</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;border-left-color:rgb(204,204,204);padding-left:1ex"><div><div class=3D=
"h5">
&gt;<br>
&gt; Yes, your reply to patch #2 does save registration functions. I will t=
ry<br>
&gt; to follow that way. Thank you!<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; diff --git a/include/dt-bindings/clock/zx296718-clock.h b/inc=
lude/dt-bindings/clock/zx296718-clock.h<br>
&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; index 0000000..97d45e2<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++ b/include/dt-bindings/clock/zx296718-clock.h<br>
&gt; &gt;&gt; @@ -0,0 +1,140 @@<br>
&gt; &gt;&gt; +/*<br>
&gt; &gt;&gt; + * Copyright (C) 2015 - 2016 ZTE Corporation.<br>
&gt; &gt;&gt; + *<br>
&gt; &gt;&gt; + * This program is free software; you can redistribute it an=
d/or modify<br>
&gt; &gt;&gt; + * it under the terms of the GNU General Public License vers=
ion 2 as<br>
&gt; &gt;&gt; + * published by the Free Software Foundation.<br>
&gt; &gt;&gt; + */<br>
&gt; &gt;&gt; +#ifndef __DT_BINDINGS_CLOCK_ZX296718_H<br>
&gt; &gt;&gt; +#define __DT_BINDINGS_CLOCK_ZX296718_H<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +/* PLL */<br>
&gt; &gt;&gt; +#define ZX296718_OSC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00<br>
&gt; &gt;&gt; +#define ZX296718_PLL_CPU=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
&gt; &gt;&gt; +#define ZX296718_PLL_MAC=C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
&gt; &gt;&gt; +#define ZX296718_PLL_MM0=C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
&gt; &gt;&gt; +#define ZX296718_PLL_MM1=C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
&gt; &gt;&gt; +#define ZX296718_PLL_VGA=C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
&gt; &gt;&gt; +#define ZX296718_PLL_DDR=C2=A0 =C2=A0 =C2=A0 =C2=A06<br>
&gt; &gt;&gt; +#define ZX296718_PLL_AUDIO=C2=A0 =C2=A0 =C2=A07<br>
&gt; &gt;&gt; +#define ZX296718_PLL_HSIC=C2=A0 =C2=A0 =C2=A0 8<br>
&gt; &gt;<br>
&gt; &gt; For some clock controllers I suggest to split this list of number=
s into<br>
&gt; &gt; a private header that is only used by the Linux driver, and anoth=
er<br>
&gt; &gt; shared DT header that exposes only the clocks that will be consum=
ed by<br>
&gt; &gt; downstream drivers (usually just leaf gate clocks).<br>
&gt; &gt;<br>
&gt; &gt; This also means that you can hide the ugly NR_CLKS stuff in the C=
-only<br>
&gt; &gt; implementation and not add that Linux-specific data into the gene=
ric<br>
&gt; &gt; binding description. It&#39;s up to you though.<br>
&gt;<br>
&gt; NR_CLKS provides redundant info to drivers and generic binding<br>
&gt; description. Maybe that&#39;s why you think it is ugly. But move clock=
s from<br>
&gt; private header to DT binding header later will result redundant change=
<br>
&gt; history and effort. If that&#39;s all situation, I prefer to expose al=
l<br>
&gt; information in DT binding header.<br>
<br>
</div></div>Sure, that sounds fine to me.<br>
<br>
Regards,<br>
Mike<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Mike<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div><br></div></div>

--94eb2c05c4feff508805389a99ab--
