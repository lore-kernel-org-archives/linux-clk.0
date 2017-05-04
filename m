Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 05/10] dt-bindings: add compatible string for Allwinner R40 pinctrl
Date: Thu,  4 May 2017 21:50:01 +0800
Message-Id: <20170504135006.16483-6-icenowy@aosc.io>
In-Reply-To: <20170504135006.16483-1-icenowy@aosc.io>
References: <20170504135006.16483-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner R40 has a pin controller like the ones in older Allwinner SoCs
(especially A20), and can use modified version of the A10/A20 pinctrl
driver.

Add a compatible string for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index b53224473672..3ab9f7849a19 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -22,6 +22,7 @@ Required properties:
   "allwinner,sun8i-a83t-pinctrl"
   "allwinner,sun8i-h3-pinctrl"
   "allwinner,sun8i-h3-r-pinctrl"
+  "allwinner,sun8i-r40-pinctrl"
   "allwinner,sun50i-a64-pinctrl"
   "allwinner,sun50i-a64-r-pinctrl"
   "allwinner,sun50i-h5-pinctrl"
-- 
2.12.2
