Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733114F9C4;
	Sun, 16 Feb 2025 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696147; cv=none; b=Lw009eDn3kD0PCjNA5KNaktf/vqLCfgo2ZlX6uEX1MB9vu5c1NSLBsxaWbx2UAnNNxtd+qRu7kTIblIzFiIstBHSGkFlOH+tvqDV2LBoqJK7HFJ/HQrCQNPh5WN3XGIKElMBijCILz1yyoxw4KuL53NdQ9ZdtZMn5zY49Mde56o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696147; c=relaxed/simple;
	bh=fghv2jcR5WF+wEohYcG7O8yEObk1xs2lk1kf1iC8kuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iClSxI77Y6YeMllVcGN57kmZPAhTRgOCRN9dM07tZvMbOWkxRByaxBn/9kGh2ebYtkFiF/KT/5fDAkEMPl+tTSU1W50X5dTFI31PYkembJ/SSo/EOv7Wn7DCkDHfl23QBKDs7dH1r8kqdGHZqNQOoiJ9NhOHarwYOAvO3tKammo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=KroW6sx9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RG2qU8/U; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="KroW6sx9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RG2qU8/U"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id C90C611400FA;
	Sun, 16 Feb 2025 03:55:44 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 16 Feb 2025 03:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696144; x=
	1739782544; bh=oCv7Nw4cxeILjr/gqRsALtNFefeEHiqf5aAWTZSsDw0=; b=K
	roW6sx92fw3O9T4dGMW5T04+njChfp4QKeEqQInusQIE2K5FZ+bgX8oZukyzMD+d
	O87RhMysvvnogiMdBWbUVfksx9ZB122RgE6mo/dsMPaHm6ut5NMbX6FTTbjMcfsr
	E6QHI+izGztY5HFb5I3/dRw7u5puMS3HCMlcRH65bDKwPD2AfkFPeCrYmPwykoOu
	N80+SmBLCibJXpsVPCN005ZUNQEqTT6uNRHohcna51ZAK0Gg5a1pUy1XIMbt00Tb
	scytLJFBst+GrnlZPrk0piPnLrm5oOQMWVmTwFsX7Yz5EGWrSH3Dpih+9mqNG8RN
	hxPc9q61rq5wTAqKuFgow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696144; x=1739782544; bh=o
	Cv7Nw4cxeILjr/gqRsALtNFefeEHiqf5aAWTZSsDw0=; b=RG2qU8/UpPqpMLC6v
	s5aNRrRGlRBuwsNJUDxD2XMfdbc4NLj4h569YvQh2Jxb7KX8WAzi0kxTNPVMTeVI
	PVLP86vcvOSstOfOI+9xuqyLcXgk9vRNDmNOH2q+iWyKo4DiqNvE+xU46NXjGruN
	V3LmWJFADXbE76V/6WlZlWCiLYdTPpf7vuV5yZyZ28p39MTOVTTRBU+vDCsmab8Z
	MGec6zmi3aC7HEdCuiOZa0wygKvKS9zTvPLDZW3wsJVgoR2WMwFHMmwLAXkoIa9o
	QLSVm9i2zMwIYiE8bTzrQykPE6xq4Xbi4f5r5FJg1CeNQNALhG1BDTnqIswp+E7o
	38QTQ==
X-ME-Sender: <xms:EKixZ30BeTOWsnhsmBcqjZclTy5BXtwKudIclOp92_To8ZQJk_GWzA>
    <xme:EKixZ2EMDq-AK6iCvAZBeJ5bgbegeuntzbV7dRJteK6as2GICfRY8cxd4LTnuQ7Po
    J8O276OML2GOZK89Q>
X-ME-Received: <xmr:EKixZ37D5qZ6RoO_o4bMF_tdJ759gy2c2iGLbzFA6KF6F4HxgGhTbNA_DSsEBvQq5fj6UYxBl9GbT8g84slFqiqVowrCJoBzZ7OvschIsPuW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:EKixZ83c7yRUO81ImRxhA0v8Pe8hD9tf2m9z0uBaraoBfkra5YCgQg>
    <xmx:EKixZ6H1wMnJ7hFeHiVfnEB65_IrJympOy1Xfmxjk6EP62qwcsMbhg>
    <xmx:EKixZ9_XKdP3czgDU3Y-3jAMtuvBnskxI61MEbZKfylV2EdzyRbomQ>
    <xmx:EKixZ3nV9FZfyfnBT0iW3g30MVjKNZSsy7sMfhKCpEXUksbjr3Bpwg>
    <xmx:EKixZ6U8G9EnUWoBH61t8MwHIP8S4_Hsd5aQ3vsIrMQtW5da7rDm4fwM>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:55:37 -0500 (EST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v6 01/27] drm: sun4i: de2/de3: Change CSC argument
Date: Sun, 16 Feb 2025 21:50:32 +1300
Message-ID: <20250216085432.6373-3-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Currently, CSC module takes care only for converting YUV to RGB.
However, DE3 is more suited to work in YUV color space. Change CSC mode
argument to format type to be more neutral. New argument only tells
layer format type and doesn't imply output type.

This commit doesn't make any functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

--
Changelog v5..v6:
- Rename format enum from format_type to sun8i_format_type
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
 drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index 58480d8e4f704..a96de701c3304 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -108,7 +108,7 @@ static const u32 yuv2rgb_de3[2][3][12] = {
 };
 
 static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
-				       enum sun8i_csc_mode mode,
+				       enum sun8i_format_type fmt_type,
 				       enum drm_color_encoding encoding,
 				       enum drm_color_range range)
 {
@@ -118,12 +118,12 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 
 	table = yuv2rgb[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		base_reg = SUN8I_CSC_COEFF(base, 0);
 		regmap_bulk_write(map, base_reg, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				base_reg = SUN8I_CSC_COEFF(base, i + 1);
@@ -141,7 +141,7 @@ static void sun8i_csc_set_coefficients(struct regmap *map, u32 base,
 }
 
 static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
-					    enum sun8i_csc_mode mode,
+					    enum sun8i_format_type fmt_type,
 					    enum drm_color_encoding encoding,
 					    enum drm_color_range range)
 {
@@ -151,12 +151,12 @@ static void sun8i_de3_ccsc_set_coefficients(struct regmap *map, int layer,
 
 	table = yuv2rgb_de3[range][encoding];
 
-	switch (mode) {
-	case SUN8I_CSC_MODE_YUV2RGB:
+	switch (fmt_type) {
+	case FORMAT_TYPE_YUV:
 		addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE, layer, 0);
 		regmap_bulk_write(map, addr, table, 12);
 		break;
-	case SUN8I_CSC_MODE_YVU2RGB:
+	case FORMAT_TYPE_YVU:
 		for (i = 0; i < 12; i++) {
 			if ((i & 3) == 1)
 				addr = SUN50I_MIXER_BLEND_CSC_COEFF(DE3_BLD_BASE,
@@ -206,7 +206,7 @@ static void sun8i_de3_ccsc_enable(struct regmap *map, int layer, bool enable)
 }
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum sun8i_format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range)
 {
@@ -214,14 +214,14 @@ void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
 
 	if (mixer->cfg->is_de3) {
 		sun8i_de3_ccsc_set_coefficients(mixer->engine.regs, layer,
-						mode, encoding, range);
+						fmt_type, encoding, range);
 		return;
 	}
 
 	base = ccsc_base[mixer->cfg->ccsc][layer];
 
 	sun8i_csc_set_coefficients(mixer->engine.regs, base,
-				   mode, encoding, range);
+				   fmt_type, encoding, range);
 }
 
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 828b86fd0cabb..e35e0ac951022 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -22,14 +22,14 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-enum sun8i_csc_mode {
-	SUN8I_CSC_MODE_OFF,
-	SUN8I_CSC_MODE_YUV2RGB,
-	SUN8I_CSC_MODE_YVU2RGB,
+enum sun8i_format_type {
+	FORMAT_TYPE_RGB,
+	FORMAT_TYPE_YUV,
+	FORMAT_TYPE_YVU,
 };
 
 void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
-				     enum sun8i_csc_mode mode,
+				     enum sun8i_format_type fmt_type,
 				     enum drm_color_encoding encoding,
 				     enum drm_color_range range);
 void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 9c09d9c08496d..8a80934e928fe 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -193,19 +193,19 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	return 0;
 }
 
-static u32 sun8i_vi_layer_get_csc_mode(const struct drm_format_info *format)
+static u32 sun8i_vi_layer_get_format_type(const struct drm_format_info *format)
 {
 	if (!format->is_yuv)
-		return SUN8I_CSC_MODE_OFF;
+		return FORMAT_TYPE_RGB;
 
 	switch (format->format) {
 	case DRM_FORMAT_YVU411:
 	case DRM_FORMAT_YVU420:
 	case DRM_FORMAT_YVU422:
 	case DRM_FORMAT_YVU444:
-		return SUN8I_CSC_MODE_YVU2RGB;
+		return FORMAT_TYPE_YVU;
 	default:
-		return SUN8I_CSC_MODE_YUV2RGB;
+		return FORMAT_TYPE_YUV;
 	}
 }
 
@@ -213,7 +213,7 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 					 int overlay, struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
-	u32 val, ch_base, csc_mode, hw_fmt;
+	u32 val, ch_base, fmt_type, hw_fmt;
 	const struct drm_format_info *fmt;
 	int ret;
 
@@ -231,9 +231,9 @@ static int sun8i_vi_layer_update_formats(struct sun8i_mixer *mixer, int channel,
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
 			   SUN8I_MIXER_CHAN_VI_LAYER_ATTR_FBFMT_MASK, val);
 
-	csc_mode = sun8i_vi_layer_get_csc_mode(fmt);
-	if (csc_mode != SUN8I_CSC_MODE_OFF) {
-		sun8i_csc_set_ccsc_coefficients(mixer, channel, csc_mode,
+	fmt_type = sun8i_vi_layer_get_format_type(fmt);
+	if (fmt_type != FORMAT_TYPE_RGB) {
+		sun8i_csc_set_ccsc_coefficients(mixer, channel, fmt_type,
 						state->color_encoding,
 						state->color_range);
 		sun8i_csc_enable_ccsc(mixer, channel, true);
-- 
2.48.1

