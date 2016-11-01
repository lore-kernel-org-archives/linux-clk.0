Return-Path: <shawnguo2@vip.163.com>
Date: Tue, 1 Nov 2016 16:50:09 +0800
From: Shawn Guo <shawnguo2@vip.163.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <kernel@pengutronix.de>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ARM: imx31: clock initialization fixes
Message-ID: <20161101085009.GA23220@tiger>
References: <1474848223-19728-1-git-send-email-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474848223-19728-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 26, 2016 at 03:03:39AM +0300, Vladimir Zapolskiy wrote:
> Vladimir Zapolskiy (4):
>   ARM: dts: imx31: fix clock control module interrupts description
>   ARM: dts: imx31: move CCM device node to AIPS2 bus devices
>   clk: imx31: fix rewritten input argument of mx31_clocks_init()
>   ARM: clk: imx31: properly init clocks for machines with DT

Applied all, thanks.
