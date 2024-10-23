Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F0A1CEEA7
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702228; cv=none; b=H9maCJiOQwPo1RW74J+htOzWZWOOwE1wJmaPLlHPCELbYGa8+PtxPrpqEwDLspIZplME86oSd7Vh7cxHmhJempxsgMcGdQQMLfz2jABDNFeewWcQz43u3YOZKy6bH6Eea2LMmi9xvXFSurA/KQ/q3+9o2J5epb6d4/pzD2s/K58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702228; c=relaxed/simple;
	bh=1hF1PhNYP2/A1x5AcjvXgQw18E7kHCNzlJ5ort+1kbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5UJxIEbINNrQAZnIB/vg8cilh9E1vb/dxE4gKHD8+mdoSPcE7qRFs4vV2uU/72/yeszV7dH3HYXrkG4FQEJDfqkZSWH9LYEGe8bjmtCRRNU63uDXGKJrfVd5BET9VjCk7QKUg0Y6z7G/ynh7P+hAy0KvX2YHiODM1asBGluk/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=cHwryQcV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cHwryQcV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43155afca99so7805665e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702225; x=1730307025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
        b=cHwryQcVjT6hHhUCg1DrGAv88Qk7t8+awkpMmAQeJkJsvn9spH6X9LT21CYaFIhkvm
         kxrRBGqn/39bIVDKrs8Rfa3Zsduls1EH/FU7chZcWzX6U/swiwZW9wsly3IiDk4NR87l
         i7iGbXLFAVi6U8+MHQK0XgTC0mu/4AicGkwbgUIVjBALIL9TVwtJbJAHqu4927UFkYZE
         6FalQF6exRvY85LkQ+mVT1lMlUBBj2l1GzI3eIq6ur7ZmO9aOYDVaY04pttrQRELlrw2
         uyCFSlnhiMXiPgajJRhOu/NkxIJOtUgL5IUlAILtJg37vVxXNegqZx/JhRHFHONsGOmk
         i4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702225; x=1730307025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjLOa+CYvpz+BpNsMyaYFjyUkwYrQkclw8bv+vdgZA4=;
        b=wPvgi8xKoUO+iEtssID1DYu93pHF3br5k1+MRa994kp5A3mGwgYtu7qbobyWoBqDHs
         JCL9ykxf1OYuEXtP1JzHv8x+eNT7O8SXoOlPicgqeyt8dvBqqCtcstWYdSDTYCHCTPIh
         Whmb7fU6L6abkUbMIVv5uO8am1PiyPSPy3WefoxtSu2rUAfuKFTGRtKEC8zeqvN5O/eQ
         FR6ZRAMoEvRHW+gK+9/ql5E3vu4XMk/XTCt71UTOETYl2J+hYAxbO6cnBUQIl1nl58Cj
         OCCs9+VsCgYLl8qXy9ypg2CnlZzKTrP4sR7SmSmGTKOWNibdy+ti7D+OHE+0C1ctXrWy
         0ytg==
X-Forwarded-Encrypted: i=1; AJvYcCWQodmr5vqlzn+hDi+Cr1FOyZtsjAeUfmf2bcm5Z8J1SD4t4M2JnO/rLiJgRbhcx/sAyYmGX6YPi7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWzr1WxQTtfj3eZ0itjKnq8w8Gare7iAw1N9PbKOIgbfHXUaTl
	LV2K/nkrFvCTS7K5JpQIh7izWMIbr9RjD2OyKHu54cLwEl/tshU6fPjEvnwcP/Y=
X-Google-Smtp-Source: AGHT+IGF/wmrQgX6tkn2u2UHI/gHpOuI8sr3sYRtr4SIzuUG0YYH6LOTQMbTm4H44/RrLqlF3LH1FA==
X-Received: by 2002:a7b:c455:0:b0:431:7c25:8600 with SMTP id 5b1f17b1804b1-4317c2586e2mr46271995e9.2.1729702224583;
        Wed, 23 Oct 2024 09:50:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:24 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:14 +0100
Subject: [PATCH 17/37] drm/vc4: txp: Add horizontal and vertical size
 offset toggle bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-17-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
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

The new writeback controllers that can be found on the BCM2712 require
to have their horizontal and vertical size reduced by one.

Let's tie that behaviour to the compatible so we can support both the
new and old controllers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h |  1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 27deb4cde02d..984fddae0048 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -539,6 +539,7 @@ struct vc4_crtc_data {
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
 	unsigned int has_byte_enable:1;
+	unsigned int size_minus_one:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index eaf30b2cfb5b..d2ee872e9c0b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -291,6 +291,8 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
+	unsigned int hdisplay;
+	unsigned int vdisplay;
 	u32 ctrl;
 	int idx;
 	int i;
@@ -330,9 +332,17 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
+
+	hdisplay = mode->hdisplay ?: 1;
+	vdisplay = mode->vdisplay ?: 1;
+	if (txp_data->size_minus_one) {
+		hdisplay -= 1;
+		vdisplay -= 1;
+	}
+
 	TXP_WRITE(TXP_DIM,
-		  VC4_SET_FIELD(mode->hdisplay, TXP_WIDTH) |
-		  VC4_SET_FIELD(mode->vdisplay, TXP_HEIGHT));
+		  VC4_SET_FIELD(hdisplay, TXP_WIDTH) |
+		  VC4_SET_FIELD(vdisplay, TXP_HEIGHT));
 
 	TXP_WRITE(TXP_DST_CTRL, ctrl);
 

-- 
2.34.1

