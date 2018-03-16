Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Lucas Stach <l.stach@pengutronix.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180117150256.7430-1-l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
References: <20180117150256.7430-1-l.stach@pengutronix.de>
Message-ID: <152124008257.242365.5597301072534827825@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: imx: pllv2: avoid using uninitialized values
Date: Fri, 16 Mar 2018 15:41:22 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Lucas Stach (2018-01-17 07:02:56)
> Forward the errors returned by __clk_pllv2_set_rate() in the recalc rate
> function, to avoid using uninitialized values for the rate calculation.
> =

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied to clk-next
