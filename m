Return-Path: <stefan@agner.ch>
From: Stefan Agner <stefan@agner.ch>
To: shawnguo@kernel.org,
	kernel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: galak@codeaurora.org,
	ijc+devicetree@hellion.org.uk,
	mark.rutland@arm.com,
	pawel.moll@arm.com,
	robh+dt@kernel.org,
	Li.Xiubo@freescale.com,
	zidan.wang@freescale.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/3] ARM: dts: vf610: fix clock definition for SAI2
Date: Sat, 17 Oct 2015 21:05:21 -0700
Message-Id: <1445141122-14183-2-git-send-email-stefan@agner.ch>
In-Reply-To: <1445141122-14183-1-git-send-email-stefan@agner.ch>
References: <1445141122-14183-1-git-send-email-stefan@agner.ch>
List-ID: <linux-clk.vger.kernel.org>

So far, only the bus clock has been assigned, but in reality the
SAI IP has for clock inputs. The driver has been updated to
make use of the additional clock inputs by c3ecef21c3f2 ("ASoC:
fsl_sai: add sai master mode support"). Due to a bug in the
clock tree, the audio clock has been enabled none the less by
the specified bus clock (see "ARM: imx: clk-vf610: fix SAI
clock tree"), which made master mode even without the proper
clock assigned working.

This patch completes the clock definition for SAI2. On Vybrid,
only two MCLK out of the four options are available (the first
being the bus clock itself). See chapter 8.10.1.2.3 of the
Vybrid Reference manual ("SAI transmitter and receiver options
for MCLK selection"). Note: The audio clocks are only required
in master mode.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vfxxx.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 6865137..c2a4d1c 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -178,8 +178,10 @@
 				compatible = "fsl,vf610-sai";
 				reg = <0x40031000 0x1000>;
 				interrupts = <86 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clks VF610_CLK_SAI2>;
-				clock-names = "sai";
+				clocks = <&clks VF610_CLK_SAI2>,
+					<&clks VF610_CLK_SAI2_DIV>,
+					<&clks 0>, <&clks 0>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dma-names = "tx", "rx";
 				dmas = <&edma0 0 21>,
 					<&edma0 0 20>;
-- 
2.6.1
