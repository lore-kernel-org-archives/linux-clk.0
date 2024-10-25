Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619CD20F3F0
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876568; cv=none; b=n3/6vv5NBuOz2xVqniz7Fms9GYR4NjQdD83qh0FZvnx6yFpCBoN0649u6FL3TxOLllExKFhCvK4tsHg/46SHVjUYAGbxantkox2jRxLzunjPJoUiRcdrJvFDCQY5sgnAbCV+itGTr+TL/I6div7Dxt49U7U4PCTLOhrgKfg9nDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876568; c=relaxed/simple;
	bh=dv8rXfxqR9AoaKXMEWoKx/PzHL9rfreE/NSbe58pUjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9uRMY1DeeXUVeL0jpe/CiIDvMV+eOMIgx2LAoXhuf8BlzmVufBinDGF0TTSReGSLiQJQrGtCDdlah7KEL9x4s9l5D/ujHeeT5oXljNdeHN6tOhw9M1PiHWnRehPzb6SVwBk9TNZa0WCezIs4fJcawd7YOIXbMWeDL/IV79Y0jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HJjVLcs+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="HJjVLcs+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so1934572f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876565; x=1730481365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=;
        b=HJjVLcs+IYrKCIAFPllcMjTqWsTYUGTjnYy8bsc11ErFpesqL0/OfFmeURCOlAFw6N
         cA0VjAtf1XA1GuvY5lXk/fVmvP/u7Aq+cxbHNhfXQpTBRKWL0Oi/wyR9G377wnJX9Y7W
         Vc2+5ZUaSNkPnewVwHMN1iiRa7mZsOfH8AzWdM2nni4G7y4b7ZYD0XCxa8dSdV34sTWP
         b3PRvEsh719ni0A6bOp5+UXVAEYns3UzmHzwLixQAWoaTnjck0c+taIXv6rnyR0au+36
         5KaT5YltUO8riZGBSh7PoWJtUeN8nynuPauzN+31PIQ1j1gZZZX9cXzSQn02dIMfLVgq
         W9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876565; x=1730481365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=;
        b=wdMzO2CPEtVoSSWgR4JPPCFhikfCqHccnSg7uA7CWmw3VSKDa6W8yjMeccZLVw7986
         ZQfPVRnIDxihvOZu7Hulo7/hwzETG6d1JZ9lyWOjnnurKZP3/H1mBY5ur4QLoqcOTfyH
         5RS4FFqpP7Aw2bVxTyH/FSgsFjq3KjyO89sohwGL6ncJmFxZ3AB37zCK1LJXqv7m69h/
         XHufrb6UQ8BBhL65PHsU7MddwmTP5aoRgDmxYVULC7KaZvkVu+2NJYTAsr8VNGrpUSOF
         7NonXm1sBSwx50ArQTWhleu3MRhV5JW/nLAxsbkXF3LIpxkrA+/Owa0rHUhYsA4B5ukB
         OyIA==
X-Forwarded-Encrypted: i=1; AJvYcCUnrwKPTggoPl66nx7fqH3+1QOhFpOYgXd9Xs++HGI8HgS/26WM0HGj+ppDg6FZPLnZ/8Ol4D7V418=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoqj8BReBL6qXBNReo26naypdmA2O90HGi6f4dn6YeuZFgEJkw
	PHlP4GMkVkG2RBOJ8ChAhBB/wWgjENsfbUD+W8UOjOeuYhAfaiGLVhtIwfv3fYE=
X-Google-Smtp-Source: AGHT+IEFF/mt9prwLkoO/wBDShJYk4RCDN1nX+/N8QkdDrkFHXlIdTeqdVrZSLG6RmWbSoiHWDwtlg==
X-Received: by 2002:a5d:4106:0:b0:37d:612c:5e43 with SMTP id ffacd0b85a97d-3806101335amr193017f8f.0.1729876564669;
        Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:35 +0100
Subject: [PATCH v2 04/36] dt-bindings: display: Add BCM2712 HVS bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-4-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 has a completely different HVS than the previous
generations, so let's add a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

