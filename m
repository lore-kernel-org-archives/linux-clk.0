Return-Path: <jaswinder.singh@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20150414093028.GB29667@station.rsr.lip6.fr>
References: <20150414093028.GB29667@station.rsr.lip6.fr>
Date: Tue, 14 Apr 2015 15:42:19 +0530
Message-ID: <CAJe_ZhfREnT7Ktq1GcLSP=_+7Ph0whSCVr7gvNu8-9kwWbYhVw@mail.gmail.com>
Subject: Re: clk: mb86s7x: ARCH_MB86S7X not defined
From: Jassi Brar <jaswinder.singh@linaro.org>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Cc: linux-clk@vger.kernel.org, Andy Green <andy.green@linaro.org>, mturquette@linaro.org,
	Andreas Ruprecht <rupran@einserver.de>, nuriya.tetsuya@socionext.com, stefan.hengelein@fau.de,
	vincent.yang@socionext.com, Paul Bolle <pebolle@tiscali.nl>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary=001a11c148244908470513ac7790
List-ID: <linux-clk.vger.kernel.org>

--001a11c148244908470513ac7790
Content-Type: text/plain; charset=UTF-8

Hi Valentin,

On Apr 14, 2015 3:00 PM, "Valentin Rothberg" <valentinrothberg@gmail.com>
wrote:
>
> Hi Jassi,
>
> your commit 1ccdd04f5365 ("clk: Add clock driver for mb86s7x") is in
> today's Linux next tree.  The clock driver clk-mb86s7x.c is
> conditionally compiled depending on CONFIG_ARCH_MB86S7X.  This option is
> nowhere defined in Kconfig, so that the driver cannot be compiled at its
> current tate.
>
> Is there a patch queued somewhere that adds this feature?
>
The arch patchset is submitted but not yet merged by Olof.

Thanks

--001a11c148244908470513ac7790
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Valentin, </p>
<p dir=3D"ltr">On Apr 14, 2015 3:00 PM, &quot;Valentin Rothberg&quot; &lt;<=
a href=3D"mailto:valentinrothberg@gmail.com">valentinrothberg@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Hi Jassi,<br>
&gt;<br>
&gt; your commit 1ccdd04f5365 (&quot;clk: Add clock driver for mb86s7x&quot=
;) is in<br>
&gt; today&#39;s Linux next tree.=C2=A0 The clock driver clk-mb86s7x.c is<b=
r>
&gt; conditionally compiled depending on CONFIG_ARCH_MB86S7X.=C2=A0 This op=
tion is<br>
&gt; nowhere defined in Kconfig, so that the driver cannot be compiled at i=
ts<br>
&gt; current tate.<br>
&gt;<br>
&gt; Is there a patch queued somewhere that adds this feature?<br>
&gt;<br>
The arch patchset is submitted but not yet merged by Olof.</p>
<p dir=3D"ltr">Thanks <br>
</p>

--001a11c148244908470513ac7790--
