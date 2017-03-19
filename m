Return-Path: <mars.cheng@mediatek.com>
From: Mars Cheng <mars.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
CC: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>,
	<linux-clk@vger.kernel.org>, Mars Cheng <mars.cheng@mediatek.com>, Kevin-CW
 Chen <kevin-cw.chen@mediatek.com>
Subject: [PATCH v3 10/12] dt-bindings: mediatek: add MT6797 power dt-bindings
Date: Sun, 19 Mar 2017 23:26:31 +0800
Message-ID: <1489937193-2953-11-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: mars.cheng@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

This adds scpsys dt-bindings for MT6797

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index 16fe94d..b1d165b 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -9,11 +9,14 @@ domain control.
 
 The driver implements the Generic PM domain bindings described in
 power/power_domain.txt. It provides the power domains defined in
-include/dt-bindings/power/mt8173-power.h and mt2701-power.h.
+- include/dt-bindings/power/mt8173-power.h
+- include/dt-bindings/power/mt6797-power.h
+- include/dt-bindings/power/mt2701-power.h
 
 Required properties:
 - compatible: Should be one of:
 	- "mediatek,mt2701-scpsys"
+	- "mediatek,mt6797-scpsys"
 	- "mediatek,mt8173-scpsys"
 - #power-domain-cells: Must be 1
 - reg: Address range of the SCPSYS unit
@@ -22,6 +25,7 @@ Required properties:
                       These are clocks which hardware needs to be
                       enabled before enabling certain power domains.
 	Required clocks for MT2701: "mm", "mfg", "ethif"
+	Required clocks for MT6797: "mm", "mfg", "vdec"
 	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
 
 Optional properties:
-- 
1.7.9.5
