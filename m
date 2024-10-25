Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DFE2161F8
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876596; cv=none; b=X5jOcMg9TxpPfigPo2osfed9mFP5GLBfaMVVBjGw5VDKXL/QDNgOcrdr5FcCIKEdLjt2eIxQF5UbCqrBwUhwddZHY1iBmDK5XqjDmRV0C6JA7HqgOwiyEqWGAMau++xb8DjUtyzPWWTPX+9tpbHWnNsj6NlW2x5L+VsgoEoaNs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876596; c=relaxed/simple;
	bh=SjVwsOGppg/2aMc/EjblXpBI+5dLiqOiAgVLBX/FLjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sah3GYYyxdrZnn90SHQv41lvziCWoT+RfuUTPU1BovCLyn+9Vyq1USGE43dt80z5YhpTn2jQ7GETy9pKXpcqFKmoSwHWfHDFjFzj0UcGK9xYoOi2dGp7XCZilMzEm7JSuXG7zvTwdxEL5E8LeJj9LArL7JfHz5xSshiw+WfslKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=nscASpWN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nscASpWN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so1429682f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876590; x=1730481390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbWeszNg1J6sxJWK/VxJPpcVrMqaA756zdsXOCwMWo8=;
        b=nscASpWN62rI3D3OGjJsawD0pakTkw02JI4PNGo7mhlMvdQI9GNdxKlfxn+iCFzikT
         vIPkqzaVmlOqvfa0vJH/6bSWvGkdANytMsXaNrAuMjQjhfW7SJXOiWnB9hxyrZ/s8G6m
         R2wHQghhb+raBag/Bb8o2OzYqatNWOEY4UmOz7lpMPmFzaQMA4FFAJIfWpVB5de6trfv
         AXQYnWrfcWN4mcSY7GL1Rk2FQO/p8NBQqL0qyaJURh7Tv2s4U6op2aTQkiG01eV6X/+b
         dn4/X9r778R6/vHdBp5wDVUe/Jd3VUjXlig8cfEYiuCDnQ71TYVGFy/twA3xlj7g7vSk
         uZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876590; x=1730481390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbWeszNg1J6sxJWK/VxJPpcVrMqaA756zdsXOCwMWo8=;
        b=ITE2UPnyaipQVhvcoT1Igt0tFoENDT9opdhBnLJp7Lz3KjTu73hJYBuKONI06KSYdD
         88qybGFvjlh+kq09+44NkTd5hYDdjVKMamEVjBXNL06zi86W2A36esuRnSxCsMbLMB8I
         GluwrC5UX7ZeiRff4j9GyijdgPeianvzeIlmi23dR8f4qrY3tCX5ZoHaM61u3Pxrwa+9
         B+D918Z9QxRF1+ZXOU6dnUd+6yCNKGvC6lOGW6nReDuDZYAm9D5sLRMu1Jmv0IG0Z6VB
         96j/+Siz7jNv04K+8NxfZyp4lJpjr2nuz+Hj/9lUOH5JjVAEJgMFgtKSOD1iBFR6rK9q
         Pk7w==
X-Forwarded-Encrypted: i=1; AJvYcCV6NFApTR5lGE0S5GOiucKfIp+bR+5ZryY6IqAIx//VM3vhmfNQbnrMG87mz+Ca504ELFJMCGXgb2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJCs4M3v2gv0IrsNG6UmR78cPsQIljNXc/IuMQ3xoF7doxjej
	dqmd9JDqD9JYzTJJE4gV/GqBl2Iiuk2eY5uZdQ2iIxb3JFAEWYBpH6YTfxtsIfc=
X-Google-Smtp-Source: AGHT+IFzLQpTgUQ1GGNf1FFbit3NR6SLMLyJmHIlrv1yJ02k6Akx4PaydsdQXONZLxuVWGUKuRmYsg==
X-Received: by 2002:a5d:5224:0:b0:37d:53dd:4dec with SMTP id ffacd0b85a97d-38061137a3emr110320f8f.15.1729876590408;
        Fri, 25 Oct 2024 10:16:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:01 +0100
Subject: [PATCH v2 30/36] clk: bcm: rpi: Allow cpufreq driver to also
 adjust gpu clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-30-35efa83c8fc0@raspberrypi.com>
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

For performance/power it is beneficial to adjust gpu clocks with arm clock.
This is how the downstream cpufreq driver works

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6d5ee1cddded..d374538e7108 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -156,7 +156,6 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 	struct raspberrypi_firmware_prop msg = {
 		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
-		.disable_turbo = cpu_to_le32(1),
 	};
 	int ret;
 

-- 
2.34.1

