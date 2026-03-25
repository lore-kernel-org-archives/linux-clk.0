Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880D7393DF9
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425519; cv=none; b=IEVJopANCCgM1ZjVy59yLTr+p5AaRsdEFpsPklKQ2oQ9mGJcBi5YiAmF+8WADUhRLCuaXpyDb85jaCS/zEgW+N6dpe2eiELVD3wRcJxs8tO2nVW2DCIscl+8Ner2WHi73Yrd3Fub1FPp0GLEu9QhpGExHD6iZFxPAA+f9qXI7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425519; c=relaxed/simple;
	bh=w6dunih7Z13sge98jZHXsknVG502iMB2uwyzYQNYhHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNsBxfPGlq69tPcCv0mx+NyfF9xgqVICI0baL+GF+w1hxMAlj20nC7nur71UKA88z+dtRz9Xs7N0ahma4QiNeB3v6f8B4iyfflXS2LCij1SwOh+C5pwmFS3gMmdJjleIac762+EYsmke4kMAqbaB+IsP/BuOa9xQ8f+AVA0joE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nIaKODMY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nIaKODMY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b0603ee486so15131705ad.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425514; x=1775030314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=;
        b=nIaKODMYmMbJFTS0cw6J3AP+RE0ig68WvGvjLEXN56hPgu6Ttvpfvgdqc9xrIQGbI1
         lqyM8yM3fC54NYzH3tLP7pSrJsVarfJjJDWxr/QKhXd+xafMwYcjfqWGTFsc1BFggF7y
         NzRZNtbvzKtG6SoTx2SpA9+VERpxaS+YfTRVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425514; x=1775030314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqEMkNh7cnEi3XsvgS5g5ei3L+mxqRTbNamH2sCwDdU=;
        b=pRKiD/CYDSc+wi+tEy9/4/sTc0fnwjT3y9iOKsDRBpeOhlJy/CDSlFMqLmcIw+qcy6
         Rlwh7FNkPEUBn9/0PUkuIcFywel9a4vIEmBgQciWxIi/l0U+peQ7jhcGK6eV0OoOxtWa
         8fdyQB33mSVKBTECVji0RXYdtZckyDSWLEB9hx0rxCvmxGreimRy7NPETWO9TsNUSNnF
         19UU5sobogK/mH5CgCH0ZODdZXlgcPvtlJ4P7ErKavuJfqh/vQV2TB6ainOu2Hzg1iYF
         mzuF/QlW0ERnn8eMJ4Nn4YQdVbUdlyCKkG0yEsDA5UWE6kV7w9kbZBsY6+dZ6EyI2mtE
         cHvw==
X-Forwarded-Encrypted: i=1; AJvYcCXfDjJgzjSn8m7wDSlxnwjIaVBV7AoAWO4CzrUY30As9XME4OfJ8z4GNK5LdnuTU6C1np9b7a/uFJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0eflmwdfa/akkrsvFZnMgJtQaPwkqyURJ2+CqCKFyR0WItP3f
	IeynfdW+WoLIrZGJ0HNQ9TcmZI+DfRt+3KZw6ajnMEHY5QuM5vVLQ3ddOWcLH8tK8w==
X-Gm-Gg: ATEYQzwAENv3D54zIdIS3Uk1MV/8q+DMPhleTmJnERa4dTwbCer3NyYpSChDH4MG7UM
	o9hFBAWX6QyZk+5YWTTvPWJ2ZUuImuTJgTfbcs8RVMw8DbYdewMBIDW25JGKjiyGCR9NVkqQils
	1wVbZx0TyUA4oYTSjAXK4CXRZm6SfcUwFyzDdsHLYaxEX93jD4arSlRki60w+WCSe4Lq409BXX2
	GnG0+z4OHiwaVGe4MKFTXMelRXMOySOReCDd1DGfBQJ7NJ7C3DemYQr2ISt+wQxg5SEOtcG9dIz
	uDc0uNv+mMC4HpXpOGvhBy6eWFy6VXWmzWcv0sC+7FObnr7iQ+9pNryFoVxkUFR8W/Fs8HZie6f
	vF/dGs+RL/rznekWcn6PYtSaf7+IlJsqnZsS7INU42r09lF0UGrhDNy7wE6CksuBaWj+FC1OFjA
	mc+hsY5cvOacTHVoWLsrA8I8CfffH4RbnKk/dslpnn74poANm+21QVOURLEAR1Ig7IpOquqWFp0
	YoxkvQ=
X-Received: by 2002:a17:903:904:b0:2ae:c5fc:b2ef with SMTP id d9443c01a7336-2b0b0ab4cdbmr26299735ad.30.1774425514658;
        Wed, 25 Mar 2026 00:58:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Wed, 25 Mar 2026 15:19:47 +0800
Message-ID: <20260325071951.544031-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
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
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v1:
- Adapted to recent changes, now only adds SoC-specific compatible string
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a1f54dbae3f3..53131cd4cc2a 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -15,6 +15,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.53.0.1018.g2bb0e51243-goog

