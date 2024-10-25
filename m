Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FA122ADBE
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876599; cv=none; b=s/ZSvX0xrD/+Xcumre5loWdFOWIcDTTc52zmghcttD8VDBupFnvUX2OdIQX59zWJRyWsiMbWYyiHtV1ff5dO/ZYTY7sepAKWxEgh/g4SOMvm9krlc7io3TS4vQ67jzu5URBvO5w5Zu02J4AeFwOR3V+n5vKo2qbtKGN3K2Mpqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876599; c=relaxed/simple;
	bh=dgB9TDqOjPHC53NYjTeAKDgaQq5QKMSxepqaspF/csI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ByiQMSIvy6PuF3Zs90S7CLpSR0X5cIx3dKzPEo9io+88cQYhjo+P0FoGZIMbTdA9f5fLg7ol1Jo1tWZ4gjncYMBwNcgnQ39ufzxxioyfcsN6hZMqg95IAPsNUIssSvyh4unCnCdwpgd24qtV4CtvfXGvC94qbVgp8zCPqR3SrWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=T41xgAoi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="T41xgAoi"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso1770671f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876593; x=1730481393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+NR5LKr4OxeWQLlNj8flZMDifFbPCFEGLf/3iSNdew=;
        b=T41xgAoiYjYRG2N0x87OEJB+S31juJxn6G+S//lU9tdYfEjy/tTmCFzAYtgNiI9b69
         Uk3Sok50qteYAYGjcy5syzXCi6NAxM+1wrcG/FuiSrm4v88Bx92DjjrbvPUAmNeKDBqm
         rVwU/7fAtV8TqbQhclQXxnJmoWqPnb7rkSA5Zqh7vJqplG3s/e4GtNen2iJkTvxuVC/Y
         RVUx+TsxLJ2BLAh2wRe7a3wqeJNfx25bB6OSF+YSiqoHJ56vXpA1wORCG886l6G45gP1
         bwbxxCQbIfFIHlmCHZ2PG0AgbfbyuogSQ+wRCBCg3HlxMFGrWa1mxJ40w/iAPbMaLfUi
         3TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876593; x=1730481393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+NR5LKr4OxeWQLlNj8flZMDifFbPCFEGLf/3iSNdew=;
        b=o/DLHSqe74wae3ks6OAhy7IWXAeeS9CjT7uz4qIbzqZ6T3bigyrQ0vXJwd1/T0HAwR
         vTJHjtGKFVebRGqjic5u5IkGfVkMAm+6H2+8FRuNtnvMwJx8UlbK9eSPNXgm9pziGbR6
         etheCRDYvUsrMG4z4lVCShwcLdkYDdKADQmBrkUp8CbwieFr/upNlSWcLlh2lKLZmSNh
         IqTXYHMvMS7D6Onr5JX1tg3IoHL+Enzyvy24EAnrYY712RIC7nqFk1tldeuzEzIlGAAB
         nVR/HgXc7DcFn1ECYruf0x89b4yanUuzSumKq6Xukd452lT1t4Wu8gDmdQkPoH+oEVR8
         q1kg==
X-Forwarded-Encrypted: i=1; AJvYcCX+Q15L7rryf4A014DWxFwKio/buYHY62xDJ17GKZUuRvh2HCgXOY/H5rWYio+unVftfcf1JATrJSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIe6I17OAE6JjRtAvcB3rs4l7hnpPhre+MTLvPv0nH6N0xDNw/
	O0KZKq4KAKO2SDw9rO62EBahuGe4WINBKzkUPHEtIZZYkkf67QPaPpZCMQqIfUw=
X-Google-Smtp-Source: AGHT+IHe5tCoSz92UO987eOIzi01b4rnj6tRANtMPS83mpXtoleIp32yTkc1Cq0CRABNQvTNNn9/Eg==
X-Received: by 2002:a5d:63cf:0:b0:37c:d57d:71cd with SMTP id ffacd0b85a97d-380611ff862mr97480f8f.52.1729876593018;
        Fri, 25 Oct 2024 10:16:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:04 +0100
Subject: [PATCH v2 33/36] clk: bcm: rpi: Add disp clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-33-35efa83c8fc0@raspberrypi.com>
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

BCM2712 has an extra clock exposed by the firmware called DISP, and used
by (at least) the HVS. Let's add it to the list of clocks to register in
Linux.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c          | 5 +++++
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index b12d86720207..0e1fe3759530 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -34,6 +34,7 @@ static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_M2MC_CLK_ID]	= "m2mc",
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	= "pixel-bvb",
 	[RPI_FIRMWARE_VEC_CLK_ID]	= "vec",
+	[RPI_FIRMWARE_DISP_CLK_ID]	= "disp",
 };
 
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
@@ -139,6 +140,10 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		.export = true,
 		.minimize = true,
 	},
+	[RPI_FIRMWARE_DISP_CLK_ID] = {
+		.export = true,
+		.minimize = true,
+	},
 };
 
 /*
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 73cac8d0287e..e1f87fbfe554 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -152,6 +152,7 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_M2MC_CLK_ID,
 	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
 	RPI_FIRMWARE_VEC_CLK_ID,
+	RPI_FIRMWARE_DISP_CLK_ID,
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 

-- 
2.34.1

