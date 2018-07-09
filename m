Return-Path: <alberto@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <4069085.blmd9nAIm0@phil>
References: <1530883132-17678-1-git-send-email-anthony@amarulasolutions.com>
 <1530883132-17678-2-git-send-email-anthony@amarulasolutions.com> <4069085.blmd9nAIm0@phil>
From: Alberto Panizzo <alberto@amarulasolutions.com>
Date: Mon, 9 Jul 2018 18:03:05 +0200
Message-ID: <CALERVAa+iN39-AguC3W1yVjRbZC=TDwp-vsxJ_3YRY_i=_AOVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: rockchip: rk3399: fix returning correct value on
 clk_i2sout get_rate [with GET_RATE_NOCACHE]
To: Heiko Stuebner <heiko@sntech.de>
Cc: Anthony Brandon <anthony@amarulasolutions.com>, linux-rockchip@lists.infradead.org,
	mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000003544650570932686"
List-ID: <linux-clk.vger.kernel.org>

--0000000000003544650570932686
Content-Type: text/plain; charset="UTF-8"

Hi Heiko,

On Sun, Jul 8, 2018 at 11:32 AM, Heiko Stuebner <heiko@sntech.de> wrote:

> Hi,
>
> Am Freitag, 6. Juli 2018, 15:18:52 CEST schrieb Anthony Brandon:
> > From: Alberto Panizzo <alberto@amarulasolutions.com>
> >
> > clk_i2sout can be used as codec mclk.
> > On simple audio card clk_i2sout is just enabled/disabled while the rate
> > is decided on parent clock by i2s driver.
> > Without setting CLK_GET_RATE_NOCACHE flag, the get_rate function on
> > clk_i2sout would return incorrect values after clk_i2sout's parents
> > update.
>
> Can you elaborate a bit more on the issue you see please?
> Because as far as I remember the clock-framework should already
> update child-clocks when the rate of their parent changed.
>
> So even the cached rate should be correct after the parent changes,
> so I don't really understand in what case you would get a wrong rate.
>
>
You are right, I'm sorry this patch were coming from days of long test and
checks
to understand why clk_get_rate were returning 0 while parents clocks were
set.
(And working with a codec which does not offer deterministic results)

Especially, after having found and fixed the bits misconfigurations, a
clk_get_rate
on clk_i2sout before the first clk_i2s0 set_rate is returning 0.

But clk_i2s0_mux results unparented before first clk_i2s0 set_rate and with
or without
NOCACHE, until a set_rate is called on clk_i2s0, a get_rate on clk_i2sout
will return 0.

This does not prevent good behavior after first _hw_params() so please,
drop this patch.
But patch 1/2 is necessary, please apply.

Thanks,

Alberto Panizzo
--
Amarula Solutions SRL                     Via le Canevare 30 31100 Treviso
Italy
Amarula Solutions BV           Cruquiuskade 47 Amsterdam 1018 AM The
Netherlands
Phone. +31(0)851119171 Fax. +31(0)204106211
www.amarulasolutions.com



>
>
> > Signed-off-by: Alberto Panizzo <alberto@amarulasolutions.com>
> > Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
> > ---
> >  drivers/clk/rockchip/clk-rk3399.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/rockchip/clk-rk3399.c
> b/drivers/clk/rockchip/clk-rk3399.c
> > index 2a8634a..6073479 100644
> > --- a/drivers/clk/rockchip/clk-rk3399.c
> > +++ b/drivers/clk/rockchip/clk-rk3399.c
> > @@ -630,7 +630,8 @@ static struct rockchip_clk_branch
> rk3399_clk_branches[] __initdata = {
> >
> >       MUX(0, "clk_i2sout_src", mux_i2sch_p, CLK_SET_RATE_PARENT,
> >                       RK3399_CLKSEL_CON(31), 0, 2, MFLAGS),
> > -     COMPOSITE_NODIV(SCLK_I2S_8CH_OUT, "clk_i2sout", mux_i2sout_p,
> CLK_SET_RATE_PARENT,
> > +     COMPOSITE_NODIV(SCLK_I2S_8CH_OUT, "clk_i2sout", mux_i2sout_p,
> > +                     CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> >                       RK3399_CLKSEL_CON(31), 2, 1, MFLAGS,
> >                       RK3399_CLKGATE_CON(8), 12, GFLAGS),
> >
> >
>
>
>
>
>

--0000000000003544650570932686
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<span style=3D"font-size:12.8px;text-decoration-st=
yle:initial;text-decoration-color:initial;float:none;display:inline">Heiko,=
</span><div class=3D"gmail_extra"><div><div class=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><br></div></div></div></div></div><div cl=
ass=3D"gmail_quote">On Sun, Jul 8, 2018 at 11:32 AM, Heiko Stuebner <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:heiko@sntech.de" target=3D"_blank">heiko@s=
ntech.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
Am Freitag, 6. Juli 2018, 15:18:52 CEST schrieb Anthony Brandon:<br>
&gt; From: Alberto Panizzo &lt;<a href=3D"mailto:alberto@amarulasolutions.c=
om">alberto@amarulasolutions.com</a>&gt;<br>
&gt; <br>
&gt; clk_i2sout can be used as codec mclk.<br>
&gt; On simple audio card clk_i2sout is just enabled/disabled while the rat=
e<br>
&gt; is decided on parent clock by i2s driver.<br>
&gt; Without setting CLK_GET_RATE_NOCACHE flag, the get_rate function on<br=
>
&gt; clk_i2sout would return incorrect values after clk_i2sout&#39;s parent=
s<br>
&gt; update.<br>
<br>
Can you elaborate a bit more on the issue you see please?<br>
Because as far as I remember the clock-framework should already<br>
update child-clocks when the rate of their parent changed.<br>
<br>
So even the cached rate should be correct after the parent changes,<br>
so I don&#39;t really understand in what case you would get a wrong rate.<b=
r><br></blockquote><div><br></div><div>You are right, I&#39;m sorry this pa=
tch were coming from days of long test and checks</div><div>to understand w=
hy clk_get_rate were returning 0 while parents clocks were set.</div><div>(=
And working with a codec which does not offer deterministic results)</div><=
div><br></div><div>Especially, after having found and fixed the bits miscon=
figurations, a=C2=A0<span style=3D"font-size:small;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">clk_get_rate</span></div><div><span style=3D"font-siz=
e:small;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">on=C2=A0<span style=
=3D"text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">clk_i2sout=C2=A0</span></span>before the first clk_i2s0 set=
_rate is returning 0.</div><div><br></div><div>But clk_i2s0_mux results unp=
arented before=C2=A0<span style=3D"font-size:small;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">first clk_i2s0 set_rate and with or without</span></d=
iv><div><span style=3D"font-size:small;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">NOCACHE, until a set_rate is called on=C2=A0<span style=3D"text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">clk_i2s0, a get_rate on=C2=A0<span style=3D"font-size:small;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">clk_i2sout will return 0.</span></span=
></span></div><div><span style=3D"font-size:small;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline"><span style=3D"text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline"><span style=3D"font-size:sm=
all;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline"><br></span></span></span>=
</div><div><span style=3D"font-size:small;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial;float:none;dis=
play:inline"><span style=3D"text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline"><span style=3D"font-size:small;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">This does not prevent good behavi=
or after first _hw_params() so please, drop this patch.</span></span></span=
></div><div><span style=3D"font-size:small;background-color:rgb(255,255,255=
);text-decoration-style:initial;text-decoration-color:initial;float:none;di=
splay:inline"><span style=3D"text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline"><span style=3D"font-size:small;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">But patch 1/2 is necessary, plea=
se apply.</span></span></span></div><div><span style=3D"font-size:small;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline"><span style=3D"text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline"><span=
 style=3D"font-size:small;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline"><br=
></span></span></span></div><div><span style=3D"font-size:small;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline"><span style=3D"text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline"><span style=
=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">Thanks,</=
span></span></span></div><div><span style=3D"font-size:small;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline"><span style=3D"text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline"><span style=3D"f=
ont-size:small;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline"><br></span></s=
pan></span></div><div><span style=3D"font-size:small;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline"><span style=3D"text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline"><span style=3D"font-size=
:small;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">Alberto Panizzo</span>=
</span></span></div><div><span style=3D"font-size:small;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline"><span style=3D"text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline"><span style=3D"font-s=
ize:small;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">--</span></span></s=
pan></div><div>Amarula Solutions SRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Via le Canevare 30 31100 Treviso Ital=
y</div><div>Amarula Solutions BV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cr=
uquiuskade 47 Amsterdam 1018 AM The Netherlands</div><div>Phone. +31(0)8511=
19171 Fax. +31(0)204106211=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<=
a href=3D"http://www.amarulasolutions.com">www.amarulasolutions.com</a></di=
v><div><span style=3D"font-size:small;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline"><span style=3D"text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><span style=3D"font-size:small;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">=C2=A0=C2=A0</span></span></span></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; Signed-off-by: Alberto Panizzo &lt;<a href=3D"mailto:alberto@amarulaso=
lutions.com">alberto@amarulasolutions.com</a>&gt;<br>
&gt; Signed-off-by: Anthony Brandon &lt;<a href=3D"mailto:anthony@amarulaso=
lutions.com">anthony@amarulasolutions.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/clk/rockchip/clk-<wbr>rk3399.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/clk/rockchip/clk-<wbr>rk3399.c b/drivers/clk/rock=
chip/clk-<wbr>rk3399.c<br>
&gt; index 2a8634a..6073479 100644<br>
&gt; --- a/drivers/clk/rockchip/clk-<wbr>rk3399.c<br>
&gt; +++ b/drivers/clk/rockchip/clk-<wbr>rk3399.c<br>
&gt; @@ -630,7 +630,8 @@ static struct rockchip_clk_branch rk3399_clk_branc=
hes[] __initdata =3D {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MUX(0, &quot;clk_i2sout_src&quot;, mux_i2sch=
_p, CLK_SET_RATE_PARENT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0RK3399_CLKSEL_CON(31), 0, 2, MFLAGS),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0COMPOSITE_NODIV(SCLK_I2S_8CH_<wbr>OUT, &quot;clk_=
i2sout&quot;, mux_i2sout_p, CLK_SET_RATE_PARENT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0COMPOSITE_NODIV(SCLK_I2S_8CH_<wbr>OUT, &quot;clk_=
i2sout&quot;, mux_i2sout_p,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0RK3399_CLKSEL_CON(31), 2, 1, MFLAGS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0RK3399_CLKGATE_CON(8), 12, GFLAGS),<br>
&gt;=C2=A0 <br>
&gt; <br>
<br>
<br>
<br>
<br>
</blockquote></div><br></div></div>

--0000000000003544650570932686--
