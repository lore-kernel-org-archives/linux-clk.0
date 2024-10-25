Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962EB226B6F
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876588; cv=none; b=tk4xf7HM4dYwgkOO++Ur+8bFKxK3gYOlSf9Wa/GsPSCbifS3Jel0qKR3O0kUGSN5ovuSuZIZKp3iKiyHAMG49sZuVHLrNjwMqd3iw57zInIXtvRaZhZl+52/2LK/H7TKcni7kznk0Ju8zyMYQFHazBc1MwF9X6tw2bGs4cWvrDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876588; c=relaxed/simple;
	bh=wRgRhlnNUNPcgFsjntpdMYGQbwOlM1DXbBRSrIRrGz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lssP8fNJsBv7eCacke0vlXaxcOpjAAHhvunVdYHcjRU6Zs+fWfg4rIUbMJsarWmwDnAqk9Oh2K+IpOrBXcEbu/yI82f0T5iIIHAbYgbTOedcC/ZhGyHK0NwCTTmSBfhU1GGR9GzEzBl1yzcilXffA4LCJEhOUwzjUYV+j1OEpyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=qOSkwLvf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="qOSkwLvf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso1437907f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876582; x=1730481382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=;
        b=qOSkwLvfRw3ZLCz92FolT+GjyREsSrbqN7BPng1ITrWtd/5eD5iTITmVMnDCK1VZFV
         Fh/A4iwAFCR02MJRGCudw3sBtcVwwf9VHKQ4fhgry6UYFbZPQ6F+Bw94sbubhTj97Qrx
         Y9Rx9lIiVIRfOuUWwHUpbaQELtg2xQ5/DCZkYv8RTOR1JyJU5UXMXdGII+XIjazB8/Rz
         HBuUorpZ5LNTP5akUsEyOPIOElTxFsw4/fW0cJGyu23zR2x2aisAIwKmFGJDzt6dS+Fm
         BLWabAHfkNXUOXZlVv6C5cQ4wdzUei7q4FoJ+SubtYKHHF6rVpbgeM6UqhvvKeWCMtIY
         AuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876582; x=1730481382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=;
        b=L0Q93M/mP6pVY8hi/WRWPa0yTTJ1sTE+tU3SDawRGWamUj/XwBeaiuJMG5pbja+h44
         ZsluiaF74j0rWq8g/1nT+3GQ++r3vjt3r23Tmo5Vau2TAxb0/Golp8DDtgJBnTunqxEQ
         exAGoKmheDgbKAMlKHFVph0ZiC/k2MuuoQlevOnctWTcdGiaWYS/oIQto6Al30VupPff
         w7zs0DONVD5LK0AnHYPYgyG1EXcglRrYEkg1yuIVOJBfHaJqJQQEHOBiI7VRY/MNmpuN
         3P/iuKmRfAn6/ZZoBu/tvUKOJ07EJtiVPSqyMW9H2evjx/2EMSQ9hfOKb+emMFVQpkG3
         MDTA==
X-Forwarded-Encrypted: i=1; AJvYcCVGj44LK4dh7DXy2H0u/kr64PlAgHu/Rc1YDg3dQH8/FkUFfw4C/O9kgZpGD/kqPJRQuWOohmvHrAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9ubQ6OF2C13DK1ewtSGhPLNmYvQY1Q7jhBc8zdde0RVXUBF8
	UigMpBf1pED8C/GgLMZOzYJy2aKDuu3OLqy/FMOV3FFwEY9yGLdoLC3jC0P66nI=
X-Google-Smtp-Source: AGHT+IEQsz/ieGCoAjrNeStjHY3m+yeckCVb8DDV3/P3RxReILzsgdvSRPsp1dMVqLFx8R4lAqslJA==
X-Received: by 2002:a05:6000:b0e:b0:37d:4fab:c198 with SMTP id ffacd0b85a97d-3806115a9bfmr105090f8f.26.1729876582551;
        Fri, 25 Oct 2024 10:16:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:53 +0100
Subject: [PATCH v2 22/36] drm/vc4: drv: Add support for 2712 D-step
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-22-35efa83c8fc0@raspberrypi.com>
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

Add in the compatible string and VC4_GEN_ enum for the D-step

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_drv.c  | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h  | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c  | 4 ++++
 drivers/gpu/drm/vc4/vc4_regs.h | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 94e01ce2b1ef..fb91e771e345 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -466,6 +466,7 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	/* NB GEN_6_C will be corrected on D0 hw to GEN_6_D via vc4_hvs_bind */
 	{ .compatible = "brcm,bcm2712-vc6", .data = (void *)VC4_GEN_6_C },
 	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
 	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index de2107e593c2..e3983a44e35e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -85,6 +85,7 @@ enum vc4_gen {
 	VC4_GEN_4,
 	VC4_GEN_5,
 	VC4_GEN_6_C,
+	VC4_GEN_6_D,
 };
 
 struct vc4_dev {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 7c2dccfdb58d..a353b51243a5 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1532,6 +1532,10 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (vc4->gen >= VC4_GEN_6_C) {
 		hvs->regset.regs = vc6_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc6_hvs_regs);
+
+		if (VC4_GET_FIELD(HVS_READ(SCALER6_VERSION), SCALER6_VERSION) ==
+						SCALER6_VERSION_D0)
+			vc4->gen = VC4_GEN_6_D;
 	} else {
 		hvs->regset.regs = vc4_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 731b13742ef5..df44a4a4009f 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -527,6 +527,9 @@
 #define SCALER5_DLIST_START			0x00004000
 
 #define SCALER6_VERSION				0x00000000
+# define SCALER6_VERSION_MASK			VC4_MASK(7, 0)
+# define SCALER6_VERSION_C0			0x00000053
+# define SCALER6_VERSION_D0			0x00000054
 #define SCALER6_CXM_SIZE			0x00000004
 #define SCALER6_LBM_SIZE			0x00000008
 #define SCALER6_UBM_SIZE			0x0000000c

-- 
2.34.1

