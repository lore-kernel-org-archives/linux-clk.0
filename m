Return-Path: <shawnguo@kernel.org>
Date: Fri, 23 Feb 2018 12:05:02 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de,
	"A . s . Dong" <aisheng.dong@nxp.com>, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: add binding for i.MX8MQ CCM
Message-ID: <20180223040500.GN3217@dragon>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180201175412.9480-1-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 01, 2018 at 06:54:09PM +0100, Lucas Stach wrote:
> +/* ENET AXI */
> +#define IMX8MQ_CLK_ENET_AXI_SRC		107
> +#define IMX8MQ_CLK_ENET_AXI_CG		108
> +#define IMX8MQ_CLK_ENET_AXI_PRE_DIV	109
> +#define IMX8MQ_CLK_ENET_AXI_DIV		110

The indentation changes from here.  Since these defines are added in one
time, the indentation can be unified.

Shawn

> +/* NAND_USDHC_BUS */
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_SRC		111
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_CG		112
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_PRE_DIV	113
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_DIV		114
