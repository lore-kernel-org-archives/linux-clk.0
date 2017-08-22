Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailgw02.mediatek.com ([210.61.82.184]:56551 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S932612AbdHVKaj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2017 06:30:39 -0400
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh@kernel.org>
CC: James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH 7/9] soc: mediatek: add dependent clock jpgdec/audio for scpsys
Date: Tue, 22 Aug 2017 18:28:20 +0800
Message-ID: <1503397702-7201-8-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1503397702-7201-1-git-send-email-weiyi.lu@mediatek.com>
References: <1503397702-7201-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There are dependent clock jpgdec/audio in scpsys on MT2712,
and will exist three dependent clocks on MT2712 VDEC.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 2569390..28c6e6a 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -84,6 +84,8 @@ enum clk_id {
 	CLK_ETHIF,
 	CLK_VDEC,
 	CLK_HIFSEL,
+	CLK_JPGDEC,
+	CLK_AUDIO,
 	CLK_MAX,
 };
 
@@ -96,10 +98,12 @@ enum clk_id {
 	"ethif",
 	"vdec",
 	"hif_sel",
+	"jpgdec",
+	"audio",
 	NULL,
 };
 
-#define MAX_CLKS	2
+#define MAX_CLKS	3
 
 struct scp_domain_data {
 	const char *name;
-- 
1.9.1

