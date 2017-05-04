Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 01/10] arm: sunxi: add support for R40 SoC
Date: Thu,  4 May 2017 21:49:57 +0800
Message-Id: <20170504135006.16483-2-icenowy@aosc.io>
In-Reply-To: <20170504135006.16483-1-icenowy@aosc.io>
References: <20170504135006.16483-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Icenowy Zheng <icenowy@aosc.xyz>

Allwinner R40 is a new SoC, with Quad Core Cortex-A7 and peripherals
like A20.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 Documentation/arm/sunxi/README                  | 4 ++++
 Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
 arch/arm/mach-sunxi/sunxi.c                     | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/README
index d7b1f016bd62..25c814adcd47 100644
--- a/Documentation/arm/sunxi/README
+++ b/Documentation/arm/sunxi/README
@@ -75,6 +75,10 @@ SunXi family
         + Datasheet
           http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf
 
+      - Allwinner R40 (sun8i)
+        + Datasheet Draft
+          http://linux-sunxi.org/File:Allwinner_R40_Datasheet_V0.1.pdf
+
     * Quad ARM Cortex-A15, Quad ARM Cortex-A7 based SoCs
       - Allwinner A80
         + Datasheet
diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
index d2c46449b4eb..b3ffe6cf821a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -14,6 +14,7 @@ using one of the following compatible strings:
   allwinner,sun8i-a83t
   allwinner,sun8i-h2-plus
   allwinner,sun8i-h3
+  allwinner-sun8i-r40
   allwinner,sun9i-a80
   allwinner,sun50i-a64
   nextthing,gr8
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index f44e3acb5c90..aea616759451 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -66,6 +66,7 @@ static const char * const sun8i_board_dt_compat[] = {
 	"allwinner,sun8i-h2-plus",
 	"allwinner,sun8i-h3",
 	"allwinner,sun8i-v3s",
+	"allwinner,sun8i-r40",
 	NULL,
 };
 
-- 
2.12.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
