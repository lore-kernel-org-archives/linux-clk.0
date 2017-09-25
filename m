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
Subject: [PATCH v1 3/5] dt-bindings: Add DT bindings for NVIDIA Tegra AHB DMA controller
Date: Tue, 26 Sep 2017 02:22:04 +0300
Message-Id: <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx@gmail.com>
In-Reply-To: <cover.1506380746.git.digetx@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
In-Reply-To: <cover.1506380746.git.digetx@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Document DT bindings for NVIDIA Tegra AHB DMA controller that presents
on Tegra20/30 SoC's.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt

diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
new file mode 100644
index 000000000000..2af9aa76ae11
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
@@ -0,0 +1,23 @@
+* NVIDIA Tegra AHB DMA controller
+
+Required properties:
+- compatible:	Must be "nvidia,tegra20-ahbdma"
+- reg:		Should contain registers base address and length.
+- interrupts:	Should contain one entry, DMA controller interrupt.
+- clocks:	Should contain one entry, DMA controller clock.
+- resets :	Should contain one entry, DMA controller reset.
+- #dma-cells:	Should be <1>. The cell represents DMA request select value
+		for the peripheral. For more details consult the Tegra TRM's
+		documentation, in particular AHB DMA channel control register
+		REQ_SEL field.
+
+Example:
+
+ahbdma: ahbdma@60008000  {
+	compatible = "nvidia,tegra20-ahbdma";
+	reg = <0x60008000 0x2000>;
+	interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&tegra_car TEGRA20_CLK_AHBDMA>;
+	resets = <&tegra_car 33>;
+	#dma-cells = <1>;
+};
-- 
2.14.1
