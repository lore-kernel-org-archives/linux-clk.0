Return-Path: <hkallweit1@gmail.com>
Return-Path: <hkallweit1@gmail.com>
Subject: [PATCH v3 3/4] ARM64: dts: meson-gx: add clock CLKID_RNG0 to hwrng
 node
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-crypto@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <4e2d12e5-f75b-3ac6-a3f7-18e8a8b7283b@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <2135c29a-41c2-f649-ea6d-bd635cbe0714@gmail.com>
Date: Wed, 22 Feb 2017 08:00:55 +0100
MIME-Version: 1.0
In-Reply-To: <4e2d12e5-f75b-3ac6-a3f7-18e8a8b7283b@gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Add clock CLKID_RNG0 to HW randon number generator node.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- splitted first version of patch into two
- add DT binding documentation
- mention that clock is optional
- replace spaces with tabs in DT binding example
v3:
- splitted DT extension and binding documentation update into two patches
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 5d995f77..620495a4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -380,7 +380,7 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
 
-			rng {
+			hwrng: rng {
 				compatible = "amlogic,meson-rng";
 				reg = <0x0 0x0 0x0 0x4>;
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 04b3324b..a375cb21 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -524,3 +524,8 @@
 &vpu {
 	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
 };
+
+&hwrng {
+	clocks = <&clkc CLKID_RNG0>;
+	clock-names = "core";
+};
-- 
2.11.1
