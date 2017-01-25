Return-Path: <oss@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Y.B. Lu" <yangbo.lu@nxp.com>,
	"Z.Q. Hou" <zhiqiang.hou@nxp.com>,
	"Y.T. Tang" <yuantian.tang@nxp.com>,
	Scott Wood <oss@buserror.net>
Date: Wed, 25 Jan 2017 02:19:22 -0600
Message-Id: <1485332363-8434-2-git-send-email-oss@buserror.net>
In-Reply-To: <1485332363-8434-1-git-send-email-oss@buserror.net>
References: <1485332363-8434-1-git-send-email-oss@buserror.net>
Subject: [PATCH 2/3] arm64: dts: ls1012a: Add coreclk
List-ID: <linux-clk.vger.kernel.org>

ls1012a has separate input root clocks for core PLLs versus the platform
PLL, with the latter described as sysclk in the hw docs.

Signed-off-by: Scott Wood <oss@buserror.net>
---
Note that current versions of U-Boot are blindly updating the frequency
of all fixed-clock nodes.  That needs to be fixed for the split input
frequency to work properly, but until U-Boot is fixed this change doesn't
make anything worse than it already was.

 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index cffebb4..515f8488 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -66,10 +66,17 @@
 	sysclk: sysclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <100000000>;
+		clock-frequency = <125000000>;
 		clock-output-names = "sysclk";
 	};
 
+	coreclk: coreclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "coreclk";
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <1 13 IRQ_TYPE_LEVEL_LOW>,/* Physical Secure PPI */
@@ -124,7 +131,8 @@
 			compatible = "fsl,ls1012a-clockgen";
 			reg = <0x0 0x1ee1000 0x0 0x1000>;
 			#clock-cells = <2>;
-			clocks = <&sysclk>;
+			clocks = <&sysclk &coreclk>;
+			clock-names = "sysclk", "coreclk";
 		};
 
 		i2c0: i2c@2180000 {
-- 
2.7.4
