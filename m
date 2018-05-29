Return-Path: <peron.clem@gmail.com>
MIME-Version: 1.0
References: <20180528173412.10000-1-peron.clem@gmail.com> <20180528173412.10000-5-peron.clem@gmail.com>
 <62455a89-3015-b160-0368-42d8d0888d55@mentor.com>
In-Reply-To: <62455a89-3015-b160-0368-42d8d0888d55@mentor.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 29 May 2018 16:25:34 +0200
Message-ID: <CAJiuCcfiH57MUmzDLH8XKGp_ookt7QMXL7Axoa=FkO63mBPqzA@mail.gmail.com>
Subject: Re: [PATCH 4/5] clocksource: add driver for i.MX EPIT timer
To: vladimir_zapolskiy@mentor.com
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Colin Didier <colin.didier@devialet.com>,
	=?UTF-8?Q?Cl=C3=A9ment_Peron?= <clement.peron@devialet.com>
Content-Type: multipart/alternative; boundary="00000000000090816c056d59026d"
List-ID: <linux-clk.vger.kernel.org>

--00000000000090816c056d59026d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

On Tue, 29 May 2018 at 08:19, Vladimir Zapolskiy <
vladimir_zapolskiy@mentor.com> wrote:

> Hi Cl=C3=A9ment,

> please find basic review comments below.
Thanks for your review,

> Please place all macro definitions after the list of included header
files.
> Also for bit field definitions please use BIT() macro, and remove
> (0 << x) macro, they are anyway unused in the code.
I will change to BIT macro but keep the others as we use the
EPITCR_CLKSRC_REF_HIGH.

I took all other comments into account, and will submit a new version.

Clement

--00000000000090816c056d59026d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi Vladimir,<br>
<br>
On Tue, 29 May 2018 at 08:19, Vladimir Zapolskiy &lt;<br>
<a href=3D"mailto:vladimir_zapolskiy@mentor.com" rel=3D"noreferrer" target=
=3D"_blank">vladimir_zapolskiy@mentor.com</a>&gt; wrote:<br>
<br>
&gt; Hi Cl=C3=A9ment,<br>
<br>
&gt; please find basic review comments below.<br>
Thanks for your review,<br>
<br>
&gt; Please place all macro definitions after the list of included header<b=
r>
files.<br>
&gt; Also for bit field definitions please use BIT() macro, and remove<br>
&gt; (0 &lt;&lt; x) macro, they are anyway unused in the code.<br>I will ch=
ange to BIT macro but keep the others as we use the EPITCR_CLKSRC_REF_HIGH.=
<br>
<br>
I took all other comments into account, and will submit a new version.<br>
<br>
Clement<br></div></div>

--00000000000090816c056d59026d--
