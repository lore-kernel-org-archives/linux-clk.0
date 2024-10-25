Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079F7228026
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876591; cv=none; b=Xxv1D8GTLSXCYCI28K6WKVJul13uAhhD7JawxreWz3fQ5LNdU6nqvvrU2Rs9xekyb0gnOrGatSqAoK1hYXuo4qyy3b/3DJef/YNHWKv3pQJ+lrL0c6R6oZDacbTpjgnS3nMuheRxhOaD6DqhIAWR/3Z8bwrCvnMHreeP6XhqW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876591; c=relaxed/simple;
	bh=i2OCo1FfMzQGcFXr+C+kMhl9+qGLNMJKAixqjTN6j7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+B2Wt+Hri/6z0sR3uDegOAl7XWFWU45D0zPAwZnHsL3OBPPOjZWiO40SJ+up6fuK3Vz6UpLksXtaRuSkWADwUcmqd1P7jDrKSh6rTZQNLwzoNk+PRJX7mc8RXjBdTZIFc4gUvbzHZUtC1cPAtkBT2MlVE7kSxUVIUF7QIaBzCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=A3YiUSVe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="A3YiUSVe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so29136115e9.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876586; x=1730481386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzwKuwbOKIs7buN3elcmt1B0UWigEPFh+7jf57NrLvk=;
        b=A3YiUSVePoo/LnVkHb1HA39PgQGTvOrLMFuAi/6jYhzWHC7+51TuxUxRpEN+FMAuET
         LwJV0Jzp3KEyETNWVmdEUkUmIN4UgBS5CaR6eCSrOExWWDbJuqb+deNluPWz9EsZYAPy
         sMG5IH9OW/hHdiwmUTjzmjVG8N9Mz7hi4JZ7kdCl4nm2vXkr9nHhsDz770mrwzNBkHVo
         dYs4gPj77UdMbWTPAZ1bZGwiVvIKIoo+7Y8jeAqgvfYYOC9P2O8kHIWWsPvspjnFcSwn
         E+4lA9pE6/lCw6ByZq5KmH6wI0VIgFpuiA6gxumz+TRI3LZ6YXwH76oA2mjaDMko9WVK
         sg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876586; x=1730481386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzwKuwbOKIs7buN3elcmt1B0UWigEPFh+7jf57NrLvk=;
        b=kWpbwz/0n3r0W2RcqU+SOvZf/5KOP3zS1Fs8HDm8b0X9Hx6tnzYuAi9SfK+ME60Cw/
         Xdw0425I0BHYLlBeRZzmFz2i4cOcESM1vHWbamCMVRP0DwLXf7xP6Bm6OjSXaUUhr9IM
         tZFp0U562o1orBeJY8q8qb/bS0KGLOA7xo0pBgkGcITXM/wx+54MV+7CSYUOKT8Cqm9D
         eK36qJEfAe+R88Kzv07MqHFYnTEPX3bBzLVsD/PPr9v+uGV6yG+ewGOAdnd1FDtXTlav
         gkbRjwKVA4Ib8/u6A8B8YEHFgz/EeSBeKWwKqWqSqSCWcfDd3+9LDUlO2JeF4viqmweI
         Nw6w==
X-Forwarded-Encrypted: i=1; AJvYcCVjESo4O3RZbrS/Nk8SqMSIWuCfyXisr83eGMtHgw5d23U80Kzyo7fnf8Gb+nBRH4mbIRG228THYIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3DfMaO572jEL3SaIge8v70LWFgFuEVXlXjFvqbNTgzsicrFfL
	AtATNvZcGlLrixUAoVvIBg3WE0iLVulCgmkYWiGJKaKu9sbkmjFE0ESpNiPmmA8=
X-Google-Smtp-Source: AGHT+IH7L5gaDfJvqohyrKgLBPDvmZg9d0+cQq0c6/lsK6b6rkJJPh7+KHzVz4tGoS7jUbr1/odWlA==
X-Received: by 2002:a05:600c:4f86:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-43184157850mr112895305e9.0.1729876585617;
        Fri, 25 Oct 2024 10:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:56 +0100
Subject: [PATCH v2 25/36] drm/vc4: hdmi: Support 2712 D-step register map
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-25-35efa83c8fc0@raspberrypi.com>
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

The D-step has increased FIFO sizes of the MAI_THR blocks,
resulting in changes to the register masking. Add support for
it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 +++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h |  9 +++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1456966732ec..b9fc4d981cf4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2123,18 +2123,33 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
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

