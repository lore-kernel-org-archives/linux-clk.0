Return-Path: <>
Return-Path: <>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	matthias.bgg@gmail.com
Cc: jamesjj.liao@mediatek.com,
	djkurtz@chromium.org,
	p.zabel@pengutronix.de,
	yingjoe.chen@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] clk: mediatek: clk-mt8173: Unmap region obtained by of_iomap
Date: Tue, 20 Sep 2016 14:00:42 +0530
Message-Id: <1474360242-15126-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory mapping, if init is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 10c9860..0ac3aee 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -1074,8 +1074,10 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	}
 
 	mt8173_pll_clk_data = clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
+	if (!clk_data) {
+		iounmap(base);
 		return;
+	}
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-- 
1.7.9.5
