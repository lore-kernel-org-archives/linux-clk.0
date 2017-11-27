Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 14/18] ARM: dts: sun8i: a83t: Enable the PWM
Date: Mon, 27 Nov 2017 16:41:38 +0100
Message-Id: <257f6ffb088c1d165c3fdc6a2b2283e493cbaa16.1511797218.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 jernej.skrabec@siol.net, plaes@plaes.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 icenowy@aosc.io
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The A83T has the same PWM block than the H3. Add it to our DT.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi |  9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 0a91f5c17f51..2cb71e460ea2 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -497,6 +497,15 @@
 			status = "disabled";
 		};
 
+		pwm: pwm@1c21400 {
+			compatible = "allwinner,sun8i-a83t-pwm",
+				     "allwinner,sun8i-h3-pwm";
+			reg = <0x01c21400 0x400>;
+			clocks = <&osc24M>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
git-series 0.9.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
