Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:19873 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731175AbeITPkn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Sep 2018 11:40:43 -0400
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh@kernel.org>
CC: James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 1/3] dt-bindings: clock: add clock for MT2712
Date: Thu, 20 Sep 2018 17:57:25 +0800
Message-ID: <20180920095727.11868-3-weiyi.lu@mediatek.com>
In-Reply-To: <20180920095727.11868-1-weiyi.lu@mediatek.com>
References: <20180920095727.11868-1-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add new clock according to 3rd ECO design change.
It's the parent clock of audio clock mux.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 include/dt-bindings/clock/mt2712-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt2712-clk.h b/include/dt-bindings/clock/mt2712-clk.h
index 76265836a1e1..c3b29dff9c0e 100644
--- a/include/dt-bindings/clock/mt2712-clk.h
+++ b/include/dt-bindings/clock/mt2712-clk.h
@@ -228,7 +228,8 @@
 #define CLK_TOP_NFI2X_EN		189
 #define CLK_TOP_NFIECC_EN		190
 #define CLK_TOP_NFI1X_CK_EN		191
-#define CLK_TOP_NR_CLK			192
+#define CLK_TOP_APLL2_D3		192
+#define CLK_TOP_NR_CLK			193
 
 /* INFRACFG */
 
-- 
2.12.5.2.gbdf23ab
