Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013DD216DFD
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876591; cv=none; b=CZsIbV2ULnn58Z+RLn4nwAtOu92DEEAfrUc9Tc4qPb8p+FE9BhHR0aealplPIfGuU+J7hOZrmRo1fZbwNEms9ejbg/+ngEfPzclq/0eQ8BsYxpgFVNygx3XxhRBLTNedNsjfI5Qa1BdGOWgL8K29/1H4nqKMPnHO8qq31ppAUdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876591; c=relaxed/simple;
	bh=28fr7uvMBpZYxXaf6t74o1B6u0IzpxyUUElRCfLdqK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fr+wY2xEYBgLR9l+jcEHs4pgf/JG9i2LzVWJNXAVIE4A6sbqLZemdig3uMMjeAFSYmGYuK7OiyU9NWH/zca8HlrIz0iqJSja4kSbogtDANL0NE/7XdU5aRN7kgTcJrTOYy8MWSWDT7Zh8pmSev4Sr1/8F3PR6jMXI+dVcqkI8EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CyPAcnns; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CyPAcnns"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1498847f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876584; x=1730481384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRFd61DSpngeCNNfWF0bSZlBVGY7r+lkqUcR/WDRUy8=;
        b=CyPAcnnsKxP8arfKKgfo6JiGfLj64y25GAefEGmyI6Sf1SsxypOcEE0VOs+MTymUa0
         zRiUFeBFmRRApE9NTLgQJLI/9TtO/1z59O1JD0UV52LbDqOsnDNxzPHK72bFH3PcCLIg
         +NVNqyYki85ruN8dh3gtUH2dAs99TTN//CcY6PhckbeF26Cp+uPaIFHRgUKT6yPv2dbT
         z7Hnd0Y3ORjz6GqJa4xMAyXUo4qE8xNpiMCQghqxMF55llnYd8etayWr4SlcX6u6mjud
         S9LlUyXy60FAVjg1A7GFwnCSz+3GW5OF6IAFrDwx9KxkVxSobIN/wkO8DXZcqZQqnMHt
         oh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876584; x=1730481384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRFd61DSpngeCNNfWF0bSZlBVGY7r+lkqUcR/WDRUy8=;
        b=Ah7Z72Fu4YObElW2th4Yv+NvIxUr3BjyQ/TO4D2TH/kY/q1kFY0XVQOkRSZ1vhD06A
         EBNPGBRDc7SlKLHQV55s1cxKhi7nKXqmkQvUSToj7jFaZVlZ2D0330JQ7bkqJV5BAbKq
         evWuiRro8cjdm6ZGK3YW9Rw5PDX4fKQxzZ6isE0Bd9OSKD1zGWxviqIMH6sUkUvosHXZ
         /uypspNDoYdS3XDFuMOhxOFihpoaMC+ckkJ2FLQsA44kpe5V8FcpIzU/66g+Ncy0p1np
         nOC7lSv+RRZmpAfFuCyb+0SP4SGH7rLXFEnG8aTCuZbrbBxNAMv7/jTJ3x1aT0+sdipS
         0IJw==
X-Forwarded-Encrypted: i=1; AJvYcCVo+NayqbuOltUjyfoejrp/iitDsx6zSZyzx9Wq8ZYQoE4qqV2+0e8253e4EUSRvV36d1dzATINuQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIlCKY5PGf5av8hi/ewHSeu+AR4AEJlAYsO3ZSYddFL2kJuIh
	rVrCyWexB0hq1BA298E+idvTp3n0EmvHV9vX8egjwalE66q4AQrVl2Edc8sHxcc=
X-Google-Smtp-Source: AGHT+IE5ggZ/+MnjT/M2pSrBXb7CHgqVlwXWTb2QVua+jciV8EenwyStxQYCUAAVVRcTsB77bKhFsQ==
X-Received: by 2002:a5d:6946:0:b0:37c:d2f0:7331 with SMTP id ffacd0b85a97d-38060fff529mr184356f8f.0.1729876584546;
        Fri, 25 Oct 2024 10:16:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:55 +0100
Subject: [PATCH v2 24/36] drm/vc4: plane: Add support for 2712 D-step.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-24-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

There are a few minor changes in the display list generation
for the D-step of the chip, so add them.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 72 ++++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_regs.h  |  9 ++++--
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 5749287f6e3c..205aea3ed419 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1134,25 +1134,53 @@ static u32 vc4_hvs4_get_alpha_blend_mode(struct drm_plane_state *state)
 
 static u32 vc4_hvs5_get_alpha_blend_mode(struct drm_plane_state *state)
 {
-	if (!state->fb->format->has_alpha)
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
-				     SCALER5_CTL2_ALPHA_MODE);
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	switch (state->pixel_blend_mode) {
-	case DRM_MODE_BLEND_PIXEL_NONE:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
-				     SCALER5_CTL2_ALPHA_MODE);
+	switch (vc4->gen) {
 	default:
-	case DRM_MODE_BLEND_PREMULTI:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
-				     SCALER5_CTL2_ALPHA_MODE) |
-			SCALER5_CTL2_ALPHA_PREMULT;
-	case DRM_MODE_BLEND_COVERAGE:
-		return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
-				     SCALER5_CTL2_ALPHA_MODE);
+	case VC4_GEN_5:
+	case VC4_GEN_6_C:
+		if (!state->fb->format->has_alpha)
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+					     SCALER5_CTL2_ALPHA_MODE);
+
+		switch (state->pixel_blend_mode) {
+		case DRM_MODE_BLEND_PIXEL_NONE:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_FIXED,
+					     SCALER5_CTL2_ALPHA_MODE);
+		default:
+		case DRM_MODE_BLEND_PREMULTI:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+					     SCALER5_CTL2_ALPHA_MODE) |
+				SCALER5_CTL2_ALPHA_PREMULT;
+		case DRM_MODE_BLEND_COVERAGE:
+			return VC4_SET_FIELD(SCALER5_CTL2_ALPHA_MODE_PIPELINE,
+					     SCALER5_CTL2_ALPHA_MODE);
+		}
+	case VC4_GEN_6_D:
+		/* 2712-D configures fixed alpha mode in CTL0 */
+		return state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ?
+			SCALER5_CTL2_ALPHA_PREMULT : 0;
 	}
 }
 
+static u32 vc4_hvs6_get_alpha_mask_mode(struct drm_plane_state *state)
+{
+	struct drm_device *dev = state->state->dev;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
+
+	WARN_ON_ONCE(vc4->gen != VC4_GEN_6_C && vc4->gen != VC4_GEN_6_D);
+
+	if (vc4->gen == VC4_GEN_6_D &&
+	    (!state->fb->format->has_alpha ||
+	     state->pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE))
+		return VC4_SET_FIELD(SCALER6D_CTL0_ALPHA_MASK_FIXED,
+				     SCALER6_CTL0_ALPHA_MASK);
+
+	return VC4_SET_FIELD(SCALER6_CTL0_ALPHA_MASK_NONE, SCALER6_CTL0_ALPHA_MASK);
+}
+
 /* Writes out a full display list for an active plane to the plane's
  * private dlist state.
  */
@@ -1645,14 +1673,13 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 static u32 vc6_plane_get_csc_mode(struct vc4_plane_state *vc4_state)
 {
 	struct drm_plane_state *state = &vc4_state->base;
+	struct vc4_dev *vc4 = to_vc4_dev(state->plane->dev);
 	u32 ret = 0;
 
 	if (vc4_state->is_yuv) {
 		enum drm_color_encoding color_encoding = state->color_encoding;
 		enum drm_color_range color_range = state->color_range;
 
-		ret |= SCALER6_CTL2_CSC_ENABLE;
-
 		/* CSC pre-loaded with:
 		 * 0 = BT601 limited range
 		 * 1 = BT709 limited range
@@ -1666,8 +1693,15 @@ static u32 vc6_plane_get_csc_mode(struct vc4_plane_state *vc4_state)
 		if (color_range > DRM_COLOR_YCBCR_FULL_RANGE)
 			color_range = DRM_COLOR_YCBCR_LIMITED_RANGE;
 
-		ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
-				     SCALER6_CTL2_BRCM_CFC_CONTROL);
+		if (vc4->gen == VC4_GEN_6_C) {
+			ret |= SCALER6C_CTL2_CSC_ENABLE;
+			ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
+					     SCALER6C_CTL2_BRCM_CFC_CONTROL);
+		} else {
+			ret |= SCALER6D_CTL2_CSC_ENABLE;
+			ret |= VC4_SET_FIELD(color_encoding + (color_range * 3),
+					     SCALER6D_CTL2_BRCM_CFC_CONTROL);
+		}
 	}
 
 	return ret;
@@ -1880,7 +1914,7 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 	vc4_dlist_write(vc4_state,
 			SCALER6_CTL0_VALID |
 			VC4_SET_FIELD(tiling, SCALER6_CTL0_ADDR_MODE) |
-			VC4_SET_FIELD(0, SCALER6_CTL0_ALPHA_MASK) |
+			vc4_hvs6_get_alpha_mask_mode(state) |
 			(vc4_state->is_unity ? SCALER6_CTL0_UNITY : 0) |
 			VC4_SET_FIELD(format->pixel_order_hvs5, SCALER6_CTL0_ORDERRGBA) |
 			VC4_SET_FIELD(scl1, SCALER6_CTL0_SCL1_MODE) |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 0efe340f99d4..0046bdb7ca32 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -1194,6 +1194,9 @@ enum hvs_pixel_format {
 #define SCALER5_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
 #define SCALER5_CTL2_ALPHA_SHIFT		4
 
+#define SCALER6D_CTL2_CSC_ENABLE		BIT(19)
+#define SCALER6D_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(22, 20)
+
 #define SCALER_POS1_SCL_HEIGHT_MASK		VC4_MASK(27, 16)
 #define SCALER_POS1_SCL_HEIGHT_SHIFT		16
 
@@ -1347,6 +1350,8 @@ enum hvs_pixel_format {
 #define SCALER6_CTL0_ADDR_MODE_UIF		4
 
 #define SCALER6_CTL0_ALPHA_MASK_MASK		VC4_MASK(19, 18)
+#define SCALER6_CTL0_ALPHA_MASK_NONE		0
+#define SCALER6D_CTL0_ALPHA_MASK_FIXED		3
 #define SCALER6_CTL0_UNITY			BIT(15)
 #define SCALER6_CTL0_ORDERRGBA_MASK		VC4_MASK(14, 13)
 #define SCALER6_CTL0_SCL1_MODE_MASK		VC4_MASK(10, 8)
@@ -1361,8 +1366,8 @@ enum hvs_pixel_format {
 #define SCALER6_CTL2_ALPHA_PREMULT		BIT(29)
 #define SCALER6_CTL2_ALPHA_MIX			BIT(28)
 #define SCALER6_CTL2_BFG			BIT(26)
-#define SCALER6_CTL2_CSC_ENABLE			BIT(25)
-#define SCALER6_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(18, 16)
+#define SCALER6C_CTL2_CSC_ENABLE		BIT(25)
+#define SCALER6C_CTL2_BRCM_CFC_CONTROL_MASK	VC4_MASK(18, 16)
 #define SCALER6_CTL2_ALPHA_MASK			VC4_MASK(15, 4)
 
 #define SCALER6_POS1_SCL_LINES_MASK		VC4_MASK(28, 16)

-- 
2.34.1

