Return-Path: <andre.przywara@arm.com>
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@googlegroups.com
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Jens Kuske <jenskuske@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3 05/10] DT: clk: sunxi: add binding doc for the multi-bus-gates clock
Date: Mon, 22 Feb 2016 18:20:50 +0000
Message-Id: <1456165255-31013-6-git-send-email-andre.przywara@arm.com>
In-Reply-To: <1456165255-31013-1-git-send-email-andre.przywara@arm.com>
References: <1456165255-31013-1-git-send-email-andre.przywara@arm.com>
List-ID: <linux-clk.vger.kernel.org>

Recent Allwinner SoCs introduced a bus gates clock which can have
different parents for individual gates.
For the time being we encoded this relation in the driver.
This commit specifies a new binding which allows to encode this in
the DT by using a child node for each parent clock used. This allows
to specify any kind of relation efficiently and also keeps the very
same kernel driver for all SoCs at the same time.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index c09f59b..323af8e 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -79,6 +79,7 @@ Required properties:
 	"allwinner,sun9i-a80-usb-mod-clk" - for usb gates + resets on A80
 	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
 	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
+	"allwinner,sunxi-multi-bus-gates-clk" - for the multi-parent bus gates
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
@@ -119,6 +120,11 @@ For "allwinner,sun6i-a31-pll6-clk", there are 2 outputs. The first output
 is the normal PLL6 output, or "pll6". The second output is rate doubled
 PLL6, or "pll6x2".
 
+The "allwinner,sunxi-multi-bus-gates-clk" holds the actual clocks in
+child nodes, where each one specifies the parent clock that the particular
+gates are depending from. The child nodes each follow the common clock
+binding as described in this document.
+
 The "allwinner,*-mmc-clk" clocks have three different outputs: the
 main clock, with the ID 0, and the output and sample clocks, with the
 IDs 1 and 2, respectively.
-- 
2.6.4
