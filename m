Return-Path: <sean.wang@mediatek.com>
From: <sean.wang@mediatek.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>, <robh+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <mark.rutland@arm.com>, <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 4/6] dt-bindings: reset: mediatek: add entry for Mali-450 node to refer
Date: Fri, 27 Apr 2018 16:14:45 +0800
Message-ID: <d9f327fa30c987ac9cf3a349551bbaa037d1b24a.1524816502.git.sean.wang@mediatek.com>
In-Reply-To: <cover.1524816502.git.sean.wang@mediatek.com>
References: <cover.1524816502.git.sean.wang@mediatek.com>
Return-Path: sean.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Sean Wang <sean.wang@mediatek.com>

Just add binding for a required reset referenced by Mali-450 on MT7623
or MT2701 SoC.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 include/dt-bindings/reset/mt2701-resets.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/reset/mt2701-resets.h b/include/dt-bindings/reset/mt2701-resets.h
index 21deb54..50b7f06 100644
--- a/include/dt-bindings/reset/mt2701-resets.h
+++ b/include/dt-bindings/reset/mt2701-resets.h
@@ -87,4 +87,7 @@
 #define MT2701_ETHSYS_GMAC_RST			23
 #define MT2701_ETHSYS_PPE_RST			31
 
+/* G3DSYS resets */
+#define MT2701_G3DSYS_CORE_RST			0
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2701 */
-- 
2.7.4
