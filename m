Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:52132 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751269AbdFBKKi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 2 Jun 2017 06:10:38 -0400
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH 08/19] drm/sun4i: hdmi: Support the TMDS clock in the A31's HDMI controller
Date: Fri,  2 Jun 2017 18:10:13 +0800
Message-Id: <20170602101024.18940-9-wens@csie.org>
In-Reply-To: <20170602101024.18940-1-wens@csie.org>
References: <20170602101024.18940-1-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The A31's HDMI controller's TMDS clock is slightly different.
There is an offset of 1 between the divider value and the actual
value programmed into the registers.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi.h          | 1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index 2f2f2ff1ea63..3a4987ab8da8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -153,5 +153,6 @@ struct sun4i_hdmi {
 
 int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
 int sun4i_tmds_create(struct sun4i_hdmi *hdmi);
+int sun6i_tmds_create(struct sun4i_hdmi *hdmi);
 
 #endif /* _SUN4I_HDMI_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index 3c304e1fbe3b..6f25c7bd887e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -240,3 +240,10 @@ int sun4i_tmds_create(struct sun4i_hdmi *hdmi)
 {
 	return _sun4i_tmds_create(hdmi, 0);
 }
+
+/* sun6i variant has a different value offset for the divider */
+
+int sun6i_tmds_create(struct sun4i_hdmi *hdmi)
+{
+	return _sun4i_tmds_create(hdmi, 1);
+}
-- 
2.11.0

