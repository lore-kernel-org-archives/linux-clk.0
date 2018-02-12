Return-Path: <shawnguo@kernel.org>
Date: Mon, 12 Feb 2018 21:35:18 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de,
	"A . s . Dong" <aisheng.dong@nxp.com>, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: add binding for i.MX8MQ CCM
Message-ID: <20180212133438.GB2939@X250>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180201175412.9480-1-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 01, 2018 at 06:54:09PM +0100, Lucas Stach wrote:
> This adds the binding for the i.MX8MQ Clock Controller Module.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Stephen,

To make your life a bit easier, I plan to collect drivers/clk/imx/
patches and send you pull request at a proper time.  Doing this will
also help resolve the clock ID dependency between clock driver and
device trees.  Sounds good to you?

Shawn
