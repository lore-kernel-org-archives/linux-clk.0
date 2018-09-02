Return-Path: <jernej.skrabec@siol.net>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: robh+dt@kernel.org,
	maxime.ripard@bootlin.com,
	wens@csie.org
Cc: mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	airlied@linux.ie,
	architt@codeaurora.org,
	a.hajda@samsung.com,
	jernej.skrabec@siol.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 15/27] drm/sun4i: Not all DW HDMI controllers has scrambled addresses
Date: Sun,  2 Sep 2018 09:26:31 +0200
Message-Id: <20180902072643.4917-16-jernej.skrabec@siol.net>
In-Reply-To: <20180902072643.4917-1-jernej.skrabec@siol.net>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
List-ID: <linux-clk.vger.kernel.org>

Currently supported Allwinner SoCs with DW HDMI controller have
scrambled addresses and read lock. However, that is not true in general.
For example, A80 and H6 have normal addresses and normal read access.

Move code for unscrambling addresses and unlocking read access to it's
own function and call it from init function.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 82502b351aec..ad4ba1cc83b4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -279,8 +279,21 @@ static const struct dw_hdmi_phy_ops sun8i_hdmi_phy_ops = {
 	.setup_hpd = &dw_hdmi_phy_setup_hpd,
 };
 
+static void sun8i_hdmi_phy_unlock(struct sun8i_hdmi_phy *phy)
+{
+	/* enable read access to HDMI controller */
+	regmap_write(phy->regs, SUN8I_HDMI_PHY_READ_EN_REG,
+		     SUN8I_HDMI_PHY_READ_EN_MAGIC);
+
+	/* unscramble register offsets */
+	regmap_write(phy->regs, SUN8I_HDMI_PHY_UNSCRAMBLE_REG,
+		     SUN8I_HDMI_PHY_UNSCRAMBLE_MAGIC);
+}
+
 static void sun8i_hdmi_phy_init_a83t(struct sun8i_hdmi_phy *phy)
 {
+	sun8i_hdmi_phy_unlock(phy);
+
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_DBG_CTRL_REG,
 			   SUN8I_HDMI_PHY_DBG_CTRL_PX_LOCK,
 			   SUN8I_HDMI_PHY_DBG_CTRL_PX_LOCK);
@@ -298,6 +311,8 @@ static void sun8i_hdmi_phy_init_h3(struct sun8i_hdmi_phy *phy)
 {
 	unsigned int val;
 
+	sun8i_hdmi_phy_unlock(phy);
+
 	regmap_write(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG, 0);
 	regmap_update_bits(phy->regs, SUN8I_HDMI_PHY_ANA_CFG1_REG,
 			   SUN8I_HDMI_PHY_ANA_CFG1_ENBI,
@@ -372,14 +387,6 @@ static void sun8i_hdmi_phy_init_h3(struct sun8i_hdmi_phy *phy)
 
 void sun8i_hdmi_phy_init(struct sun8i_hdmi_phy *phy)
 {
-	/* enable read access to HDMI controller */
-	regmap_write(phy->regs, SUN8I_HDMI_PHY_READ_EN_REG,
-		     SUN8I_HDMI_PHY_READ_EN_MAGIC);
-
-	/* unscramble register offsets */
-	regmap_write(phy->regs, SUN8I_HDMI_PHY_UNSCRAMBLE_REG,
-		     SUN8I_HDMI_PHY_UNSCRAMBLE_MAGIC);
-
 	phy->variant->phy_init(phy);
 }
 
-- 
2.18.0
