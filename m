Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs51.siol.net ([185.57.226.242]:38668 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S934332AbeFLUCg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jun 2018 16:02:36 -0400
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org
Cc: airlied@linux.ie, gustavo@padovan.org,
        maarten.lankhorst@linux.intel.com, seanpaul@chromium.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v2 18/27] dt-bindings: display: sun4i-drm: Add description of A64 HDMI PHY
Date: Tue, 12 Jun 2018 22:00:27 +0200
Message-Id: <20180612200036.21483-19-jernej.skrabec@siol.net>
In-Reply-To: <20180612200036.21483-1-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

A64 HDMI PHY is similar to H3 HDMI PHY except it has two possible PLL
clock parents. It is compatible to other HDMI PHYs, like that found in
R40.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index d84df6d808c2..6fb45c7a9ac8 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -101,6 +101,7 @@ DWC HDMI PHY
 
 Required properties:
   - compatible: value must be one of:
+    * allwinner,sun50i-a64-hdmi-phy
     * allwinner,sun8i-a83t-hdmi-phy
     * allwinner,sun8i-h3-hdmi-phy
   - reg: base address and size of memory-mapped region
@@ -111,8 +112,9 @@ Required properties:
   - resets: phandle to the reset controller driving the PHY
   - reset-names: must be "phy"
 
-H3 HDMI PHY requires additional clock:
+H3 and A64 HDMI PHY require additional clocks:
   - pll-0: parent of phy clock
+  - pll-1: second possible phy clock parent (A64 only)
 
 TV Encoder
 ----------
-- 
2.17.1

