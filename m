Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFA03CAE80
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353229; cv=none; b=pWFx+9+TvrH/RpL996djBu4eUqSlm1gAGIPHgDEyyQvx8BRwm5LLZmPwsto6eWJmKPMxt0gmXoEce2G8wEPRv8VJExY3Fa5lYuaTFNAXzMb/z4WlYJYd+kur4i5AdzdT1CsvVfeLVZrzCryoW/7k7GlUeI70yJsXiGEBQBY5HBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353229; c=relaxed/simple;
	bh=dJZiUI/nXwbVKeTyU5YlTJh5eS1vXANNoICbkU5BWMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isCwv8hwBjjqvdL1+pX27trP7VPnANBpbl+qviBMSKJmEzVsBtXtmsOlAhSg2sCMaqtLHAbdmAPPuffTxJMF02/R73rnyWGwJr9i9QlOlxdO9Y07ka9WqzkwAkQkCD8HntiQoer2+cDccE/LRpz/pI3PxDU6//FMF2ckM8mq1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAfn7DsJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAfn7DsJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449de065cb3so2793964f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353226; x=1778958026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=mAfn7DsJuE1lS8lGbqvF+gtkWlU/TsGy/CqufQjfeEA9W/jXxKCaHkQwFdKa67ESso
         yj1jhLqg2Xgx3+90wT8ohnK5GLjEheXlbHh1btbLJqgIM+sVSQINZLkiayiB6Z+YPUT9
         lnW1xrkJKFvRuS3YZRPpY5BdvNrDWvrw/SZDfWbu2AEY0y1hXaqCvUm9DiGK4XbdxE5g
         XKGK2jVbvY4rh7T2v/M017k2ae+6fwB8LrcY8nIgMGzaObAGeojriFlR1+DfOhb2VdTa
         /6v5VDBfaGk0ydDFHLkaT+rRaH9JinlZfZYgwdw02ITpNbZsn2J8QwZwTQpj7V+UG5xj
         onnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353226; x=1778958026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OFHSVkKikAqL7V5/tk/bF1gVjwq2bK7i4HjBHfLDqaU=;
        b=TARCTQ80Q/Qf2Wl42yCl3j6kG/a/jQPrakDvEkM2fGpOyFxcSjX0FAE2JPBrYm5mIn
         yBJDii5ThneYAwcBb2obVKgJehjvn/CiZjGoS1jQqEXj1x9ViQ5QwRkLG7Tmcusj4E0/
         zWo80q5avkhJ/L53sVm/ghwy30qyqgzPt6JERA/aQCn41V9BJXVCS/gi+5/ZIzj1rjIQ
         TEWFY7dz9BvYBl82o9goTLObkoFPD72INNP3t3oXgQ9V/skWBcJjQ6eABcuo2jxI/521
         4Eum0Z3o1H0KP0SzuDzelZbgK6ZzPjwYdLMAJ3AWEo0A6fJQ1O8VzYVVq1hUSGIF+0mY
         zgXw==
X-Forwarded-Encrypted: i=1; AFNElJ+rwU7ek46ZYpRFPSsi5fVx4t3XQoUnujH3t80bBHr0DYvGb6FKfTm8QfsSIfpmwlKlTz0lpbi/yQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YznRL+E2/AAjpg/mjpS7aN2fgwYrME6Y9KG4MSkbqmA1DS9GiPd
	ofbG8rxcSk0tYVD0x6co7qlXV+/su52m2LwAx3JrrDVwj6cflIGlCqed
X-Gm-Gg: Acq92OGHsJrkcGIPu2CWZipIadxcU3ckhywk52zIIIKEjvHBU8lBlX1ziET+tOVQQ9n
	64801QF9vkjFicmhBnQMJNI1SR+TLi2JLMBuq/1vtix8sLEUP2KgZCI2bk3lzgayB3x1I7rUuAM
	K0XBPK6CRsKJjShO0o8ic3sEns6fbbLmm1Rg8ZPLe//TE/E3ShZH5V+XKQrfjkjOFwXcdsy8Q1O
	f5Yn0GC2H+tJjFwVgHd3VAMPyR8c++DNUV9PpgHk72VXNxhIE0Zy1scf1F0+EefASzZc/wuTamb
	+VQY6hvb4qH994H3kPUmAXuZ90D3jXwluKYMx76+GKUNvUT0XtC0WcE6J9S1Fz8iM6fZdMY+lwL
	DJFQI7rmq+xNqEaBZrE32OELHgiCYqDWSEyuiwGXheQmoLYh5rQz6dHKTvLbuj0/NPGdp+O1ZDY
	wpaMXtmgdFf1+1Vha5ueri3RXbeDXB/5wuTivzrGmZHy+35hCY4c3N7KFrWmQrhJjibps=
X-Received: by 2002:a05:6000:40dc:b0:43d:309b:9c4f with SMTP id ffacd0b85a97d-4515b056c90mr27920879f8f.6.1778353225999;
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:25 -0700 (PDT)
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
Subject: [PATCH v2 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat,  9 May 2026 21:00:11 +0200
Message-ID: <20260509190015.79086-5-jernej.skrabec@siol.net>
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

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- collected tag
- generalize check to be dependant on scaler feature

 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 40 ++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index cd8d6c2da0c7..afbd41a18a0e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -380,6 +380,33 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+static const u32 sun8i_vi_layer_de3_no_yuv_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -410,8 +437,17 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->cfg = cfg;
 
 	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
-		formats = sun8i_vi_layer_de3_formats;
-		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		/*
+		 * TODO: DE33 drivers doesn't support scaling yet, which is a
+		 * requirement for YUV support.
+		 */
+		if (layer->cfg->scaler_mask & BIT(phy_index)) {
+			formats = sun8i_vi_layer_de3_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
+		} else {
+			formats = sun8i_vi_layer_de3_no_yuv_formats;
+			format_count = ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
+		}
 	} else {
 		formats = sun8i_vi_layer_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_formats);
-- 
2.54.0

