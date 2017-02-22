Return-Path: <alexander.stein@systec-electronic.com>
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: ls1021a: Add node for scfg-qspi-cfg
Date: Wed, 22 Feb 2017 16:03:48 +0100
Message-Id: <20170222150349.16790-3-alexander.stein@systec-electronic.com>
In-Reply-To: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
References: <20170222150349.16790-1-alexander.stein@systec-electronic.com>
List-ID: <linux-clk.vger.kernel.org>

This adds the node for SCFG_QSPI_CFG driver.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 78a3d79..a2d58ef 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -176,6 +176,15 @@
 			big-endian;
 		};
 
+		scfg_qspi_cfg: scfg_qspi_cfg@157015c {
+		    compatible = "fsl,scfg-qspi-cfg-ls1021a";
+		    #clock-cells = <0>;
+		    reg = <0x0 0x157015c 0x0 0x4>;
+		    clocks = <&cga_pll1 0>;
+		    clock-output-names = "scfg-qspi-cfg";
+		    big-endian;
+		};
+
 		crypto: crypto@1700000 {
 			compatible = "fsl,sec-v5.0", "fsl,sec-v4.0";
 			fsl,sec-era = <7>;
-- 
2.10.2
