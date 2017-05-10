Return-Path: <ukl@pengutronix.de>
Date: Wed, 10 May 2017 16:13:56 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Michael Krummsdorf <michael.krummsdorf@tq-group.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, kernel@pengutronix.de,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170510141356.itzgwoij4rwi6pwc@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
 <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
 <16216689.278511.1494157914798@email.1und1.de>
 <20170508082456.dx4rthdsidbrkxza@pengutronix.de>
 <07a0f0c6-8fb6-6535-f042-122a5257aeb6@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <07a0f0c6-8fb6-6535-f042-122a5257aeb6@i2se.com>
List-ID: <linux-clk.vger.kernel.org>

Hello Stefan,

On Wed, May 10, 2017 at 03:39:14PM +0200, Stefan Wahren wrote:
> Am 08.05.2017 um 10:24 schrieb Uwe Kleine-König:
> > The patch doesn't make the bit errors go away. The only message being
> > generated is:
> >
> > 	swapper-1     [000] .......     1.134985: clk_div_set_rate: Cannot to set ssp3_div: gated 
> >
> > When I compare your clk_summary (with my patch) to my working one the
> > only differences are some enable/prepare counts, you have the following
> > clocks on while I have not:
> >
> > 	lradc, enet_out, lcdif_sel (also reparented), fec
> >
> > while I have these clocks on and you have not:
> >
> > 	ssp1

	ssp0: SD-card
	ssp1: eMMC (which /)
	ssp2: eeprom

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
