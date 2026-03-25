Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86D396B98
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425522; cv=none; b=PQVC158IV6ivhslsdtWxHXSY0GzOU4AClaBo6egZfnrkQpDUMfIbAdPduKG55aHxEF4uZQa65c5k9p2/x3nHSJU+Fcvox2e32HktLBgVi+LBSFOjZASivR+rPErUQq3NYtzvbOcAFqslKiyG9Ktij1fqCP5gxweiG+TLB9AD5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425522; c=relaxed/simple;
	bh=CGqkR3mWoMrvedl9PurJ8WPDCGpOFl6GsXTaOWq1WG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZT9zJwIlx4WX96Y79auPJ2QYd6JTqan3Zab9LqWO5T5AwvOGnQSykb9QMpNyEVkRvR4VT+azKUoCNJUC/34AeTVi+DjcnRGTtPlfTKtxO/2zGyXO/7z8LFRhYN+AuKBHuc0O1kRLjmZCX3frqsr6eCAzwksL34j4u5V8IJ0vM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UBCEbWQJ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UBCEbWQJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b05761bec1so3013975ad.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425518; x=1775030318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=UBCEbWQJlLDQ0cPqF5aOpwqAq2ieTcaHKe5A3//wDYGwvPx4NXFvPkoPJwbfMEhgzu
         ZxfSCrkCdzdmFq8s9xZFfgVNg2GTsHBUbueNNNUa6MAaxmmYb4uH4GuOlboJVdv4xCSq
         wu5iDrYoRwPr+lgemaiwlDfYEN0UXIRLg9ZVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425518; x=1775030318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=Jis27uRSMQAInLPMx7Dj5NWaEvlF/lcgl75z6VQIb+f5lFn4UEtxr1BquwwwYdKH9Q
         RGRhQjK9LPyaHqkbXFMmZ0fSv0qKpjHSroeSLV2UWJq1fTJnLct7fo4lo5x768uT3HUk
         r4jgHqXhF7ia8/kkkm2T5iK22sOUYs1Xhcp0vJya2rKuVzcIAL+XQnltYkMTSxyxsfS1
         rLT2MftYNmSkdH6TXgvzy7BSkj+HuA/pOOZIb6VGm0JV1vf7izRtcptZglwNPCQyiNBG
         tohjLthGEZy3Tr1D+U/VCTkv54iwfF2OLoPAfnb5q2UfN9YNrqQPKIJvzJCcnxh/jILw
         t8FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0u12WwCtl0rjAlG5URIcwiXlpC35B5Z0RB1p8oDs3slmvFZjCyxTiLmZTD2LgbZ2xwx+EOaN+0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+/agVMbSay5/9S+FA5k6sjVd3xf7qNpZMjJwUxHMSx4c/msz
	LpOkSOwdLpymnSPXOP8ZlLN5CnkJBVEUjb3wCTi3vdxwR/ySdh5yTOxndI/PA98X4Q==
X-Gm-Gg: ATEYQzzJbRRTl8jWkuZiYEQDXGWqb1Lta3FI2S2zVJFmRAJnVOs0rI2bkKoeuBm9Zrt
	dth4fcF5jBy0LLBj1BJN7q3eM37bvVz09aqnT+7tNLMn24IEbVCgKw7SNrolbOvhApellMGKfvT
	8TAxp0JQOoWuLMaAQKdK8syfcQbswJu5+lTnwFge6cpxKxmI2VWITatFqnyImKKxZzd5ElBSWxR
	FMHeCOXsy11U9QitfmeGJgvpkyX3WsDZFfWpKg/07IKoHlUGYjHoUMmg30kFa0SVkW0O6KzFjkg
	ligfwS34mCr2mZejW62MTy8UhQ0Awv/sIQ13GdOYygrVGr0mG/7T90inRkI7gzMBE+JCgijELj9
	cTenvA0YxFghVVpueAkjYUUoy89ew44rbnX7aCBhUDRSVdfpyUzTw0jjWzEVTzdt0z960T9c2+b
	sS6zyNq0193cz0e4hwJHIkKT82GLXZECV9Jm0w8CfRmYh50zlWYebEHsdoi/f3GHSUG0qqqbfYt
	IeoOwCMeoeibyRpaQ==
X-Received: by 2002:a17:902:ec8a:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b0a4dc9efbmr60505455ad.13.1774425518163;
        Wed, 25 Mar 2026 00:58:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:37 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Wed, 25 Mar 2026 15:19:48 +0800
Message-ID: <20260325071951.544031-5-wenst@chromium.org>
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.53.0.1018.g2bb0e51243-goog

