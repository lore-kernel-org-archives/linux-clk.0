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
	<linux-clk@vger.kernel.org>, Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH v3 09/12] soc: mediatek: add vdec item for scpsys
Date: Sun, 19 Mar 2017 23:26:30 +0800
Message-ID: <1489937193-2953-10-git-send-email-mars.cheng@mediatek.com>
In-Reply-To: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: mars.cheng@mediatek.com
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
