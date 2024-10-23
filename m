Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4D1CF5C3
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702216; cv=none; b=loZLnzs6pNf8OEn/6uhmE0H4uHVNB/QiiGACC5ZbvKY+5Jm0LD/1k2C1SiCfajCpydC8NzwAF6dXuPDNLXgY0RYOEu2PQZPPDHs/ke68y0yXWdsfU68UWspp8+7zfH8tAH0X9kpOIZqpxuLZDFyNIGPDoCp9rmylq9Po/bZ5oAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702216; c=relaxed/simple;
	bh=uQSMO7Abrb3EmzD4lBlPnbiRh9+yEgOVzcHKKpTIN68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bmghu7VqaUgyFMDWa+srDQNZ/9wjUCN/jx5WZPsZRek3sPgjkprvcot1EWz/hiQIWVARMkquvDQwn0RD64T6n/EHZ5tYQILvGl6ohIG84GWjy3c+GAcloeg4vAdqvQq6Ieq8cIJT8hA+x3a9ZPWV7mB5Sjdzy9cWNH4GbCBLUVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TBBTcN3g; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TBBTcN3g"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315baec69eso66519375e9.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702213; x=1730307013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRsyBqkiezxBnssjhK1B67iF/aAHVHcHQNujZZby09I=;
        b=TBBTcN3gkZVnsW1VIOSAIx+SFkKAgyzDX0LIE121/TX1NlAPfmfHHHTDKV3dMNEb5C
         J+Ezd5nzHkXYK96ezwnLQ69hXXhn9KWCkX1VUXA396ChiFB/W5IYPbbaVMHjkMcp009H
         0ZcoVpkmVZCaOFEIuWi3y52BVhmm50qKFixF67beDQpPlJb44Plflqs/eEdGZneIiHFD
         bx7Pn1593P0nWHd3XUl/iSQ739sUyxYc4BP70hGxiYlTOmwAsHdxV7qAzarCZKzyKXDh
         RUxttddCRvhzpJXKJbHdbAYgUQzLhTcHAo9Tvc8Iio/FS1v2lHXdGEl3k73sX3idM6hQ
         Giwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702213; x=1730307013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRsyBqkiezxBnssjhK1B67iF/aAHVHcHQNujZZby09I=;
        b=uzL3T930mnrFiqUzvKXl0X5xFM84wHFIlDu8dUS6hLpA+lYV15uzjT2WN02mDIJHxm
         ca9oAUJkQoK/0dJowbwbDHAnFhvj+RsoBmYW2VhN9E4RS7DmKefJEizFP6eaLOcJI+Mr
         hXg5QLt8m2GdU0Cj5L1LxIoqMLwWghnzbgrWqj9nZwpi5Ce1AA1DkS7Pz2grddTC+usn
         y3VPblcxAnQWDd94ObxtBZ+XxQZclDwG6TloptRKDKcMdgOYAyGvbq5gb0sVHo4dQMl0
         lnAgXnZlMoPsxQNfouv0roSEzqLRTY1pn8VyeVLYxQYXIqLAFxdcTmhjDE1YX6oSLI36
         PJCg==
X-Forwarded-Encrypted: i=1; AJvYcCW1JVxYXZj/J2eZsvGbrM2SSZ58lJi1OPXxnDCW3ucEzA/se6Og2Khre63pLQeWNu03WPqQMuLYWJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqg+HjRKoyRPXoeP1PWXaPjMQbFJEmLFoEUcfn6V4Uc4TYr3hf
	JR/YrSnsN8U6pgOOg6zWypqVlGEoLZcYO2BVYhv66zVMAjBNNUzRQXL+ZJgoFFI=
X-Google-Smtp-Source: AGHT+IGDZgGkDPQj1asKApxHb+1RRVP4pBKwGrn8gf3ud6Z4Zj4ffcb+iWXuf3VXHoFcZCsz0HsC3w==
X-Received: by 2002:a05:600c:35d3:b0:431:1575:2e83 with SMTP id 5b1f17b1804b1-43184201b28mr30823345e9.10.1729702213156;
        Wed, 23 Oct 2024 09:50:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:12 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:02 +0100
Subject: [PATCH 05/37] dt-bindings: display: Add BCM2712 HVS bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-5-1cc2d5594907@raspberrypi.com>
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

The BCM2712 has a completely different HVS than the previous
generations, so let's add a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 2e8566f47e63..f91c9dce2a44 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-hvs
+      - brcm,bcm2712-hvs
       - brcm,bcm2835-hvs
 
   reg:
@@ -36,7 +37,9 @@ if:
   properties:
     compatible:
       contains:
-        const: brcm,bcm2711-hvs
+        enum:
+          - brcm,bcm2711-hvs
+          - brcm,bcm2712-hvs
 
 then:
   required:

-- 
2.34.1

