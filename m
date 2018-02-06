Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>, <robh+dt@kernel.org>,
	<mark.rutland@arm.com>, <devicetree@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v3 11/11] arm64: dts: nvidia: Tegra210 CPU clock definition
Date: Tue, 6 Feb 2018 18:34:12 +0200
Message-ID: <1517934852-23255-12-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index bc9851a..a7fddae 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1229,6 +1229,13 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <0>;
+			clocks = <&tegra_car TEGRA210_CLK_CCLK_G>,
+				 <&tegra_car TEGRA210_CLK_PLL_X>,
+				 <&tegra_car TEGRA210_CLK_PLL_P_OUT_CPU>,
+				 <&dfll>;
+			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
+			/* FIXME: what's the actual transition time? */
+			clock-latency = <300000>;
 		};
 
 		cpu@1 {
-- 
1.9.1
