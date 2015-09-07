Return-Path: <ukl@pengutronix.de>
Date: Mon, 7 Sep 2015 11:10:05 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, patchwork-lst@pengutronix.de,
	kernel@pengutronix.de, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] clk: imx25: retain early UART clocks during
 kernel init
Message-ID: <20150907091005.GV9999@pengutronix.de>
References: <1441382419-4343-1-git-send-email-l.stach@pengutronix.de>
 <1441382419-4343-3-git-send-email-l.stach@pengutronix.de>
 <20150906142315.GA30746@tiger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20150906142315.GA30746@tiger>
List-ID: <linux-clk.vger.kernel.org>

On Sun, Sep 06, 2015 at 10:23:15PM +0800, Shawn Guo wrote:
> 
> I prefer to code it like:
> 
> static struct clk **uart_clks[] __initdata = {
> 	&clk[uart_ipg_per],
> 	&clk[uart1_ipg],
> 	&clk[uart2_ipg],
> 	&clk[uart3_ipg],
> 	&clk[uart4_ipg],
> 	&clk[uart5_ipg],
> 	NULL
> };

And maybe also use mx25_ as prefix to make the name unique.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
