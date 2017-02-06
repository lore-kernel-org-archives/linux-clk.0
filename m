Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:22419 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751628AbdBFMQP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2017 07:16:15 -0500
From: Mars Cheng <mars.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Jades Shih <jades.shih@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        My Chuang <my.chuang@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will.deacon@arm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        <linux-clk@vger.kernel.org>,
        Chieh-Jay Liu <Chieh-Jay.Liu@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Kevin-CW Chen <kevin-cw.chen@mediatek.com>
Subject: [PATCH v2 10/10] arm64: dts: mediatek: add clk nodes for MT6797
Date: Mon, 6 Feb 2017 20:15:36 +0800
Message-ID: <1486383336-16892-11-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds clk nodes for MT6797

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi |   71 ++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index da3a6ff..eca2376 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -11,6 +11,8 @@
  * GNU General Public License for more details.
  */
 
+#include <dt-bindings/clock/mt6797-clk.h>
+#include <dt-bindings/power/mt6797-power.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -127,6 +129,35 @@
 			     (GIC_CPU_MASK_SIMPLE(10) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	topckgen: topckgen@10000000 {
+		compatible = "mediatek,mt6797-topckgen";
+		reg = <0 0x10000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	infrasys: infracfg_ao@10001000 {
+		compatible = "mediatek,mt6797-infracfg", "syscon";
+		reg = <0 0x10001000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	scpsys: scpsys@10006000 {
+		compatible = "mediatek,mt6797-scpsys";
+		#power-domain-cells = <1>;
+		reg = <0 0x10006000 0 0x1000>;
+		clocks = <&topckgen CLK_TOP_MUX_MFG>,
+			 <&topckgen CLK_TOP_MUX_MM>,
+			 <&topckgen CLK_TOP_MUX_VDEC>;
+		clock-names = "mfg", "mm", "vdec";
+		infracfg = <&infrasys>;
+	};
+
+	apmixedsys: apmixed@1000c000 {
+		compatible = "mediatek,mt6797-apmixedsys";
+		reg = <0 0x1000c000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	sysirq: intpol-controller@10200620 {
 		compatible = "mediatek,mt6797-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -143,7 +174,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11002000 0 0x400>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART0>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -152,7 +185,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11003000 0 0x400>;
 		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART1>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -161,7 +196,9 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11004000 0 0x400>;
 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART2>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
@@ -170,10 +207,36 @@
 			     "mediatek,mt6577-uart";
 		reg = <0 0x11005000 0 0x400>;
 		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&clk26m>;
+		clocks = <&infrasys CLK_INFRA_UART3>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "baud", "bus";
 		status = "disabled";
 	};
 
+	mmsys: mmsys_config@14000000 {
+		compatible = "mediatek,mt6797-mmsys", "syscon";
+		reg = <0 0x14000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	imgsys: imgsys_config@15000000  {
+		compatible = "mediatek,mt6797-imgsys", "syscon";
+		reg = <0 0x15000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	vdecsys: vdec_gcon@16000000 {
+		compatible = "mediatek,mt6797-vdecsys", "syscon";
+		reg = <0 0x16000000 0 0x10000>;
+		#clock-cells = <1>;
+	};
+
+	vencsys: venc_gcon@17000000 {
+		compatible = "mediatek,mt6797-vencsys", "syscon";
+		reg = <0 0x17000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
 	gic: interrupt-controller@19000000 {
 		compatible = "arm,gic-v3";
 		#interrupt-cells = <3>;
-- 
1.7.9.5

