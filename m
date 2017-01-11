Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-mmc@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ziji Hu <huziji@marvell.com>,
	Jimmy Xu <zmxu@marvell.com>,
	Jisheng Zhang <jszhang@marvell.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Ryan Gao <ygao@marvell.com>,
	Doug Jones <dougj@marvell.com>,
	Victor Gu <xigu@marvell.com>,
	"Wei(SOCP) Liu" <liuw@marvell.com>,
	Wilson Ding <dingwei@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Hanna Hawa <hannah@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>
Subject: [PATCH v5 11/12] arm64: dts: marvell: add sdhci support for Armada 7K/8K
Date: Wed, 11 Jan 2017 18:19:14 +0100
Message-Id: <b8c9916218b3bd92cbac52164209bbe5feb378a5.1484154449.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
References: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
References: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Also enable it on the Armada 7040 DB board

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts       | 14 +++++++++++++-
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi        | 10 +++++++++-
 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 11 ++++++++++-
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 070b589680c5..6adbfcd26369 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -146,3 +146,17 @@
 &cpm_usb3_1 {
 	status = "okay";
 };
+
+&ap_sdhci0 {
+	status = "okay";
+	bus-width = <4>;
+	no-1-8-v;
+	non-removable;
+};
+
+&cpm_sdhci0 {
+	status = "okay";
+	bus-width = <4>;
+	no-1-8-v;
+	non-removable;
+};
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 5019c8f4acd0..0b49cbda8539 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -229,6 +229,16 @@
 
 			};
 
+			ap_sdhci0: sdhci@6e0000 {
+				compatible = "marvell,armada-8k-sdhci";
+				reg = <0x6e0000 0x300>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "core";
+				clocks = <&ap_syscon 4>;
+				dma-coherent;
+				status = "disabled";
+			};
+
 			ap_syscon: system-controller@6f4000 {
 				compatible = "marvell,ap806-system-controller",
 					     "syscon";
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index 05222f749a45..421e91049cf7 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -172,6 +172,17 @@
 				clocks = <&cpm_syscon0 1 25>;
 				status = "okay";
 			};
+
+			cpm_sdhci0: sdhci@780000 {
+				compatible = "marvell,armada-8k-sdhci";
+				reg = <0x780000 0x300>;
+				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "core";
+				clocks = <&cpm_syscon0 1 4>;
+				dma-coherent;
+				status = "disabled";
+			};
+
 		};
 
 		cpm_pcie0: pcie@f2600000 {
-- 
git-series 0.9.1
