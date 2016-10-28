Return-Path: <lho@apm.com>
MIME-Version: 1.0
In-Reply-To: <20161027233344.GF26139@codeaurora.org>
References: <1477610508-7449-1-git-send-email-labbott@redhat.com>
 <ccea4ce8-5607-c164-f90a-291075bcc13e@redhat.com> <20161027233344.GF26139@codeaurora.org>
From: Loc Ho <lho@apm.com>
Date: Thu, 27 Oct 2016 21:57:38 -0700
Message-ID: <CAPw-ZTk60L5MpC3qgYP0dXB_ZGKSj7NtMPSMCx9sinaK6EDwaA@mail.gmail.com>
Subject: Re: [PATCH] clk: xgene: Don't call __pa on ioremaped address
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Laura Abbott <labbott@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary=001a113fbd488674a5053fe5b26c
List-ID: <linux-clk.vger.kernel.org>

--001a113fbd488674a5053fe5b26c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Oct 27, 2016 at 4:33 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> On 10/27, Laura Abbott wrote:
> > On 10/27/2016 04:21 PM, Laura Abbott wrote:
> > >
> > >@@ -269,7 +267,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
> > >             xgene_clk_write(data, pclk->param.csr_reg +
> > >                                     pclk->param.reg_csr_offset);
> > >             pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X
> mask 0x%08X value 0x%08X\n",
> >
> > Bah, this got fixed locally but didn't get amended. I'll remove
> > the format here in a v2 assuming there are no other objections.
> >
>
> Include a Fixes: tag too? It would be nice if sparse complained
> about __pa used on an __iomem pointer too.
>

=E2=80=8BThe change looks fine after you fix the pr_debug mentioned above. =
Will you
be generate another version?

-Loc=E2=80=8B

--001a113fbd488674a5053fe5b26c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi Stephen,</div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Thu, Oct 27, 2016 at 4:33 PM, Stephen Boyd <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sboyd@codeaurora.org" target=3D"_blank">sboy=
d@codeaurora.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 10/27, Laura Abbott wrote:<br>
&gt; On 10/27/2016 04:21 PM, Laura Abbott wrote:<br>
&gt; &gt;<br>
&gt; &gt;@@ -269,7 +267,7 @@ static int xgene_clk_enable(struct clk_hw *hw)=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xgene_clk_write(da=
ta, pclk-&gt;param.csr_reg +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pclk-&gt;=
param.reg_csr_offset);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s =
CSR RESET PADDR base %pa csr offset 0x%08X mask 0x%08X value 0x%08X\n&quot;=
,<br>
&gt;<br>
&gt; Bah, this got fixed locally but didn&#39;t get amended. I&#39;ll remov=
e<br>
&gt; the format here in a v2 assuming there are no other objections.<br>
&gt;<br>
<br>
Include a Fixes: tag too? It would be nice if sparse complained<br>
about __pa used on an __iomem pointer too.<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif">=E2=80=8BThe change looks fine after you fix the pr_debug mentioned =
above. Will you be generate another version?</div><div class=3D"gmail_defau=
lt" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=
=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">-Loc=E2=
=80=8B</div><br></div></div></div></div>

--001a113fbd488674a5053fe5b26c--
