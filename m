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
Subject: [PATCH 04/10] arm64: dts: marvell: add peripherals clocks for Armada 37xx
Date: Fri, 10 Jun 2016 15:23:32 +0200
Message-Id: <1465565018-14172-5-git-send-email-gregory.clement@free-electrons.com>
In-Reply-To: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
References: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Add two new blocks of clocks. The peripheral clocks are the source clocks
of the peripheral of the Armada 3700 SoC.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index e9f0b97c63d5..c55542ba0c54 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -105,6 +105,22 @@
 				status = "disabled";
 			};
 
+			nb_perih_clk: nb-periph-clk@13000{
+				compatible = "marvell,armada-3700-periph-clock-nb";
+				reg = <0x13000 0x100>;
+				clocks = <&tbg 0>, <&tbg 1>, <&tbg 2>,
+				<&tbg 3>, <&xtalclk>;
+				#clock-cells = <1>;
+			};
+
+			sb_perih_clk: sb-periph-clk@13000{
+				compatible = "marvell,armada-3700-periph-clock-sb";
+				reg = <0x18000 0x100>;
+				clocks = <&tbg 0>, <&tbg 1>, <&tbg 2>,
+				<&tbg 3>, <&xtalclk>;
+				#clock-cells = <1>;
+			};
+
 			tbg: tbg@13200 {
 				compatible = "marvell,armada-3700-tbg-clock";
 				reg = <0x13200 0x100>;
-- 
2.5.0
