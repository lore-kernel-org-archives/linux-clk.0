Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Jun 2017 09:04:36 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
	Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 4/6] regulator: pfuze100: add fsl,pmic-stby-poweroff
 property
Message-ID: <20170618140436.a2owbfsij5k4vmvt@rob-hp-laptop>
References: <20170609140739.15726-1-o.rempel@pengutronix.de>
 <20170609140739.15726-5-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170609140739.15726-5-o.rempel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 09, 2017 at 04:07:37PM +0200, Oleksij Rempel wrote:
> Document the new optional "fsl,pmic-stby-poweroff" property.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/regulator/pfuze100.txt | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
