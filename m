Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780DA1CF5F3
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702253; cv=none; b=Se/LNHsEYvYjsIS5P3zaNAABwbAn7SzfeowQAC1kIr7KBJbhvCFySgLgr+DeDKvubuumrROcfyT+QZwJqi4BAAkoXjZ+VqV48Aq0GIAoHy35w0ma3uOdz2Ba9XIkGDTOOJnQshSULUoFgBiGD998gj3RIujvflaofmvVs8DXInA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702253; c=relaxed/simple;
	bh=0je9Y0xbsCwGhDIv3Ukq4aSt2NhWmJSUC9xO7wwoU+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1xd+p5u9IWn/KeeudTKNLPWaC417ubie1O8LMV4PwJ5AEIVq+okDQUzCums8dcJTdXRNyuNEkXa+ojasUuJf2PVivl0YsRcJdPhA0w0zTRfzIGeOcwyVaXfopeY3ks5veAfu6RtmHT/vXgM1T40EqD0tdmFa357YEjJcQupy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=NZh3rnyl; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NZh3rnyl"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4fd00574so52043f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702250; x=1730307050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=NZh3rnyln15b4NoTAMJm2xtzQ0XgdJFooE4JGnISCXetjvJg4dIE7//ICE/OHd61Yg
         0DXYN2tDUHx2frZsLDE4LMLHMP/5kCgr9iXKQAsGsga3euHBV+L1eTUtbXCwJiD5Uyy6
         DXX7mpej0RkSVxwjI6pkaxW/6ZD28mPR8jPrIJQ0x/fzmMyzIJLEpz9uhrsc1bHE/1ey
         kDKJ1olOZ5vdkxgW/PeziY28uUx19tXb6LwBW6t4QJLXLKdMUpfeLc7Ihr8+/ua+kFsG
         wokXebkIe8qM81p8/8BJXIQJFtDLk/kKEVprOzH38/uNhXApOlagqpQlxc53x5X6AIAN
         eE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702250; x=1730307050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=V3G+IQI04TuHmxRa6H+NvbcoLdHFFXNPvpzcuHA8tMLdr1DsuMt/E8+bBDcK1nN2Eb
         5yfovYvvIxRF9f5cA48JgVp0x5/IumvXoafLFahuUDRoc/u/aq2V29URo75WyNftxiwd
         CAkakRbv6+BwFjjjuXOozYc3IVtlTyDHT99XRKznCfaPPMkQC1XnEohfboTatJjkcAAj
         EkvcBW6XMZZFobCc8qe6AgWAtqUXEh2HoxOneQdOuk6XK25psRqCxEUl4wclO/v79y/B
         5Gt5ZsRuw2AMFUG9Z8kpq8FSYAY8oaIcRp56El8rmuSLhy881ZMrtpGPRov2ZDPlTclf
         Ssww==
X-Forwarded-Encrypted: i=1; AJvYcCUKk5CMaPt+OrGJaG4R0MCc8aFEvKmvNMz8Vz3z1x3Mzlp4SYHjHHZDy+zfVQxuu4e35ljEmmpLhgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFhjqWhulbG4qkLMOyLeVjtpfMnmeDBslEop8NWu43/J+zo+g
	oBK9NcCjUivc2ErB6YeYIqOBOuwX5Qf/mcERb8UD7+862whCSl2QRgkc1U0sNEM=
X-Google-Smtp-Source: AGHT+IHiThpqNk1aykeI/HCv+JYxamwU4EBdrmtK4EAyvKSVy0PZGtmgt/LXmRWsriS/yuXmN6RtIA==
X-Received: by 2002:adf:e88d:0:b0:37d:47eb:b586 with SMTP id ffacd0b85a97d-37ef12592e5mr5273994f8f.4.1729702249886;
        Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:27 +0100
Subject: [PATCH 30/37] clk: bcm: rpi: Add ISP to exported clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-30-1cc2d5594907@raspberrypi.com>
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

The ISP clock can be controlled by the driver, so register it
with the clock subsystem.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index a18a8768feb4..6d5ee1cddded 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -118,6 +118,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_ISP_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},

-- 
2.34.1

