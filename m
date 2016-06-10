Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Victor Gu <xigu@marvell.com>,
	Romain Perier <romain.perier@free-electrons.com>,
	Omri Itach <omrii@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Wilson Ding <dingwei@marvell.com>,
	Shadi Ammouri <shadi@marvell.com>
Subject: [PATCH 02/10] arm64: dts: marvell: Add xtal clock support for Armada 3700
Date: Fri, 10 Jun 2016 15:23:30 +0200
Message-Id: <1465565018-14172-3-git-send-email-gregory.clement@free-electrons.com>
In-Reply-To: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
References: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The configuration of the clock depend of the gpio latch. This information
is stored in the gpio block registers. That's why the block is shared
using a syscon node.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 9e2efb882983..7c61e13a16f3 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -105,6 +105,18 @@
 				status = "disabled";
 			};
 
+			gpio1: gpio@13800 {
+				compatible = "marvell,mvebu-gpio-3700",
+				"syscon", "simple-mfd";
+				reg = <0x13800 0x500>;
+
+				xtalclk: xtal-clk {
+					compatible = "marvell,armada-3700-xtal-clock";
+					clock-output-names = "xtal";
+					#clock-cells = <0>;
+				};
+			};
+
 			usb3: usb@58000 {
 				compatible = "marvell,armada3700-xhci",
 				"generic-xhci";
-- 
2.5.0
