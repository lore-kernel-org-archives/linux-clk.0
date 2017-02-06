Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Mars Cheng <mars.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Jades Shih <jades.shih@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        My Chuang <my.chuang@mediatek.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <wsd_upstream@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will.deacon@arm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        <linux-clk@vger.kernel.org>,
        Chieh-Jay Liu <Chieh-Jay.Liu@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v2 03/10] Document: DT: Add bindings for mediatek MT6797 SoC Platform
Date: Mon, 6 Feb 2017 20:15:29 +0800
Message-ID: <1486383336-16892-4-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds dt-binding documentation for Mediatek MT6797. Only
include very basic items, gic, uart timer and cpu.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt |    4 ++++
 .../interrupt-controller/mediatek,sysirq.txt       |    1 +
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index c860b24..2d3344d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -12,6 +12,7 @@ compatible: Must contain one of
    "mediatek,mt6592"
    "mediatek,mt6755"
    "mediatek,mt6795"
+   "mediatek,mt6797"
    "mediatek,mt7623"
    "mediatek,mt8127"
    "mediatek,mt8135"
@@ -38,6 +39,9 @@ Supported boards:
 - Evaluation board for MT6795(Helio X10):
     Required root node properties:
       - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
+- Evaluation board for MT6797(Helio X20):
+    Required root node properties:
+      - compatible = "mediatek,mt6797-evb", "mediatek,mt6797";
 - Evaluation board for MT7623:
     Required root node properties:
       - compatible = "mediatek,mt7623-evb", "mediatek,mt7623";
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 1718454..9e537d6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -9,6 +9,7 @@ Required properties:
 	"mediatek,mt8135-sysirq"
 	"mediatek,mt8127-sysirq"
 	"mediatek,mt6795-sysirq"
+	"mediatek,mt6797-sysirq"
 	"mediatek,mt6755-sysirq"
 	"mediatek,mt6592-sysirq"
 	"mediatek,mt6589-sysirq"
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 0015c72..5b8513d 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -8,6 +8,7 @@ Required properties:
   * "mediatek,mt6589-uart" for MT6589 compatible UARTS
   * "mediatek,mt6755-uart" for MT6755 compatible UARTS
   * "mediatek,mt6795-uart" for MT6795 compatible UARTS
+  * "mediatek,mt6797-uart" for MT6797 compatible UARTS
   * "mediatek,mt7623-uart" for MT7623 compatible UARTS
   * "mediatek,mt8127-uart" for MT8127 compatible UARTS
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
-- 
1.7.9.5
