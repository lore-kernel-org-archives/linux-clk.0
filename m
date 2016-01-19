Return-Path: <yadi.brar01@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1453105525-31506-3-git-send-email-andi.shyti@samsung.com>
References: <1453105525-31506-1-git-send-email-andi.shyti@samsung.com>
	<1453105525-31506-3-git-send-email-andi.shyti@samsung.com>
Date: Mon, 18 Jan 2016 16:42:57 -0800
Message-ID: <CAKew6eX4WZa4595ZUhiX+Ndc_WCzBNJBh5ejzxaJVkCnAskCYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: s2mps11: allocate only one structure for clock init
From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
To: Andi Shyti <andi.shyti@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sangbeom Kim <sbkim73@samsung.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>
Content-Type: multipart/alternative; boundary=001a113ec998a0d9330529a52631
List-ID: <linux-clk.vger.kernel.org>

--001a113ec998a0d9330529a52631
Content-Type: text/plain; charset=UTF-8

Hello Andi Shyti,

On Mon, Jan 18, 2016 at 12:25 AM, Andi Shyti <andi.shyti@samsung.com> wrote:

> The driver allocates three structures for three different clock
> types. They are quite similar and in the clock init data they
> differ only by the name. Only one of these structure is used,
> while the others lie unused in the memory.
>

If you are worried about memory, they can be made __initdata by
creating a copy during probe.


>
> The clock's name, though, is not such a meaningful information
>

I think it can be meaningful in debugging.


> and by assigning the same name to the initial data we can avoid
> over allocation. The common name chosen will be s2mps11,
> coherently with the device driver name, instead of the clock
> device.
>
> Therefore, remove the structures associated to s2mps13 and
> s2mps14 and use only the one referred to s2mps11 for all kind of
> clocks.
>

IMHO, with all these modifications, it will leave driver with some extra
checks and reduced readability, perhaps will make it complex to add
support for similar clocks but with different clk_ops, if next version or
 any similar mfd chip comes up in future.


Regards,
Yadwinder


>
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/clk-s2mps11.c | 48
> +++++++----------------------------------------
>  1 file changed, 7 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index ccb12f1..dce9753 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -99,6 +99,7 @@ static struct clk_ops s2mps11_clk_ops = {
>         .recalc_rate    = s2mps11_clk_recalc_rate,
>  };
>
> +/* This ss2mps11_clks_init tructure is common to s2mps11, s2mps13 and
> s2mps14 */
>  static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
>         [S2MPS11_CLK_AP] = {
>                 .name = "s2mps11_ap",
> @@ -117,37 +118,6 @@ static struct clk_init_data
> s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
>         },
>  };
>
> -static struct clk_init_data s2mps13_clks_init[S2MPS11_CLKS_NUM] = {
> -       [S2MPS11_CLK_AP] = {
> -               .name = "s2mps13_ap",
> -               .ops = &s2mps11_clk_ops,
> -               .flags = CLK_IS_ROOT,
> -       },
> -       [S2MPS11_CLK_CP] = {
> -               .name = "s2mps13_cp",
> -               .ops = &s2mps11_clk_ops,
> -               .flags = CLK_IS_ROOT,
> -       },
> -       [S2MPS11_CLK_BT] = {
> -               .name = "s2mps13_bt",
> -               .ops = &s2mps11_clk_ops,
> -               .flags = CLK_IS_ROOT,
> -       },
> -};
> -
> -static struct clk_init_data s2mps14_clks_init[S2MPS11_CLKS_NUM] = {
> -       [S2MPS11_CLK_AP] = {
> -               .name = "s2mps14_ap",
> -               .ops = &s2mps11_clk_ops,
> -               .flags = CLK_IS_ROOT,
> -       },
> -       [S2MPS11_CLK_BT] = {
> -               .name = "s2mps14_bt",
> -               .ops = &s2mps11_clk_ops,
> -               .flags = CLK_IS_ROOT,
> -       },
> -};
> -
>  static struct device_node *s2mps11_clk_parse_dt(struct platform_device
> *pdev,
>                 struct clk_init_data *clks_init)
>  {
> @@ -179,8 +149,8 @@ static int s2mps11_clk_probe(struct platform_device
> *pdev)
>         struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
>         struct s2mps11_clk *s2mps11_clks;
>         unsigned int s2mps11_reg;
> -       struct clk_init_data *clks_init;
>         int i, ret = 0;
> +       enum sec_device_type hwid =
> platform_get_device_id(pdev)->driver_data;
>
>         s2mps11_clks = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
>                                 sizeof(*s2mps11_clks), GFP_KERNEL);
> @@ -192,22 +162,18 @@ static int s2mps11_clk_probe(struct platform_device
> *pdev)
>         if (!clk_table)
>                 return -ENOMEM;
>
> -       switch(platform_get_device_id(pdev)->driver_data) {
> +       switch (hwid) {
>         case S2MPS11X:
>                 s2mps11_reg = S2MPS11_REG_RTC_CTRL;
> -               clks_init = s2mps11_clks_init;
>                 break;
>         case S2MPS13X:
>                 s2mps11_reg = S2MPS13_REG_RTCCTRL;
> -               clks_init = s2mps13_clks_init;
>                 break;
>         case S2MPS14X:
>                 s2mps11_reg = S2MPS14_REG_RTCCTRL;
> -               clks_init = s2mps14_clks_init;
>                 break;
>         case S5M8767X:
>                 s2mps11_reg = S5M8767_REG_CTRL1;
> -               clks_init = s2mps11_clks_init;
>                 break;
>         default:
>                 dev_err(&pdev->dev, "Invalid device type\n");
> @@ -215,15 +181,15 @@ static int s2mps11_clk_probe(struct platform_device
> *pdev)
>         }
>
>         /* Store clocks of_node in first element of s2mps11_clks array */
> -       s2mps11_clks->clk_np = s2mps11_clk_parse_dt(pdev, clks_init);
> +       s2mps11_clks->clk_np = s2mps11_clk_parse_dt(pdev,
> s2mps11_clks_init);
>         if (IS_ERR(s2mps11_clks->clk_np))
>                 return PTR_ERR(s2mps11_clks->clk_np);
>
>         for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
> -               if (!clks_init[i].name)
> +               if (i == S2MPS11_CLK_CP && hwid == S2MPS14X)
>                         continue; /* Skip clocks not present in some
> devices */
>                 s2mps11_clks[i].iodev = iodev;
> -               s2mps11_clks[i].hw.init = &clks_init[i];
> +               s2mps11_clks[i].hw.init = &s2mps11_clks_init[i];
>                 s2mps11_clks[i].mask = 1 << i;
>                 s2mps11_clks[i].reg = s2mps11_reg;
>
> @@ -246,7 +212,7 @@ static int s2mps11_clk_probe(struct platform_device
> *pdev)
>
>         for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
>                 /* Skip clocks not present on S2MPS14 */
> -               if (!clks_init[i].name)
> +               if (i == S2MPS11_CLK_CP && hwid == S2MPS14X)
>                         continue;
>                 clk_table[i] = s2mps11_clks[i].clk;
>         }
> --
> 2.6.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a113ec998a0d9330529a52631
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Andi Shyti,<br><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Mon, Jan 18, 2016 at 12:25 AM, Andi Shyti <span dir=
=3D"ltr">&lt;<a href=3D"mailto:andi.shyti@samsung.com" target=3D"_blank">an=
di.shyti@samsung.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">The driver allocates three structures for three different clock<br>
types. They are quite similar and in the clock init data they<br>
differ only by the name. Only one of these structure is used,<br>
while the others lie unused in the memory.<br></blockquote><div><br></div><=
div>If you are worried about memory, they can be made __initdata by</div><d=
iv>creating a copy during probe.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
The clock&#39;s name, though, is not such a meaningful information<br></blo=
ckquote><div><br></div><div>I think it can be meaningful in debugging.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
and by assigning the same name to the initial data we can avoid<br>
over allocation. The common name chosen will be s2mps11,<br>
coherently with the device driver name, instead of the clock<br>
device.<br>
<br>
Therefore, remove the structures associated to s2mps13 and<br>
s2mps14 and use only the one referred to s2mps11 for all kind of<br>
clocks.<br></blockquote><div><br></div><div>IMHO, with all these modificati=
ons, it will leave driver with some extra</div><div>checks and reduced read=
ability, perhaps will make it complex to add</div><div>support for similar =
clocks but with different clk_ops, if next version or</div><div>=C2=A0any s=
imilar mfd chip comes up in future.</div><div><br></div><div><br></div><div=
>Regards,</div><div>Yadwinder</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
Signed-off-by: Andi Shyti &lt;<a href=3D"mailto:andi.shyti@samsung.com">and=
i.shyti@samsung.com</a>&gt;<br>
Suggested-by: Krzysztof Kozlowski &lt;<a href=3D"mailto:k.kozlowski@samsung=
.com">k.kozlowski@samsung.com</a>&gt;<br>
---<br>
=C2=A0drivers/clk/clk-s2mps11.c | 48 +++++++-------------------------------=
---------<br>
=C2=A01 file changed, 7 insertions(+), 41 deletions(-)<br>
<br>
diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c<br>
index ccb12f1..dce9753 100644<br>
--- a/drivers/clk/clk-s2mps11.c<br>
+++ b/drivers/clk/clk-s2mps11.c<br>
@@ -99,6 +99,7 @@ static struct clk_ops s2mps11_clk_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .recalc_rate=C2=A0 =C2=A0 =3D s2mps11_clk_recal=
c_rate,<br>
=C2=A0};<br>
<br>
+/* This ss2mps11_clks_init tructure is common to s2mps11, s2mps13 and s2mp=
s14 */<br>
=C2=A0static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] =3D {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [S2MPS11_CLK_AP] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;s2m=
ps11_ap&quot;,<br>
@@ -117,37 +118,6 @@ static struct clk_init_data s2mps11_clks_init[S2MPS11_=
CLKS_NUM] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0};<br>
<br>
-static struct clk_init_data s2mps13_clks_init[S2MPS11_CLKS_NUM] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[S2MPS11_CLK_AP] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;s2m=
ps13_ap&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;s2mps=
11_clk_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_IS_R=
OOT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[S2MPS11_CLK_CP] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;s2m=
ps13_cp&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;s2mps=
11_clk_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_IS_R=
OOT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[S2MPS11_CLK_BT] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;s2m=
ps13_bt&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;s2mps=
11_clk_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_IS_R=
OOT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-};<br>
-<br>
-static struct clk_init_data s2mps14_clks_init[S2MPS11_CLKS_NUM] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[S2MPS11_CLK_AP] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;s2m=
ps14_ap&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;s2mps=
11_clk_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_IS_R=
OOT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[S2MPS11_CLK_BT] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;s2m=
ps14_bt&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;s2mps=
11_clk_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags =3D CLK_IS_R=
OOT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
-};<br>
-<br>
=C2=A0static struct device_node *s2mps11_clk_parse_dt(struct platform_devic=
e *pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct clk_init_dat=
a *clks_init)<br>
=C2=A0{<br>
@@ -179,8 +149,8 @@ static int s2mps11_clk_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sec_pmic_dev *iodev =3D dev_get_drvdata(=
pdev-&gt;dev.parent);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct s2mps11_clk *s2mps11_clks;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int s2mps11_reg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk_init_data *clks_init;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum sec_device_type hwid =3D platform_get_devi=
ce_id(pdev)-&gt;driver_data;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_clks =3D devm_kcalloc(&amp;pdev-&gt;dev=
, S2MPS11_CLKS_NUM,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*s2mps11_clks), GFP_KERNEL);<=
br>
@@ -192,22 +162,18 @@ static int s2mps11_clk_probe(struct platform_device *=
pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!clk_table)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch(platform_get_device_id(pdev)-&gt;driver_=
data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (hwid) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case S2MPS11X:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_reg =3D S2M=
PS11_REG_RTC_CTRL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clks_init =3D s2mps=
11_clks_init;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case S2MPS13X:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_reg =3D S2M=
PS13_REG_RTCCTRL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clks_init =3D s2mps=
13_clks_init;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case S2MPS14X:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_reg =3D S2M=
PS14_REG_RTCCTRL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clks_init =3D s2mps=
14_clks_init;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case S5M8767X:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_reg =3D S5M=
8767_REG_CTRL1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clks_init =3D s2mps=
11_clks_init;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&amp;pdev-&=
gt;dev, &quot;Invalid device type\n&quot;);<br>
@@ -215,15 +181,15 @@ static int s2mps11_clk_probe(struct platform_device *=
pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Store clocks of_node in first element of s2m=
ps11_clks array */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0s2mps11_clks-&gt;clk_np =3D s2mps11_clk_parse_d=
t(pdev, clks_init);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0s2mps11_clks-&gt;clk_np =3D s2mps11_clk_parse_d=
t(pdev, s2mps11_clks_init);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(s2mps11_clks-&gt;clk_np))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PTR_ERR(s2mp=
s11_clks-&gt;clk_np);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; S2MPS11_CLKS_NUM; i++) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!clks_init[i].n=
ame)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D S2MPS1=
1_CLK_CP &amp;&amp; hwid =3D=3D S2MPS14X)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue; /* Skip clocks not present in some devices */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_clks[i].iod=
ev =3D iodev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s2mps11_clks[i].hw.=
init =3D &amp;clks_init[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s2mps11_clks[i].hw.=
init =3D &amp;s2mps11_clks_init[i];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_clks[i].mas=
k =3D 1 &lt;&lt; i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s2mps11_clks[i].reg=
 =3D s2mps11_reg;<br>
<br>
@@ -246,7 +212,7 @@ static int s2mps11_clk_probe(struct platform_device *pd=
ev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; S2MPS11_CLKS_NUM; i++) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip clocks not =
present on S2MPS14 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!clks_init[i].n=
ame)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D S2MPS1=
1_CLK_CP &amp;&amp; hwid =3D=3D S2MPS14X)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_table[i] =3D s2=
mps11_clks[i].clk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.6.4<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at=C2=A0 <a href=3D"http://vger.kernel.org/majordomo-in=
fo.html" rel=3D"noreferrer" target=3D"_blank">http://vger.kernel.org/majord=
omo-info.html</a><br>
</font></span></blockquote></div><br></div></div>

--001a113ec998a0d9330529a52631--
