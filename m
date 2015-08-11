Return-Path: <zhjwpku@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEG3pNA8BL65AoaKg+yuKEc5SwWD56GE95TnF44ke69NWesKTw@mail.gmail.com>
References: <CAEG8a3JL=nfbTGR-svK3fPovwK=ums9-q-vGQiiG3iiv8SXUTA@mail.gmail.com>
	<CAEG3pNA8BL65AoaKg+yuKEc5SwWD56GE95TnF44ke69NWesKTw@mail.gmail.com>
Date: Tue, 11 Aug 2015 15:46:53 +0800
Message-ID: <CAEG8a3JYPkf6HtyJca775WKthRj8aXspREu4dOj+PBtVAEuqCw@mail.gmail.com>
Subject: Re: question about clk.h
From: John Hunter <zhjwpku@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Content-Type: multipart/alternative; boundary=089e0160bd103c60c9051d044e09
List-ID: <linux-clk.vger.kernel.org>

--089e0160bd103c60c9051d044e09
Content-Type: text/plain; charset=UTF-8

Hi Michael,

Sorry I didn't reply soon, cause something goes wrong with my gmail, your
reply was automatically deleted, I really have no idea why this happened.

Anyway, here is the code:
    ret = clk_register_clkdev(clk_info[i].clk, clk_info[i].clk->name, NULL);
so after move it to 4.1, I change it to:
    ret = clk_register_clkdev(clk_info[i].clk, clk_info[i].clk->core->name,
NULL);

This give me the error msg.

On Fri, Aug 7, 2015 at 10:07 PM, Michael Turquette <mturquette@baylibre.com>
wrote:

> Hello Junwang Zhao,
>
> Thanks for asking! And it is not a stupid question. The only stupid
> question is the one that is never asked.
>
> Drivers should never need to know the definitions of struct clk. This
> is true for both clk consumer drivers (example: USB host controller
> driver) and for clock provider drivers (example: clock controller
> driver).
>
> clk.h declares but does not define struct clk, so your drivers may use
> struct clk has a handle or opaque cookie, but may never dereference
> that pointer.
>
> Can you share your code that is dereferencing struct clk? I may be
> able to help you.
>
> Also, if you want you can Cc linux-clk@vger.kernel.org. It is always
> best to Cc the mailing list for these types of discussions.
>
> Best regards,
> Mike
>
> On Fri, Aug 7, 2015 at 6:50 AM, John Hunter <zhjwpku@gmail.com> wrote:
> > hi Mike,
> >
> > I used to include <linux/clk-private.h> in my driver, and my linux tree
> is
> > 3.17, but
> > when I move to linux 4.1, I found that this file was deleted, and the
> struct
> > clk was
> > moving to drivers/clk/clk.c, but this gives me a problem:
> >
> >     error: dereferencing pointer to incomplete type
> >
> > This is because I just include the <linux/clk.h>, and in this file, we
> only
> > declared
> > the struct clk, but not define it (definition is in drivers/clk/clk.c).
> >
> > Some how I might need the definition, so I want to know how can I fix
> this.
> >
> > I am new learner of linux device driver, so thanks very much for any of
> your
> > help,
> > pls show some mercy if I asked a stupid question.
> >
> > --
> > Best regards
> > Junwang Zhao
> > Microprocessor Research and Develop Center
> > Department of Computer Science &Technology
> > Peking University
> > Beijing, 100871, PRC
>
>
>
> --
> Michael Turquette
> CEO
> BayLibre - At the Heart of Embedded Linux
> http://baylibre.com/
>



-- 
Best regards
Junwang Zhao
Microprocessor Research and Develop Center
Department of Computer Science &Technology
Peking University
Beijing, 100871, PRC

--089e0160bd103c60c9051d044e09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Michael,<div><br></div><div>Sorry I didn&#39;t reply so=
on, cause something goes wrong with my gmail, your</div><div>reply was auto=
matically deleted, I really have no idea why this happened.</div><div><br><=
/div><div>Anyway, here is the code:</div><div>=C2=A0 =C2=A0 ret =3D clk_reg=
ister_clkdev(clk_info[i].clk, clk_info[i].clk-&gt;name, NULL);</div><div>so=
 after move it to 4.1, I change it to:</div><div>=C2=A0 =C2=A0 ret =3D clk_=
register_clkdev(clk_info[i].clk, clk_info[i].clk-&gt;core-&gt;name, NULL);<=
/div><div><br></div><div>This give me the error msg.</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Aug 7, 2015 at 10:0=
7 PM, Michael Turquette <span dir=3D"ltr">&lt;<a href=3D"mailto:mturquette@=
baylibre.com" target=3D"_blank">mturquette@baylibre.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Hello Junwang Zhao,<br>
<br>
Thanks for asking! And it is not a stupid question. The only stupid<br>
question is the one that is never asked.<br>
<br>
Drivers should never need to know the definitions of struct clk. This<br>
is true for both clk consumer drivers (example: USB host controller<br>
driver) and for clock provider drivers (example: clock controller<br>
driver).<br>
<br>
clk.h declares but does not define struct clk, so your drivers may use<br>
struct clk has a handle or opaque cookie, but may never dereference<br>
that pointer.<br>
<br>
Can you share your code that is dereferencing struct clk? I may be<br>
able to help you.<br>
<br>
Also, if you want you can Cc <a href=3D"mailto:linux-clk@vger.kernel.org">l=
inux-clk@vger.kernel.org</a>. It is always<br>
best to Cc the mailing list for these types of discussions.<br>
<br>
Best regards,<br>
Mike<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Fri, Aug 7, 2015 at 6:50 AM, John Hunter &lt;<a href=3D"mailto:zhjwpku@g=
mail.com">zhjwpku@gmail.com</a>&gt; wrote:<br>
&gt; hi Mike,<br>
&gt;<br>
&gt; I used to include &lt;linux/clk-private.h&gt; in my driver, and my lin=
ux tree is<br>
&gt; 3.17, but<br>
&gt; when I move to linux 4.1, I found that this file was deleted, and the =
struct<br>
&gt; clk was<br>
&gt; moving to drivers/clk/clk.c, but this gives me a problem:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0error: dereferencing pointer to incomplete type<br>
&gt;<br>
&gt; This is because I just include the &lt;linux/clk.h&gt;, and in this fi=
le, we only<br>
&gt; declared<br>
&gt; the struct clk, but not define it (definition is in drivers/clk/clk.c)=
.<br>
&gt;<br>
&gt; Some how I might need the definition, so I want to know how can I fix =
this.<br>
&gt;<br>
&gt; I am new learner of linux device driver, so thanks very much for any o=
f your<br>
&gt; help,<br>
&gt; pls show some mercy if I asked a stupid question.<br>
&gt;<br>
&gt; --<br>
&gt; Best regards<br>
&gt; Junwang Zhao<br>
&gt; Microprocessor Research and Develop Center<br>
&gt; Department of Computer Science &amp;Technology<br>
&gt; Peking University<br>
&gt; Beijing, 100871, PRC<br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Michael Turquette<br>
CEO<br>
BayLibre - At the Heart of Embedded Linux<br>
<a href=3D"http://baylibre.com/" rel=3D"noreferrer" target=3D"_blank">http:=
//baylibre.com/</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><div dir=3D"ltr"><div>Best regards<br></di=
v><div>Junwang Zhao</div><div>Microprocessor Research and Develop Center</d=
iv><div>Department of Computer Science &amp;Technology</div><div>Peking Uni=
versity</div><div>Beijing, 100871, PRC</div></div></div>
</div>

--089e0160bd103c60c9051d044e09--
