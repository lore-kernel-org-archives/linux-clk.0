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
Subject: [PATCH v2 02/26] reset: Make reset_control_ops const
Date: Thu, 14 Jan 2016 16:24:45 +0100
Message-Id: <1452785109-6172-3-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The ops pointer is holding a pointer to a structure that is usually not
modified. Make it const.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 include/linux/reset-controller.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index ce6b962ffed4..a3a5bcdb1d02 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -38,7 +38,7 @@ struct of_phandle_args;
  * @nr_resets: number of reset controls in this reset controller device
  */
 struct reset_controller_dev {
-	struct reset_control_ops *ops;
+	const struct reset_control_ops *ops;
 	struct module *owner;
 	struct list_head list;
 	struct device_node *of_node;
-- 
2.6.4
