Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5075C1E2304
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702229; cv=none; b=oPCZhIa29cJpkjP6ddSwmzLfTISNe/b0g0Wq2V3EcIC9ofx5+lyDjBm9If11ogJBoD5Mz/irVujOm31GjBPe2VRwvT+hwSwzVimnaIxTrEQQqcu41AACNK7Icg4lbDzdyD3uyVh17QL7yq/MlE7pLw0teiMHr2/4nZQ0lsCSkGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702229; c=relaxed/simple;
	bh=HzQCBtQCnxLWR4MqnTAho9PePXTWdc9dHx/+VUH7KOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfZ6WbfuKFwB9JvA5VeKPcYjbRFgfVDWfIrp7xYcZ85ofVT1TXtONsxBsJulKK4CoVV3F+0BlXuz/OtFuW6Uk07unC7H1eEoqqEJyUENVe28l3r/8StNYFpQB/G1dC9YTYa3iVOVW23sQ/ZY9y4zQg0nBSmIBYabuCII8qNpm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fM8h8mvf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fM8h8mvf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so61815415e9.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702222; x=1730307022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=;
        b=fM8h8mvfBJZ4oIuFYDsNRLufvReN2CL95yJ/pGXcr+kHnuDq5DnpyHzOwT7Bf/hJKp
         NDG9/WjCwxPf3LUKE108J/nkCAzYkpGVTU95CqIgZkkTxgpZMxOamakMGNbzSUsAquMG
         rOh3W+VYLReS+3MfhNZ4W75pquKnpZykOivbaOz8uSocIx/T/TV3Y3/y6MKzGmDWbB63
         klKOIJI1UdLzelOaa1st9Snvb+BlthGUbEk8irm5dcOkrEtpHrWDuA6Mv5nGUU7PjzlP
         SENsD94r2L58GO6BMQkFiPjQEi+Sc6vBAkhFfwibaoRX0pjTX9ARF+qcJklrRJhE09KW
         I90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702222; x=1730307022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dnZzxFDSzNZ2XOSUDTFMzhrUG7dVfBzR4nm1WX8rOk=;
        b=MoOUIJ3FbyyolmW80LQDwSpdH4KAcSaNdkDeUH+OG6MrUTM0Nlyd2DzZmho+xFo34g
         dBjFjokX2C1NHYLTcC+eXQY53ND2gPV3GJEAO0FNVyQ2h3yBB7mQ0vMic7CaoHKjlxw7
         hj/6zZMU3etRHExs9pW9bAfjp/dXJ3gwaqdzKZrRilAWltmuC8m7DQsNK1Q2PXRGMkxw
         4ZGfD8RCn9m7154DEpnKXQskbYNT8ai76iP2J8tQrM+SXGZrYNH0/7BvdQb21UZ/1Byy
         D8qMz4xISMreM8NAwT9Goe2zDjW2Ld9LUfJKAMLFbWgmbGu8NtqDEdH2nGx6ixiiYL5c
         d2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXibnuTaW5JvI17g5yGbd6HSoh4/P0QdRHkTesvZND7BU/ikiJbkyL9Agpphh244Di+91K1nC8Z68g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoqSeth8HOnUS/Mnxd0IMP+aLVOJPaGNIFD1pJbEFtCZSUqA28
	dJAuUBTp0+hAmJrSxrNWzE/H0p1dHuya4C8+a0cb9rDlJMmV4nJxgvHmhnIQOtw=
X-Google-Smtp-Source: AGHT+IFI36WmNXTRV4DxPlE9LTtOwItl4jqcDI9buc5n49Q8WtFQEB6vJFj2nzepFaAVYzIFdCfs7w==
X-Received: by 2002:a05:600c:3b9b:b0:42c:bd27:4c12 with SMTP id 5b1f17b1804b1-4318413e4d1mr30434035e9.10.1729702222575;
        Wed, 23 Oct 2024 09:50:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:12 +0100
Subject: [PATCH 15/37] drm/vc4: txp: Rename TXP data structure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-15-1cc2d5594907@raspberrypi.com>
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

The TXP data structure has a name too generic for the multiple variants
we'll have to support. Let's rename it to mention the SoC it applies to.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c | 4 ++--
 drivers/gpu/drm/vc4/vc4_drv.h        | 2 +-
 drivers/gpu/drm/vc4/vc4_txp.c        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index c7b91c87f1bc..372482fcd6c7 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -51,7 +51,7 @@ struct vc4_mock_desc {
 
 static const struct vc4_mock_desc vc4_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
+		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
@@ -77,7 +77,7 @@ static const struct vc4_mock_desc vc4_mock =
 
 static const struct vc4_mock_desc vc5_mock =
 	VC4_MOCK_DESC(
-		VC4_MOCK_CRTC_DESC(&vc4_txp_data.base,
+		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
 				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 1ed1fb5aa7e8..e08c90245f94 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -540,7 +540,7 @@ struct vc4_txp_data {
 	struct vc4_crtc_data	base;
 };
 
-extern const struct vc4_txp_data vc4_txp_data;
+extern const struct vc4_txp_data bcm2835_txp_data;
 
 struct vc4_pv_data {
 	struct vc4_crtc_data	base;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index dcb1b3fd37de..6fe378b454ca 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -485,7 +485,7 @@ static irqreturn_t vc4_txp_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-const struct vc4_txp_data vc4_txp_data = {
+const struct vc4_txp_data bcm2835_txp_data = {
 	.base = {
 		.name = "txp",
 		.debugfs_name = "txp_regs",
@@ -588,7 +588,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id vc4_txp_dt_match[] = {
-	{ .compatible = "brcm,bcm2835-txp", .data = &vc4_txp_data },
+	{ .compatible = "brcm,bcm2835-txp", .data = &bcm2835_txp_data },
 	{ /* sentinel */ },
 };
 

-- 
2.34.1

