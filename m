Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:58311 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730085AbeGZSfp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Jul 2018 14:35:45 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3.1 08/10] dt-bindings: sun4i-drm: add HDMI VCC supply property for sun8i-dw-hdmi
Date: Fri, 27 Jul 2018 01:12:55 +0800
Message-Id: <20180726171257.6688-9-icenowy@aosc.io>
In-Reply-To: <20180726171257.6688-1-icenowy@aosc.io>
References: <20180726171257.6688-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allwiner SoCs with DesignWare HDMI controller all come with a "HVCC"
pin, which is the VCC of HDMI part.

Add a supply property to specify HVCC's regulator in the device tree.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
Changes in v3.1:
- New patch.

 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index fdb8fb29033f..cb4769913e89 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -97,6 +97,9 @@ Required properties:
     first port should be the input endpoint. The second should be the
     output, usually to an HDMI connector.
 
+Optional properties:
+  - hdmi-supply: the VCC power supply of the controller
+
 DWC HDMI PHY
 ------------
 
-- 
2.18.0

