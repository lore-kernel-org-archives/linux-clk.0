Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9728200CA7
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702244; cv=none; b=sdgfpB0WedFRWOLTu6EJ3mlzCtHcOGb9osWUw+QvbQlru+8qIPQsaJr/Jom5dZJTkZgs6d4gEQrjXDA/0QEcnW4c3oDY0hrs/zMU3+cQF46r7twegPD0pE8KdTukyIxcK6IbbI4ryRyJPuwls4mRlav8/B64bjNpuV9pxCZIhYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702244; c=relaxed/simple;
	bh=tZOo0Ix9iGrdx8pkIPTQHYKTf0KrfmsFOehv40Q+vb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHM7cc+JUuvnCP6NRxA7gba4fNVCrXu7oczJyyoQ4RzbeQj6L+VNtezUTlsMIY3z6jOGpfSIGHFYD0GFPbZCZqqpwv+GQgtGEWLmNsA3z6xulDhnVXgWgNAH8pCrzOP/d5kUl8KgXGuQZZyeecdlsidqMAXuDfEOeuARsLx/L4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=WelteRD1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WelteRD1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315abed18aso67276175e9.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702241; x=1730307041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vaguUe7juL1LVMz08cL6sDxAEiRfNF+JBFP9wF0Q+s=;
        b=WelteRD1jH/o/pmNMehvDU3poLhCzwThNTXbMOyxlB01zXSDo+h3p18ZeykSLsd2Z6
         icXhXvjzP2kpTAu2uhACRXytuG40twE4xoIXU1GfxmAuQGe98mi6zIu91wAeDClskQGt
         N+ax2YzC8epP1AEEjbfFXGsU2Hd84qSMYWWln61MYRz+rdJRNfTw5XJnzK6cVc9KOPhE
         WAIMh9dpfsOoMH3UH61IOk9jelcPSe9CWu0Qh2oosu1cqaVHknTDjHKhjYswi1ywH0mi
         qJsBXZGvgAZBfGjHq7zUKUxCA8cgRvTw92SubJIa1gfx14jTXD/M+nETXISCnitlW9k8
         jmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702241; x=1730307041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vaguUe7juL1LVMz08cL6sDxAEiRfNF+JBFP9wF0Q+s=;
        b=E7YRgDfoQp4cKYiwtwbJBiirFSgmmnJN5t5XjrB942XCfU7pZJACHiG+LP+/BUX/uI
         sQ4AfZkP7ht/jM9D+9THZZmiyb6JuW62c7VBZnKt/z0TSwNcttNR6xWT4Qo39hnszqGt
         bKYlPZ4yfZVfxmuDpI6yqK4IAlvJohPtPsUsgCeiL3i3ER+XQTyN5r/UOukJgpEg9mti
         Sm78RWEvEecXfxUjKeTM7jtAF9Gb68ewwDmRb05+hwVfpJfZ5fhc4sESooR6E5HMDMKf
         dhKIEDlVtv9bYa8eMYMTACkqISYIjlSc+DGCMshPCwKIPyA0L9d7IdVsuLEJN/bKcSn3
         xxhg==
X-Forwarded-Encrypted: i=1; AJvYcCUDfx+jG7eurwxBmprxKZQRBzdhujnUwAUvfS1RW4jiGtxHGf0WbxNe0+GzUMdWSnxmy8/ziWSK3y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyadXNZW5nRRMRx6F9c8GxNJmYuVxae1orVLBi4Cq8RuaWJbMAn
	N5C8WhP5l/9uaSRclz2DuFHp4dwFbZtIxiW1g0OwIrMwLafP7fbRQxjCQKjsvxs=
X-Google-Smtp-Source: AGHT+IERYOndgW/udDrkKTC0Se/KUmNKFRwzDAk4TOKT6h49ITwfBkIc/0nZV6Akai4GqaHXpM9b4Q==
X-Received: by 2002:a05:600c:511c:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-4318423b856mr23693165e9.27.1729702241069;
        Wed, 23 Oct 2024 09:50:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:23 +0100
Subject: [PATCH 26/37] drm/vc4: hdmi: Support 2712 D-step register map
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-26-1cc2d5594907@raspberrypi.com>
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

The D-step has increased FIFO sizes of the MAI_THR blocks,
resulting in changes to the register masking. Add support for
it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 +++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h |  9 +++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 95ef8bbe6439..6fcdd1c247d2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2128,18 +2128,33 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	if (vc4->gen >= VC4_GEN_5)
+	switch (vc4->gen) {
+	case VC4_GEN_6_D:
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQLOW));
+		break;
+	case VC4_GEN_6_C:
+	case VC4_GEN_5:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQLOW));
-	else
+		break;
+	case VC4_GEN_4:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x6, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_DREQLOW));
+		break;
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		break;
+	}
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 0046bdb7ca32..27158be19952 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -987,6 +987,15 @@ enum {
 # define VC4_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(5, 0)
 # define VC4_HD_MAI_THR_DREQLOW_SHIFT		0
 
+# define VC6_D_HD_MAI_THR_PANICHIGH_MASK	VC4_MASK(29, 23)
+# define VC6_D_HD_MAI_THR_PANICHIGH_SHIFT	23
+# define VC6_D_HD_MAI_THR_PANICLOW_MASK		VC4_MASK(21, 15)
+# define VC6_D_HD_MAI_THR_PANICLOW_SHIFT	15
+# define VC6_D_HD_MAI_THR_DREQHIGH_MASK		VC4_MASK(13, 7)
+# define VC6_D_HD_MAI_THR_DREQHIGH_SHIFT	7
+# define VC6_D_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(6, 0)
+# define VC6_D_HD_MAI_THR_DREQLOW_SHIFT		0
+
 /* Divider from HDMI HSM clock to MAI serial clock.  Sampling period
  * converges to N / (M + 1) cycles.
  */

-- 
2.34.1

