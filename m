Return-Path: <carlo.caione@gmail.com>
Return-Path: <carlo.caione@gmail.com>
Sender: Carlo Caione <carlo.caione@gmail.com>
From: Carlo Caione <carlo@caione.org>
To: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux@arm.linux.org.uk,
	linux-meson@googlegroups.com,
	drake@endlessm.com,
	jerry.cao@amlogic.com,
	victor.wan@amlogic.com,
	pawel.moll@arm.com,
	arnd@arndb.de
Cc: Carlo Caione <carlo@endlessm.com>
Subject: [PATCH 7/7] ARM: DTS: meson8b: Add SMP related nodes
Date: Tue, 17 Nov 2015 15:56:42 +0100
Message-Id: <1447772202-12418-8-git-send-email-carlo@caione.org>
In-Reply-To: <1447772202-12418-1-git-send-email-carlo@caione.org>
References: <1447772202-12418-1-git-send-email-carlo@caione.org>
List-ID: <linux-clk.vger.kernel.org>

From: Carlo Caione <carlo@endlessm.com>

Add nodes for: SCU, PMU and SRAM. Set also the enable-method for SMP
bringup.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 977d55f..0477a81 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -51,9 +51,20 @@
 / {
 	interrupt-parent = <&gic>;
 
+	scu@c4300000 {
+		compatible = "arm,cortex-a5-scu";
+		reg = <0xc4300000 0x100>;
+	};
+
+	pmu@c81000e4 {
+		compatible = "amlogic,meson8b-pmu", "syscon";
+		reg = <0xc81000e0 0x18>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "amlogic,meson8b-smp";
 
 		cpu@200 {
 			device_type = "cpu";
@@ -88,6 +99,19 @@
 		};
 	};
 
+	sram: sram@d9000000 {
+		compatible = "mmio-sram";
+		reg = <0xd9000000 0x20000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0xd9000000 0x20000>;
+
+		smp-sram@1ff80 {
+			compatible = "amlogic,meson8b-smp-sram";
+			reg = <0x1ff80 0x8>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.5.0
