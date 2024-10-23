Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC07205AA5
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702256; cv=none; b=nd1xLNtN/06DSHXe7uJwp/B2jN6U9YLeQUMvXYZ2A327rCDuyCGc+ZoIh4VIim8YsuI7dFGC2Rg2ZvbQvxtwX7EqhAfPkifu1H3dP6AZ7mYTFC5kmIZfocYOSjkzwo74jGRX99yFAXcj73lZJ/sRSIt8usV0/64GBJc5/4d0avU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702256; c=relaxed/simple;
	bh=nCTgcNJqAOLt1t1JGW8NB89E+/HvF1h0Y8xB7b4gHLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6mmEAcORTJ1q7d+nO7mgucvdZZOzzwWV+j6xoR+CjMDXEGk5vY0iwagU8wxg2/YbQCBgu0q8C0p8gdSCZs73Zyx2R5YVBdhn5LJwbsmKDOZD00n0gmFwhn25TFK1BE7uHQAXUV1RMhYpMwlALbpXL0FYH6HnPGyT3ZdG3Oe0wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EmYDbt0K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EmYDbt0K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so77168055e9.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702252; x=1730307052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts1NDd5vcHREqhcvSTV/1shtmvDfyt1K2xdMF/qf56o=;
        b=EmYDbt0KXrQUZiQBkXgvvcfZQsvlvr9WTeHhNnGiGLG2k1RH+Wo9YZtnBvPlHydMAC
         FT+ZBU2ZFzsbYHFYc4n+e7ILJ2S6/PIeygADPFr3ZDRe++lulrtn04ZauqjHfF7cEprZ
         7m/5CxLiL2UP+J+JbFKYhOUW1L9FDQ9thPoFqG9f5bbff+KEGdJQn6DuDT3zGMTjlFJA
         ON6viroX+X7RG98IpCwIkdsAMPo8jO6Z648ynPGnElsv5cBiq13Hy+qNqie8AHqSQtgB
         WdAJcv3Qr6dUJB7r9LJQtrvrnZWw6GBKsEAjdp+tmieK5JU5/Y2yzxvVOazO59C6a0nd
         HaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702252; x=1730307052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ts1NDd5vcHREqhcvSTV/1shtmvDfyt1K2xdMF/qf56o=;
        b=aKJWCvMqqtv8Xo43OdrQiMTL2itt0ELd1ky6ub3W48T7B0ugg1fF0obbbh82TuvNew
         wQS6LzPUoZdr9b3BtTu1xVly9nwgTrXT1b1E7uVaqLEPqHVLDRwv/ISmqB+yvv8kudjq
         4mEj52WYzNAo931/wCbbehzJSkPFlPHtsE5uS5pEcUEgVT6kNvzohYYJgJX48H7677BS
         uzfKCTxtpqeojSds3agZjHwiR0ZEiv02l0CdUqZ12U0lGsNawkykhlQ1lZR5usgrfqjV
         05AaPIHWlRcFE2tXEBUTAa1U3iMp1VU41Ahp2dseVhG7Yq+BFatztDB3LsXX1uxVT1fY
         uR4A==
X-Forwarded-Encrypted: i=1; AJvYcCWqpFvIKJ/Ud8VhOHQQ7LoZrN+SbXmBUY4SCyQES2ZznJgjGx853whvtZEg4YJnSkIfniEy4+vdMdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT91YiWYz/tr6NfRI/rvZvYXw+s8o12dDgftmvdxbOQSYF7J3D
	L7/PcdAw4m1d0ZkVzHIiiTwdkwOzv+1R8bUoJBLZ0Hjqpb2rou+Jiy8B7wTWefE=
X-Google-Smtp-Source: AGHT+IF+Ep5cy5ocAHASp/06u2OSiKjV3AGCYRQMjGhBm4svhBLkWe/K2mww/KQzVSfsztZblCEfXg==
X-Received: by 2002:a05:600c:358b:b0:431:46fe:4cad with SMTP id 5b1f17b1804b1-4318413e307mr28468675e9.9.1729702252475;
        Wed, 23 Oct 2024 09:50:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:29 +0100
Subject: [PATCH 32/37] clk: bcm: rpi: Enable minimize for all firmware
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-32-1cc2d5594907@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1

From: Dom Cobley <popcornmix@gmail.com>

There isn't a reason not to minimise the clocks, and it saves
some power.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 274176a938c6..fd7ae0efcf07 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -111,21 +111,27 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 };
 

-- 
2.34.1

