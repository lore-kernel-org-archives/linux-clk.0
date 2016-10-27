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
Subject: [PATCH V3 5/6] ARM: tegra: Add Tegra20 GMI support
Date: Thu, 27 Oct 2016 16:01:11 +0200
Message-Id: <1477576872-2665-6-git-send-email-mirza.krak@gmail.com>
In-Reply-To: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Mirza Krak <mirza.krak@gmail.com>

Add a device node for the GMI controller found on Tegra20.

Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
---

Changes in v2:
- added address-cells, size-cells and ranges properties

Changes in v3:
- fixed range address which is not the same as Tegra30.

 arch/arm/boot/dts/tegra20.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2207c08..b22cddb 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -1,4 +1,4 @@
-#include <dt-bindings/clock/tegra20-car.h>
+include <dt-bindings/clock/tegra20-car.h>
 #include <dt-bindings/gpio/tegra-gpio.h>
 #include <dt-bindings/pinctrl/pinctrl-tegra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -376,6 +376,20 @@
 		status = "disabled";
 	};

+
+	gmi@70009000 {
+		compatible = "nvidia,tegra20-gmi";
+		reg = <0x70009000 0x1000>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0xd0000000 0xfffffff>;
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
