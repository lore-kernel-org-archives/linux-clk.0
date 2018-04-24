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
Subject: [v2 resend 09/10] drm: mediatek: Omit warning on probe defers
Date: Tue, 24 Apr 2018 11:47:06 +0200
Message-Id: <a698a40ce7723200fd55d0d98daff5a28a7d0039.1524563001.git.mbrugger@suse.com>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
In-Reply-To: <cover.1524563001.git.mbrugger@suse.com>
References: <cover.1524563001.git.mbrugger@suse.com>
List-ID: <linux-clk.vger.kernel.org>

From: Matthias Brugger <mbrugger@suse.com>

When probe through the MFD, it can happen that the
clock drivers wasn't probed before the ddp driver gets
invoked. The driver used to omit a warning that the driver
failed to get the clocks. Omit this error on the defered probe path.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index bafc5c77c4fb..6b399348a2dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -374,7 +374,8 @@ static int mtk_ddp_probe(struct platform_device *pdev)
 
 	ddp->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ddp->clk)) {
-		dev_err(dev, "Failed to get clock\n");
+		if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get clock\n");
 		return PTR_ERR(ddp->clk);
 	}
 
-- 
2.16.3
