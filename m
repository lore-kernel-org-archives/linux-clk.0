Return-Path: <ukl@pengutronix.de>
Date: Mon, 8 May 2017 12:14:34 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Shawn Guo <shawnguo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170508101434.zah6wfq25k6ymrls@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
 <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
 <ae7631748701472c837c225a8c62c9fc@desrvmail02.tq-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <ae7631748701472c837c225a8c62c9fc@desrvmail02.tq-net.de>
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Mon, May 08, 2017 at 09:53:28AM +0000, Krummsdorf Michael wrote:
> > (adding Michael Krummsdorf who authored a different patch for the same
> > problem back in 2014 which Stefan found in TQ's patch stack.)
> 
> thanks for adding me.
> Back then I narrowed the issue down to two conditions:
> * ref_io had to be clock source and
> * ssp clock div had to be 1

This is not the complete problem description because my patch lowers the
speed on ref_io and has no influence on HW_CLKCTRL_SSP2 (which has
already DIV=2 for me before the patch where it's broken).

Also Stefan has values >1 and the problem is still there on a duckbill.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
