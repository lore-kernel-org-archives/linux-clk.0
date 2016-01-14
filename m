Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 01/26] reset: Move DT cell size check to the core
Date: Thu, 14 Jan 2016 16:24:44 +0100
Message-Id: <1452785109-6172-2-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The core currently doesn't check that the DT cell size matches what the
driver declares, which means that every xlate function needs to duplicate
that check.

Make sure that of_reset_control_get checks for this to avoid duplication
and errors.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/reset/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 7955e00d04d4..d53b2b980bdd 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -46,9 +46,6 @@ struct reset_control {
 static int of_reset_simple_xlate(struct reset_controller_dev *rcdev,
 			  const struct of_phandle_args *reset_spec)
 {
-	if (WARN_ON(reset_spec->args_count != rcdev->of_reset_n_cells))
-		return -EINVAL;
-
 	if (reset_spec->args[0] >= rcdev->nr_resets)
 		return -EINVAL;
 
@@ -182,6 +179,9 @@ struct reset_control *of_reset_control_get(struct device_node *node,
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
+	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells))
+		return ERR_PTR(-EINVAL);
+
 	rstc_id = rcdev->of_xlate(rcdev, &args);
 	if (rstc_id < 0) {
 		mutex_unlock(&reset_controller_list_mutex);
-- 
2.6.4
