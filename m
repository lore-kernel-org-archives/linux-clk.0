Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:61798 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753283AbdHOGoA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2017 02:44:00 -0400
From: <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC: James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v1 7/9] soc: mediatek: add dependent clock jpgdec/audio for scpsys
Date: Tue, 15 Aug 2017 14:42:48 +0800
Message-ID: <1502779370-30150-8-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1502779370-30150-1-git-send-email-weiyi.lu@mediatek.com>
References: <1502779370-30150-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Weiyi Lu <weiyi.lu@mediatek.com>

There are dependent clock jpgdec/audio in scpsys on MT2712,
and will exist three dependent clocks on MT2712 VDEC.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index b181ef2..590e82d 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -73,6 +73,8 @@ enum clk_id {
 	CLK_VENC_LT,
 	CLK_ETHIF,
 	CLK_VDEC,
+	CLK_JPGDEC,
+	CLK_AUDIO,
 	CLK_MAX,
 };
 
@@ -84,10 +86,12 @@ enum clk_id {
 	"venc_lt",
 	"ethif",
 	"vdec",
+	"jpgdec",
+	"audio",
 	NULL,
 };
 
-#define MAX_CLKS	2
+#define MAX_CLKS	3
 
 struct bus_prot_ext {
 	u32 set_ofs;
-- 
1.9.1

