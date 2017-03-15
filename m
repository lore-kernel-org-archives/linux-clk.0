Return-Path: <shawnguo@kernel.org>
Date: Wed, 15 Mar 2017 14:28:21 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Robin van der Gracht <robin@protonic.nl>
Cc: Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: imx: clk-imx6ul: The i.mx6ul has no aips_tz3
 clock
Message-ID: <20170315062819.GQ3618@dragon>
References: <20170303141405.17581-1-robin@protonic.nl>
 <20170314115514.7ea25d1c@erd979>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170314115514.7ea25d1c@erd979>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 14, 2017 at 11:55:14AM +0100, Robin van der Gracht wrote:
> On Fri,  3 Mar 2017 15:14:05 +0100
> Robin van der Gracht <robin@protonic.nl> wrote:
> 
> > The clock was mapped on CG15 (gpio2_clocks) in the CCRG0 register.
> > 
> > Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> > Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> 
> Sasha or Shawn would you mind pushing this patch upstream?
> I don't have a path.

I think Stephen will take care of it.

Shawn
