Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6431B1C0DEA
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058134; cv=none; b=WVqNZ03WQapPfOeXuk7oF+uqtR8WE+QMsEkyAZMWfgy8aR/hJitxx9mnJdnoCmnvZ6UyAV3epu7/KVYPSveZetLjGbwaWjXSYj2DXOkC0ZhuDraQQU8Y8OIipdOpjQWL3o11DYz6dxfAsdVgqgYXQ0htumLukzBNWt1xuFH6S2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058134; c=relaxed/simple;
	bh=fOA9PRzoSPSdOmLcXpSzgPJnmVrBIbISbwQee7WCels=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JLjT6xgWQuXlTvonkAsRXp+E9QucmuFavaD12J+9PQS/zc5Mc1qYa04fMGCahvO2v+mX5AOEMyNME91JPtA8T7fuVYjNBxA8V8P9X2MEqSr+bGHetd42JpGw/1/0h0wdErX8moHyh/tns+7hLM+c2Bt3U5ZAps9XlkUKhvX2jI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bctwU5M3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bctwU5M3"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f44b4404dfso5771645ad.0
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058131; x=1717662931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xwThRWWm7RGJSY39HVyy4ljf9OK8/1xd1SRHdwBmpo=;
        b=bctwU5M331EWFWasLTXDWtsRprL4uk6qi8hPZrnKFQLPV5zdQ+AcKI9xijUe1d1CSI
         uenStIs4Qb9q9cSH6GlkmA7dPx38xuAnuDnZQaddXJOJNz3HdqNYU1rc9CQoopDKmjkd
         QVfnq/oIUN4Z+HdD3MwFAJt/DoJYWW4UFOshE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058131; x=1717662931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xwThRWWm7RGJSY39HVyy4ljf9OK8/1xd1SRHdwBmpo=;
        b=p5JLuUxIsc+HdPpg0Jdt8/olK52TIUVT51liYUM6AIdSn0x0ALlPa769m9NC0+JCeL
         1+J5ATYlbHZIV340CKS2HKbGOkHA7n+o1BUGcudOAN8Xl3eGK77xSJhNEgi8Hgp6w0JM
         O39B/GJV8XBmStROZgT3fpCBHrzkYkeUVh6vmZikZFHQeXZmFERGvS679q4UsNGlRbOH
         FT7GXDUBs4UK7gn8ZP4lnlkW4r6H13nwnDeP35EKgjr8ofo1jBeKj9dgT4wqBXt1taVf
         DY8/MEWeii9psrhNQNgAKs3r3DFsoRSIxPiaqFogm7WqSjAa/wlcIk5WFfa4o3uU15MT
         BoxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKUfoUPzkl8vrbWYMjPSg5O2qkCcgrX9Ckl5sIavwyXYRIkqO5iG/+fHB4/sdX9NAkdb+ojwFIcZz/v2MSNcqKbzxgHLZBHDLJ
X-Gm-Message-State: AOJu0YyHZAek9lZNUswwntzOEzpNajiPxUG0SXCsf25xwOnvkhs/tvsO
	uGz7zhMU3YNTYBQ5VsWOUB6zYc5sPhCfL7+NiHA7IOMtg/EvcPgCMVp2aCfESw==
X-Google-Smtp-Source: AGHT+IEp028TMUUWRl/RXoMRYp1icLkfUsk+YnlWATTbz/4qqOD7Tx9V/9ogbJ57638g/PX+8PWjow==
X-Received: by 2002:a17:902:c409:b0:1f5:e796:f26a with SMTP id d9443c01a7336-1f6193f2c1cmr16752955ad.5.1717058130799;
        Thu, 30 May 2024 01:35:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Thu, 30 May 2024 16:35:02 +0800
Message-ID: <20240530083513.4135052-4-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped. The compatible string has been updated to follow
the new naming scheme adopted for the AXE series.

In a previous iteration of the PowerVR binding submission [1], the
number of clocks required for the 6XT family was mentioned to be
always 3. This is also reflected here.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087..48aa205b66b4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -12,10 +12,17 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8173-gpu
+          # PowerVR 6XT GPU model/revision is fully discoverable
+          - const: img,powervr-6xt
+      - items:
+          - enum:
+              - ti,am62-gpu
+          # IMG AXE GPU model/revision is fully discoverable
+          - const: img,img-axe
 
   reg:
     maxItems: 1
@@ -56,6 +63,15 @@ allOf:
       properties:
         clocks:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,powervr-6xt
+    then:
+      properties:
+        clocks:
+          minItems: 3
 
 examples:
   - |
-- 
2.45.1.288.g0e0cd299f1-goog

