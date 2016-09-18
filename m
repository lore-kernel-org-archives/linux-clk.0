Return-Path: <keguang.zhang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160819000408.GM361@codeaurora.org>
References: <1470999108-9851-1-git-send-email-keguang.zhang@gmail.com>
 <1470999108-9851-4-git-send-email-keguang.zhang@gmail.com> <20160819000408.GM361@codeaurora.org>
From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Sun, 18 Sep 2016 19:00:58 +0800
Message-ID: <CAJhJPsUZi2XyUOVwnaCWEpuOcReGRRFO9t-qBiNRWN5KS_5Agg@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: Loongson1: Make use of GENMASK
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
Content-Type: multipart/alternative; boundary=001a1145b660780281053cc61dce
List-ID: <linux-clk.vger.kernel.org>

--001a1145b660780281053cc61dce
Content-Type: text/plain; charset=UTF-8

2016-08-19 8:04 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:

> On 08/12, Keguang Zhang wrote:
> > From: Kelvin Cheung <keguang.zhang@gmail.com>
> >
> > Make use of GENMASK instead of open coding the equivalent operation,
> > and update the PLL formula.
>
> Was the old formula broken? I would expect a bug fix like this to
> be first in the series and be backported to any affected stable
> trees.
>
>
It was not broken.
I remove the rest of the fomula due to it is always zero.


> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
>



-- 
Best regards,

Kelvin Cheung

--001a1145b660780281053cc61dce
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2016-08-19 8:04 GMT+08:00 Stephen Boyd <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sboyd@codeaurora.org" target=3D"_blank">sboyd@codeaurora.org</a>&gt=
;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 08/12, Kegu=
ang Zhang wrote:<br>
&gt; From: Kelvin Cheung &lt;<a href=3D"mailto:keguang.zhang@gmail.com">keg=
uang.zhang@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Make use of GENMASK instead of open coding the equivalent operation,<b=
r>
&gt; and update the PLL formula.<br>
<br>
</span>Was the old formula broken? I would expect a bug fix like this to<br=
>
be first in the series and be backported to any affected stable<br>
trees.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br></div><div>It was not broken.<br></div><div>I remove the rest o=
f the fomula due to it is always zero.<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><span class=3D"HOEnZb"><font color=3D"#888888">
--<br>
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,<br>
a Linux Foundation Collaborative Project<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Best =
regards,<br><br>Kelvin Cheung<br></div></div></div></div></div></div></div>=
</div></div>
</div></div>

--001a1145b660780281053cc61dce--
