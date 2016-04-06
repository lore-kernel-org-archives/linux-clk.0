Return-Path: <shawnguo@kernel.org>
Date: Wed, 6 Apr 2016 22:52:30 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: Bai Ping <ping.bai@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH BUGFIX] clk: imx6q: fix typo in CAN clock definition
Message-ID: <20160406145230.GB4022@tiger>
References: <1459340583-14743-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1459340583-14743-1-git-send-email-LW@KARO-electronics.de>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 30, 2016 at 02:23:03PM +0200, Lothar Waﬂmann wrote:
> commit ee36027427c7 ("clk: imx: Add clock support for imx6qp")
> introduced a regression due to a subtle typo in the 'can_root' clock
> definition. The effect is that trying to configure the bitrate of the
> can interfaces fails with -EDOM or produces a division by zero error
> due to the clock_freq of the can serial clock being reported as '0'.
> 
> Signed-off-by: Lothar Waﬂmann <LW@KARO-electronics.de>

Applied, thanks.
