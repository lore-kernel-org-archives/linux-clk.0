Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63562215C63
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876572; cv=none; b=jXufSV6QGJ1EHTdv2wWbMSG27UyWpfSxf9zhQ0lmP/9IYMDphbOmqit6Sqlj+wXhOZJwBAZbCAI//okqa54mFsFU8JjRujLsIsdv3jUwDto8SqmC3iPExEBw+FZy7bR+WUgOeTeW0Tkly4tZdXwJ1RWn5/6sQVY6LyCA2dBGdfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876572; c=relaxed/simple;
	bh=k6R9IHCAOKpNgfleJXOjd6jC25fBTS6hozkENjnK1mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lqunn97Hupt10lsbPv0EAqoAihn7IT2A4esNBKikTBaSycI+gcJ1K7nnTI9n4pNkzuAXHhQ3HBvyZszQb9H7B5CUFXLWFXWMXePUr7SfVtFVpPkmop3RI3mGm924OgvJuXDpHn+Yde9AuUBIlxFdfLxLgHt7GhY25l0nD8X8n5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GzcpFNPr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GzcpFNPr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so1495027f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876569; x=1730481369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=;
        b=GzcpFNPr7xDAY9PrGbdMlSYoEGgrolnKUN16DFcZd3jpXYJKG2tlyfn50MmYvovr9h
         cYoqQByba0/NItPP4jOSggUw4SGQdegNQi59UHh6wt7+1q8Id2RifGTustQSDEBwsPRH
         ihQD5qM1On7JPbVhwFpe7YUIj8F2jSKlc++HgcePn0NGlKqAtQIrzXg6/LWa/6nfI7ZW
         qwmSRD81pKvMxOvfg3EosyjGaY979jLB1867azbdCTq2K1D51lYYZ0tjadv1jeHSRwE/
         0HBU6YPwx/Wko4l4GE7jlxByFw5zHm/f8j4av8hzUtGLqcNiS4dVjg5uRmC66B2BY+24
         AGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876569; x=1730481369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=;
        b=XNbtOnAYuNzSIzSO82B6B388tfMvE8BF8r10r6Cx3/2cH0PO64etn4riu7qMY4bXpR
         Q8vpWzlX6f2ZZ3rEITL2EhpPYU+FGwPg+Jy7UoWbk0Jnn6qkUkT8gUwCKJpmDcmboVUP
         n9AxuJU5hpDKP3RtphbbYwuyrvwSD5RlOurOMkjo16dqd4mKpnp329igjN1fMHFHVCJA
         t+qkXqXvkMgZnYYemyKHxi20xSLAcpO/UkhGc+Wh5Etaise/u0qx6vfv6K7MtEFxX005
         EyUriij0c8LluKvZZbkDAgiuVplN7XG75po7uT7v4YYfLPSQ7VU6XzFHjH/xPliJSZCe
         IN8A==
X-Forwarded-Encrypted: i=1; AJvYcCVW8hNyBCGCoPN6hgKR9xOalmmmWN166rdbbMsiejb1FI8Ca/QuleKnuGtxWnMBNLe+nDYoUBq1rHY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+UWWnBt81hPhKQBAg3ky48+qpGv+PbYhZj3HKqjI5jSC8Kv4V
	zxko7jwWMvuoEf6FurSmNif6ouMq+G+hJQ4QGwRDRKdaBme1MoEujgiITb6uEzE=
X-Google-Smtp-Source: AGHT+IEtkqmEo1cHWR2W1weuYPM4uWgJxftiucw4MZPmb7qQfL+iD3mzdPD9IiAb9rW3E2dTgpbMnA==
X-Received: by 2002:a5d:6082:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-38061122a87mr106867f8f.19.1729876568721;
        Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:39 +0100
Subject: [PATCH v2 08/36] dt-bindings: display: Add BCM2712 KMS driver
 bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-8-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 SoC comes with a new variation of the videocore display
pipeline. Let's create a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 49a5e041aa49..2aa9d5d2afff 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-vc5
+      - brcm,bcm2712-vc6
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 

-- 
2.34.1

