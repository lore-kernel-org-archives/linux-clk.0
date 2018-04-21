Return-Path: <maxi.jourdan@wanadoo.fr>
MIME-Version: 1.0
From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Date: Sat, 21 Apr 2018 10:18:43 +0200
Message-ID: <CAHStOZ7m+8xSX=k5k-LwmgZy6Ja4MFwsVjMy-FeoG=2c0rpm2g@mail.gmail.com>
Subject: [PATCH] clk: meson: add the video decoder clocks
To: Neil <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: multipart/alternative; boundary="001a114fe86efb9d7a056a5773c0"
List-ID: <linux-clk.vger.kernel.org>

--001a114fe86efb9d7a056a5773c0
Content-Type: text/plain; charset="UTF-8"

In preparation for the V4L2 M2M driver, add the clocks for
VDEC_1 and VDEC_HEVC to gxbb.

Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
---
 drivers/clk/meson/gxbb.c              | 112 ++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |   4 +-
 include/dt-bindings/clock/gxbb-clkc.h |   4 +
 3 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index b1e4d9557610..f9d7ab9c924e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1543,6 +1543,100 @@ static struct clk_regmap gxbb_vapb = {
  },
 };

+/* VDEC clocks */
+
+static const char * const gxbb_vdec_parent_names[] = {
+ "fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7"
+};
+
+static struct clk_regmap gxbb_vdec_1_sel = {
+ .data = &(struct clk_regmap_mux_data){
+ .offset = HHI_VDEC_CLK_CNTL,
+ .mask = 0x3,
+ .shift = 9,
+ },
+ .hw.init = &(struct clk_init_data){
+ .name = "vdec_1_sel",
+ .ops = &clk_regmap_mux_ops,
+ .parent_names = gxbb_vdec_parent_names,
+ .num_parents = ARRAY_SIZE(gxbb_vdec_parent_names),
+ .flags = CLK_SET_RATE_NO_REPARENT,
+ },
+};
+
+static struct clk_regmap gxbb_vdec_1_div = {
+ .data = &(struct clk_regmap_div_data){
+ .offset = HHI_VDEC_CLK_CNTL,
+ .shift = 0,
+ .width = 7,
+ },
+ .hw.init = &(struct clk_init_data){
+ .name = "vdec_1_div",
+ .ops = &clk_regmap_divider_ops,
+ .parent_names = (const char *[]){ "vdec_1_sel" },
+ .num_parents = 1,
+ .flags = CLK_SET_RATE_PARENT,
+ },
+};
+
+static struct clk_regmap gxbb_vdec_1 = {
+ .data = &(struct clk_regmap_gate_data){
+ .offset = HHI_VDEC_CLK_CNTL,
+ .bit_idx = 8,
+ },
+ .hw.init = &(struct clk_init_data) {
+ .name = "vdec_1",
+ .ops = &clk_regmap_gate_ops,
+ .parent_names = (const char *[]){ "vdec_1_div" },
+ .num_parents = 1,
+ .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+ },
+};
+
+static struct clk_regmap gxbb_vdec_hevc_sel = {
+ .data = &(struct clk_regmap_mux_data){
+ .offset = HHI_VDEC2_CLK_CNTL,
+ .mask = 0x3,
+ .shift = 25,
+ },
+ .hw.init = &(struct clk_init_data){
+ .name = "vdec_hevc_sel",
+ .ops = &clk_regmap_mux_ops,
+ .parent_names = gxbb_vdec_parent_names,
+ .num_parents = ARRAY_SIZE(gxbb_vdec_parent_names),
+ .flags = CLK_SET_RATE_NO_REPARENT,
+ },
+};
+
+static struct clk_regmap gxbb_vdec_hevc_div = {
+ .data = &(struct clk_regmap_div_data){
+ .offset = HHI_VDEC2_CLK_CNTL,
+ .shift = 16,
+ .width = 7,
+ },
+ .hw.init = &(struct clk_init_data){
+ .name = "vdec_hevc_div",
+ .ops = &clk_regmap_divider_ops,
+ .parent_names = (const char *[]){ "vdec_hevc_sel" },
+ .num_parents = 1,
+ .flags = CLK_SET_RATE_PARENT,
+ },
+};
+
+static struct clk_regmap gxbb_vdec_hevc = {
+ .data = &(struct clk_regmap_gate_data){
+ .offset = HHI_VDEC2_CLK_CNTL,
+ .bit_idx = 24,
+ },
+ .hw.init = &(struct clk_init_data) {
+ .name = "vdec_hevc",
+ .ops = &clk_regmap_gate_ops,
+ .parent_names = (const char *[]){ "vdec_hevc_div" },
+ .num_parents = 1,
+ .flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+ },
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
 static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
@@ -1786,6 +1880,12 @@ static struct clk_hw_onecell_data
gxbb_hw_onecell_data = {
  [CLKID_FCLK_DIV4_DIV]     = &gxbb_fclk_div4_div.hw,
  [CLKID_FCLK_DIV5_DIV]     = &gxbb_fclk_div5_div.hw,
  [CLKID_FCLK_DIV7_DIV]     = &gxbb_fclk_div7_div.hw,
+ [CLKID_VDEC_1_SEL]     = &gxbb_vdec_1_sel.hw,
+ [CLKID_VDEC_1_DIV]     = &gxbb_vdec_1_div.hw,
+ [CLKID_VDEC_1]     = &gxbb_vdec_1.hw,
+ [CLKID_VDEC_HEVC_SEL]     = &gxbb_vdec_hevc_sel.hw,
+ [CLKID_VDEC_HEVC_DIV]     = &gxbb_vdec_hevc_div.hw,
+ [CLKID_VDEC_HEVC]     = &gxbb_vdec_hevc.hw,
  [NR_CLKS]     = NULL,
  },
  .num = NR_CLKS,
@@ -1942,6 +2042,12 @@ static struct clk_hw_onecell_data
gxl_hw_onecell_data = {
  [CLKID_FCLK_DIV4_DIV]     = &gxbb_fclk_div4_div.hw,
  [CLKID_FCLK_DIV5_DIV]     = &gxbb_fclk_div5_div.hw,
  [CLKID_FCLK_DIV7_DIV]     = &gxbb_fclk_div7_div.hw,
+ [CLKID_VDEC_1_SEL]     = &gxbb_vdec_1_sel.hw,
+ [CLKID_VDEC_1_DIV]     = &gxbb_vdec_1_div.hw,
+ [CLKID_VDEC_1]     = &gxbb_vdec_1.hw,
+ [CLKID_VDEC_HEVC_SEL]     = &gxbb_vdec_hevc_sel.hw,
+ [CLKID_VDEC_HEVC_DIV]     = &gxbb_vdec_hevc_div.hw,
+ [CLKID_VDEC_HEVC]     = &gxbb_vdec_hevc.hw,
  [NR_CLKS]     = NULL,
  },
  .num = NR_CLKS,
@@ -2100,6 +2206,12 @@ static struct clk_regmap *const gx_clk_regmaps[] = {
  &gxbb_fclk_div4,
  &gxbb_fclk_div5,
  &gxbb_fclk_div7,
+ &gxbb_vdec_1_sel,
+ &gxbb_vdec_1_div,
+ &gxbb_vdec_1,
+ &gxbb_vdec_hevc_sel,
+ &gxbb_vdec_hevc_div,
+ &gxbb_vdec_hevc,
 };

 struct clkc_data {
diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/meson/gxbb.h
index 9febf3f03739..ae21d235355a 100644
--- a/drivers/clk/meson/gxbb.h
+++ b/drivers/clk/meson/gxbb.h
@@ -204,8 +204,10 @@
 #define CLKID_FCLK_DIV4_DIV   148
 #define CLKID_FCLK_DIV5_DIV   149
 #define CLKID_FCLK_DIV7_DIV   150
+#define CLKID_VDEC_1_DIV   152
+#define CLKID_VDEC_HEVC_DIV   155

-#define NR_CLKS   151
+#define NR_CLKS   157

 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/gxbb-clkc.h>
diff --git a/include/dt-bindings/clock/gxbb-clkc.h
b/include/dt-bindings/clock/gxbb-clkc.h
index 8ba99a5e3fd3..ae7f6be747e4 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -125,5 +125,9 @@
 #define CLKID_VAPB_1 138
 #define CLKID_VAPB_SEL 139
 #define CLKID_VAPB 140
+#define CLKID_VDEC_1_SEL 151
+#define CLKID_VDEC_1 153
+#define CLKID_VDEC_HEVC_SEL 154
+#define CLKID_VDEC_HEVC 156

 #endif /* __GXBB_CLKC_H */
-- 
2.17.0

--001a114fe86efb9d7a056a5773c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>In preparation for the V4L2 M2M driver, add the =
clocks for</div><div>VDEC_1 and VDEC_HEVC to gxbb.</div><div><br></div><div=
>Signed-off-by: Maxime Jourdan &lt;<a href=3D"mailto:maxi.jourdan@wanadoo.f=
r">maxi.jourdan@wanadoo.fr</a>&gt;</div><div>---</div><div>=C2=A0drivers/cl=
k/meson/gxbb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 112 ++++++=
++++++++++++++++++++</div><div>=C2=A0drivers/clk/meson/gxbb.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-</div><div>=C2=A0inclu=
de/dt-bindings/clock/gxbb-clkc.h |=C2=A0 =C2=A04 +</div><div>=C2=A03 files =
changed, 119 insertions(+), 1 deletion(-)</div><div><br></div><div>diff --g=
it a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c</div><div>index b1=
e4d9557610..f9d7ab9c924e 100644</div><div>--- a/drivers/clk/meson/gxbb.c</d=
iv><div>+++ b/drivers/clk/meson/gxbb.c</div><div>@@ -1543,6 +1543,100 @@ st=
atic struct clk_regmap gxbb_vapb =3D {</div><div>=C2=A0<span style=3D"white=
-space:pre">	</span>},</div><div>=C2=A0};</div><div>=C2=A0</div><div>+/* VD=
EC clocks */</div><div>+</div><div>+static const char * const gxbb_vdec_par=
ent_names[] =3D {</div><div>+<span style=3D"white-space:pre">	</span>&quot;=
fclk_div4&quot;, &quot;fclk_div3&quot;, &quot;fclk_div5&quot;, &quot;fclk_d=
iv7&quot;</div><div>+};</div><div>+</div><div>+static struct clk_regmap gxb=
b_vdec_1_sel =3D {</div><div>+<span style=3D"white-space:pre">	</span>.data=
 =3D &amp;(struct clk_regmap_mux_data){</div><div>+<span style=3D"white-spa=
ce:pre">		</span>.offset =3D HHI_VDEC_CLK_CNTL,</div><div>+<span style=3D"w=
hite-space:pre">		</span>.mask =3D 0x3,</div><div>+<span style=3D"white-spa=
ce:pre">		</span>.shift =3D 9,</div><div>+<span style=3D"white-space:pre">	=
</span>},</div><div>+<span style=3D"white-space:pre">	</span>.hw.init =3D &=
amp;(struct clk_init_data){</div><div>+<span style=3D"white-space:pre">		</=
span>.name =3D &quot;vdec_1_sel&quot;,</div><div>+<span style=3D"white-spac=
e:pre">		</span>.ops =3D &amp;clk_regmap_mux_ops,</div><div>+<span style=3D=
"white-space:pre">		</span>.parent_names =3D gxbb_vdec_parent_names,</div><=
div>+<span style=3D"white-space:pre">		</span>.num_parents =3D ARRAY_SIZE(g=
xbb_vdec_parent_names),</div><div>+<span style=3D"white-space:pre">		</span=
>.flags =3D CLK_SET_RATE_NO_REPARENT,</div><div>+<span style=3D"white-space=
:pre">	</span>},</div><div>+};</div><div>+</div><div>+static struct clk_reg=
map gxbb_vdec_1_div =3D {</div><div>+<span style=3D"white-space:pre">	</spa=
n>.data =3D &amp;(struct clk_regmap_div_data){</div><div>+<span style=3D"wh=
ite-space:pre">		</span>.offset =3D HHI_VDEC_CLK_CNTL,</div><div>+<span sty=
le=3D"white-space:pre">		</span>.shift =3D 0,</div><div>+<span style=3D"whi=
te-space:pre">		</span>.width =3D 7,</div><div>+<span style=3D"white-space:=
pre">	</span>},</div><div>+<span style=3D"white-space:pre">	</span>.hw.init=
 =3D &amp;(struct clk_init_data){</div><div>+<span style=3D"white-space:pre=
">		</span>.name =3D &quot;vdec_1_div&quot;,</div><div>+<span style=3D"whit=
e-space:pre">		</span>.ops =3D &amp;clk_regmap_divider_ops,</div><div>+<spa=
n style=3D"white-space:pre">		</span>.parent_names =3D (const char *[]){ &q=
uot;vdec_1_sel&quot; },</div><div>+<span style=3D"white-space:pre">		</span=
>.num_parents =3D 1,</div><div>+<span style=3D"white-space:pre">		</span>.f=
lags =3D CLK_SET_RATE_PARENT,</div><div>+<span style=3D"white-space:pre">	<=
/span>},</div><div>+};</div><div>+</div><div>+static struct clk_regmap gxbb=
_vdec_1 =3D {</div><div>+<span style=3D"white-space:pre">	</span>.data =3D =
&amp;(struct clk_regmap_gate_data){</div><div>+<span style=3D"white-space:p=
re">		</span>.offset =3D HHI_VDEC_CLK_CNTL,</div><div>+<span style=3D"white=
-space:pre">		</span>.bit_idx =3D 8,</div><div>+<span style=3D"white-space:=
pre">	</span>},</div><div>+<span style=3D"white-space:pre">	</span>.hw.init=
 =3D &amp;(struct clk_init_data) {</div><div>+<span style=3D"white-space:pr=
e">		</span>.name =3D &quot;vdec_1&quot;,</div><div>+<span style=3D"white-s=
pace:pre">		</span>.ops =3D &amp;clk_regmap_gate_ops,</div><div>+<span styl=
e=3D"white-space:pre">		</span>.parent_names =3D (const char *[]){ &quot;vd=
ec_1_div&quot; },</div><div>+<span style=3D"white-space:pre">		</span>.num_=
parents =3D 1,</div><div>+<span style=3D"white-space:pre">		</span>.flags =
=3D CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,</div><div>+<span style=3D"whit=
e-space:pre">	</span>},</div><div>+};</div><div>+</div><div>+static struct =
clk_regmap gxbb_vdec_hevc_sel =3D {</div><div>+<span style=3D"white-space:p=
re">	</span>.data =3D &amp;(struct clk_regmap_mux_data){</div><div>+<span s=
tyle=3D"white-space:pre">		</span>.offset =3D HHI_VDEC2_CLK_CNTL,</div><div=
>+<span style=3D"white-space:pre">		</span>.mask =3D 0x3,</div><div>+<span =
style=3D"white-space:pre">		</span>.shift =3D 25,</div><div>+<span style=3D=
"white-space:pre">	</span>},</div><div>+<span style=3D"white-space:pre">	</=
span>.hw.init =3D &amp;(struct clk_init_data){</div><div>+<span style=3D"wh=
ite-space:pre">		</span>.name =3D &quot;vdec_hevc_sel&quot;,</div><div>+<sp=
an style=3D"white-space:pre">		</span>.ops =3D &amp;clk_regmap_mux_ops,</di=
v><div>+<span style=3D"white-space:pre">		</span>.parent_names =3D gxbb_vde=
c_parent_names,</div><div>+<span style=3D"white-space:pre">		</span>.num_pa=
rents =3D ARRAY_SIZE(gxbb_vdec_parent_names),</div><div>+<span style=3D"whi=
te-space:pre">		</span>.flags =3D CLK_SET_RATE_NO_REPARENT,</div><div>+<spa=
n style=3D"white-space:pre">	</span>},</div><div>+};</div><div>+</div><div>=
+static struct clk_regmap gxbb_vdec_hevc_div =3D {</div><div>+<span style=
=3D"white-space:pre">	</span>.data =3D &amp;(struct clk_regmap_div_data){</=
div><div>+<span style=3D"white-space:pre">		</span>.offset =3D HHI_VDEC2_CL=
K_CNTL,</div><div>+<span style=3D"white-space:pre">		</span>.shift =3D 16,<=
/div><div>+<span style=3D"white-space:pre">		</span>.width =3D 7,</div><div=
>+<span style=3D"white-space:pre">	</span>},</div><div>+<span style=3D"whit=
e-space:pre">	</span>.hw.init =3D &amp;(struct clk_init_data){</div><div>+<=
span style=3D"white-space:pre">		</span>.name =3D &quot;vdec_hevc_div&quot;=
,</div><div>+<span style=3D"white-space:pre">		</span>.ops =3D &amp;clk_reg=
map_divider_ops,</div><div>+<span style=3D"white-space:pre">		</span>.paren=
t_names =3D (const char *[]){ &quot;vdec_hevc_sel&quot; },</div><div>+<span=
 style=3D"white-space:pre">		</span>.num_parents =3D 1,</div><div>+<span st=
yle=3D"white-space:pre">		</span>.flags =3D CLK_SET_RATE_PARENT,</div><div>=
+<span style=3D"white-space:pre">	</span>},</div><div>+};</div><div>+</div>=
<div>+static struct clk_regmap gxbb_vdec_hevc =3D {</div><div>+<span style=
=3D"white-space:pre">	</span>.data =3D &amp;(struct clk_regmap_gate_data){<=
/div><div>+<span style=3D"white-space:pre">		</span>.offset =3D HHI_VDEC2_C=
LK_CNTL,</div><div>+<span style=3D"white-space:pre">		</span>.bit_idx =3D 2=
4,</div><div>+<span style=3D"white-space:pre">	</span>},</div><div>+<span s=
tyle=3D"white-space:pre">	</span>.hw.init =3D &amp;(struct clk_init_data) {=
</div><div>+<span style=3D"white-space:pre">		</span>.name =3D &quot;vdec_h=
evc&quot;,</div><div>+<span style=3D"white-space:pre">		</span>.ops =3D &am=
p;clk_regmap_gate_ops,</div><div>+<span style=3D"white-space:pre">		</span>=
.parent_names =3D (const char *[]){ &quot;vdec_hevc_div&quot; },</div><div>=
+<span style=3D"white-space:pre">		</span>.num_parents =3D 1,</div><div>+<s=
pan style=3D"white-space:pre">		</span>.flags =3D CLK_SET_RATE_PARENT | CLK=
_IGNORE_UNUSED,</div><div>+<span style=3D"white-space:pre">	</span>},</div>=
<div>+};</div><div>+</div><div>=C2=A0/* Everything Else (EE) domain gates *=
/</div><div>=C2=A0static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);</div><div=
>=C2=A0static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);</div><div>@@ -1786,6=
 +1880,12 @@ static struct clk_hw_onecell_data gxbb_hw_onecell_data =3D {</=
div><div>=C2=A0<span style=3D"white-space:pre">		</span>[CLKID_FCLK_DIV4_DI=
V]<span style=3D"white-space:pre">	</span>=C2=A0 =C2=A0 =3D &amp;gxbb_fclk_=
div4_div.hw,</div><div>=C2=A0<span style=3D"white-space:pre">		</span>[CLKI=
D_FCLK_DIV5_DIV]<span style=3D"white-space:pre">	</span>=C2=A0 =C2=A0 =3D &=
amp;gxbb_fclk_div5_div.hw,</div><div>=C2=A0<span style=3D"white-space:pre">=
		</span>[CLKID_FCLK_DIV7_DIV]<span style=3D"white-space:pre">	</span>=C2=
=A0 =C2=A0 =3D &amp;gxbb_fclk_div7_div.hw,</div><div>+<span style=3D"white-=
space:pre">		</span>[CLKID_VDEC_1_SEL]<span style=3D"white-space:pre">	</sp=
an>=C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1_sel.hw,</div><div>+<span style=3D"whi=
te-space:pre">		</span>[CLKID_VDEC_1_DIV]<span style=3D"white-space:pre">	<=
/span>=C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1_div.hw,</div><div>+<span style=3D"=
white-space:pre">		</span>[CLKID_VDEC_1]<span style=3D"white-space:pre">		<=
/span>=C2=A0 =C2=A0 =3D &amp;gxbb_vdec_1.hw,</div><div>+<span style=3D"whit=
e-space:pre">		</span>[CLKID_VDEC_HEVC_SEL]<span style=3D"white-space:pre">=
	</span>=C2=A0 =C2=A0 =3D &amp;gxbb_vdec_hevc_sel.hw,</div><div>+<span styl=
e=3D"white-space:pre">		</span>[CLKID_VDEC_HEVC_DIV]<span style=3D"white-sp=
ace:pre">	</span>=C2=A0 =C2=A0 =3D &amp;gxbb_vdec_hevc_div.hw,</div><div>+<=
span style=3D"white-space:pre">		</span>[CLKID_VDEC_HEVC]<span style=3D"whi=
te-space:pre">	</span>=C2=A0 =C2=A0 =3D &amp;gxbb_vdec_hevc.hw,</div><div>=
=C2=A0<span style=3D"white-space:pre">		</span>[NR_CLKS]<span style=3D"whit=
e-space:pre">		</span>=C2=A0 =C2=A0 =3D NULL,</div><div>=C2=A0<span style=
=3D"white-space:pre">	</span>},</div><div>=C2=A0<span style=3D"white-space:=
pre">	</span>.num =3D NR_CLKS,</div><div>@@ -1942,6 +2042,12 @@ static stru=
ct clk_hw_onecell_data gxl_hw_onecell_data =3D {</div><div>=C2=A0<span styl=
e=3D"white-space:pre">		</span>[CLKID_FCLK_DIV4_DIV]<span style=3D"white-sp=
ace:pre">	</span>=C2=A0 =C2=A0 =3D &amp;gxbb_fclk_div4_div.hw,</div><div>=
=C2=A0<span style=3D"white-space:pre">		</span>[CLKID_FCLK_DIV5_DIV]<span s=
tyle=3D"white-space:pre">	</span>=C2=A0 =C2=A0 =3D &amp;gxbb_fclk_div5_div.=
hw,</div><div>=C2=A0<span style=3D"white-space:pre">		</span>[CLKID_FCLK_DI=
V7_DIV]<span style=3D"white-space:pre">	</span>=C2=A0 =C2=A0 =3D &amp;gxbb_=
fclk_div7_div.hw,</div><div>+<span style=3D"white-space:pre">		</span>[CLKI=
D_VDEC_1_SEL]<span style=3D"white-space:pre">	</span>=C2=A0 =C2=A0 =3D &amp=
;gxbb_vdec_1_sel.hw,</div><div>+<span style=3D"white-space:pre">		</span>[C=
LKID_VDEC_1_DIV]<span style=3D"white-space:pre">	</span>=C2=A0 =C2=A0 =3D &=
amp;gxbb_vdec_1_div.hw,</div><div>+<span style=3D"white-space:pre">		</span=
>[CLKID_VDEC_1]<span style=3D"white-space:pre">		</span>=C2=A0 =C2=A0 =3D &=
amp;gxbb_vdec_1.hw,</div><div>+<span style=3D"white-space:pre">		</span>[CL=
KID_VDEC_HEVC_SEL]<span style=3D"white-space:pre">	</span>=C2=A0 =C2=A0 =3D=
 &amp;gxbb_vdec_hevc_sel.hw,</div><div>+<span style=3D"white-space:pre">		<=
/span>[CLKID_VDEC_HEVC_DIV]<span style=3D"white-space:pre">	</span>=C2=A0 =
=C2=A0 =3D &amp;gxbb_vdec_hevc_div.hw,</div><div>+<span style=3D"white-spac=
e:pre">		</span>[CLKID_VDEC_HEVC]<span style=3D"white-space:pre">	</span>=
=C2=A0 =C2=A0 =3D &amp;gxbb_vdec_hevc.hw,</div><div>=C2=A0<span style=3D"wh=
ite-space:pre">		</span>[NR_CLKS]<span style=3D"white-space:pre">		</span>=
=C2=A0 =C2=A0 =3D NULL,</div><div>=C2=A0<span style=3D"white-space:pre">	</=
span>},</div><div>=C2=A0<span style=3D"white-space:pre">	</span>.num =3D NR=
_CLKS,</div><div>@@ -2100,6 +2206,12 @@ static struct clk_regmap *const gx_=
clk_regmaps[] =3D {</div><div>=C2=A0<span style=3D"white-space:pre">	</span=
>&amp;gxbb_fclk_div4,</div><div>=C2=A0<span style=3D"white-space:pre">	</sp=
an>&amp;gxbb_fclk_div5,</div><div>=C2=A0<span style=3D"white-space:pre">	</=
span>&amp;gxbb_fclk_div7,</div><div>+<span style=3D"white-space:pre">	</spa=
n>&amp;gxbb_vdec_1_sel,</div><div>+<span style=3D"white-space:pre">	</span>=
&amp;gxbb_vdec_1_div,</div><div>+<span style=3D"white-space:pre">	</span>&a=
mp;gxbb_vdec_1,</div><div>+<span style=3D"white-space:pre">	</span>&amp;gxb=
b_vdec_hevc_sel,</div><div>+<span style=3D"white-space:pre">	</span>&amp;gx=
bb_vdec_hevc_div,</div><div>+<span style=3D"white-space:pre">	</span>&amp;g=
xbb_vdec_hevc,</div><div>=C2=A0};</div><div>=C2=A0</div><div>=C2=A0struct c=
lkc_data {</div><div>diff --git a/drivers/clk/meson/gxbb.h b/drivers/clk/me=
son/gxbb.h</div><div>index 9febf3f03739..ae21d235355a 100644</div><div>--- =
a/drivers/clk/meson/gxbb.h</div><div>+++ b/drivers/clk/meson/gxbb.h</div><d=
iv>@@ -204,8 +204,10 @@</div><div>=C2=A0#define CLKID_FCLK_DIV4_DIV<span st=
yle=3D"white-space:pre">	</span>=C2=A0 148</div><div>=C2=A0#define CLKID_FC=
LK_DIV5_DIV<span style=3D"white-space:pre">	</span>=C2=A0 149</div><div>=C2=
=A0#define CLKID_FCLK_DIV7_DIV<span style=3D"white-space:pre">	</span>=C2=
=A0 150</div><div>+#define CLKID_VDEC_1_DIV<span style=3D"white-space:pre">=
	</span>=C2=A0 152</div><div>+#define CLKID_VDEC_HEVC_DIV<span style=3D"whi=
te-space:pre">	</span>=C2=A0 155</div><div>=C2=A0</div><div>-#define NR_CLK=
S<span style=3D"white-space:pre">			</span>=C2=A0 151</div><div>+#define NR=
_CLKS<span style=3D"white-space:pre">			</span>=C2=A0 157</div><div>=C2=A0<=
/div><div>=C2=A0/* include the CLKIDs that have been made part of the DT bi=
nding */</div><div>=C2=A0#include &lt;dt-bindings/clock/gxbb-clkc.h&gt;</di=
v><div>diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bind=
ings/clock/gxbb-clkc.h</div><div>index 8ba99a5e3fd3..ae7f6be747e4 100644</d=
iv><div>--- a/include/dt-bindings/clock/gxbb-clkc.h</div><div>+++ b/include=
/dt-bindings/clock/gxbb-clkc.h</div><div>@@ -125,5 +125,9 @@</div><div>=C2=
=A0#define CLKID_VAPB_1<span style=3D"white-space:pre">		</span>138</div><d=
iv>=C2=A0#define CLKID_VAPB_SEL<span style=3D"white-space:pre">		</span>139=
</div><div>=C2=A0#define CLKID_VAPB<span style=3D"white-space:pre">		</span=
>140</div><div>+#define CLKID_VDEC_1_SEL<span style=3D"white-space:pre">	</=
span>151</div><div>+#define CLKID_VDEC_1<span style=3D"white-space:pre">		<=
/span>153</div><div>+#define CLKID_VDEC_HEVC_SEL<span style=3D"white-space:=
pre">	</span>154</div><div>+#define CLKID_VDEC_HEVC<span style=3D"white-spa=
ce:pre">	</span>156</div><div>=C2=A0</div><div>=C2=A0#endif /* __GXBB_CLKC_=
H */</div><div>--=C2=A0</div><div>2.17.0</div></div><div><br></div><div><br=
></div></div>

--001a114fe86efb9d7a056a5773c0--
