Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1528074406-11735-4-git-send-email-Anson.Huang@nxp.com>
References: <1528074406-11735-1-git-send-email-Anson.Huang@nxp.com> <1528074406-11735-4-git-send-email-Anson.Huang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 3 Jun 2018 22:34:15 -0300
Message-ID: <CAOMZO5DsJHTGQuU7KksZ5ZFFXi6YkX=2Gz=aVqC3775tqHL_cg@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] clk: imx6ul: remove clks_init_on array
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, NXP Linux Team <Linux-imx@nxp.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jun 3, 2018 at 10:06 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> Clock framework will enable those clocks registered
> with CLK_IS_CRITICAL flag, so no need to have
> clks_init_on array during clock initialization now.
>
> ARM clock is busy divider type which has the
> CLK_IS_CRITICAL flag set by default when registered.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
