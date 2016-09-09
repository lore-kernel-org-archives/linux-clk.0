Return-Path: <shawnguo@kernel.org>
Date: Fri, 9 Sep 2016 14:28:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: clk-imx35: fix name for ckil clk
Message-ID: <20160909062816.GL16911@tiger>
References: <1473327022-8065-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20160909061631.GI16911@tiger>
 <20160909062034.tim2tzcihui6inoa@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20160909062034.tim2tzcihui6inoa@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 09, 2016 at 08:20:34AM +0200, Uwe Kleine-König wrote:
> To += mturquette, sboyd
> 
> Hello Shawn, hello Michael, hello Stephen,
> 
> On Fri, Sep 09, 2016 at 02:16:31PM +0800, Shawn Guo wrote:
> > On Thu, Sep 08, 2016 at 11:30:21AM +0200, Uwe Kleine-König wrote:
> > > This fixes
> > > 	[    0.000000] i.MX clk 82: register failed with -17
> > > because the name is duplicated.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > I did not queue any clock patches for this cycle.  Can you please send
> > the patches directly to clock maintainers?
> 
> @shawnguo: Is this an ack?

Yes,

Acked-by: Shawn Guo <shawnguo@kernel.org>

> @mturquette, sboyd: should I resend? IMHO the first patch should go in
> soon.
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
