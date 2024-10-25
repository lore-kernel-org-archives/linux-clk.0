Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF5322ADA0
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876598; cv=none; b=sqb7G86N1PzAWlCKJOn4oS87q5CIxTsvxtG9TMFI2M5ywmaUEItYChLsdpUQjZcRSZ+EkeqTqHPfxdsiMojxcxORnLJ76vjXAFvPKTis6igoV/KvQr+/5nK+AdDjXbRJ4I6/amGQTNymOsof+9B4jUnU1LqnMmCxR0nLyywHlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876598; c=relaxed/simple;
	bh=XBzj1denapOs56Du29PEQKEZahYGIqXLFsG73uRG2VE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiU1EgnwNNlWXAewQxHhSZLQYUS87IL4OkolwkOb9aiH4Q0TxkuZfgr0E4+8LDZwhbRVQWGXGZyJv6koQUD8U0xmUwnHlKKAydedEHQ0K0pCxLfRpNc4BtkBSRHHKALq8iUeGgbdpjEMPKMWDBsnX/CL3jOXdRZV403RbprePuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kNdafAIY; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kNdafAIY"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so1566604f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876591; x=1730481391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLNEe24VVIwAaP5agwCiuxY7rB4nwlR4wJvUVCZVQ/E=;
        b=kNdafAIYshrHa6sbvPV0peVIFCgeHSpHEHygIXhw87zhQ/hIrUZmEU7zMi3WKFq+z4
         lUHKxwNB0k3dFJetKPrXlxp2zbshMp1zjPolYYPBN478inYGDi2iD/GhvqL9hXrD/HUW
         jJ7emcdeurB9AXrwN5l6b3fAB0D6K4RJTQmQ+W67IW9O/00SI6l+7FUnBeGW+BQRHxCK
         TmhWzKZv1S2ZwIKdyV0jsjOu0hwK0SutmoQxWWXYbjtaxb8ll0rP4YRYYHNa1g+BjMPs
         RlzxnMavvYF7VBm075frWU2S0nSRohtfEjRBI0jXsQgeKJ+8J/6UPPaHFcnZxGUXDvo6
         U6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876591; x=1730481391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLNEe24VVIwAaP5agwCiuxY7rB4nwlR4wJvUVCZVQ/E=;
        b=q/o/UgRiA+yoGWA0xO9mpgkCUyZEc8NdvY+dr5gE1Rt4tOTMbzrwfTX2sfEICc10WI
         kqriUn1Kc7sTH8OX8ZOfMK3KHAPj1gH4xcf/mp8k8kYttm3afZvWGabdCF8H19lTG+pA
         sclXON77lH7um/RwYwppLTUkX+rPfpuvi18Oii2vAPEey5R3UpUodRT/qfjI2Wi0Gtvf
         VpYKyTkfOD2epnkVPVVF3dB30OofzwSXEpUBcNvWaxSEFP6Nf6J9C0o2ubcJkCnafKk0
         0aem+W6f7qCzyLyDtl2ASj4UyBswjB27bgq3a5qZM3HdexPFiHMi2X0KmFjVDMTCNtfB
         BWqg==
X-Forwarded-Encrypted: i=1; AJvYcCW/XFo0pVlo0AJ8tw8uXEY8MFKpM9VqboQKyEpDvWGLwrTVYACJgfc1xzwPNE+Ddb0ncH3wdPSBdAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiSZMFwpoLl7FkVMNEHK2bFW72ue2AknGSP4Cc6HBQo7YphmuC
	Ai6uurJAtL7ZxyUCg3Ye1gs9wfY2NdOvU81+11K9Ppl6t/NLsid+xGKLjhvL0Gs=
X-Google-Smtp-Source: AGHT+IEf4KZxMhq0qk7/lCgwke2nZYw7jfKwbBRjQajizbRblmsymhNJTGNxxKLe3CTSVhp57vlUig==
X-Received: by 2002:adf:f411:0:b0:37d:4e59:549a with SMTP id ffacd0b85a97d-380611418abmr124517f8f.16.1729876591324;
        Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:02 +0100
Subject: [PATCH v2 31/36] clk: bcm: rpi: Enable minimize for all firmware
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-31-35efa83c8fc0@raspberrypi.com>
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
index d374538e7108..9f716b2223ae 100644
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

