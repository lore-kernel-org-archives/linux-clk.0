Return-Path: <mirza.krak@gmail.com>
Return-Path: <mirza.krak@gmail.com>
From: Mirza Krak <mirza.krak@gmail.com>
To: swarren@wwwdotorg.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com
Cc: gnurou@gmail.com,
	linux@armlinux.org.uk,
	pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Mirza Krak <mirza.krak@gmail.com>
Subject: [PATCH v2 4/6] ARM: tegra: Add Tegra30 GMI support
Date: Wed, 24 Aug 2016 15:37:16 +0200
Message-Id: <1472045838-22628-5-git-send-email-mirza.krak@gmail.com>
In-Reply-To: <1472045838-22628-1-git-send-email-mirza.krak@gmail.com>
References: <1472045838-22628-1-git-send-email-mirza.krak@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Mirza Krak <mirza.krak@gmail.com>

Add a device node for the GMI controller found on Tegra30.

Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
---
Changes in v2:
- added address-cells, size-cells and ranges properties

 arch/arm/boot/dts/tegra30.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 5030065..1b26308 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -439,6 +439,19 @@
 		status = "disabled";
 	};

+	gmi@70009000 {
+		compatible = "nvidia,tegra30-gmi";
+		reg = <0x70009000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x48000000 0x7ffffff>;
+		clocks = <&tegra_car TEGRA30_CLK_NOR>;
+		clock-names = "gmi";
+		resets = <&tegra_car 42>;
+		reset-names = "gmi";
+		status = "disabled";
+	};
+
 	pwm: pwm@7000a000 {
 		compatible = "nvidia,tegra30-pwm", "nvidia,tegra20-pwm";
 		reg = <0x7000a000 0x100>;
--
2.1.4
