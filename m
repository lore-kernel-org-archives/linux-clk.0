Return-Path: <maxi.jourdan@wanadoo.fr>
MIME-Version: 1.0
In-Reply-To: <1524341993.2601.131.camel@baylibre.com>
References: <CAHStOZ7m+8xSX=k5k-LwmgZy6Ja4MFwsVjMy-FeoG=2c0rpm2g@mail.gmail.com>
 <1524341993.2601.131.camel@baylibre.com>
From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Date: Sun, 22 Apr 2018 09:43:33 +0200
Message-ID: <CAHStOZ6-jV9gAvJPfk+JKanoNWmWnYykN-u3HwpY9bgoJb1myQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: add the video decoder clocks
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Mike Turquette <mturquette@baylibre.com>, linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: multipart/alternative; boundary="94eb2c0837a6134df5056a6b14a0"
List-ID: <linux-clk.vger.kernel.org>

--94eb2c0837a6134df5056a6b14a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil, J=C3=A9rome,

Thanks for the answers, I'll resubmit with proper formatting.

@J=C3=A9rome: very valid points. The usage of the clk will indeed be throug=
h
set_clk_rate on the leaf clock within the driver, so I don't need to expose
the mux. If I want the mux automatically selected to provide the nearest
target clock, should I keep  CLK_SET_RATE_NO_REPARENT ?

CLK_IGNORE_UNUSED  doesn't seem like a required property indeed for those
clocks.

Maxime



2018-04-21 22:19 GMT+02:00 Jerome Brunet <jbrunet@baylibre.com>:

> On Sat, 2018-04-21 at 10:18 +0200, Maxime Jourdan wrote:
> > In preparation for the V4L2 M2M driver, add the clocks for
> > VDEC_1 and VDEC_HEVC to gxbb.
> >
> > Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
>
> a few other comments, in addition to what neil pointed out.
>
> > ---
> >  drivers/clk/meson/gxbb.c              | 112 ++++++++++++++++++++++++++
> >  drivers/clk/meson/gxbb.h              |   4 +-
> >  include/dt-bindings/clock/gxbb-clkc.h |   4 +
> >  3 files changed, 119 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> > index b1e4d9557610..f9d7ab9c924e 100644
> > --- a/drivers/clk/meson/gxbb.c
> > +++ b/drivers/clk/meson/gxbb.c
> > @@ -1543,6 +1543,100 @@ static struct clk_regmap gxbb_vapb =3D {
> >       },
> >  };
> >
> > +/* VDEC clocks */
> > +
> > +static const char * const gxbb_vdec_parent_names[] =3D {
> > +     "fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
> > +};
> > +
> > +static struct clk_regmap gxbb_vdec_1_sel =3D {
> > +     .data =3D &(struct clk_regmap_mux_data){
> > +             .offset =3D HHI_VDEC_CLK_CNTL,
> > +             .mask =3D 0x3,
> > +             .shift =3D 9,
> > +     },
> > +     .hw.init =3D &(struct clk_init_data){
> > +             .name =3D "vdec_1_sel",
> > +             .ops =3D &clk_regmap_mux_ops,
> > +             .parent_names =3D gxbb_vdec_parent_names,
> > +             .num_parents =3D ARRAY_SIZE(gxbb_vdec_parent_names),
> > +             .flags =3D CLK_SET_RATE_NO_REPARENT,
>
> Looks like you are/will be controlling the mux manually from your driver.
> Any particular reason for doing so ?
>
> Looking at the possible parent, you may as well call clk_set_rate() on th=
e
> leaf
> clock with 500Mhz, 666Mhz, etc ... it would accomplish the same thing but=
 :
> * You would need to get only one clock in your driver
> * You don't need to manage the topology of the clock tree in your driver,
> which
> could be interresting  if your driver ends up supporting more than GXBB.
>
> > +     },
> > +};
> > +
> > +static struct clk_regmap gxbb_vdec_1_div =3D {
> > +     .data =3D &(struct clk_regmap_div_data){
> > +             .offset =3D HHI_VDEC_CLK_CNTL,
> > +             .shift =3D 0,
> > +             .width =3D 7,
> > +     },
> > +     .hw.init =3D &(struct clk_init_data){
> > +             .name =3D "vdec_1_div",
> > +             .ops =3D &clk_regmap_divider_ops,
> > +             .parent_names =3D (const char *[]){ "vdec_1_sel" },
> > +             .num_parents =3D 1,
> > +             .flags =3D CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap gxbb_vdec_1 =3D {
> > +     .data =3D &(struct clk_regmap_gate_data){
> > +             .offset =3D HHI_VDEC_CLK_CNTL,
> > +             .bit_idx =3D 8,
> > +     },
> > +     .hw.init =3D &(struct clk_init_data) {
> > +             .name =3D "vdec_1",
> > +             .ops =3D &clk_regmap_gate_ops,
> > +             .parent_names =3D (const char *[]){ "vdec_1_div" },
> > +             .num_parents =3D 1,
> > +             .flags =3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
>
> Any particular reason for using CLK_IGNORE_UNUSED ?
>
> You should only need CLK_IGNORE_UNUSED when the clock is left on by the
> bootloader, and you need it stay that way until the driver load.
>
> It allows to skip the clk_disable_unused() mechanism of CCF but I don't
> think
> the video decoder should require this, unless I missed something.
>
> > +     },
> > +};
> > +
> > +static struct clk_regmap gxbb_vdec_hevc_sel =3D {
> > +     .data =3D &(struct clk_regmap_mux_data){
> > +             .offset =3D HHI_VDEC2_CLK_CNTL,
> > +             .mask =3D 0x3,
> > +             .shift =3D 25,
> > +     },
> > +     .hw.init =3D &(struct clk_init_data){
> > +             .name =3D "vdec_hevc_sel",
> > +             .ops =3D &clk_regmap_mux_ops,
> > +             .parent_names =3D gxbb_vdec_parent_names,
> > +             .num_parents =3D ARRAY_SIZE(gxbb_vdec_parent_names),
> > +             .flags =3D CLK_SET_RATE_NO_REPARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap gxbb_vdec_hevc_div =3D {
> > +     .data =3D &(struct clk_regmap_div_data){
> > +             .offset =3D HHI_VDEC2_CLK_CNTL,
> > +             .shift =3D 16,
> > +             .width =3D 7,
> > +     },
> > +     .hw.init =3D &(struct clk_init_data){
> > +             .name =3D "vdec_hevc_div",
> > +             .ops =3D &clk_regmap_divider_ops,
> > +             .parent_names =3D (const char *[]){ "vdec_hevc_sel" },
> > +             .num_parents =3D 1,
> > +             .flags =3D CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap gxbb_vdec_hevc =3D {
> > +     .data =3D &(struct clk_regmap_gate_data){
> > +             .offset =3D HHI_VDEC2_CLK_CNTL,
> > +             .bit_idx =3D 24,
> > +     },
> > +     .hw.init =3D &(struct clk_init_data) {
> > +             .name =3D "vdec_hevc",
> > +             .ops =3D &clk_regmap_gate_ops,
> > +             .parent_names =3D (const char *[]){ "vdec_hevc_div" },
> > +             .num_parents =3D 1,
> > +             .flags =3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> > +     },
> > +};
> > +
> >  /* Everything Else (EE) domain gates */
> >  static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
> >  static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
> > @@ -1786,6 +1880,12 @@ static struct clk_hw_onecell_data
> gxbb_hw_onecell_data =3D {
> >               [CLKID_FCLK_DIV4_DIV]       =3D &gxbb_fclk_div4_div.hw,
> >               [CLKID_FCLK_DIV5_DIV]       =3D &gxbb_fclk_div5_div.hw,
> >               [CLKID_FCLK_DIV7_DIV]       =3D &gxbb_fclk_div7_div.hw,
> > +             [CLKID_VDEC_1_SEL]          =3D &gxbb_vdec_1_sel.hw,
> > +             [CLKID_VDEC_1_DIV]          =3D &gxbb_vdec_1_div.hw,
> > +             [CLKID_VDEC_1]              =3D &gxbb_vdec_1.hw,
> > +             [CLKID_VDEC_HEVC_SEL]       =3D &gxbb_vdec_hevc_sel.hw,
> > +             [CLKID_VDEC_HEVC_DIV]       =3D &gxbb_vdec_hevc_div.hw,
> > +             [CLKID_VDEC_HEVC]           =3D &gxbb_vdec_hevc.hw,
> >               [NR_CLKS]                   =3D NULL,
> >       },
> >       .num =3D NR_CLKS,
> > @@ -1942,6 +2042,12 @@ static struct clk_hw_onecell_data
> gxl_hw_onecell_data =3D {
> >               [CLKID_FCLK_DIV4_DIV]       =3D &gxbb_fclk_div4_div.hw,
> >               [CLKID_FCLK_DIV5_DIV]       =3D &gxbb_fclk_div5_div.hw,
> >               [CLKID_FCLK_DIV7_DIV]       =3D &gxbb_fclk_div7_div.hw,
> > +             [CLKID_VDEC_1_SEL]          =3D &gxbb_vdec_1_sel.hw,
> > +             [CLKID_VDEC_1_DIV]          =3D &gxbb_vdec_1_div.hw,
> > +             [CLKID_VDEC_1]              =3D &gxbb_vdec_1.hw,
> > +             [CLKID_VDEC_HEVC_SEL]       =3D &gxbb_vdec_hevc_sel.hw,
> > +             [CLKID_VDEC_HEVC_DIV]       =3D &gxbb_vdec_hevc_div.hw,
> > +             [CLKID_VDEC_HEVC]           =3D &gxbb_vdec_hevc.hw,
> >               [NR_CLKS]                   =3D NULL,
> >       },
> >       .num =3D NR_CLKS,
> > @@ -2100,6 +2206,12 @@ static struct clk_regmap *const gx_clk_regmaps[]
> =3D {
> >       &gxbb_fclk_div4,
> >       &gxbb_fclk_div5,
> >       &gxbb_fclk_div7,
> > +     &gxbb_vdec_1_sel,
> > +     &gxbb_vdec_1_div,
> > +     &gxbb_vdec_1,
> > +     &gxbb_vdec_hevc_sel,
> > +     &gxbb_vdec_hevc_div,
> > +     &gxbb_vdec_hevc,
> >  };
> >
> >  struct clkc_data {
> > diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
> > index 9febf3f03739..ae21d235355a 100644
> > --- a/drivers/clk/meson/gxbb.h
> > +++ b/drivers/clk/meson/gxbb.h
> > @@ -204,8 +204,10 @@
> >  #define CLKID_FCLK_DIV4_DIV    148
> >  #define CLKID_FCLK_DIV5_DIV    149
> >  #define CLKID_FCLK_DIV7_DIV    150
> > +#define CLKID_VDEC_1_DIV       152
> > +#define CLKID_VDEC_HEVC_DIV    155
> >
> > -#define NR_CLKS                        151
> > +#define NR_CLKS                        157
> >
>
> We prefer to get the DT binding part in a separate patch, it makes the
> platform
> maintainer's life easier.
>
> >  /* include the CLKIDs that have been made part of the DT binding */
> >  #include <dt-bindings/clock/gxbb-clkc.h>
> > diff --git a/include/dt-bindings/clock/gxbb-clkc.h
> b/include/dt-bindings/clock/gxbb-clkc.h
> > index 8ba99a5e3fd3..ae7f6be747e4 100644
> > --- a/include/dt-bindings/clock/gxbb-clkc.h
> > +++ b/include/dt-bindings/clock/gxbb-clkc.h
> > @@ -125,5 +125,9 @@
> >  #define CLKID_VAPB_1         138
> >  #define CLKID_VAPB_SEL               139
> >  #define CLKID_VAPB           140
> > +#define CLKID_VDEC_1_SEL     151
> > +#define CLKID_VDEC_1         153
> > +#define CLKID_VDEC_HEVC_SEL  154
> > +#define CLKID_VDEC_HEVC      156
> >
> >  #endif /* __GXBB_CLKC_H */
> > --
> > 2.17.0
> >
> >
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--94eb2c0837a6134df5056a6b14a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Neil, J=C3=A9rome,<div><br></div><div>Thanks for the an=
swers, I&#39;ll resubmit with proper formatting.</div><div><br></div><div>@=
J=C3=A9rome: very valid points. The usage of the clk will indeed be through=
 set_clk_rate on the leaf clock within the driver, so I don&#39;t need to e=
xpose the mux. If I want the mux automatically selected to provide the near=
est target clock, should I keep=C2=A0

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">CLK_SET_RATE_NO_REPARENT=C2=A0</span>?</div><div=
><br></div><div>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">CLK_IGNORE_UNUSED</span>=C2=A0 doesn&#39;t seem =
like a required property indeed for those clocks.<br></div><div><br></div><=
div>Maxime</div><div><br></div><div><br></div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">2018-04-21 22:19 GMT+02:00 Jerome Brunet=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:jbrunet@baylibre.com" target=3D"_b=
lank">jbrunet@baylibre.com</a>&gt;</span>:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span class=3D"">On Sat, 2018-04-21 at 10:18 +0200, Maxime Jourdan wrote:=
<br>
&gt; In preparation for the V4L2 M2M driver, add the clocks for<br>
&gt; VDEC_1 and VDEC_HEVC to gxbb.<br>
&gt; <br>
&gt; Signed-off-by: Maxime Jourdan &lt;<a href=3D"mailto:maxi.jourdan@wanad=
oo.fr">maxi.jourdan@wanadoo.fr</a>&gt;<br>
<br>
</span>a few other comments, in addition to what neil pointed out.<br>
<div><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 drivers/clk/meson/gxbb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 112 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 drivers/clk/meson/gxbb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 include/dt-bindings/clock/<wbr>gxbb-clkc.h |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 3 files changed, 119 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c<br>
&gt; index b1e4d9557610..f9d7ab9c924e 100644<br>
&gt; --- a/drivers/clk/meson/gxbb.c<br>
&gt; +++ b/drivers/clk/meson/gxbb.c<br>
&gt; @@ -1543,6 +1543,100 @@ static struct clk_regmap gxbb_vapb =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +/* VDEC clocks */<br>
&gt; +<br>
&gt; +static const char * const gxbb_vdec_parent_names[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;fclk_div4&quot;, &quot;fclk_div3&quot;, &qu=
ot;fclk_div5&quot;, &quot;fclk_div7&quot;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct clk_regmap gxbb_vdec_1_sel =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.data =3D &amp;(struct clk_regmap_mux_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D HHI_VDEC_=
CLK_CNTL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask =3D 0x3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shift =3D 9,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hw.init =3D &amp;(struct clk_init_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vdec_=
1_sel&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;clk_reg=
map_mux_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent_names =3D gxb=
b_vdec_parent_names,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_parents =3D ARRA=
Y_SIZE(gxbb_vdec_parent_<wbr>names),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_SET_RA=
TE_NO_REPARENT,<br>
<br>
</div></div>Looks like you are/will be controlling the mux manually from yo=
ur driver.<br>
Any particular reason for doing so ?<br>
<br>
Looking at the possible parent, you may as well call clk_set_rate() on the =
leaf<br>
clock with 500Mhz, 666Mhz, etc ... it would accomplish the same thing but :=
<br>
* You would need to get only one clock in your driver<br>
* You don&#39;t need to manage the topology of the clock tree in your drive=
r, which<br>
could be interresting=C2=A0 if your driver ends up supporting more than GXB=
B.<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct clk_regmap gxbb_vdec_1_div =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.data =3D &amp;(struct clk_regmap_div_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D HHI_VDEC_=
CLK_CNTL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shift =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =3D 7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hw.init =3D &amp;(struct clk_init_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vdec_=
1_div&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;clk_reg=
map_divider_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent_names =3D (co=
nst char *[]){ &quot;vdec_1_sel&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_parents =3D 1,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_SET_RA=
TE_PARENT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct clk_regmap gxbb_vdec_1 =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.data =3D &amp;(struct clk_regmap_gate_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D HHI_VDEC_=
CLK_CNTL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.bit_idx =3D 8,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hw.init =3D &amp;(struct clk_init_data) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vdec_=
1&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;clk_reg=
map_gate_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent_names =3D (co=
nst char *[]){ &quot;vdec_1_div&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_parents =3D 1,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_SET_RA=
TE_PARENT | CLK_IGNORE_UNUSED,<br>
<br>
</div></div>Any particular reason for using CLK_IGNORE_UNUSED ?<br>
<br>
You should only need CLK_IGNORE_UNUSED when the clock is left on by the<br>
bootloader, and you need it stay that way until the driver load.<br>
<br>
It allows to skip the clk_disable_unused() mechanism of CCF but I don&#39;t=
 think<br>
the video decoder should require this, unless I missed something.<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct clk_regmap gxbb_vdec_hevc_sel =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.data =3D &amp;(struct clk_regmap_mux_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D HHI_VDEC2=
_CLK_CNTL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.mask =3D 0x3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shift =3D 25,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hw.init =3D &amp;(struct clk_init_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vdec_=
hevc_sel&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;clk_reg=
map_mux_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent_names =3D gxb=
b_vdec_parent_names,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_parents =3D ARRA=
Y_SIZE(gxbb_vdec_parent_<wbr>names),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_SET_RA=
TE_NO_REPARENT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct clk_regmap gxbb_vdec_hevc_div =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.data =3D &amp;(struct clk_regmap_div_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D HHI_VDEC2=
_CLK_CNTL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shift =3D 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =3D 7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hw.init =3D &amp;(struct clk_init_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vdec_=
hevc_div&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;clk_reg=
map_divider_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent_names =3D (co=
nst char *[]){ &quot;vdec_hevc_sel&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_parents =3D 1,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_SET_RA=
TE_PARENT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct clk_regmap gxbb_vdec_hevc =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.data =3D &amp;(struct clk_regmap_gate_data){<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D HHI_VDEC2=
_CLK_CNTL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.bit_idx =3D 24,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.hw.init =3D &amp;(struct clk_init_data) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;vdec_=
hevc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;clk_reg=
map_gate_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.parent_names =3D (co=
nst char *[]){ &quot;vdec_hevc_div&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.num_parents =3D 1,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_SET_RA=
TE_PARENT | CLK_IGNORE_UNUSED,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 /* Everything Else (EE) domain gates */<br>
&gt;=C2=A0 static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);<br>
&gt;=C2=A0 static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);<br>
&gt; @@ -1786,6 +1880,12 @@ static struct clk_hw_onecell_data gxbb_hw_onece=
ll_data =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_FCLK_DIV4=
_DIV]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_fclk_div4_div.hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_FCLK_DIV5=
_DIV]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_fclk_div5_div.hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_FCLK_DIV7=
_DIV]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_fclk_div7_div.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_1_SEL]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1_sel.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_1_DIV]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1_div.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_1]=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_HEVC_SEL]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_vdec_hevc_sel.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_HEVC_DIV]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_vdec_hevc_div.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_HEVC]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_vdec_hevc.hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NR_CLKS]=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.num =3D NR_CLKS,<br>
&gt; @@ -1942,6 +2042,12 @@ static struct clk_hw_onecell_data gxl_hw_onecel=
l_data =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_FCLK_DIV4=
_DIV]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_fclk_div4_div.hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_FCLK_DIV5=
_DIV]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_fclk_div5_div.hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_FCLK_DIV7=
_DIV]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_fclk_div7_div.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_1_SEL]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1_sel.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_1_DIV]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1_div.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_1]=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_HEVC_SEL]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_vdec_hevc_sel.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_HEVC_DIV]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_vdec_hevc_div.hw,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[CLKID_VDEC_HEVC]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &amp;gxbb_vdec_hevc.hw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NR_CLKS]=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.num =3D NR_CLKS,<br>
&gt; @@ -2100,6 +2206,12 @@ static struct clk_regmap *const gx_clk_regmaps[=
] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;gxbb_fclk_div4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;gxbb_fclk_div5,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;gxbb_fclk_div7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;gxbb_vdec_1_sel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;gxbb_vdec_1_div,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;gxbb_vdec_1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;gxbb_vdec_hevc_sel,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;gxbb_vdec_hevc_div,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;gxbb_vdec_hevc,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct clkc_data {<br>
&gt; diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h<br>
&gt; index 9febf3f03739..ae21d235355a 100644<br>
&gt; --- a/drivers/clk/meson/gxbb.h<br>
&gt; +++ b/drivers/clk/meson/gxbb.h<br>
&gt; @@ -204,8 +204,10 @@<br>
&gt;=C2=A0 #define CLKID_FCLK_DIV4_DIV=C2=A0 =C2=A0 148<br>
&gt;=C2=A0 #define CLKID_FCLK_DIV5_DIV=C2=A0 =C2=A0 149<br>
&gt;=C2=A0 #define CLKID_FCLK_DIV7_DIV=C2=A0 =C2=A0 150<br>
&gt; +#define CLKID_VDEC_1_DIV=C2=A0 =C2=A0 =C2=A0 =C2=A0152<br>
&gt; +#define CLKID_VDEC_HEVC_DIV=C2=A0 =C2=A0 155<br>
&gt;=C2=A0 <br>
&gt; -#define NR_CLKS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 151<br>
&gt; +#define NR_CLKS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 157<br>
&gt;=C2=A0 <br>
<br>
</div></div>We prefer to get the DT binding part in a separate patch, it ma=
kes the platform<br>
maintainer&#39;s life easier.<br>
<span class=3D""><br>
&gt;=C2=A0 /* include the CLKIDs that have been made part of the DT binding=
 */<br>
&gt;=C2=A0 #include &lt;dt-bindings/clock/gxbb-clkc.<wbr>h&gt;<br>
&gt; diff --git a/include/dt-bindings/clock/<wbr>gxbb-clkc.h b/include/dt-b=
indings/clock/<wbr>gxbb-clkc.h<br>
&gt; index 8ba99a5e3fd3..ae7f6be747e4 100644<br>
&gt; --- a/include/dt-bindings/clock/<wbr>gxbb-clkc.h<br>
&gt; +++ b/include/dt-bindings/clock/<wbr>gxbb-clkc.h<br>
&gt; @@ -125,5 +125,9 @@<br>
&gt;=C2=A0 #define CLKID_VAPB_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0138<br>
&gt;=C2=A0 #define CLKID_VAPB_SEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0139<br>
&gt;=C2=A0 #define CLKID_VAPB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0140<b=
r>
&gt; +#define CLKID_VDEC_1_SEL=C2=A0 =C2=A0 =C2=A0151<br>
&gt; +#define CLKID_VDEC_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0153<br>
&gt; +#define CLKID_VDEC_HEVC_SEL=C2=A0 154<br>
&gt; +#define CLKID_VDEC_HEVC=C2=A0 =C2=A0 =C2=A0 156<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #endif /* __GXBB_CLKC_H */<br>
&gt; -- <br>
&gt; 2.17.0<br>
&gt; <br>
&gt; <br>
<br>
</span>--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-clk&qu=
ot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/<wbr>m=
ajordomo-info.html</a><br>
</blockquote></div><br></div>

--94eb2c0837a6134df5056a6b14a0--
