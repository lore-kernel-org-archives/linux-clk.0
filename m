Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:27933 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S933366AbdDHBZJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Apr 2017 21:25:09 -0400
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
Subject: [PATCH v4 07/10] soc: mediatek: add vdec item for scpsys
Date: Sat, 8 Apr 2017 09:20:32 +0800
Message-ID: <1491614435-23754-8-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
References: <1491614435-23754-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

for some chips, there is vdec item in scpsys, this patch adds it.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index eadbf0d..a8ba800 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -71,6 +71,7 @@ enum clk_id {
 	CLK_VENC,
 	CLK_VENC_LT,
 	CLK_ETHIF,
+	CLK_VDEC,
 	CLK_MAX,
 };
 
@@ -81,6 +82,7 @@ enum clk_id {
 	"venc",
 	"venc_lt",
 	"ethif",
+	"vdec",
 	NULL,
 };
 
-- 
1.7.9.5

