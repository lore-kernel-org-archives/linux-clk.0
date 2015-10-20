Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29494 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752156AbbJTJX3 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 05:23:29 -0400
From: Andrzej Hajda <a.hajda@samsung.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH 05/10] drm/exynos/decon5433: fix timing registers writes
Date: Tue, 20 Oct 2015 11:22:36 +0200
Message-id: <1445332961-25419-6-git-send-email-a.hajda@samsung.com>
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

All timing registers should contain values decreased by one.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index b25d764..83e0939 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -104,7 +104,7 @@ static void decon_setup_trigger(struct decon_context *ctx)
 static void decon_commit(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
-	struct drm_display_mode *mode = &crtc->base.mode;
+	struct drm_display_mode *m = &crtc->base.mode;
 	u32 val;
 
 	if (ctx->suspended)
@@ -122,29 +122,29 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 		val |= VIDOUT_RGB_IF;
 	writel(val, ctx->addr + DECON_VIDOUTCON0);
 
-	val = VIDTCON2_LINEVAL(mode->vdisplay - 1) |
-		VIDTCON2_HOZVAL(mode->hdisplay - 1);
+	val = VIDTCON2_LINEVAL(m->vdisplay - 1) |
+		VIDTCON2_HOZVAL(m->hdisplay - 1);
 	writel(val, ctx->addr + DECON_VIDTCON2);
 
 	if (!ctx->i80_if) {
 		val = VIDTCON00_VBPD_F(
-				mode->crtc_vtotal - mode->crtc_vsync_end) |
+				m->crtc_vtotal - m->crtc_vsync_end - 1) |
 			VIDTCON00_VFPD_F(
-				mode->crtc_vsync_start - mode->crtc_vdisplay);
+				m->crtc_vsync_start - m->crtc_vdisplay - 1);
 		writel(val, ctx->addr + DECON_VIDTCON00);
 
 		val = VIDTCON01_VSPW_F(
-				mode->crtc_vsync_end - mode->crtc_vsync_start);
+				m->crtc_vsync_end - m->crtc_vsync_start - 1);
 		writel(val, ctx->addr + DECON_VIDTCON01);
 
 		val = VIDTCON10_HBPD_F(
-				mode->crtc_htotal - mode->crtc_hsync_end) |
+				m->crtc_htotal - m->crtc_hsync_end - 1) |
 			VIDTCON10_HFPD_F(
-				mode->crtc_hsync_start - mode->crtc_hdisplay);
+				m->crtc_hsync_start - m->crtc_hdisplay - 1);
 		writel(val, ctx->addr + DECON_VIDTCON10);
 
 		val = VIDTCON11_HSPW_F(
-				mode->crtc_hsync_end - mode->crtc_hsync_start);
+				m->crtc_hsync_end - m->crtc_hsync_start - 1);
 		writel(val, ctx->addr + DECON_VIDTCON11);
 	}
 
-- 
1.9.1

