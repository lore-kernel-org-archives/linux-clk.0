Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
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
Subject: [PATCH 5/8] mfd: mtk-mmsys: Add mt8173 nodes
Date: Tue, 14 Nov 2017 22:41:11 +0100
Message-Id: <20171114214114.15793-6-mbrugger@suse.com>
In-Reply-To: <20171114214114.15793-1-mbrugger@suse.com>
References: <20171114214114.15793-1-mbrugger@suse.com>
List-ID: <linux-clk.vger.kernel.org>

Add devices for the mt8173 SoC.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/mfd/mtk-mmsys.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mfd/mtk-mmsys.c b/drivers/mfd/mtk-mmsys.c
index 102b491aa28f..45973dfc6010 100644
--- a/drivers/mfd/mtk-mmsys.c
+++ b/drivers/mfd/mtk-mmsys.c
@@ -21,6 +21,7 @@
 
 enum {
 	MMSYS_MT2701 = 1,
+	MMSYS_MT8173,
 };
 
 static const struct mfd_cell mmsys_mt2701_devs[] = {
@@ -28,6 +29,12 @@ static const struct mfd_cell mmsys_mt2701_devs[] = {
 	{ .name = "drm-mt2701-mm", },
 };
 
+static const struct mfd_cell mmsys_mt8173_devs[] = {
+	{ .name = "clk-mt8173-mm", },
+	{ .name = "drm-mt8173-mm", },
+};
+
+
 static int mmsys_probe(struct platform_device *pdev)
 {
 	struct mmsys_dev *private;
@@ -47,6 +54,10 @@ static int mmsys_probe(struct platform_device *pdev)
 		mmsys_cells = mmsys_mt2701_devs;
 		nr_cells = ARRAY_SIZE(mmsys_mt2701_devs);
 		break;
+	case MMSYS_MT8173:
+		mmsys_cells = mmsys_mt8173_devs;
+		nr_cells = ARRAY_SIZE(mmsys_mt8173_devs);
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -74,6 +85,9 @@ static const struct of_device_id of_match_mmsys[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = (void *) MMSYS_MT2701,
 	},
+	{ .compatible = "mediatek,mt8173-mmsys",
+	  .data = (void *) MMSYS_MT8173,
+	},
 	{ /* sentinel */ },
 };
 
-- 
2.14.2
