Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46489 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752826AbbJTJXc (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 05:23:32 -0400
From: Andrzej Hajda <a.hajda@samsung.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH 09/10] dt-bindings: video: exynos5433-decon: add bindings for
 DECON-TV
Date: Tue, 20 Oct 2015 11:22:40 +0200
Message-id: <1445332961-25419-10-git-send-email-a.hajda@samsung.com>
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

DECON-TV(Display and Enhancement Controller for TV) is a variation
of DECON IP. Its main purpose is to produce video stream for HDMI IP.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 .../devicetree/bindings/video/exynos5433-decon.txt  | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
index 3dff78b..2a88c8d 100644
--- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
+++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
@@ -5,24 +5,27 @@ Exynos series of SoCs which transfers the image data from a video memory
 buffer to an external LCD interface.
 
 Required properties:
-- compatible: value should be "samsung,exynos5433-decon";
+- compatible: value should be one of:
+	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
 - reg: physical base address and length of the DECON registers set.
-- interrupts: should contain a list of all DECON IP block interrupts in the
-	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
-	      depends on the interrupt controller used.
-- interrupt-names: should contain the interrupt names: "vsync", "lcd_sys"
-		   in the same order as they were listed in the interrupts
-		   property.
+- interrupts: should contain interrupt specifier of VSYNC and optionally
+	      LCD_SYSTEM. The interrupt specifier format depends on
+	      the interrupt controller used.
+- interrupt-names: should contain the interrupt name "vsync" and optionally
+		   "lcd_sys" in the same order as they were listed in
+		   the interrupts property.
 - clocks: must include clock specifiers corresponding to entries in the
 	  clock-names property.
 - clock-names: list of clock names sorted in the same order as the clocks
 	       property. Must contain "pclk", "aclk_decon", "aclk_smmu_decon0x",
 	       "aclk_xiu_decon0x", "pclk_smmu_decon0x", clk_decon_vclk",
 	       "sclk_decon_eclk"
+
+Optional properties:
 - ports: contains a port which is connected to mic node. address-cells and
-	 size-cells must 1 and 0, respectively.
+	 size-cells must be 1 and 0, respectively.
 - port: contains an endpoint node which is connected to the endpoint in the mic
-	node. The reg value muset be 0.
+	node. The reg value must be 0.
 - i80-if-timings: specify whether the panel which is connected to decon uses
 		  i80 lcd interface or mipi video interface. This node contains
 		  no timing information as that of fimd does. Because there is
-- 
1.9.1

