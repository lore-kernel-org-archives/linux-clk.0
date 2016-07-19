Return-Path: <mirza.krak@gmail.com>
Return-Path: <mirza.krak@gmail.com>
From: Mirza Krak <mirza.krak@gmail.com>
To: swarren@wwwdotorg.org,
	thierry.reding@gmail.com,
	gnurou@gmail.com,
	pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	linux@armlinux.org.uk,
	Mirza Krak <mirza.krak@gmail.com>
Subject: [RFC 5/6] ARM: tegra: Add Tegra20 NOR support
Date: Tue, 19 Jul 2016 15:36:36 +0200
Message-Id: <1468935397-11926-6-git-send-email-mirza.krak@gmail.com>
In-Reply-To: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Mirza Krak <mirza.krak@gmail.com>

Add a device node for the NOR controller found on Tegra20.

Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2207c08..fa8b3c7 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -376,6 +376,18 @@
 		status = "disabled";
 	};

+
+	nor@70009000 {
+		compatible = "nvidia,tegra20-nor", "nvidia,tegra30-nor";
+		reg = <70009000 0x1000>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		clocks = <&tegra_car TEGRA20_CLK_NOR>;
+		resets = < &tegra_car 42>;
+		reset-names = "nor";
+		status = "disabled";
+	};
+
 	pwm: pwm@7000a000 {
 		compatible = "nvidia,tegra20-pwm";
 		reg = <0x7000a000 0x100>;
--
2.1.4
