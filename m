Return-Path: <ukl@pengutronix.de>
Date: Thu, 2 Aug 2018 10:33:18 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20180802083318.qzsqchrf46oh2ne3@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <20180726143232.ds22exgxiv6zlsn5@pengutronix.de>
 <10f5e651-caf4-3fe0-87c0-fe42ccdc6349@i2se.com>
 <CAOMZO5Cgf6aeNKWn5CnV8X-+bo20M00efoAxv51GPDE45Pg4yg@mail.gmail.com>
 <20180801093113.wnjeg5a3rjbh7yc4@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20180801093113.wnjeg5a3rjbh7yc4@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Wed, Aug 01, 2018 at 11:31:13AM +0200, Uwe Kleine-König wrote:
> On Thu, Jul 26, 2018 at 12:02:42PM -0300, Fabio Estevam wrote:
> > On Thu, Jul 26, 2018 at 11:50 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> > 
> > > I only want to note that we are using this ugly hack for Duckbill to avoid
> > > this issue:
> > >
> > > https://github.com/I2SE/linux/commit/e457d5e0309c07e30e8dd8b17c32f7b3cbdd9547
> > 
> > Do you see the problem on TQMa28L with Stefan's hack applied?
> 
> With this change by Stefan the bug is not reproducible. Your change to
> set the bypass bits only later doesn't help though.

I wanted to try without DMA (by just removing dem dma properties in the
mmc node) but this makes the driver fail to probe :-|

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
