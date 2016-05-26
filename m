Return-Path: <gabriel.fernandez@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20160525172409.GA27913@rob-hp-laptop>
References: <1463560892-7209-1-git-send-email-gabriel.fernandez@linaro.org>
 <1463560892-7209-3-git-send-email-gabriel.fernandez@linaro.org> <20160525172409.GA27913@rob-hp-laptop>
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Date: Thu, 26 May 2016 11:35:25 +0200
Message-ID: <CAG374jA1NG69jVrCE20fdvRty8E4VKGbvpEHePCUQardDq2zxA@mail.gmail.com>
Subject: Re: [PATCH 02/11] drivers: clk: st: Add clock propagation for audio clocks
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Olivier Bideau <olivier.bideau@st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
	Pankaj Dev <pankaj.dev@st.com>, Dinh Nguyen <dinguyen@opensource.altera.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kernel@stlinux.com" <kernel@stlinux.com>, linux-clk@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>,
	Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
	Vincent ABRIOU <vincent.abriou@st.com>
Content-Type: multipart/alternative; boundary=047d7b5d5ffee5b5190533bb841c
List-ID: <linux-clk.vger.kernel.org>

--047d7b5d5ffee5b5190533bb841c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 May 2016 at 19:24, Rob Herring <robh@kernel.org> wrote:

> On Wed, May 18, 2016 at 10:41:23AM +0200, Gabriel Fernandez wrote:
> > This patch allows fine tuning of the quads FS for audio clocks
> > accuracy.
> >
> > Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/st/st,flexgen.txt    |  1 +
> >  drivers/clk/st/clk-flexgen.c                       | 24
> ++++++++++++++++++++++
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> > index b7ee5c7..15b33c7 100644
> > --- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> > +++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> > @@ -60,6 +60,7 @@ This binding uses the common clock binding[2].
> >  Required properties:
> >  - compatible : shall be:
> >    "st,flexgen"
> > +  "
> =E2=80=8B=E2=80=8B
> st,stih407-clkgend0", "st,flexgen" (enable clock
> =E2=80=8B
> =E2=80=8B
> st,stih407-clkgend0 on parent)
>
> What do "d0" and "d2" refer to?
>
> This seems to indicate you have too much clock detail in the DT (with
> individual clocks described) or not enough with genericish compatible
> strings. What happens for the mext clock you need to adjust the flags
> on? You should be able to make these adjustments without DT updates.
> Perhaps you need a wider fixing of clock compatible strings.
>
> Rob
>

=E2=80=8BHi Rob

Thanks for reviewing.

Can i remove
=E2=80=8B"
st,stih407-clkgend0" & "
=E2=80=8B
st,stih407-clkgend2" compatible strings and add proprieties instead ?
I only need to activate 2 features and then we can keep generic compatible
strings.

e.g.

clk_s_d2_flexgen: clk-s-d2-flexgen {
#clock-cells =3D <1>;
compatible =3D "st,flexgen";
        ...
=E2=80=8B        st-sync-mode=E2=80=8B;
        st-update
-parent-rate;
};

for d0_flexgen i will enable only =E2=80=8Bst-sync-mode=E2=80=8B;

Best Regards

Gabriel

--047d7b5d5ffee5b5190533bb841c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:&#39;cou=
rier new&#39;,monospace"><span style=3D"font-family:arial,sans-serif">On 25=
 May 2016 at 19:24, Rob Herring </span><span dir=3D"ltr" style=3D"font-fami=
ly:arial,sans-serif">&lt;<a href=3D"mailto:robh@kernel.org" target=3D"_blan=
k">robh@kernel.org</a>&gt;</span><span style=3D"font-family:arial,sans-seri=
f"> wrote:</span><br></div><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><span class=3D"">On Wed, May 18, 2016 at 10:41:23AM =
+0200, Gabriel Fernandez wrote:<br>
&gt; This patch allows fine tuning of the quads FS for audio clocks<br>
&gt; accuracy.<br>
&gt;<br>
&gt; Signed-off-by: Olivier Bideau &lt;<a href=3D"mailto:olivier.bideau@st.=
com">olivier.bideau@st.com</a>&gt;<br>
&gt; Signed-off-by: Gabriel Fernandez &lt;<a href=3D"mailto:gabriel.fernand=
ez@linaro.org">gabriel.fernandez@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../devicetree/bindings/clock/st/st,flexgen.txt=C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 drivers/clk/st/clk-flexgen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++++++++++++++=
<br>
&gt;=C2=A0 2 files changed, 25 insertions(+)<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt=
 b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt<br>
&gt; index b7ee5c7..15b33c7 100644<br>
&gt; --- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt<br>
&gt; +++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt<br>
&gt; @@ -60,6 +60,7 @@ This binding uses the common clock binding[2].<br>
&gt;=C2=A0 Required properties:<br>
&gt;=C2=A0 - compatible : shall be:<br>
&gt;=C2=A0 =C2=A0 &quot;st,flexgen&quot;<br>
&gt; +=C2=A0 &quot;<div class=3D"gmail_default" style=3D"font-family:&#39;c=
ourier new&#39;,monospace;display:inline">=E2=80=8B=E2=80=8B</div>st,stih40=
7-clkgend0&quot;, &quot;st,flexgen&quot; (enable clock <div class=3D"gmail_=
default" style=3D"font-family:&#39;courier new&#39;,monospace;display:inlin=
e">=E2=80=8B</div><div class=3D"gmail_default" style=3D"font-family:&#39;co=
urier new&#39;,monospace;display:inline">=E2=80=8B</div>st,stih407-clkgend0=
=C2=A0on parent)<br>
<br>
</span>What do &quot;d0&quot; and &quot;d2&quot; refer to?<br>
<br>
This seems to indicate you have too much clock detail in the DT (with<br>
individual clocks described) or not enough with genericish compatible<br>
strings. What happens for the mext clock you need to adjust the flags<br>
on? You should be able to make these adjustments without DT updates.<br>
Perhaps you need a wider fixing of clock compatible strings.<br>
<span class=3D""><font color=3D"#888888"><br>
Rob<br></font></span></blockquote><div>=C2=A0</div></div><div class=3D"gmai=
l_default" style=3D"font-family:&#39;courier new&#39;,monospace">=E2=80=8BH=
i Rob</div><div class=3D"gmail_default" style=3D"font-family:&#39;courier n=
ew&#39;,monospace"><br></div><div class=3D"gmail_default" style=3D"font-fam=
ily:&#39;courier new&#39;,monospace">Thanks for reviewing.</div><div class=
=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace"><b=
r></div><div class=3D"gmail_default"><font face=3D"courier new, monospace">=
Can i remove=C2=A0</font><div class=3D"gmail_default" style=3D"font-family:=
&#39;courier new&#39;,monospace;display:inline">=E2=80=8B&quot;</div><span =
style=3D"font-family:arial,sans-serif">st,stih407-clkgend0&quot; &amp; &quo=
t;</span><div class=3D"gmail_default" style=3D"font-family:&#39;courier new=
&#39;,monospace;display:inline">=E2=80=8B</div>st,stih407-clkgend2&quot; co=
mpatible strings and add=C2=A0proprieties=C2=A0instead ?</div><div class=3D=
"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace">I onl=
y need to activate 2 features and then we can keep generic compatible strin=
gs.<br></div><div class=3D"gmail_default" style=3D"font-family:&#39;courier=
 new&#39;,monospace"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:&#39;courier new&#39;,monospace">e.g.=C2=A0</div><div class=3D"gmail_=
default" style=3D""><div class=3D"gmail_default" style=3D""><font face=3D"c=
ourier new, monospace"><br></font></div><div class=3D"gmail_default" style=
=3D""><font face=3D"courier new, monospace">clk_s_d2_flexgen: clk-s-d2-flex=
gen {</font></div><div class=3D"gmail_default" style=3D""><font face=3D"cou=
rier new, monospace"><span class=3D"" style=3D"white-space:pre">	</span>#cl=
ock-cells =3D &lt;1&gt;;</font></div><div class=3D"gmail_default" style=3D"=
"><font face=3D"courier new, monospace"><span class=3D"" style=3D"white-spa=
ce:pre">	</span>compatible =3D &quot;st,flexgen&quot;;</font></div><div cla=
ss=3D"gmail_default" style=3D""><font face=3D"courier new, monospace">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ...</font></div><div class=3D"gmail_default" style=
=3D"font-family:&#39;courier new&#39;,monospace">=E2=80=8B =C2=A0 =C2=A0 =
=C2=A0 =C2=A0st-sync-mode=E2=80=8B;<br></div></div><div class=3D"gmail_defa=
ult" style=3D"font-family:&#39;courier new&#39;,monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 st-update<div class=3D"gmail_default" style=3D"display:inline=
">-parent-rate;</div></div><div class=3D"gmail_default" style=3D"font-famil=
y:&#39;courier new&#39;,monospace"><div class=3D"gmail_default" style=3D"di=
splay:inline">};</div></div><div class=3D"gmail_default" style=3D"font-fami=
ly:&#39;courier new&#39;,monospace"><br></div><div class=3D"gmail_default" =
style=3D"font-family:&#39;courier new&#39;,monospace">for d0_flexgen i will=
 enable only =E2=80=8Bst-sync-mode=E2=80=8B;</div><div class=3D"gmail_defau=
lt"><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;=
,monospace"><br></div><div class=3D"gmail_default" style=3D"font-family:&#3=
9;courier new&#39;,monospace">Best Regards</div><div class=3D"gmail_default=
" style=3D"font-family:&#39;courier new&#39;,monospace"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace">G=
abriel</div><div class=3D"gmail_default" style=3D"font-family:&#39;courier =
new&#39;,monospace"><br></div></div><div class=3D"gmail_default" style=3D"f=
ont-family:&#39;courier new&#39;,monospace"><br></div><br></div></div>

--047d7b5d5ffee5b5190533bb841c--
