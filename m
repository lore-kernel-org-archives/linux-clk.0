Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452543C9EE4
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353228; cv=none; b=iRVzQtPG4PLTs9lgq3a2dBdj7xJ9SRE8AuYdkLmnF+rGAkK/rQc+dXlMb0eA018Ksn/zrstkrkUR1Uopo5dn0Ew+EE3mjnuLIOJEUb7BEJ9vivJeJtQCgQ/9SkrW++UVIDu0y5lKfS21RlmCLxt6zsPgCesQAwIfeX9h5klLk28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353228; c=relaxed/simple;
	bh=L6dj0kDI2fqtZ2CWX89EK2nkipCryFY/CsWhogL/8pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdkifIT/eFhqpVhZKcfI/jMBGYAE4Q2zKZHSdqhdD3GpjcaKS9bYR6pAIAPjHjb7znJSzk09UTUrqzrnCFYu3c1xbvN+6fHBAArgjvhUKiEKgmpuYiTWYH/vafNgled0F5C8JDJl5SeNiXu6OG02Y1+w0jwNZYhMl4YzKvBuzGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHpZooOm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHpZooOm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44a5174670eso1719242f8f.1
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353225; x=1778958025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CrDBvKu/hcgSB1anyD1GXBKe06ZzlWC9+3i2f9q0bQ=;
        b=CHpZooOm4kN5IESlar1OK3ijgaGACVSaHzUKLXj2JKgbvVdPQdU4nNyZfedRnYip/8
         iiO+6D+7bfVAZeWgQlMjpeeA79zkbH8kyysCISs0gVcT+foi5+LvA2zvTv9f/fMn3wsc
         Bx+F9dEvT7E2wBc4xypncMJGnnoP1XnjICd2xyGcOBLvR7FNr5THGNi7m74YYxrYOAc2
         mb8Cr9RXyTQcUPBQsE8xAGPI5JKQPfm4nsFkAzuMk4JdQcT3WCvJ//WrEVQIq6/87cIu
         z3EvFY3SII0IVkHV9ggXbbp+jeHqDM0gvscQG1bWX4QAMkxWvx8/sD6fGDVgq8uNDeuo
         8I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353225; x=1778958025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+CrDBvKu/hcgSB1anyD1GXBKe06ZzlWC9+3i2f9q0bQ=;
        b=GYPpG4HCZb+c65IiprAv51kesTgYN1K2ExqIji9c5crXzF0GeKA4asp0bUIzCnsvI+
         qhse+SS9ytK7sTYa/btz22BqVcABDZoiKhj5YPkzSArOG5smzo9OsXn+42uDeY9rFGQ7
         M0c4HeS/3gcQmEYY0uJ5yZfxlC9RaEKq1jhli8TGg1lMVKNX13nd/Jp7lvY587BP3dUT
         G+HzI4Loqlp2ZmUh7k9xhyLtkcA4FmyT56JWeFNelkszyXdlHeDkUYqAlSx53AuACtt2
         8C2r+cv/LYe1Kjmr8JVTGGiVMJP6dByJcDoWT77TjVE0QqnH0T2PVCS6TYivyJAI9rP3
         6qJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eFYtflcbMZwvwDSl5nTYwNAIfMkkEL4diRrGgQx8BWsP+rZkYgvmcsxIcqe7d8ekOuJ22pRMNpLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3jjvQtCZuWK+CqE1PgHwIT3Tr6JvsxF8D4CDR+Jn0jSFInztI
	eSvDgQ4yk42eXkW0al4qsRiJAIAC1Io5Jd7+EVcngpdIfFWiqh8Pv/Ml
X-Gm-Gg: Acq92OGob4C8FQos9N8Ccv1yXVt4d5LE60qA4/hLpEBO562DNT8FQsFTKxDX3zRw4zy
	2eb2bmupIk1Tq8RHeYu4a7RTA9FZYdRoCEWJ8jkY5j02YGmxoW6DJc1RJ+zJTU0DesHIX1tVOO5
	XED5iQxAmDLv8E5brtr0eekfAo/DGhKG3m64L3ga3hr0eQdpTbNQUqTs/RFVbyn4L218rO6/8dr
	B3OifOpgTnFxcIqkblt6C5GfNflSDAmeGLK0uISkpJxIn9tthpjIcq9wkooFeMnAad/FwnQnxaj
	nkG+RzH5kB6j7slFdB9Oezk1Dr/CsPl0rcXfNOelTO6GYrIgUpklc3QdHGEzmkIRrDQvpEQt/93
	Y7IsaaA5zRfYZ8B+rJubZBsFvda9RJYMk4f2JA5s3w5z6KcAk7SwZZvTEokJ02hucUDHkBdwThs
	vrtXTs5v5JYyaczxdCjT28If2zDmVMgskpIpkeeMGBLYwW8fpgd+NuA8yI1AeyQ0gfjCg=
X-Received: by 2002:a05:6000:2910:b0:44d:821:1a0b with SMTP id ffacd0b85a97d-4515d3dc326mr27958440f8f.29.1778353224452;
        Sat, 09 May 2026 12:00:24 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:24 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v2 3/8] drm/sun4i: Add support for DE33 CSC
Date: Sat,  9 May 2026 21:00:10 +0200
Message-ID: <20260509190015.79086-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

DE33 has channel CSC units (for each plane separately) so pipeline can
be configured to output in desired colorspace.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- collected tag

 drivers/gpu/drm/sun4i/sun8i_csc.c | 71 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h |  5 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ce81c12f511d..70fc9b017d17 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -205,6 +205,72 @@ static void sun8i_de3_ccsc_setup(struct regmap *map, int layer,
 			   mask, val);
 }
 
+/* extract constant from high word and invert sign if necessary */
+static u32 sun8i_de33_ccsc_get_constant(u32 value)
+{
+	value >>= 16;
+
+	if (value & BIT(15))
+		return 0x400 - (value & 0x3ff);
+
+	return value;
+}
+
+static void sun8i_de33_convert_table(const u32 *src, u32 *dst)
+{
+	dst[0] = sun8i_de33_ccsc_get_constant(src[3]);
+	dst[1] = sun8i_de33_ccsc_get_constant(src[7]);
+	dst[2] = sun8i_de33_ccsc_get_constant(src[11]);
+	memcpy(&dst[3], src, sizeof(u32) * 12);
+	dst[6] &= 0xffff;
+	dst[10] &= 0xffff;
+	dst[14] &= 0xffff;
+}
+
+static void sun8i_de33_ccsc_setup(struct regmap *map, int layer,
+				  enum sun8i_csc_mode mode,
+				  enum drm_color_encoding encoding,
+				  enum drm_color_range range)
+{
+	u32 addr, val, base, csc[15];
+	const u32 *table;
+	int i;
+
+	table = yuv2rgb_de3[range][encoding];
+	base = DE33_CCSC_BASE + layer * DE33_CH_SIZE;
+
+	switch (mode) {
+	case SUN8I_CSC_MODE_OFF:
+		val = 0;
+		break;
+	case SUN8I_CSC_MODE_YUV2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		regmap_bulk_write(map, SUN50I_CSC_COEFF(base, 0), csc, 15);
+		break;
+	case SUN8I_CSC_MODE_YVU2RGB:
+		val = SUN8I_CSC_CTRL_EN;
+		sun8i_de33_convert_table(table, csc);
+		for (i = 0; i < 15; i++) {
+			addr = SUN50I_CSC_COEFF(base, i);
+			if (i > 3) {
+				if (((i - 3) & 3) == 1)
+					addr = SUN50I_CSC_COEFF(base, i + 1);
+				else if (((i - 3) & 3) == 2)
+					addr = SUN50I_CSC_COEFF(base, i - 1);
+			}
+			regmap_write(map, addr, csc[i]);
+		}
+		break;
+	default:
+		val = 0;
+		DRM_WARN("Wrong CSC mode specified.\n");
+		return;
+	}
+
+	regmap_write(map, SUN8I_CSC_CTRL(base), val);
+}
+
 static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 {
 	const struct drm_format_info *format;
@@ -238,6 +304,11 @@ void sun8i_csc_config(struct sun8i_layer *layer,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		sun8i_de33_ccsc_setup(layer->regs, layer->channel,
+				      mode, state->color_encoding,
+				      state->color_range);
+		return;
 	}
 
 	base = ccsc_base[layer->cfg->ccsc][layer->channel];
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index 2a4b79599610..d2ba5f8611aa 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -18,9 +18,14 @@ struct sun8i_layer;
 #define CCSC10_OFFSET 0xA0000
 #define CCSC11_OFFSET 0xF0000
 
+#define DE33_CCSC_BASE 0x800
+
 #define SUN8I_CSC_CTRL(base)		((base) + 0x0)
 #define SUN8I_CSC_COEFF(base, i)	((base) + 0x10 + 4 * (i))
 
+#define SUN50I_CSC_COEFF(base, i)	((base) + 0x04 + 4 * (i))
+#define SUN50I_CSC_ALPHA(base)		((base) + 0x40)
+
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
 void sun8i_csc_config(struct sun8i_layer *layer,
-- 
2.54.0

