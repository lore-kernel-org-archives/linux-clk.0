Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572EB1D14EA
	for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 16:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702221; cv=none; b=h7311B6wIUyzr0nxE1Xq0pijz7Lno3AS6SwZTuemnZR1pdnG1n1b7g+nzEIyvkJ3SMYVW62EQRT5dHa7h/+PHkaZlb43/IPbJMvsBFRwX9Xv78TsKqt3RPmmnZ4vTrP/bvOVXBcMVonPayLu0rem3ca4zuSeHqf2uB8W5q4ABPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702221; c=relaxed/simple;
	bh=qbTXGGCtCxRZYwnAfxwA9KNcR/Ug/Ds7SZHmLf1ddZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQpIrShon667d0QUQpbK6+l6Ip7O1Pbmujxj6fCJcsfQamjx0PewexPjiex4FZNS2vT3ErxkzBsXaSBTzLLOr83jqA8LYppbHdUTShElxarmURktcInnx1WwU3AVwUHApJUZmv+zynrYBZDHxoXXyHcK5mozrBp3MdvkPQaBvY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=RIEZOMkg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="RIEZOMkg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so70318515e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Oct 2024 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702218; x=1730307018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
        b=RIEZOMkgwOIyuGJ99o+X87X1vK6Hjd4OClbW5nexDC6RDF/0yg0raqiVuSIvWin9rs
         jfdU+4tL1vl5JRBELY5DrInBm2o/k5Qmz2sWszTQ2Y55gq6nMqDOCKTkeyOu1eacL9P4
         PbQCTV6758NrkNavjG/lm/yfwnk7Gy78oc0WLkfEb4hNh7dKQqKg2qATWJ4iOeLjaVGS
         7VeDUhfCeDEmVffJf8k1eOvKwb8suzfxbNxlIPBI1+NfSJHn5CMXSlrc2Dj7VzVYxeT0
         MI65NTxg9ZheR+IWd+kEC/0YVVObNdK4/AI70/0mHfqRDP3YxxI61+6UvgV0SsbSx87M
         oBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702218; x=1730307018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
        b=M8aA7AdKK57g6EUZEJSKmYk+B7+zfWNNew04IxyIcLWktqMImP7AbxBL/mPjzHudlV
         2FQleKnZDB4+v7Hx2e1Kb98XblEE24Q0bl9oqNLyZiwyBsE/YioN0d8lbkq4MLi0kzaV
         Te6wn9nBFZ7qbrKXnPx0qwea+mXA4+NFuOYSB+sNVW++Fi90jAKqARxkXDPQm++US9N4
         xj2XOr9YzYVe6/Rqh/tti1oKpVGcWkMHK10f+vNeuVZXejMQ/cwwaQuIWuyoFVWMbgsn
         MXQ/ZW/gF4efXdyRJCf8v8FdY8aqzukZG12jRn1YoVyhD2TiUToB6FN2pqHIolxsSG7M
         v83Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtf1wWqIXXu7tb0DxMh57PcyRwgzTGOXVFAhd+i2R+44kf4sqp5yrS7gXTKy5aYHYXiCUhTCQbraY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcOvMLtSu9I7dN97Gi7aM4g3FaP579cgEpuOe+pZ+AMx9JD7qv
	RCEvMzGCESm6IRIHXcE5ooslcAwhxUWs/Sh327wweKrYbjCom0Jna05/7aAahWk=
X-Google-Smtp-Source: AGHT+IGRXt+xjnUqmt434Ic5Jf/wCUKhHYDJmvv7fkNd+2lWuUEM38OLLC7VPFEj10VF2wQhrQ46vw==
X-Received: by 2002:a05:600c:1d9b:b0:431:4e82:ffa6 with SMTP id 5b1f17b1804b1-43184188334mr32238395e9.24.1729702217658;
        Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:07 +0100
Subject: [PATCH 10/37] drm/vc4: drv: Support BCM2712
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-10-1cc2d5594907@raspberrypi.com>
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

The BCM2712 has an improved display pipeline, most notably with a
different HVS and only HDMI and writeback outputs.

Let's introduce it as a new VideoCore generation and compatible.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 3099292f22a5..417a5b456d80 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -460,6 +460,7 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	{ .compatible = "brcm,bcm2712-vc6", .data = (void *)VC4_GEN_6_C },
 	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
 	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
 	{},
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c6be1997f1c7..14b0a7ef2683 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,6 +84,7 @@ struct vc4_perfmon {
 enum vc4_gen {
 	VC4_GEN_4,
 	VC4_GEN_5,
+	VC4_GEN_6_C,
 };
 
 struct vc4_dev {

-- 
2.34.1

