Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Mon, 13 Jul 2015 16:39:20 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: imx6qdl-sabresd: Allow HDMI and LVDS to
 work simultaneously
Message-ID: <20150713083919.GN23464@tiger>
References: <1435338654-9098-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1435338654-9098-1-git-send-email-fabio.estevam@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux@arm.linux.org.uk, mturquette@baylibre.com,
 eric.nelson@boundarydevices.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Ying.liu@freescale.com, linux-clk@vger.kernel.org,
 vladimir_zapolskiy@mentor.com
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 26, 2015 at 02:10:53PM -0300, Fabio Estevam wrote:
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
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

Applied both, thanks.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
