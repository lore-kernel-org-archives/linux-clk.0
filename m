Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Irina Tirdea <irina.tirdea@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Chen <peter.chen@freescale.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1522219599-10831-2-git-send-email-abel.vesa@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 Anson Huang <anson.huang@nxp.com>,
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
 Abel Vesa <abelvesa@linux.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Abel Vesa <abel.vesa@nxp.com>
References: <1522219599-10831-1-git-send-email-abel.vesa@nxp.com>
 <1522219599-10831-2-git-send-email-abel.vesa@nxp.com>
Message-ID: <152303880853.143116.713341287544981271@swboyd.mtv.corp.google.com>
Subject: Re: [RESEND 1/4] clk: imx7d: Add USB clock information
Date: Fri, 06 Apr 2018 11:20:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Abel Vesa (2018-03-27 23:46:35)
> From: Peter Chen <peter.chen@freescale.com>
> =

> Add USB clock information, the pll_usb_main_clk is USB_PLL at CCM
> which is the output of USBOTG2 PHY.
> =

> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> Signed-off-by: Irina Tirdea <irina.tirdea@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Applied to clk-next
