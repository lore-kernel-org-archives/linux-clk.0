Return-Path: <mirza.krak@gmail.com>
Return-Path: <mirza.krak@gmail.com>
From: Mirza Krak <mirza.krak@gmail.com>
To: swarren@wwwdotorg.org,
	thierry.reding@gmail.com,
	gnurou@gmail.com,
	pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com
Cc: robh+dt@kernel.org,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	linux@armlinux.org.uk,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Mirza Krak <mirza.krak@gmail.com>
Subject: [PATCH 5/6] ARM: tegra: Add Tegra20 GMI support
Date: Sat,  6 Aug 2016 21:40:51 +0200
Message-Id: <1470512452-8322-6-git-send-email-mirza.krak@gmail.com>
In-Reply-To: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
References: <1470512452-8322-1-git-send-email-mirza.krak@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Mirza Krak <mirza.krak@gmail.com>

Add a device node for the GMI controller found on Tegra20.

Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2207c08..9b97863 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -376,6 +376,17 @@
 		status = "disabled";
 	};
 
+
+	gmi@70009000 {
+		compatible = "nvidia,tegra20-gmi";
+		reg = <70009000 0x1000>;
+		clocks = <&tegra_car TEGRA20_CLK_NOR>;
+		clock-names = "gmi";
+		resets = < &tegra_car 42>;
+		reset-names = "gmi";
+		status = "disabled";
+	};
+
 	pwm: pwm@7000a000 {
 		compatible = "nvidia,tegra20-pwm";
 		reg = <0x7000a000 0x100>;
-- 
2.1.4
