Return-Path: <sboyd@codeaurora.org>
Date: Thu, 31 Aug 2017 11:31:38 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de,
	Chris Healy <cphealy@gmail.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	"Wladimir J . van der Laan" <laanwj@gmail.com>,
	Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH] clk: imx51: propagate rate across ipu_di*_sel
Message-ID: <20170831183138.GG21656@codeaurora.org>
References: <20170818163058.22252-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170818163058.22252-1-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 08/18, Lucas Stach wrote:
> This propagates rate requests from the display interface to the divider
> or PLL output, allowing to hit the required display rate in many more
> cases.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
