Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:56730 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1754320AbdDHBZC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Apr 2017 21:25:02 -0400
From: Mars Cheng <mars.cheng@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC: CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Jades Shih <jades.shih@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Kevin-CW Chen <kevin-cw.chen@mediatek.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v4 08/10] dt-bindings: mediatek: add MT6797 power dt-bindings
Date: Sat, 8 Apr 2017 09:20:33 +0800
Message-ID: <1491614435-23754-9-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
References: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds power dt-bindings for MT6797

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

