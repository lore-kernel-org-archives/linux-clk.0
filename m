Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:52126 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751125AbdFBKKi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 2 Jun 2017 06:10:38 -0400
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH 06/19] dt-bindings: display: sun4i: Add binding for A31 HDMI controller
Date: Fri,  2 Jun 2017 18:10:11 +0800
Message-Id: <20170602101024.18940-7-wens@csie.org>
In-Reply-To: <20170602101024.18940-1-wens@csie.org>
References: <20170602101024.18940-1-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The HDMI controller in the A31 SoC is slightly different from the
earlier version. In addition to the TMDS clock and DDC controls,
this version now takes a second DDC clock input.

Add a compatible string for it, and add the DDC clock input to the
list of clocks required.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index b83e6018041d..d23e7cad19d0 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -23,14 +23,17 @@ CEC. It is one end of the pipeline.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun5i-a10s-hdmi
+    * allwinner,sun6i-a31-hdmi
   - reg: base address and size of memory-mapped region
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the HDMI encoder
     * ahb: the HDMI interface clock
     * mod: the HDMI module clock
+    * ddc: the HDMI ddc clock (A31 only)
     * pll-0: the first video PLL
     * pll-1: the second video PLL
   - clock-names: the clock names mentioned above
+  - resets: phandle to the reset control for the HDMI encoder (A31 only)
   - dmas: phandles to the DMA channels used by the HDMI encoder
     * ddc-tx: The channel for DDC transmission
     * ddc-rx: The channel for DDC reception
-- 
2.11.0

