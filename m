Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C211FF028
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702235; cv=none; b=M+29ywy+he7DPwzxoP9/XQhto6NNQf/5UY8PBDwGCyHSdWuPW9HZqhRrME1524Pg4ddEK6CtwedAB7u4u+SK+LIHLIs0gsMGDehPB8hNbVj6thg+UxWzMo1q6C097YPNFDFalSYMHpv1ESAdTlyT/XUN/Lyt8KNXUqZyQuxt6Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702235; c=relaxed/simple;
	bh=QAgLZexOXOfeZrmTJXiUrgHWdMT4l6zXGD6c1pRKTQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJuD58aGr40Y9Fc5G5KSPR1JDEsgCVFzacg+d0y6vmlScnwO25zzVfaYhAM7HoIcPuA2GOQiZSj2EMJMt6aWuipUKeUiuGSon5WeLPJfplW9lUXcO5a+f6u4qoO/3Uq6mNaPQwdedlgthCZnlMN+aduW02aeoSDNGttiNRdZCvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DBHmfjx4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DBHmfjx4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so61816925e9.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702231; x=1730307031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWOdbW9r291k0JLZ0WclOypLE+F7cuj+vNJzDbk38ZI=;
        b=DBHmfjx4b/ykWFYhNxIkr2ZKtR6DyqQ5kMjyiAmtI0S/8ajySTewr+tw1H8RVd2Za2
         +P0QE+PXYbH83r91fMZeftJhuQb56Fil6vpv1byq04GwAwvSthUhxs8S5/GNtLZC4wbY
         I+2msnBKlLM4sEaowwtY4QYh21VkSNrLgpHc4qIjf0guu5+NXNVmomBFrNUtV3ONNfu8
         I/pfxthwtmOJoWnuE026Jd4zvaRlgRkUPIEyTl252GtyWj834HYWzPp+yAS73CEqFvgC
         8EWgRp/EFg+tdkI+lUnCSY9pz7b5k1PWPyu+4MQJS7vur3jFH65CIIFOXpgWAWv7ytVx
         99xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702231; x=1730307031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWOdbW9r291k0JLZ0WclOypLE+F7cuj+vNJzDbk38ZI=;
        b=Vn5k++KVTdon4uQfWpLoMAA6IoXVtegWuCMDFiqgv2aURetSohBN/V6Qzcm8knqBY3
         Mneun9sMrD19hc2mhA+fzJdnxrNWPrNFC+URoliTw5kkL++hSyN2RTpwEt2bGG4gWRiV
         SgN8zA3zQbu3g4yxEhdRPlA8piMjrIH9t0A/oDgNCl81msnjwlLP4YW7DYmyFUgmTygg
         GzbAwOrTUcjFLLAaeJx5XcZip6Mc/BY4H03LmBclQT8H/Gw8MBy3g+nifSlPkLG1eC0k
         ykKAC1G+uvjyGNnc7766tSbCDJddDTiuID7IXdMjuBk0a5Or6vG24cOtykJpa+8zPF0L
         905w==
X-Forwarded-Encrypted: i=1; AJvYcCWSxtkWUeYGmZGiudqtNIigODFNDHj9xsmIMyG9SQTvJOKt6lJ/Wee/bwmZTLMzcGSHagONQxa9OL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxee59wcJ9r5aCGv0/UlKE/1XV5Wq/gtcBiKVjYk+vnrbcWCrZH
	L+ZMwTIyocG9fvlyWQ+U3VHBd/6ppGxH9BCr00gRI9zCJ9ID+2DmqvaropMFFoJkJoKBdNEOQNT
	jduY=
X-Google-Smtp-Source: AGHT+IGFlT9aIT0ELBQ3fGLuocjkqWYAz5lioaoVMV3JghaR5fVi3lzSzAvTX/9JlAsFJlj3SG7awA==
X-Received: by 2002:a05:600c:4f10:b0:431:5bf2:2d4 with SMTP id 5b1f17b1804b1-431841a2ee1mr29394055e9.29.1729702231586;
        Wed, 23 Oct 2024 09:50:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:20 +0100
Subject: [PATCH 23/37] drm/vc4: drv: Add support for 2712 D-step
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-23-1cc2d5594907@raspberrypi.com>
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

Add in the compatible string and VC4_GEN_ enum for the D-step

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
index 5606ded928e4..b698f7070510 100644
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

