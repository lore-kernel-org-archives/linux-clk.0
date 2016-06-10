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
Subject: [PATCH 03/10] arm64: dts: marvell: add tbg clocks for Armada 37xx
Date: Fri, 10 Jun 2016 15:23:31 +0200
Message-Id: <1465565018-14172-4-git-send-email-gregory.clement@free-electrons.com>
In-Reply-To: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
References: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Add a new block of clocks. The Time Base Generators clocks can be the
parent of the peripheral clocks.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 7c61e13a16f3..e9f0b97c63d5 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -105,6 +105,13 @@
 				status = "disabled";
 			};
 
+			tbg: tbg@13200 {
+				compatible = "marvell,armada-3700-tbg-clock";
+				reg = <0x13200 0x100>;
+				clocks = <&xtalclk>;
+				#clock-cells = <1>;
+			};
+
 			gpio1: gpio@13800 {
 				compatible = "marvell,mvebu-gpio-3700",
 				"syscon", "simple-mfd";
-- 
2.5.0
