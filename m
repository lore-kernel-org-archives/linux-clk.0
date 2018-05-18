Return-Path: <jagan@amarulasolutions.com>
Return-Path: <jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>,
	David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 01/26] dt-bindings: clock: Add compatible for A64 DE2 CCU
Date: Fri, 18 May 2018 15:15:11 +0530
Message-Id: <20180518094536.17201-2-jagan@amarulasolutions.com>
In-Reply-To: <20180518094536.17201-1-jagan@amarulasolutions.com>
References: <20180518094536.17201-1-jagan@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

Allwinner A64 has DE2 CCU is similar to H3/H5 SoC.

So add compatible for A64 which is fallback compatible
for H5, so update fallback binding.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes for v2:
- Add fallback compatible

 Documentation/devicetree/bindings/clock/sun8i-de2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
index f2fa87c4765c..e3ffe0bcd0a0 100644
--- a/Documentation/devicetree/bindings/clock/sun8i-de2.txt
+++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
@@ -7,6 +7,7 @@ Required properties :
 		- "allwinner,sun8i-h3-de2-clk"
 		- "allwinner,sun8i-v3s-de2-clk"
 		- "allwinner,sun50i-h5-de2-clk"
+		- "allwinner,sun50i-a64-de2-clk", "allwinner,sun50i-h5-de2-clk"
 
 - reg: Must contain the registers base address and length
 - clocks: phandle to the clocks feeding the display engine subsystem.
-- 
2.14.3
