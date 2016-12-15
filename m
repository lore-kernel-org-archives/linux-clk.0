Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: [PATCH v2] ARM: dts: sun8i: add opp-v2 table for A33
Date: Fri, 16 Dec 2016 02:27:54 +0800
Message-Id: <20161215182754.33921-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

An operating point table is needed for the cpu frequency adjusting to
work.

The operating point table is converted from the common value in
extracted script.fex from many A33 board/tablets.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Changes since v1:
- Fix format problem (blank lines).
- Removed the 1.344GHz operating point, as it's overvoltage and overclocked.

This patch depends on the following patchset:

http://lists.infradead.org/pipermail/linux-arm-kernel/2016-December/473962.html

It's the v2 of the [PATCH 4/6] in this patchset.

I think this operating point table may also apply to A23, as there's no
difference except the points over 1.2GHz between A23 and A33's stock dvfs table.

But as A23 CCU may not have the necessary fixes, I won't add the table to A23
now.

Chen-Yu, could you test the CCU fixes I described in the patchset above on A23,
then test this operating points table?

If it's necessary, you can send out the CCU fixes and add one more patch that
moves this opp-v2 table to sun8i-a23-a33.dtsi .

 arch/arm/boot/dts/sun8i-a33.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 504996cbee29..0f5b2af72981 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -46,7 +46,42 @@
 #include <dt-bindings/dma/sun4i-a10.h>
 
 / {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@648000000 {
+			opp-hz = /bits/ 64 <648000000>;
+			opp-microvolt = <1040000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp@816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1100000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp@1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1200000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp@1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1320000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+	};
+
 	cpus {
+		cpu0: cpu@0 {
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
 		cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
