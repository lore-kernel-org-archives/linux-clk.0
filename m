Return-Path: <alexander.stein@systec-electronic.com>
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: ls1021a: Add QSPI node
Date: Wed, 22 Feb 2017 16:03:49 +0100
Message-Id: <20170222150349.16790-4-alexander.stein@systec-electronic.com>
In-Reply-To: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
References: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
List-ID: <linux-clk.vger.kernel.org>

Add the QSPI node, disabled by default. Any chips and partitions must
be setup at board level.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index a2d58ef..7e412fb 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -147,6 +147,21 @@
 			big-endian;
 		};
 
+		qspi: quadspi@1550000 {
+			compatible = "fsl,ls1021a-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x1550000 0x0 0x10000>,
+				<0x0 0x40000000 0x0 0x20000000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "qspi_en", "qspi";
+			clocks = <&scfg_qspi_cfg>, <&scfg_qspi_cfg>;
+			big-endian;
+			amba-base = <0x40000000>;
+			status = "disabled";
+		};
+
 		esdhc: esdhc@1560000 {
 			compatible = "fsl,esdhc";
 			reg = <0x0 0x1560000 0x0 0x10000>;
-- 
2.10.2
