Return-Path: <Anson.Huang@nxp.com>
From: Anson Huang <Anson.Huang@nxp.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-imx@nxp.com>
CC: <shawnguo@kernel.org>, <kernel@pengutronix.de>, <fabio.estevam@nxp.com>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
	<mark.rutland@arm.com>, <stefan@agner.ch>, <linux@armlinux.org.uk>
Subject: [PATCH 2/2] ARM: dts: imx7s: add snvs rtc clock
Date: Thu, 4 Jan 2018 23:06:42 +0800
Message-ID: <1515078402-22135-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
References: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
Return-Path: Anson.Huang@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Add i.MX7 SNVS RTC clock.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index e718fd2..f9b97f3 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -534,6 +534,8 @@
 					offset = <0x34>;
 					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
 						     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&clks IMX7D_SNVS_CLK>;
+					clock-names = "snvs-rtc";
 				};
 
 				snvs_poweroff: snvs-poweroff {
-- 
1.9.1
