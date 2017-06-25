Return-Path: <plaes@plaes.org>
From: Priit Laes <plaes@plaes.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com,
	Jonathan Liu <net147@gmail.com>,
	Priit Laes <plaes@plaes.org>
Subject: [PATCH v4 4/6] dt-bindings: List devicetree binding for the CCU of Allwinner A10
Date: Sun, 25 Jun 2017 23:45:45 +0300
Message-Id: <cc55dca83509fe2d2f7f97686de7a9d58653b45b.1498422562.git-series.plaes@plaes.org>
In-Reply-To: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
In-Reply-To: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
References: <cover.24b2b13ec5a68552e186ba1637f1328363c3886e.1498422562.git-series.plaes@plaes.org>
List-ID: <linux-clk.vger.kernel.org>

Allwinner A10 is now driven by sunxi-ng CCU driver.

Add devicetree binding for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Priit Laes <plaes@plaes.org>
---
 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index 81d0fa4..429168d 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -3,6 +3,7 @@ Allwinner Clock Control Unit Binding
 
 Required properties :
 - compatible: must contain one of the following compatibles:
+		- "allwinner,sun4i-a10-ccu"
 		- "allwinner,sun6i-a31-ccu"
 		- "allwinner,sun7i-a20-ccu"
 		- "allwinner,sun8i-a23-ccu"
-- 
git-series 0.9.1
