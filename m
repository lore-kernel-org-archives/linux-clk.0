Return-Path: <weiyi.lu@mediatek.com>
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>
CC: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <srv_heupstream@mediatek.com>, Weiyi Lu
	<weiyi.lu@mediatek.com>
Subject: [PATCH v6 7/9] soc: mediatek: add dependent clock jpgdec/audio for scpsys
Date: Mon, 23 Oct 2017 12:10:38 +0800
Message-ID: <1508731840-4231-8-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1508731840-4231-1-git-send-email-weiyi.lu@mediatek.com>
References: <1508731840-4231-1-git-send-email-weiyi.lu@mediatek.com>
Return-Path: weiyi.lu@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

There are dependent clock jpgdec/audio in scpsys on MT2712,
and will exist three dependent clocks on MT2712 VDEC.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ba552de..7e7e4ec 100644
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
