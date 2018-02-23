Return-Path: <shawnguo@kernel.org>
Date: Fri, 23 Feb 2018 17:29:35 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: "A . s . Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
	Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
	kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: add binding for i.MX8MQ CCM
Message-ID: <20180223092934.GS3217@dragon>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
 <20180222035518.GG3217@dragon>
 <20180222141246.GL3217@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180222141246.GL3217@dragon>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 22, 2018 at 10:12:48PM +0800, Shawn Guo wrote:
> On Thu, Feb 22, 2018 at 11:55:20AM +0800, Shawn Guo wrote:
> > On Thu, Feb 01, 2018 at 06:54:09PM +0100, Lucas Stach wrote:
> > > This adds the binding for the i.MX8MQ Clock Controller Module.
> > > 
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > 
> > Applied all, thanks.
> 
> I decided to hold it a bit, as I found something which needs a bit more
> discussion.  Will reply to individual patch tomorrow.

Besides the comments I put on individual patches, please also go through
the checkpatch results.  We ignore MAINTAINERS updating and line over
80 characters warnings, but I see the following ones which I think we
should fix.

 - ERROR: code indent should use tabs where possible
 - WARNING: please, no space before tabs

Shawn
