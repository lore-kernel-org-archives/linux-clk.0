Return-Path: <wuninsu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160202024158.GM4848@codeaurora.org>
References: <1454166724-17374-1-git-send-email-wuninsu@gmail.com>
	<20160202024158.GM4848@codeaurora.org>
Date: Mon, 1 Feb 2016 23:21:59 -0500
Message-ID: <CAGoFzNf_MLBvQfiR6SAwjmaauPo1KJLPM_Z4jGqKL+2ZkjEfAQ@mail.gmail.com>
Subject: Re: [PATCH] clk: unlock for handling unregisterd clock
From: Insu Yun <wuninsu@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Taesoo Kim <taesoo@gatech.edu>,
	Yeongjin Jang <yeongjin.jang@gatech.edu>, "Yun, Insu" <insu@gatech.edu>,
	Changwoo Min <changwoo@gatech.edu>
Content-Type: multipart/alternative; boundary=94eb2c09d77abae26c052ac1d745
List-ID: <linux-clk.vger.kernel.org>

--94eb2c09d77abae26c052ac1d745
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 9:41 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 01/30, Insu Yun wrote:
> > If clock is already unregistered, it returns with holding lock.
> > It needs to be unlocked.
> >
> > Signed-off-by: Insu Yun <wuninsu@gmail.com>
> > ---
>
> Applied to clk-next but I changed it to a goto:
>

Ok Thanks


>
> ---8<---
> From: Insu Yun <wuninsu@gmail.com>
> Subject: [PATCH] clk: unlock for handling unregisterd clock
>
> If clock is already unregistered, it returns with holding lock.
> It needs to be unlocked.
>
> Signed-off-by: Insu Yun <wuninsu@gmail.com>
> [sboyd@codeaurora.org: Use goto instead]
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/clk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fff87b39944f..7d247a26a212 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2639,7 +2639,7 @@ void clk_unregister(struct clk *clk)
>         if (clk->core->ops == &clk_nodrv_ops) {
>                 pr_err("%s: unregistered clock: %s\n", __func__,
>                        clk->core->name);
> -               return;
> +               goto unlock;
>         }
>         /*
>          * Assign empty clock ops for consumers that might still hold
> @@ -2665,7 +2665,7 @@ void clk_unregister(struct clk *clk)
>                 pr_warn("%s: unregistering prepared clock: %s\n",
>                                         __func__, clk->core->name);
>         kref_put(&clk->core->ref, __clk_release);
> -
> +unlock:
>         clk_prepare_unlock();
>  }
>  EXPORT_SYMBOL_GPL(clk_unregister);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
>


-- 
Regards
Insu Yun

--94eb2c09d77abae26c052ac1d745
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Feb 1, 2016 at 9:41 PM, Stephen Boyd <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sboyd@codeaurora.org" target=3D"_blank">sboyd@codeaurora.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><span class=3D"">On 01/30, Insu Yun =
wrote:<br>
&gt; If clock is already unregistered, it returns with holding lock.<br>
&gt; It needs to be unlocked.<br>
&gt;<br>
&gt; Signed-off-by: Insu Yun &lt;<a href=3D"mailto:wuninsu@gmail.com">wunin=
su@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
</span>Applied to clk-next but I changed it to a goto:<br></blockquote><div=
><br></div><div>Ok Thanks</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
---8&lt;---<br>
From: Insu Yun &lt;<a href=3D"mailto:wuninsu@gmail.com">wuninsu@gmail.com</=
a>&gt;<br>
Subject: [PATCH] clk: unlock for handling unregisterd clock<br>
<span class=3D""><br>
If clock is already unregistered, it returns with holding lock.<br>
It needs to be unlocked.<br>
<br>
Signed-off-by: Insu Yun &lt;<a href=3D"mailto:wuninsu@gmail.com">wuninsu@gm=
ail.com</a>&gt;<br>
</span>[<a href=3D"mailto:sboyd@codeaurora.org">sboyd@codeaurora.org</a>: U=
se goto instead]<br>
Signed-off-by: Stephen Boyd &lt;<a href=3D"mailto:sboyd@codeaurora.org">sbo=
yd@codeaurora.org</a>&gt;<br>
---<br>
=C2=A0drivers/clk/clk.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c<br>
index fff87b39944f..7d247a26a212 100644<br>
--- a/drivers/clk/clk.c<br>
+++ b/drivers/clk/clk.c<br>
@@ -2639,7 +2639,7 @@ void clk_unregister(struct clk *clk)<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clk-&gt;core-&gt;ops =3D=
=3D &amp;clk_nodrv_ops) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err(&quot;%s: un=
registered clock: %s\n&quot;, __func__,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0clk-&gt;core-&gt;name);<br>
</span>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unlock;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Assign empty clock ops for consumers th=
at might still hold<br>
@@ -2665,7 +2665,7 @@ void clk_unregister(struct clk *clk)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn(&quot;%s: u=
nregistering prepared clock: %s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__=
, clk-&gt;core-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kref_put(&amp;clk-&gt;core-&gt;ref, __clk_relea=
se);<br>
-<br>
+unlock:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_prepare_unlock();<br>
=C2=A0}<br>
=C2=A0EXPORT_SYMBOL_GPL(clk_unregister);<br>
<span class=3D""><font color=3D"#888888">--<br>
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,<=
br>
a Linux Foundation Collaborative Project<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><div>Regards</div>
<div>Insu Yun</div></div>
</div></div>

--94eb2c09d77abae26c052ac1d745--
