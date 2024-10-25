Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D6B3DABF5
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876567; cv=none; b=hjDZcmozOcRKiVg8XqVdnVzhw/HQuSOBdvWobxDg16gea7sFeuz1gh/0bW11wWZetWaBZUc3EmfLA4WPYbFhqcKpcePFHsb0q5DcP50AqwMNx6SrCA0n8YBeZ4jrCafun2UlwKyCmsxIvfH+vTanKJAzFo8LQZ11JX4w3ek4R2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876567; c=relaxed/simple;
	bh=FQ5F+QORxSN0hqjJB03JSaZBLHg3MohVrt+mbUZveP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LqmP8boTcZgMbWXwxZvvYfHjhNiFgjtd2Y94QvoHj6m5iYUTD3D8irA+Ct0ZO3NXvBaORhN3FylAyu96q1Vn+X7Zq0hasRlz9AVCehFSp++l/CIK14F0x/aB8d3mO15+bfcPS/tUviFIg7MzR04MrR+cyCd1uEX/MPZcFeK0dDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=V+xcY9lY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="V+xcY9lY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso29404335e9.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876564; x=1730481364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvdhnqZWhjJaVRixzXDF8i8NipPmGHymdrTVaS8WSIY=;
        b=V+xcY9lY8+VhefPvWzvQLqs6bq0IAfYlzx1Qac5aIVuRmlDHdaUyzI0yM3j98TAlW7
         msIv9Rj9FxN7fUfMilC5Bd8V+6S1VIIBfTlJfwvEsEH9rWMSs1hgRTTZgqXsZ1M6g71X
         toGhaowAE5/RXAVcJw4kuyeLnwyhla015DwIqXqJtrMHO8kTvN8aJlfEJELY4y47GNQy
         9cB8MMLitLuRHd4G5ug3nnR8bdEuvsica6nqnmwcD5r8eTVQuBw2Pn0Fgn6ct4Cf5agz
         aZ4Mfty0uRIl5z0nv5dmgoMh0D0poAtOyOKVRz01XpYFrzoM7iCrm7msOqWYE0SxCySs
         E6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876564; x=1730481364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvdhnqZWhjJaVRixzXDF8i8NipPmGHymdrTVaS8WSIY=;
        b=Ld8kUSiizZqw1tCOw3FUePl/Rg4nCYRjauwhg5c9Yf+gTX71wLu3BER/4QvvSCQXvp
         fIR5Jg2fy7oqKCVws75JvOZTC6Lkltt2hSoMgWcBqE9woR2qV3g7/Ml1b7Fibxm/et8G
         Av7CKNVO0kOmGMq+M+1ap9B5uARidSspmP9yzAhkZqZqHEchEQUqL8CRNMxRfPdps9aK
         2pyZrqwAIslEdNEfZQxd+mvRgRwUoyTKQVyzcK8EmugDT43Pvjwr5XgmIPN9HIV2p4/Z
         2giHTAG0C2gdNQgtK1ksy48IDP07HGUTXwjWTrIaMMPlForvy26arRZ5rgV6KPXuTwWH
         hMbg==
X-Forwarded-Encrypted: i=1; AJvYcCXB7tXSXZy2YO60HO7iqQCV3MoE6RHkiYtwZQ/P9zwCwQThkUb7sBTS4UDRIOmo6eN7WD/vpcvpses=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeYwS9WDeyrXWfV6ItX2zrEBaCg4VZ94a/HRUXJ4SIn40G3wtM
	3qFnahiC6/yfRzQeFF4rTgyjqth1AtP5MpbEvJqy/TdXY9X6/MkDfGPzBTlkkYw=
X-Google-Smtp-Source: AGHT+IGJw1+OsEH13czUNrPVKJZqUz4zqCjXXtEZzfN0U7VM1+Tkm4ryrjbOYe8QkQQMzLnZPTtsFg==
X-Received: by 2002:a5d:6a07:0:b0:37d:4619:f975 with SMTP id ffacd0b85a97d-380611727b1mr120000f8f.19.1729876563675;
        Fri, 25 Oct 2024 10:16:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:03 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:34 +0100
Subject: [PATCH v2 03/36] dt-bindings: display: Add BCM2712 HDMI bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-3-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 HDMI controller uses a slightly different HDMI controller
than the BCM2711, and a completely different PHY.

Let's introduce a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 5b35adf34c7b..6d11f5955b51 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - brcm,bcm2711-hdmi0
       - brcm,bcm2711-hdmi1
+      - brcm,bcm2712-hdmi0
+      - brcm,bcm2712-hdmi1
 
   reg:
     items:

-- 
2.34.1

