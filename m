Return-Path: <matthias.bgg@kernel.org>
From: matthias.bgg@kernel.org
To: ulrich.hecht+renesas@gmail.com,
	laurent.pinchart@ideasonboard.com,
	ck.hu@mediatek.com,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	lee.jones@linaro.org
Cc: davem@davemloft.net,
	gregkh@linuxfoundation.org,
	mchehab@kernel.org,
	rdunlap@infradead.org,
	pi-cheng.chen@linaro.org,
	sean.wang@mediatek.com,
	linux-clk@vger.kernel.org,
	linux@armlinux.org.uk,
	matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [v2 resend 05/10] clk: mediatek: mt2701-mm: switch to mfd device
Date: Tue, 24 Apr 2018 11:47:02 +0200
Message-Id: <16dd3041d81069f87422fd29b26d9d74c8a36293.1524563001.git.mbrugger@suse.com>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
List-ID: <linux-clk.vger.kernel.org>

From: Matthias Brugger <mbrugger@suse.com>

As the new mfd device is in place, switch probing
for the MMSYS to support invocation from the mfd device.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/mediatek/clk-mt2701-mm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-mm.c b/drivers/clk/mediatek/clk-mt2701-mm.c
index fe1f85072fc5..4517525887dd 100644
--- a/drivers/clk/mediatek/clk-mt2701-mm.c
+++ b/drivers/clk/mediatek/clk-mt2701-mm.c
@@ -87,16 +87,13 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_DISP1(CLK_MM_TVE_FMM, "mm_tve_fmm", "mm_sel", 14),
 };
 
-static const struct of_device_id of_match_clk_mt2701_mm[] = {
-	{ .compatible = "mediatek,mt2701-mmsys", },
-	{}
-};
-
 static int clk_mt2701_mm_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
 	int r;
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node;
+
+	node = pdev->dev.parent->of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR);
 
@@ -116,7 +113,6 @@ static struct platform_driver clk_mt2701_mm_drv = {
 	.probe = clk_mt2701_mm_probe,
 	.driver = {
 		.name = "clk-mt2701-mm",
-		.of_match_table = of_match_clk_mt2701_mm,
 	},
 };
 
-- 
2.16.3
