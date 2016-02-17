Return-Path: <lenyoez1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1455591838-22725-1-git-send-email-eric@anholt.net>
References: <1455591838-22725-1-git-send-email-eric@anholt.net>
Date: Wed, 17 Feb 2016 09:51:16 -0800
Message-ID: <CAB=mZpFHz-gvqa0WimT-eCQiHk+ZGbH1t-+HL8oLXtuQcfOBdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: bcm2835: Fix setting of PLL divider clock rates
From: Jayson Aguilar <lenyoez1@gmail.com>
To: Eric Anholt <eric@anholt.net>
Cc: stable@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@codeaurora.org>
Content-Type: multipart/alternative; boundary=089e0115e8e888db43052bfae5b8
List-ID: <linux-clk.vger.kernel.org>

--089e0115e8e888db43052bfae5b8
Content-Type: text/plain; charset=UTF-8

Unsubscribe
On Feb 16, 2016 12:42 AM, "Eric Anholt" <eric@anholt.net> wrote:

> Our dividers weren't being set successfully because CM_PASSWORD wasn't
> included in the register write.  It looks easier to just compute the
> divider to write ourselves than to update clk-divider for the ability
> to OR in some arbitrary bits on write.
>
> Fixes about half of the video modes on my HDMI monitor (everything
> except 720x400).
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  drivers/clk/bcm/clk-bcm2835.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 015e687..9f4df8f 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1107,13 +1107,15 @@ static int bcm2835_pll_divider_set_rate(struct
> clk_hw *hw,
>         struct bcm2835_pll_divider *divider =
> bcm2835_pll_divider_from_hw(hw);
>         struct bcm2835_cprman *cprman = divider->cprman;
>         const struct bcm2835_pll_divider_data *data = divider->data;
> -       u32 cm;
> -       int ret;
> +       u32 cm, div, max_div = 1 << A2W_PLL_DIV_BITS;
>
> -       ret = clk_divider_ops.set_rate(hw, rate, parent_rate);
> -       if (ret)
> -               return ret;
> +       div = DIV_ROUND_UP_ULL(parent_rate, rate);
> +
> +       div = min(div, max_div);
> +       if (div == max_div)
> +               div = 0;
>
> +       cprman_write(cprman, data->a2w_reg, div);
>         cm = cprman_read(cprman, data->cm_reg);
>         cprman_write(cprman, data->cm_reg, cm | data->load_mask);
>         cprman_write(cprman, data->cm_reg, cm & ~data->load_mask);
> --
> 2.7.0
>
>
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
>

--089e0115e8e888db43052bfae5b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Unsubscribe </p>
<div class=3D"gmail_quote">On Feb 16, 2016 12:42 AM, &quot;Eric Anholt&quot=
; &lt;<a href=3D"mailto:eric@anholt.net">eric@anholt.net</a>&gt; wrote:<br =
type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Our dividers weren&#39;=
t being set successfully because CM_PASSWORD wasn&#39;t<br>
included in the register write.=C2=A0 It looks easier to just compute the<b=
r>
divider to write ourselves than to update clk-divider for the ability<br>
to OR in some arbitrary bits on write.<br>
<br>
Fixes about half of the video modes on my HDMI monitor (everything<br>
except 720x400).<br>
<br>
Cc: <a href=3D"mailto:stable@vger.kernel.org">stable@vger.kernel.org</a><br=
>
Signed-off-by: Eric Anholt &lt;<a href=3D"mailto:eric@anholt.net">eric@anho=
lt.net</a>&gt;<br>
---<br>
=C2=A0drivers/clk/bcm/clk-bcm2835.c | 12 +++++++-----<br>
=C2=A01 file changed, 7 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c<=
br>
index 015e687..9f4df8f 100644<br>
--- a/drivers/clk/bcm/clk-bcm2835.c<br>
+++ b/drivers/clk/bcm/clk-bcm2835.c<br>
@@ -1107,13 +1107,15 @@ static int bcm2835_pll_divider_set_rate(struct clk_=
hw *hw,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct bcm2835_pll_divider *divider =3D bcm2835=
_pll_divider_from_hw(hw);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct bcm2835_cprman *cprman =3D divider-&gt;c=
prman;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct bcm2835_pll_divider_data *data =3D=
 divider-&gt;data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 cm, div, max_div =3D 1 &lt;&lt; A2W_PLL_DIV=
_BITS;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_divider_ops.set_rate(hw, rate, pare=
nt_rate);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D DIV_ROUND_UP_ULL(parent_rate, rate);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D min(div, max_div);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (div =3D=3D max_div)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0div =3D 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cprman_write(cprman, data-&gt;a2w_reg, div);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cm =3D cprman_read(cprman, data-&gt;cm_reg);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cprman_write(cprman, data-&gt;cm_reg, cm | data=
-&gt;load_mask);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cprman_write(cprman, data-&gt;cm_reg, cm &amp; =
~data-&gt;load_mask);<br>
--<br>
2.7.0<br>
<br>
<br>
_______________________________________________<br>
linux-rpi-kernel mailing list<br>
<a href=3D"mailto:linux-rpi-kernel@lists.infradead.org">linux-rpi-kernel@li=
sts.infradead.org</a><br>
<a href=3D"http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel" re=
l=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/listi=
nfo/linux-rpi-kernel</a><br>
</blockquote></div>

--089e0115e8e888db43052bfae5b8--
