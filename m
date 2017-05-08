Return-Path: <Michael.Krummsdorf@tq-group.com>
From: Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Stefan Wahren <stefan.wahren@i2se.com>
CC: Fabio Estevam <festevam@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam
	<fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: AW: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Date: Mon, 8 May 2017 09:53:28 +0000
Message-ID: <ae7631748701472c837c225a8c62c9fc@desrvmail02.tq-net.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
 <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
In-Reply-To: <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Hello Uwe,=20

> (adding Michael Krummsdorf who authored a different patch for the same
> problem back in 2014 which Stefan found in TQ's patch stack.)

thanks for adding me.
Back then I narrowed the issue down to two conditions:
* ref_io had to be clock source and
* ssp clock div had to be 1

Limiting ssp clock div to be at least 2 eliminated the error.
So in the driver I capped clk_freq to 480 MHz / 2.
I did not consider changing ref_io frequency.

Best regards,
i.A. Michael Krummsdorf
Entwicklung Standort Leipzig
Tel. +49 341 308598-27, Fax +49 341 308598-11,
Friedrich-List-Platz 2, 04103 Leipzig
mailto:michael.krummsdorf@tq-group.com
=20
TQ-Systems GmbH
M=FChlstra=DFe 2, Gut Delling, 82229 Seefeld
Amtsgericht M=FCnchen, HRB 105018
Sitz der Gesellschaft: Seefeld
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
www.tq-group.com

Besuchen Sie uns:
Intersolar Europe, M=FCnchen, 31. Mai - 2. Juni 2017, Halle B2, Stand B2.23=
4
MT-CONNECT, N=FCrnberg, 21. - 22. Juni 2017, Halle 10.1, Stand 10.1-116
