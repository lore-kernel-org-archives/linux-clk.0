Return-Path: <Ping.Bai@freescale.com>
From: Bai Ping <b51503@freescale.com>
To: <shawnguo@kernel.org>, <kernel@pengutronix.de>
CC: <l.stach@pengutronix.de>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH 2/3] ARM: dts: imx: modify the clocks used by cpufreq driver
Date: Tue, 24 Nov 2015 18:25:15 +0800
Message-ID: <1448360716-1741-2-git-send-email-b51503@freescale.com>
In-Reply-To: <1448360716-1741-1-git-send-email-b51503@freescale.com>
References: <1448360716-1741-1-git-send-email-b51503@freescale.com>
Return-Path: b51503@freescale.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

As on i.MX7D, we using a virtual arm clk for CPU frequency
scaling, so correct the clocks info used by the cpufreq driver.

Signed-off-by: Bai Ping <b51503@freescale.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index ebc053a..489604a 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -85,9 +85,7 @@
 				792000	975000
 			>;
 			clock-latency = <61036>; /* two CLK32 periods */
-			clocks = <&clks IMX7D_ARM_A7_ROOT_CLK>, <&clks IMX7D_ARM_A7_ROOT_SRC>,
-				 <&clks IMX7D_PLL_ARM_MAIN_CLK>, <&clks IMX7D_PLL_SYS_MAIN_CLK>;
-			clock-names = "arm", "arm_root_src", "pll_arm", "pll_sys_main";
+			clocks = <&clks IMX7D_CLK_ARM>;
 		};
 
 		cpu1: cpu@1 {
-- 
1.9.1
