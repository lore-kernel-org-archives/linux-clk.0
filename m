Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1435314894.3761.88.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] ARM: dts: imx6qdl-sabresd: Allow HDMI and LVDS
 to work simultaneously
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Fabio Estevam <fabio.estevam@freescale.com>
Cc: shawnguo@kernel.org, linux@arm.linux.org.uk, mturquette@baylibre.com,
 eric.nelson@boundarydevices.com, kernel@pengutronix.de,
 Ying.liu@freescale.com,  linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 26 Jun 2015 12:34:54 +0200
In-Reply-To: <1435241830-20187-1-git-send-email-fabio.estevam@freescale.com>
References: <1435241830-20187-1-git-send-email-fabio.estevam@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, den 25.06.2015, 11:17 -0300 schrieb Fabio Estevam:
> Currently it is not possible to have HDMI and LVDS working simultaneously,
> because both ports try to use PLL5.
> 
> Move the LVDS clock parent to PLL3_USB_OTG, so that HDMI and LVDS can be
> driven from independent sources.
> 
> With this change the LDB pixel clock goes to 68.57 MHz, which is still
> within the valid range for the HSD100PXN1 LVDS panel.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
