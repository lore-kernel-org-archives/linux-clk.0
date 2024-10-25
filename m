Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F5214429
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876571; cv=none; b=t0mmWvQVqBTTSl9AJFXTCaS80iF0+Ney3QMwGH8xWZK5lwxSs1sgRi4AfCTaSKqd+tKp80jZ9ZR1I7ia47bo+lMDR220drxkPtCEmaBOhadS8a/jV1j97gPwBJ0ubdc8L+uJ1k0fzowlnxZMoNFNeB7nICMuFHCKp7OcdHXb2kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876571; c=relaxed/simple;
	bh=im8lPEqPibwrkF20d8j8rEeYbRDE7CTkHJHOC7HO310=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MF7GcFTw9TPa9tJzNkNk/zSNzdTxqX1x/bBdK/tFCUh095cSEyEpMGlnC1x6w5Wm1ugA3opbiVGuN1z8rdO8kr8dJhA4+ZOWRyg0KbgnHsOmL1nj9BYmiBc9GsrP2a5ikGucRSwTjXSgVvqP+hTaJt4sT6oB76wXvXxITreEGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hq77L8ag; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hq77L8ag"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4c482844so1395421f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876567; x=1730481367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3D0msUfHXMuv4C1SeqQ0nPQBde1GE17PCvfA0szIc8=;
        b=hq77L8agFTQHoKn/LUIhqFf6iqy6b+G1eAnm/qLM1cxLur0NTEegbLWzNJM8hEh+Of
         nFX00/o0m9xoZBJjhRlO3Zu4fpfcs550HPEkoBA9rmXVrrqrRFmcGwIeDVtCnwWzvXNC
         yBmyaru0/ptOat0zlO4NeedWxcMW4B1dDC/0c+RebeE4/FR9M3x+U4d2rAfwHV2tJSvz
         vHCL2C+pDBCfazM8zxwjJQjxwTl7j1XizllsDSA5NJfZzMu0MJNrqkjN3bEgdGkvZ5gk
         IwTeRGoqUbKPmHETc+4GemGhrhyjRGKKz5ktRwLyljo/m0C04TP7QO8btNpmjmH1wyb1
         GLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876567; x=1730481367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3D0msUfHXMuv4C1SeqQ0nPQBde1GE17PCvfA0szIc8=;
        b=WMqMYNDo9p7vP5/gmYEAmXEm97OVtsE8+KtHO5I7ko9ep2j/UUzLCXqAaB9ZM+qPt/
         CUSZgZnvbhuC3X/8vlW3UGqcRvuD22wWoCiA+A+UhozBs0l2yQqU7d0vCCO9UWeU2+WZ
         3Xew9alN4OOFeFLjjF6lL5ZCqkAqGJ7sfkN+TPT+DuI8FVm61h2FeLtjhu4AaWuprfPJ
         77OhmIYQNsblsf0ms4ttNui052BXLLjbd2y8KUd2AwjAWjbo3Nmr9Lf/0g3GlRJGWaux
         RvY7At+pK2OsuT/jqSSdgpweNQfoiknv1jGcx5AgFP3ZcpBaj3l/bTNLtSZEHN6p/FlS
         vfaw==
X-Forwarded-Encrypted: i=1; AJvYcCUFwRSGbRpp59nkcqX2sIeAoDcYMcMRSPWBkCkS1VwNVu+raUTXQm3G1pxQhv7Ov0s1hD7v+T6Dwk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZOJgbHHOwBtuQJXr0GLh5y4InXMGXGHL2IxDXGbrsqPBFgexN
	gclewBDRRDa31XWBeO/pILbGk7R8zLa44pi63hpkkwAYTTh7ZjeAy5VpTErXmgo=
X-Google-Smtp-Source: AGHT+IG4wS89LpASUknXmvnY5DCWRnrRky+UYDTB7/8M+xpU5UpHS3oldLC31P65rzLuem6Jwptv4w==
X-Received: by 2002:a05:6000:c90:b0:37d:511b:aecc with SMTP id ffacd0b85a97d-380611ff90bmr97416f8f.54.1729876566840;
        Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:37 +0100
Subject: [PATCH v2 06/36] dt-bindings: display: Add BCM2712 MOP bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-6-35efa83c8fc0@raspberrypi.com>
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

The BCM2712 has a MOP controller which is basically a new revision of
the TXP.

Express that by adding a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
index bb186197e471..c9c08042cffc 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-txp
+    enum:
+      - brcm,bcm2712-mop
+      - brcm,bcm2835-txp
 
   reg:
     maxItems: 1

-- 
2.34.1

