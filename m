Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB89212197
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876583; cv=none; b=faFS3Qr1OtEkA7b9veRUj/pFOm5EpHh8vKGw3CylqOKdlZKrp1YeedL3SaTlyVW3gsXI+prFBHGtF0bss7BlsZB+bIanVS67OosXBgz16062070gwZlmCpR8Af2qGaXa9xGch0RsNWua9Gk1TIXcX4iRDBj/NOBYG0De2OSM0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876583; c=relaxed/simple;
	bh=6/0MGSFMLpItvDKAiuH9HB3iIfeafKjYJItOtt2uxf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aqgrz1jglEZLGalQOjX0tThz5eJcMMICeD43hkWhRvp124CFNdM0Eu0jLjjVRN6CbsfPNG0gqdyOZzjeiShtSBKFJwXM5mfaWMrROYqEeg231RlS4dcy3PpX/deC6kvEvlFo/4YQlRUj+/f6VIOx0PUVVHLYGCoTiN0x2YqakZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=e95752CD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="e95752CD"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53a007743e7so2843811e87.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876578; x=1730481378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=;
        b=e95752CDNGOsjvXHH83FuVLfyhDlT0zRrA3oYZ/qC3GgiuH4GgBuP88l/+9Icy2A5N
         EsZTER09kHoZuQT2vVcBlr6ny1ZNF4blk/lRcj1LnY7ees+2BoZ4uPdrB1zAFlH6Pww6
         W6pNo0lfZViK1puGq94aw4hSqsfgJeSuZy8QVEC2/ENGZ5OvYxK3roOs+cEq4jVcf33M
         5XactLso+8tAdCWBxB5KrToCXrOmyVAOpILlekTuDzEVY03U/CK+4M3m3Pt+uRU4aXO2
         HHhSli1I/sGvxOU5tTaDeVLwFjuAAqO+DVwRYKEju48WIFUnX58KZAAhvbW/pffeNlJ/
         YlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876578; x=1730481378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAmGnbsXlsT4wTydGcek4ZEoMBRAPW62Dt7gooaokpo=;
        b=lwlZQ0ulTlkYijH0+9LBvPeABBUp+Zx/IX7aVRLPaqV4S3B9EyrqVS/VMYplyBaIO7
         /kYC3jwZKs1vClOYKi7I1UippmYLgLlUSKHBOLluQmw+UvJPy/RQBYeSopRhs2levdga
         i/WbJWkrHEho+1iXorEffmhAZNOXYErS6yAF0ks3JsE98HJn0wdNSxBr6nDerW9qxsEM
         t5J15TBniofSwaDyA2kRJjbxAIBhkeY69wiQSgCHF6rsVZM4iuxqENQqpdplGOfnxrP+
         l0tpKZzLT3c6RbLXfczXVirj3GidkdbFFloaJNRUpQG83RsbDj8XFNLReugszedr6+4s
         rNtw==
X-Forwarded-Encrypted: i=1; AJvYcCXVmvEa9obcN4pHq0vjiiSK0r9N7IAqaIbpdoXldaRWk79Izsrbs8g2junhZ7ItCPyVsu/QSi6BsF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcjaVa4VjmeqaJkzjK9pB9CEnoPWG6fZC7Y69EnnmbqQu6nN/h
	Wnu3DDGaobr/4G+3DwLl/KOeqse3iknjKzqh3HwQ1dMGTecKyM+A5e7J9ZcMxEQ=
X-Google-Smtp-Source: AGHT+IFFnG99FDg0tbPUCrnuJ+5q39hROU6G1I7WeeX7XFXM8eg9WZcnUlhOo1IjHc3SXaTvZYJUzg==
X-Received: by 2002:a05:6512:138b:b0:539:f1e3:ca5e with SMTP id 2adb3069b0e04-53b1a391ed0mr5911852e87.44.1729876577643;
        Fri, 25 Oct 2024 10:16:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:48 +0100
Subject: [PATCH v2 17/36] drm/vc4: txp: Handle 40-bits DMA Addresses
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-17-35efa83c8fc0@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 MOP and MOPLET can handle addresses larger than 32bits
through an extra register. We can easily support it and make it
conditional based on the compatible through a boolean in our variant
structure.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
 drivers/gpu/drm/vc4/vc4_txp.c | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 984fddae0048..34e72e711a17 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,8 +538,10 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	unsigned int high_addr_ptr_reg;
 	unsigned int has_byte_enable:1;
 	unsigned int size_minus_one:1;
+	unsigned int supports_40bit_addresses:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index d2ee872e9c0b..c2726ccde1cf 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -145,6 +145,9 @@
 /* Number of lines received and committed to memory. */
 #define TXP_PROGRESS		0x10
 
+#define TXP_DST_PTR_HIGH_MOPLET	0x1c
+#define TXP_DST_PTR_HIGH_MOP	0x24
+
 #define TXP_READ(offset)								\
 	({										\
 		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
@@ -293,6 +296,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_framebuffer *fb;
 	unsigned int hdisplay;
 	unsigned int vdisplay;
+	dma_addr_t addr;
 	u32 ctrl;
 	int idx;
 	int i;
@@ -330,7 +334,13 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		return;
 
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
+	addr = gem->dma_addr + fb->offsets[0];
+
+	TXP_WRITE(TXP_DST_PTR, lower_32_bits(addr));
+
+	if (txp_data->supports_40bit_addresses)
+		TXP_WRITE(txp_data->high_addr_ptr_reg, upper_32_bits(addr) & 0xff);
+
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
 
 	hdisplay = mode->hdisplay ?: 1;

-- 
2.34.1

