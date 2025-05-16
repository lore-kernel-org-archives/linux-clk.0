Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A99235066;
	Fri, 16 May 2025 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392751; cv=none; b=gDsNUMZO/7adbPZb/GdUvHbgCWgOjWfOMLfOJrQSAvIDOSA3nEyB0vFIulxkxOYhYU3qILZ4OmlnoOOjSioO3y62rdi0jasRwqOlCnTFp/u97JrBMZnhRE6+eYVA6mb+ToKw3Z/N7+UInmy2jk1gxETsKz7QXVJh/1dkp6SfenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392751; c=relaxed/simple;
	bh=aF1Jix7qBS4eAEkvvaop8tJ5gqjlK7qFo4ruxeNi96I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PsqVSe2Md7amp/1yhWq4qTozvGxzWUqs9oWfSaHE50cez1+okoMuV24xE3Qopwh31IUYKCBirjPlLw3ysZi/CZOe0E4WBa0nbFj+yqqiU7q/ZdcGIRs2jYoUnmwdRXGhHEDI7sobfxrdjGwqxaVHbulUP4a4z+WaKohS+DERB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=KpzP9BF1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=h4Yn0oZB; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="KpzP9BF1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="h4Yn0oZB"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id EF31211400D8;
	Fri, 16 May 2025 06:52:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 16 May 2025 06:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1747392746; x=
	1747479146; bh=NNUdNyPdjnoE399zpqVY7qkaeyBlyn6l+DNHkjQNyIg=; b=K
	pzP9BF171NnJz8BhJU3hdIGnd9pO6fqAcsElAF18NMA6NMvYBL8x9FgWmXigx1NU
	NR8Kwxo1Dq//xyvh8cX357JaABEAPkqI74JJLSw7DphlJZRI540m0ZKVdHV1+HaH
	BDtWd2O6G/9JvoNmNSM8UFPqj9WOPjvvwK/tRclVfkmM5ljsczH76ugRY8tY+/od
	K+PrqZarPllj/X4bxbsjP/BgScRWo2BZX5i4EqVovXUL4F+T3gakroiL1aLt9w53
	xQ3YysoJ1Cec/dk/nrrMUQwxDv6J/WUD2qqrG7QbKrYtWKd3uSdG2pSxrfDFwoBi
	jvpGGyFFbWvu5ihtA/iMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747392746; x=1747479146; bh=N
	NUdNyPdjnoE399zpqVY7qkaeyBlyn6l+DNHkjQNyIg=; b=h4Yn0oZBEfy2KGfY+
	LMfHsSWO/dZRUKyiCYClbth0Wx4UU6JPdObi6EVQUfRbhbHzS7tciBpS15PSwUOf
	vPNb1Y3EK0blMHHh9X6kOMZrTfy+Upt1K/SDBNeeD8qop9dJAYJq5lpCuCKMVuFo
	j8EpcsoQ5DxVIQFQd1X1EKZfBVJritR98VPyxslZ3afflmZkTdQK5Th7abU3XX4L
	S4yRbQhcsH3VZhzk1jwj7v4XqpnmZ1BpBQqJKIppsDNPSxbrv2qurd4PtupN/mWZ
	zpPyK4eOnbEp/Y7n/VhLe211lRt53rZj1X94U2DPV3Ws0MZ6nVJZVEwVwXXtp8HE
	gL8EQ==
X-ME-Sender: <xms:6hgnaIuidT_-nAoL7xukREzHg8UmJ0aJdBv3fG2shnVb1Pw1u0jzhg>
    <xme:6hgnaFczOV-GpYX9vs59B4mRN1-1t0S2xeEXGIzK_PKdcLNOXxhRbN8ZYtQKcuErl
    RKAq5I7mPQ0rHNCIw>
X-ME-Received: <xmr:6hgnaDxeD63pNSiFDeVGNFJP125rJ4H8lDnqC6oSLXX0QMFPfl0zHkm6ROitxbnH6F5rp5lPWOIbTwGIK6U9Lkp1JAfQiDigT_mEcgQlarl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgrsh
    htrdgtohhmqeenucggtffrrghtthgvrhhnpeffheeiffegtdfgffejteevgeefkeelieel
    keevueetffetteduffevgeeiieehteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghr
    tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrhhiphgrrh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhr
    tghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlh
    drtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghp
    thhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlh
    esfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprh
    gtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6hgnaLNzaKoA60_LPh8HfUzi3x0nUwW0CBdpk4J6wQ7OmEQiddiy3g>
    <xmx:6hgnaI_Zs4WFzFOFy6_8oNFQWV6oXT15J14gWAoCdG0RcVb_MoLHtQ>
    <xmx:6hgnaDW4xJW3ADUhQQxoptRzS7zfeWbqRE6DNZuwNJGv0X6xtOSwNA>
    <xmx:6hgnaBeeu7vf78nX8q69Y47Ulk-8ayulAxdMYtjlBBqPlTN67nOL5w>
    <xmx:6hgnaNDMdUCsxObMkDzhxY18PFqAYiaJV9y4sGaSc88HR6wogk1gSrgw>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 06:52:19 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33) support
Date: Fri, 16 May 2025 22:44:23 +1200
Message-ID: <20250516105101.11650-7-ryan@testtoast.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516105101.11650-1-ryan@testtoast.com>
References: <20250516105101.11650-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The DE33 is a newer version of the Allwinner Display Engine IP block,
found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
supported by the mainline driver.

Notable features (from the H616 datasheet and implemented):
- 4096 x 2048 (4K) output support

Other features (implemented but not in this patchset):
- AFBC ARM Frame Buffer Compression support
- YUV pipeline support

The DE2 and DE3 engines have a blender register range within the
mixer engine register map, whereas the DE33 separates this out into
a separate display group, and adds a top register map.

The DE33 also appears to remove the global double buffer control
register, present in the DE2 and DE3.

Extend the mixer to support the DE33.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>

---
Changelog v4..v5:
- Whitespace fixes
- Correct strict mode warnings from checkpatch.pl

Changelog v7..v8:
- Add top/disp regmaps to mixer for DE33
- Remove YUV-specific code
- Remove use of global double buffer
- Remove unneeded if/then parentheses and fix an alignment issue as suggested by checkpatch.pl

Changelog v9..v10:
- Use names from vendor BSP kernel for register blocks.

Changelog v10..v11:
- move before vi_scaler patch as vi_scaler code references new DE33 enum.

Changelog v10..v11:
- Convert de_type enum to uppercase
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 82 +++++++++++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 15 +++++-
 2 files changed, 84 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 86e5211a843b..13e712382010 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -318,8 +318,9 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
-		     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
+	if (mixer->cfg->de_type != SUN8I_MIXER_DE33)
+		regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
+			     SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
 }
 
 static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
@@ -368,25 +369,31 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	struct regmap *bld_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
+	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
 	DRM_DEBUG_DRIVER("Updating global size W: %u H: %u\n",
 			 mode->hdisplay, mode->vdisplay);
 
-	regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_SIZE, size);
-	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		regmap_write(mixer->top_regs, SUN50I_MIXER_GLOBAL_SIZE, size);
+	else
+		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
+
+	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -400,12 +407,29 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 };
 
 static const struct regmap_config sun8i_mixer_regmap_config = {
+	.name		= "layers",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
 	.max_register	= 0xffffc, /* guessed */
 };
 
+static const struct regmap_config sun8i_top_regmap_config = {
+	.name		= "top",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x3c,
+};
+
+static const struct regmap_config sun8i_disp_regmap_config = {
+	.name		= "display",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x20000,
+};
+
 static int sun8i_mixer_of_get_id(struct device_node *node)
 {
 	struct device_node *ep, *remote;
@@ -428,33 +452,45 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
+	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
 	int plane_cnt, i;
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		top_regs = mixer->top_regs;
+		disp_regs = mixer->disp_regs;
+	} else {
+		top_regs = mixer->engine.regs;
+		disp_regs = mixer->engine.regs;
+	}
+
 	/* Enable the mixer */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
+	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
 		     SUN8I_MIXER_GLOBAL_CTL_RT_EN);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
+
 	/* Set background color to black */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(mixer->engine.regs,
+		regmap_write(disp_regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -526,6 +562,30 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 		return PTR_ERR(mixer->engine.regs);
 	}
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		regs = devm_platform_ioremap_resource_byname(pdev, "top");
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->top_regs = devm_regmap_init_mmio(dev, regs,
+							&sun8i_top_regmap_config);
+		if (IS_ERR(mixer->top_regs)) {
+			dev_err(dev, "Couldn't create the top regmap\n");
+			return PTR_ERR(mixer->top_regs);
+		}
+
+		regs = devm_platform_ioremap_resource_byname(pdev, "display");
+		if (IS_ERR(regs))
+			return PTR_ERR(regs);
+
+		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
+							 &sun8i_disp_regmap_config);
+		if (IS_ERR(mixer->disp_regs)) {
+			dev_err(dev, "Couldn't create the disp regmap\n");
+			return PTR_ERR(mixer->disp_regs);
+		}
+	}
+
 	mixer->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(mixer->reset)) {
 		dev_err(dev, "Couldn't get our reset line\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index b75008d05fc9..870f9b9daf0d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -21,6 +21,9 @@
 #define SUN8I_MIXER_GLOBAL_DBUFF		0x8
 #define SUN8I_MIXER_GLOBAL_SIZE			0xc
 
+#define SUN50I_MIXER_GLOBAL_SIZE		0x8
+#define SUN50I_MIXER_GLOBAL_CLK			0xc
+
 #define SUN8I_MIXER_GLOBAL_CTL_RT_EN		BIT(0)
 
 #define SUN8I_MIXER_GLOBAL_DBUFF_ENABLE		BIT(0)
@@ -154,6 +157,7 @@ enum {
 enum sun8i_mixer_type {
 	SUN8I_MIXER_DE2,
 	SUN8I_MIXER_DE3,
+	SUN8I_MIXER_DE33,
 };
 
 /**
@@ -178,6 +182,7 @@ struct sun8i_mixer_cfg {
 	unsigned long	mod_rate;
 	unsigned int	de_type;
 	unsigned int	scanline_yuv;
+	unsigned int	map[6];
 };
 
 struct sun8i_mixer {
@@ -189,6 +194,9 @@ struct sun8i_mixer {
 
 	struct clk			*bus_clk;
 	struct clk			*mod_clk;
+
+	struct regmap			*top_regs;
+	struct regmap			*disp_regs;
 };
 
 enum {
@@ -225,13 +233,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 static inline struct regmap *
 sun8i_blender_regmap(struct sun8i_mixer *mixer)
 {
-	return mixer->engine.regs;
+	return mixer->cfg->de_type == SUN8I_MIXER_DE33 ?
+		mixer->disp_regs : mixer->engine.regs;
 }
 
 static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
 		return DE2_CH_BASE + channel * DE2_CH_SIZE;
-- 
2.49.0

