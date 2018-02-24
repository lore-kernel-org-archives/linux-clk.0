Return-Path: <shawnguo@kernel.org>
Date: Sat, 24 Feb 2018 11:54:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de,
	"A . s . Dong" <aisheng.dong@nxp.com>, linux-imx@nxp.com
Subject: Re: [PATCH v2 4/4] clk: imx: add clock driver for i.MX8MQ CCM
Message-ID: <20180224035404.GZ3217@dragon>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
 <20180201175412.9480-4-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180201175412.9480-4-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 01, 2018 at 06:54:12PM +0100, Lucas Stach wrote:
> +	for (i = 0; i < IMX8MQ_CLK_END; i++)
> +		if (IS_ERR(clks[i]))
> +			pr_err("i.MX8mq clk %u register failed with %ld\n",
> +			       i, PTR_ERR(clks[i]));

We have a helper imx_check_clocks() for this.

Shawn
