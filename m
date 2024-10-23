Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C892038CA
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702252; cv=none; b=ZBIKOZZzspYH+hXcE8dxMjuxGC+Bl7nd8hnzvvR2PalvTwnS4yqtvDi90z3+YB994sTt54ZO6R0CZ+owO7yK9FC8BiHAx01r7B5W2HxdyuwB7GqPWzsMEfbcotqvC6GntGdGLYf8qpnfgFYo0cVmoH3/qjal255nW+a3fKPsA7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702252; c=relaxed/simple;
	bh=ZpoQHHOugAokWeviZCRyfQ9yR7PkyScHju2uFvM9Aw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Be/atxVFKZBeIWULnxJINlozUA3s6v4dacRrV+1VkPli8G33Dh/ajIZSy1hgAxX8TWJPa0RuLjT0fZ3iRhyzy0Racqwn6Z4Uca6KfVBTROOB2wP/5Q0UXTQQK1P0dQ+Xbbb9FHtoME7m9KrEPgktS2Dcbvqi5nf0fHR4w5raY/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pOwL66H6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pOwL66H6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315abed18aso67277205e9.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702248; x=1730307048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXVu+XPK1twrhAqeJinZn0FZ1mNK/jEIbakCvmjUtPs=;
        b=pOwL66H6CdJ7bJg8VymBw5mpXmteWXfca5HnOJkb5CIchGrgbvPK5mWE0EX6i7obCc
         mxDdm8xY8ir9gCzab7wRdcarsArLtx588RfkJcdD+1dYkVLoHiQkUc+QZypVNNxAtxRS
         0vhVsprVFQOlo3sElaIzOb76LZbaAoCym/0Q+9/pUZfOxWG75JwfOtYllmDkpkC849qc
         ijPJ6fwRKWyGOI1ySaXl+aV4djI+aAgNMVw0ybWGEhNvwjkNOwMYo5dU4tDqNnQ4P4VJ
         uXxEP6iBcq9wGzC2E2Zjn2zGu+uGpybiWwLaOKRYB4s6gXyuNsctxtAVl+g+FMl+EzbO
         h2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702248; x=1730307048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXVu+XPK1twrhAqeJinZn0FZ1mNK/jEIbakCvmjUtPs=;
        b=bkkTfMBVGpO/TWng/B+7yXja9zkBiTmreK+WYi1PuZqPMZWTwZ7qJniWFPAV6UKyrm
         kPkeJpI10FlKHv6qJTYqx53GlbYkKVWR1mcSGSGp0P8I4mljzM3BKY1Bb/m5DOReubWN
         39vSI67fi7/Ogxc2dkDhWOQuH8ODQq+vvZgzIFP6DcIv/sq36wqJCdPhfrpFcULZOaOB
         vRSEr10sJwpw2zITnYL6haQ6xUQSvlUfzeJCLJ6GzzWTHZY9K2koCRgx7NIBUd4Vwrz9
         QThbLZW+EzdjVefXrlZFoxNyNH5C8oPzeIeGbf/fR+N2LNhq4TOVeLA2AexfUGXmPBXW
         F44A==
X-Forwarded-Encrypted: i=1; AJvYcCUo9s7rmriuhEMQ+NaA3hgWcgnhbMyiV72jNBnzJYt1G+vRY2FxCpso61/x0lprmPCwmNsUpKTaBwM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxez5cqSFvgltOQ1dIXRnY8ByhGnMe0njb8F+bs8w31bi7M4OQ7
	mPtqXMHUv7auWa5E1DAZnZa3euzLEQXz5eDa8W2lq+dEcPuAoXeQnbQ2q94g+lc=
X-Google-Smtp-Source: AGHT+IE4mgCaYm2elKT76LlNq3zUCFQBwxYPgla+kkQUxdQtty9ocFGx1hYzfLUy3hw38CapCGa/1g==
X-Received: by 2002:a05:600c:4ecd:b0:431:612f:189b with SMTP id 5b1f17b1804b1-431841fdademr30938035e9.12.1729702247813;
        Wed, 23 Oct 2024 09:50:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:47 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:25 +0100
Subject: [PATCH 28/37] drm/vc4: Enable bg_fill if there are no planes
 enabled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-28-1cc2d5594907@raspberrypi.com>
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

The default was to have enable_bg_fill disabled and the first
plane set it if it wasn't opaque and covering the whole screen.
However that meant that if no planes were enabled, then the
background fill wasn't enabled, and would give a striped
output from the uninitialised output buffer.

Initialise it to enabled to avoid this.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index f15aba4b81d7..5d40bbcb3b54 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -936,7 +936,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
-	bool enable_bg_fill = false;
+	bool enable_bg_fill = true;
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
 	unsigned int zpos = 0;

-- 
2.34.1

