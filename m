Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41110 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753347AbbJTJX0 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 20 Oct 2015 05:23:26 -0400
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
Subject: [PATCH 06/10] drm/exynos/decon5433: add function to set particular
 register bits
Date: Tue, 20 Oct 2015 11:22:37 +0200
Message-id: <1445332961-25419-7-git-send-email-a.hajda@samsung.com>
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The driver often sets only particular bits of configuration registers.
Using separate function to such action simplifies the code.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 69 ++++++++-------------------
 1 file changed, 19 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 83e0939..722c11a 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -62,6 +62,13 @@ static const uint32_t decon_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
+static inline void decon_set_bits(struct decon_context *ctx, u32 reg, u32 mask,
+				  u32 val)
+{
+	val = (val & mask) | (readl(ctx->addr + reg) & ~mask);
+	writel(val, ctx->addr + reg);
+}
+
 static int decon_enable_vblank(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
@@ -215,16 +222,8 @@ static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 static void decon_shadow_protect_win(struct decon_context *ctx, int win,
 					bool protect)
 {
-	u32 val;
-
-	val = readl(ctx->addr + DECON_SHADOWCON);
-
-	if (protect)
-		val |= SHADOWCON_Wx_PROTECT(win);
-	else
-		val &= ~SHADOWCON_Wx_PROTECT(win);
-
-	writel(val, ctx->addr + DECON_SHADOWCON);
+	decon_set_bits(ctx, DECON_SHADOWCON, SHADOWCON_Wx_PROTECT(win),
+		       protect ? ~0 : 0);
 }
 
 static void decon_atomic_begin(struct exynos_drm_crtc *crtc,
@@ -278,14 +277,10 @@ static void decon_update_plane(struct exynos_drm_crtc *crtc,
 	decon_win_set_pixfmt(ctx, win, state->fb);
 
 	/* window enable */
-	val = readl(ctx->addr + DECON_WINCONx(win));
-	val |= WINCONx_ENWIN_F;
-	writel(val, ctx->addr + DECON_WINCONx(win));
+	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, ~0);
 
 	/* standalone update */
-	val = readl(ctx->addr + DECON_UPDATE);
-	val |= STANDALONE_UPDATE_F;
-	writel(val, ctx->addr + DECON_UPDATE);
+	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 }
 
 static void decon_disable_plane(struct exynos_drm_crtc *crtc,
@@ -293,7 +288,6 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 {
 	struct decon_context *ctx = crtc->ctx;
 	unsigned int win = plane->zpos;
-	u32 val;
 
 	if (ctx->suspended)
 		return;
@@ -301,16 +295,12 @@ static void decon_disable_plane(struct exynos_drm_crtc *crtc,
 	decon_shadow_protect_win(ctx, win, true);
 
 	/* window disable */
-	val = readl(ctx->addr + DECON_WINCONx(win));
-	val &= ~WINCONx_ENWIN_F;
-	writel(val, ctx->addr + DECON_WINCONx(win));
+	decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
 
 	decon_shadow_protect_win(ctx, win, false);
 
 	/* standalone update */
-	val = readl(ctx->addr + DECON_UPDATE);
-	val |= STANDALONE_UPDATE_F;
-	writel(val, ctx->addr + DECON_UPDATE);
+	decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 }
 
 static void decon_atomic_flush(struct exynos_drm_crtc *crtc,
@@ -416,17 +406,12 @@ static void decon_disable(struct exynos_drm_crtc *crtc)
 void decon_te_irq_handler(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
-	u32 val;
 
 	if (!test_bit(BIT_CLKS_ENABLED, &ctx->enabled))
 		return;
 
-	if (atomic_add_unless(&ctx->win_updated, -1, 0)) {
-		/* trigger */
-		val = readl(ctx->addr + DECON_TRIGCON);
-		val |= TRIGCON_SWTRIGCMD;
-		writel(val, ctx->addr + DECON_TRIGCON);
-	}
+	if (atomic_add_unless(&ctx->win_updated, -1, 0))
+		decon_set_bits(ctx, DECON_TRIGCON, TRIGCON_SWTRIGCMD, ~0);
 
 	drm_crtc_handle_vblank(&ctx->crtc->base);
 }
@@ -435,7 +420,6 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 {
 	struct decon_context *ctx = crtc->ctx;
 	int win, i, ret;
-	u32 val;
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
@@ -446,25 +430,10 @@ static void decon_clear_channels(struct exynos_drm_crtc *crtc)
 	}
 
 	for (win = 0; win < WINDOWS_NR; win++) {
-		/* shadow update disable */
-		val = readl(ctx->addr + DECON_SHADOWCON);
-		val |= SHADOWCON_Wx_PROTECT(win);
-		writel(val, ctx->addr + DECON_SHADOWCON);
-
-		/* window disable */
-		val = readl(ctx->addr + DECON_WINCONx(win));
-		val &= ~WINCONx_ENWIN_F;
-		writel(val, ctx->addr + DECON_WINCONx(win));
-
-		/* shadow update enable */
-		val = readl(ctx->addr + DECON_SHADOWCON);
-		val &= ~SHADOWCON_Wx_PROTECT(win);
-		writel(val, ctx->addr + DECON_SHADOWCON);
-
-		/* standalone update */
-		val = readl(ctx->addr + DECON_UPDATE);
-		val |= STANDALONE_UPDATE_F;
-		writel(val, ctx->addr + DECON_UPDATE);
+		decon_shadow_protect_win(ctx, win, true);
+		decon_set_bits(ctx, DECON_WINCONx(win), WINCONx_ENWIN_F, 0);
+		decon_shadow_protect_win(ctx, win, false);
+		decon_set_bits(ctx, DECON_UPDATE, STANDALONE_UPDATE_F, ~0);
 	}
 	/* TODO: wait for possible vsync */
 	msleep(50);
-- 
1.9.1

