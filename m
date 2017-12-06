Return-Path: <BATV+8bed4c591845638e5a3f+5218+infradead.org+hch@bombadil.srs.infradead.org>
Date: Wed, 6 Dec 2017 15:11:30 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Russell King <linux@armlinux.org.uk>, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v6 3/6] kernel/reboot.c: export pm_power_off_prepare
Message-ID: <20171206231130.GA6235@infradead.org>
References: <20171206072402.11694-1-o.rempel@pengutronix.de>
 <20171206072402.11694-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171206072402.11694-4-o.rempel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

>  void (*pm_power_off_prepare)(void);
> +EXPORT_SYMBOL(pm_power_off_prepare);

EXPORT_SYMBOL_GPL for something this deeply internal, please.
