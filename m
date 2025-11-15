Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BF72FD7B8
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216059; cv=none; b=E+NzzXdDM2pI1gIAAVNmSB2UP1Y50AT5CpjSe2ITj3b4K/v66r9TSJoS+Ro8sc+7TLuadLkegwR8c+qmWncQv8KWRRDMHBJ8Dh9jOTHN1e5fvN3VYN3YUlP3Bd+oeiWBvF9nwjEOMjylBY3rPLYWSsWkk1UPf2RiEzPxMIkIBls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216059; c=relaxed/simple;
	bh=S0twu21aOxJ0VLQedxu7u559MvY/4tOCK9iLWkudnWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8imKS+Oar1u3q/ncbivC2DEt6bMRdg0BJo5KLl1A5/SLC+1ng29nZXxVgbVCY7sinrlUKH2A54M8zvm2QWZKEtmCFC2qVEUwrTDGC01wGsCkqCb1DijO5uV6kt61gHDGSNGVbbjco5uL2dD+nPPWFbhueCnfBr6pYYFRwwZq3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGKTHkTS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGKTHkTS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so5587829a12.0
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216056; x=1763820856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
        b=bGKTHkTSMmDreaLRKekZdXkPAu0VMx6SORhMdmq0/nSmU4i93rCk/bTMxpQV6P+gzu
         q774IWj9qyOphosXqov3uMd8ZR/0qrToRzCPclfVfExUXHOA2xMqM+tYmvFmF18ufhSv
         bIgvfK4smUSk6zr5xlbhb/wP3hhXjYY/XlxztYGS50cjQL8CyCs559PFr5TqD3+G2RNz
         4o9C43drnPLHTrtuyTQCoCcAjUQXxFDgB6gUQ9532PsdsMghx0ZLWdW6tdih2vCe81He
         a8YFC7kosvDnfDtoFBmOr61o5xgoQFruZXuZjVPyG8ZhVuw571lVi+aRuC3g6rKaqlqt
         dDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216056; x=1763820856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TdxCYAFUxE8TEo/HdclUzBmM8/cH8lgIgGUaiseaWSY=;
        b=nAHw+d6XpaymHtBp/SD5BHnEq/mbBf4CLfYOgjEql0yqOSrZWrr5k6NwwcessFvA5u
         zPzBkq7CmxdjsjH5yr+3nj0AdW69bjO+ttQz1FU7PaAGof2SDzLVsbFt9RegqAQER8FP
         eNslB2zgGdtXSv6pu60FRIvJMbtE5rJNlji/Fhmlb4edifcPRf/4wyS4yt/Rg45QqPaQ
         EPOzq5Z6y+J3y0CC8Qq40rGBResTX8Dsn+KP9GaeCjrpzgBIwYBCwTvtEfJuUaRRi/M4
         ccKqhSKnFCw0pkIcLCqNlNSyHEQfYqRTexDcRCHgYFlH8jPF7t732P7jT0OoHczx090/
         A0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8WocDsEay40sy9eFbm+N5fm8kTnrCt1SFW6vaUbzxh8pT34tMoytdu/nhjoB4bAPti5+q4jhygWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuSzE0HT4BtrWqAxrs73FdlDAZYzsxuMa6U6Fg4rxLkiKvoIwv
	KNdUJ9ZvYHBoxlK1xCfBi6+v/+begJYwsvqPGdUqtuExdhoMVXgsUiZB
X-Gm-Gg: ASbGncvefenZ2+VkAMbgnOtJJBWWOz9F4XSug9H6nYqAJ27jn1865cEaQ34BWui5BzN
	FG9YJSHJSwupRP+4ouwRp/vLtpYsVr2fKeoIIy8qbvNMk6k2s2+532m8xzBBe2rmn9BKKXhjzn5
	hc3GxYWU0apmINKP6WTBF8bi3Fcp74vuYuh8SCwdZikZXrnMLNoa1PLFun3Lgeo909pUYKipl3R
	euvPPbRr8lNP0RgU9Qa07LXAJDlVnPlU+SPxUNa4Aa4HwmeVN8XLSxwmYGZxBkoKzQjV8x2siw4
	2obrqYYvXa3Pbr3zSOai25sry+H9ko8Grxwk3fSz3wZ9CtACJ6RMd9VKFeJmxn9xtHxri651Fys
	eWrgnBIfLeRtNUVWwq20NlLilPtyOKJTqRjKFYHOsjamnZjhJZaJLUSzhUbvN5mMcSbDyubud5N
	GiGox7aJRJYzwISQQUpkPXxLG/u3m/K2gyt0U+MP9d1o+nqw==
X-Google-Smtp-Source: AGHT+IFh8CjX1reglk+d9qFWiwVdzTnZZrgC6zCnkQGkRjSeca5TyFvpwvWCslriMZOQG7eYdwduUg==
X-Received: by 2002:a17:907:7f05:b0:b73:880a:fdb7 with SMTP id a640c23a62f3a-b73880b0177mr94905066b.35.1763216055478;
        Sat, 15 Nov 2025 06:14:15 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:15 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
Date: Sat, 15 Nov 2025 15:13:42 +0100
Message-ID: <20251115141347.13087-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

YUV formats need scaler support due to chroma upscaling, but that's not
yet supported in the driver. Remove them from supported list until
DE33 scaler is properly supported.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 40008c38003d..baa240c4bb82 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -403,6 +403,37 @@ static const u32 sun8i_vi_layer_de3_formats[] = {
 	DRM_FORMAT_YVU422,
 };
 
+/*
+ * TODO: DE33 VI planes naturally support YUV formats but
+ * driver needs improvements in order to support them.
+ */
+static const u32 sun8i_vi_layer_de33_formats[] = {
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_XRGB8888,
+};
+
 static const uint64_t sun8i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -432,7 +463,10 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	layer->regs = regs;
 	layer->cfg = cfg;
 
-	if (layer->cfg->de_type >= SUN8I_MIXER_DE3) {
+	if (layer->cfg->de_type == SUN8I_MIXER_DE33) {
+		formats = sun8i_vi_layer_de33_formats;
+		format_count = ARRAY_SIZE(sun8i_vi_layer_de33_formats);
+	} else if (layer->cfg->de_type == SUN8I_MIXER_DE3) {
 		formats = sun8i_vi_layer_de3_formats;
 		format_count = ARRAY_SIZE(sun8i_vi_layer_de3_formats);
 	} else {
-- 
2.51.2

