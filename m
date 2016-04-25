Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v4 03/11] drm: fb: Add seq_file definition
Date: Mon, 25 Apr 2016 15:22:44 +0200
Message-Id: <1461590572-4027-4-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Otherwise, building with DEBUG_FS enabled will trigger a build warning
because we're using a structure that has not been declared.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 include/drm/drm_fb_cma_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_cma_helper.h
index be62bd321e75..ae49c24fbf50 100644
--- a/include/drm/drm_fb_cma_helper.h
+++ b/include/drm/drm_fb_cma_helper.h
@@ -24,6 +24,8 @@ struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
 	unsigned int plane);
 
 #ifdef CONFIG_DEBUG_FS
+struct seq_file;
+
 int drm_fb_cma_debugfs_show(struct seq_file *m, void *arg);
 #endif
 
-- 
2.8.1
