Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@caione.org,
	narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux@armlinux.org.uk,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 3/3] ARM: dts: meson: mark the clock controller also as reset controller
Date: Fri, 28 Jul 2017 23:13:13 +0200
Message-Id: <20170728211313.10603-4-martin.blumenstingl@googlemail.com>
In-Reply-To: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
References: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

The clock controller provides a few reset lines as well. Add the
corresponding CPU cores.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8.dtsi  | 1 +
 arch/arm/boot/dts/meson8b.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 6fe6a159e960..b98d44fde6b6 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -168,6 +168,7 @@
 &cbus {
 	clkc: clock-controller@4000 {
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 		compatible = "amlogic,meson8-clkc";
 		reg = <0x8000 0x4>, <0x4000 0x460>;
 	};
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 8fce13844b0c..bc278da7df0d 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -119,6 +119,7 @@
 &cbus {
 	clkc: clock-controller@4000 {
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
 		reg = <0x8000 0x4>, <0x4000 0x460>;
 	};
-- 
2.13.3
