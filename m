Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180117150256.7430-1-l.stach@pengutronix.de>
References: <20180117150256.7430-1-l.stach@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Jan 2018 16:52:22 -0200
Message-ID: <CAOMZO5Db5TMQ2ugG1NumVnxuBPiS23R1WUOvbqpc0N2U1eFTzQ@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: pllv2: avoid using uninitialized values
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 17, 2018 at 1:02 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> Forward the errors returned by __clk_pllv2_set_rate() in the recalc rate
> function, to avoid using uninitialized values for the rate calculation.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Thanks
