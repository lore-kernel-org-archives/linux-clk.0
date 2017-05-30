Return-Path: <ukl@pengutronix.de>
Date: Tue, 30 May 2017 08:54:57 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	Sascha Hauer <kernel@pengutronix.de>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170530065457.e2m4nyo2dztumyi6@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5BZ8pqBW2VfuaUGyzgn8kv3AdvhwQ5nFEWuUSpmvrW9rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <CAOMZO5BZ8pqBW2VfuaUGyzgn8kv3AdvhwQ5nFEWuUSpmvrW9rA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 29, 2017 at 06:21:49PM -0300, Fabio Estevam wrote:
> Hi Uwe,
> 
> On Wed, May 3, 2017 at 3:56 PM, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") and
> > 64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
> > SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initialized
> > to 288 MHz because the initial frequency "seems too high to be ssp clock
> > source directly". However this isn't enough to ensure that the frequency
> > isn't increased later again. In fact this happens on my machine as the
> > mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
> > ssp2 which is resolved to
> >
> >         ref_io1.rate = 320 MHz
> >         ssp2_sel.parent = ref_io1
> >         ssp2_div.divider = 2
> >
> > . The observed effect is that reading MISO reliably fails: Instead of
> > the least significant bit the second least significant bit is reported
> > twice. This is probably related to the reports
> >
> >         https://community.nxp.com/thread/290209
> >         https://community.nxp.com/thread/310434
> 
> As Stefan mentioned that your patch does not solve his issue, please
> remove this link when you submit a v2.

I still think it is related to these reports, don't you?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
