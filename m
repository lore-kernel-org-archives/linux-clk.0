Return-Path: <jean-michel.hautbois@veo-labs.com>
MIME-Version: 1.0
In-Reply-To: <CALHpu34iKGTE=tENJTFOu13LxSozRjU9bwmGxnigUXgTDsXAQw@mail.gmail.com>
References: <CAH-u=82M1yCmPjBg5qeiC8JiHjM8+WsP+utX_VPKfJwJsu0QFg@mail.gmail.com>
	<CALHpu366MPbxJinVL2QFM11gMHx-T=M9QXNoznOTh++oHGGmrA@mail.gmail.com>
	<CAH-u=81hMAF=r6rUKF+iuta3nC6n+4EDDz7Rn2-oGYbkbN0Jyg@mail.gmail.com>
	<CALHpu34iKGTE=tENJTFOu13LxSozRjU9bwmGxnigUXgTDsXAQw@mail.gmail.com>
Date: Thu, 5 Nov 2015 07:43:09 +0100
Message-ID: <CAH-u=83K7EPQ57cP=GQ6duH=bEwYxoC=YU+urLsg9kCo9eOQwA@mail.gmail.com>
Subject: Re: i.MX6: Increasing VPU frequency
From: Jean-Michel Hautbois <jean-michel.hautbois@veo-labs.com>
To: Jon Nettleton <jon.nettleton@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Michael Turquette <mturquette@baylibre.com>, Sascha Hauer <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, sboyd@codeaurora.org,
	Shawn Guo <shawnguo@kernel.org>
Content-Type: multipart/alternative; boundary=001a1135f3a6b293ac0523c57082
List-ID: <linux-clk.vger.kernel.org>

--001a1135f3a6b293ac0523c57082
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 5 nov. 2015 05:23, "Jon Nettleton" <jon.nettleton@gmail.com> a =C3=A9cri=
t :
>
> On Wed, Nov 4, 2015 at 8:33 PM, Jean-Michel Hautbois
> <jean-michel.hautbois@veo-labs.com> wrote:
> > 2015-11-04 18:04 GMT+01:00 Jon Nettleton <jon.nettleton@gmail.com>:
> >> On Wed, Nov 4, 2015 at 5:52 PM, Jean-Michel Hautbois
> >> <jean-michel.hautbois@veo-labs.com> wrote:
> >>> Hi !
> >>>
> >>> I can see in FSL kernel that VPU is configurable to 352M (it defaults
> >>> at 264MHz in mainline I think).
> >>> In the TRM, it is even specified at 352MHz as a default frequency,
> >>> with a maximum of 540MHz.
> >>>
> >>> Would it be possible to allow this clock rating modification if, for
> >>> instance, we select a performance governor in cpufreq, or if a coda
> >>> encoder is started with 1080p for instance ?
> >>> If so, then how is it doable properly ?
> >>
> >> For some reason the FSL kernel configures the VPU to run at 352Mhz in
> >> a very odd way that requires limiting the min cpu-frequency to 792Mhz.
> >> It also requires clocking down a bunch of devices on pll2_pfd2_396m to
> >> 352Mhz.
> >>
> >> The simple solution to this is to instead parent the VPU to
> >> pll2_pfd0_352m which is unused.  I have found by default it is stable
> >> decoding but unstable encoding at 352Mhz, most likely due to the
> >> voltage changes needed that limiting the min cpu-freq to 792Mhz
> >> provides.  However everything seems to work quite reliably clocking
> >> that pfd to 327Mhz, which still gives a boost of almost 24%
> >>
> >> In my testing the performance gain in then going from 327 to 352 is
> >> minimal.  Generally I think you hit AXI bus limitations rather than
> >> VPU performance.
> >
> > Interesting.
> > So you propose to add something like the following in
> > drivers/clk/imx/clk-imx6q.cdrivers/clk/imx/clk-imx6q.c :
> > imx_clk_set_rate(clk[IMX6QDL_CLK_PLL2_PFD0_352M], 327000000);
> > imx_clk_set_parent(clk[IMX6QDL_CLK_VPU_AXI_SEL],
> > clk[IMX6QDL_CLK_PLL2_PFD0_352M]);
> >
> > This should end up with a fastest VPU (in fact ~25% boost is good).
> > Is it the correct way to do it ?
> > Should it be done in coda instead ? And only when needed ?
>
> That is how I have done it.  I was going to implement dvfs for the vpu
> but found that this change really added minimal power and thermal
> overhead.  Without looking it up I believe I only saw a 10-20mA rise
> in power usage and virtually no thermal differences.

OK so it could even be integrated mainline... Should it be driven by DT
maybe?
Is it OK to have VPU at 327MHz and CPU at 396MHz?

JM

--001a1135f3a6b293ac0523c57082
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
Le=C2=A05 nov. 2015 05:23, &quot;Jon Nettleton&quot; &lt;<a href=3D"mailto:=
jon.nettleton@gmail.com">jon.nettleton@gmail.com</a>&gt; a =C3=A9crit=C2=A0=
:<br>
&gt;<br>
&gt; On Wed, Nov 4, 2015 at 8:33 PM, Jean-Michel Hautbois<br>
&gt; &lt;<a href=3D"mailto:jean-michel.hautbois@veo-labs.com">jean-michel.h=
autbois@veo-labs.com</a>&gt; wrote:<br>
&gt; &gt; 2015-11-04 18:04 GMT+01:00 Jon Nettleton &lt;<a href=3D"mailto:jo=
n.nettleton@gmail.com">jon.nettleton@gmail.com</a>&gt;:<br>
&gt; &gt;&gt; On Wed, Nov 4, 2015 at 5:52 PM, Jean-Michel Hautbois<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:jean-michel.hautbois@veo-labs.com">jean=
-michel.hautbois@veo-labs.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt; Hi !<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I can see in FSL kernel that VPU is configurable to 352M =
(it defaults<br>
&gt; &gt;&gt;&gt; at 264MHz in mainline I think).<br>
&gt; &gt;&gt;&gt; In the TRM, it is even specified at 352MHz as a default f=
requency,<br>
&gt; &gt;&gt;&gt; with a maximum of 540MHz.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Would it be possible to allow this clock rating modificat=
ion if, for<br>
&gt; &gt;&gt;&gt; instance, we select a performance governor in cpufreq, or=
 if a coda<br>
&gt; &gt;&gt;&gt; encoder is started with 1080p for instance ?<br>
&gt; &gt;&gt;&gt; If so, then how is it doable properly ?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; For some reason the FSL kernel configures the VPU to run at 3=
52Mhz in<br>
&gt; &gt;&gt; a very odd way that requires limiting the min cpu-frequency t=
o 792Mhz.<br>
&gt; &gt;&gt; It also requires clocking down a bunch of devices on pll2_pfd=
2_396m to<br>
&gt; &gt;&gt; 352Mhz.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The simple solution to this is to instead parent the VPU to<b=
r>
&gt; &gt;&gt; pll2_pfd0_352m which is unused.=C2=A0 I have found by default=
 it is stable<br>
&gt; &gt;&gt; decoding but unstable encoding at 352Mhz, most likely due to =
the<br>
&gt; &gt;&gt; voltage changes needed that limiting the min cpu-freq to 792M=
hz<br>
&gt; &gt;&gt; provides.=C2=A0 However everything seems to work quite reliab=
ly clocking<br>
&gt; &gt;&gt; that pfd to 327Mhz, which still gives a boost of almost 24%<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; In my testing the performance gain in then going from 327 to =
352 is<br>
&gt; &gt;&gt; minimal.=C2=A0 Generally I think you hit AXI bus limitations =
rather than<br>
&gt; &gt;&gt; VPU performance.<br>
&gt; &gt;<br>
&gt; &gt; Interesting.<br>
&gt; &gt; So you propose to add something like the following in<br>
&gt; &gt; drivers/clk/imx/clk-imx6q.cdrivers/clk/imx/clk-imx6q.c :<br>
&gt; &gt; imx_clk_set_rate(clk[IMX6QDL_CLK_PLL2_PFD0_352M], 327000000);<br>
&gt; &gt; imx_clk_set_parent(clk[IMX6QDL_CLK_VPU_AXI_SEL],<br>
&gt; &gt; clk[IMX6QDL_CLK_PLL2_PFD0_352M]);<br>
&gt; &gt;<br>
&gt; &gt; This should end up with a fastest VPU (in fact ~25% boost is good=
).<br>
&gt; &gt; Is it the correct way to do it ?<br>
&gt; &gt; Should it be done in coda instead ? And only when needed ?<br>
&gt;<br>
&gt; That is how I have done it.=C2=A0 I was going to implement dvfs for th=
e vpu<br>
&gt; but found that this change really added minimal power and thermal<br>
&gt; overhead.=C2=A0 Without looking it up I believe I only saw a 10-20mA r=
ise<br>
&gt; in power usage and virtually no thermal differences.</p>
<p dir=3D"ltr">OK so it could even be integrated mainline... Should it be d=
riven by DT maybe? <br>
Is it OK to have VPU at 327MHz and CPU at 396MHz?</p>
<p dir=3D"ltr">JM</p>

--001a1135f3a6b293ac0523c57082--
