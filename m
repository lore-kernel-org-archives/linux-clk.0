Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Vinod Koul <vinod.koul@intel.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] ARM: dts: tegra: Add AHB DMA controller nodes
Date: Tue, 26 Sep 2017 02:22:06 +0300
Message-Id: <d6610e316d40e1f9cd3e10d0b41efa24a7d464a1.1506380746.git.digetx@gmail.com>
In-Reply-To: <cover.1506380746.git.digetx@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
In-Reply-To: <cover.1506380746.git.digetx@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Add AHB DMA controller nodes to Tegra20/30 DT's.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 9 +++++++++
 arch/arm/boot/dts/tegra30.dtsi | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index f1579c9a7ef4..d0c0c26427f7 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -200,6 +200,15 @@
 		reg = <0x60007000 0x1000>;
 	};
 
+	ahbdma: ahbdma@60008000 {
+		compatible = "nvidia,tegra20-ahbdma";
+		reg = <0x60008000 0x2000>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_AHBDMA>;
+		resets = <&tegra_car 33>;
+		#dma-cells = <1>;
+	};
+
 	apbdma: dma@6000a000 {
 		compatible = "nvidia,tegra20-apbdma";
 		reg = <0x6000a000 0x1200>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 13960fda7471..0800d9a8c546 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -291,6 +291,15 @@
 		reg = <0x60007000 0x1000>;
 	};
 
+	ahbdma: ahbdma@60008000 {
+		compatible = "nvidia,tegra20-ahbdma";
+		reg = <0x60008000 0x2000>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA30_CLK_AHBDMA>;
+		resets = <&tegra_car 33>;
+		#dma-cells = <1>;
+	};
+
 	apbdma: dma@6000a000 {
 		compatible = "nvidia,tegra30-apbdma", "nvidia,tegra20-apbdma";
 		reg = <0x6000a000 0x1400>;
-- 
2.14.1
