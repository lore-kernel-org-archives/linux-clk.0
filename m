Return-Path: <matthias.bgg@kernel.org>
From: matthias.bgg@kernel.org
To: ulrich.hecht+renesas@gmail.com,
	laurent.pinchart@ideasonboard.com,
	ck.hu@mediatek.com,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	lee.jones@linaro.org
Cc: davem@davemloft.net,
	gregkh@linuxfoundation.org,
	mchehab@kernel.org,
	rdunlap@infradead.org,
	pi-cheng.chen@linaro.org,
	sean.wang@mediatek.com,
	linux-clk@vger.kernel.org,
	linux@armlinux.org.uk,
	matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [v2 resend 01/10] dt-bindings: mediatek: mmsys: Add support for mfd
Date: Tue, 24 Apr 2018 11:46:58 +0200
Message-Id: <64ca273429d92f581568a48f3efe6035af65f579.1524563001.git.mbrugger@suse.com>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
List-ID: <linux-clk.vger.kernel.org>

From: Matthias Brugger <mbrugger@suse.com>

Add binding description for the mmsys mfd for some Mediatek
devices. mmsys has some registers to control clock gates (which is
used in the clk driver) and some registers to set the routing and enable
the differnet blocks of the display subsystem.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |  2 --
 .../bindings/display/mediatek/mediatek,disp.txt    |  2 +-
 .../devicetree/bindings/mfd/mediatek,mmsys.txt     | 27 ++++++++++++++++++++++
 3 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mmsys.txt

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index 4eb8bbe15c01..4468345f8b1a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -6,10 +6,8 @@ The Mediatek mmsys controller provides various clocks to the system.
 Required Properties:
 
 - compatible: Should be one of:
-	- "mediatek,mt2701-mmsys", "syscon"
 	- "mediatek,mt2712-mmsys", "syscon"
 	- "mediatek,mt6797-mmsys", "syscon"
-	- "mediatek,mt8173-mmsys", "syscon"
 - #clock-cells: Must be 1
 
 The mmsys controller uses the common clk binding from
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 383183a89164..85a3b4ec06cd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -9,7 +9,7 @@ function block.
 
 All DISP device tree nodes must be siblings to the central MMSYS_CONFIG node.
 For a description of the MMSYS_CONFIG binding, see
-Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt.
+Documentation/devicetree/bindings/mfd/mediatek,mmsys.txt
 
 DISP function blocks
 ====================
diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mmsys.txt b/Documentation/devicetree/bindings/mfd/mediatek,mmsys.txt
new file mode 100644
index 000000000000..2331ae16917e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mmsys.txt
@@ -0,0 +1,27 @@
+MediaTek MMSYS Multifunction Device Driver
+
+MMSYS is a multifunction device with the following sub modules:
+- clocks for the multi-media subsystem
+- central node for the DRM subsystem.
+
+This document describes the binding for MFD device. The MFD takes care to initailize
+the clock driver and the DRM driver. More info see
+Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+
+Required properties:
+- compatible: Should be one of:
+	- "mediatek,mt2701-mmsys", "syscon"
+	- "mediatek,mt8173-mmsys", "syscon"
+- #clock-cells: Must be 1
+
+Optional properties:
+- power-domains: list of powerdomains needed for the subsystem to work
+
+Example:
+
+mmsys: clock-controller@14000000 {
+	compatible = "mediatek,mt8173-mmsys", "syscon";
+	reg = <0 0x14000000 0 0x1000>;
+	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+	#clock-cells = <1>;
+};
-- 
2.16.3
