Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122D3395272
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425527; cv=none; b=DzrTX1dq2kclKRKTHASvauNgzi7QHxc4lF+SDJL/IGUK18pWqX3TXzYLRGr4+sxfXe2oYByQ1yqFp27Tz/IzB7luJJ6UC0kScQHwMQRMjWzVZE13SPknM5sZMFuw/WFWvBS0Sd4pnoFe3JAAiWAyjp7Xwolmb7tTcbrOEO5T4aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425527; c=relaxed/simple;
	bh=N0dkvlUzarRPk1AZnWmDt9ZTQWZc9fkf1MFuZOlscIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFjA1XLvU2TVs/b0u48jw0vmBu8y3xz85kWHHl+PDwcGGJZl55D+iouVndwErGv5lhkn2TbCViSTlaG/XAKj6umx7fD2s0YmAjSGVH559ohsb+2U2CkB204rzYZBpNIF6vpWkn97CjwMqJO9dzV+YaNkBYo0kZXRqQgyRPJyUN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JFblFXLl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JFblFXLl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b0abdde280so12971865ad.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425522; x=1775030322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=JFblFXLlr8G1OfqsDdZXR4R0Z8SmViUiePpDc4L3vVRTd7e3a0z7dn2y/Qjwx0+DOJ
         Y48F5QSWPezQv0Q/s80Yl/9n132Q6S6RGKiUIIuCp75OGP6JLxbzV0LwukgbYT16RFe+
         iUGpkLgyyZalaJ3CQdDb58hj9X0MJ/HVdigDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425522; x=1775030322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ylCJHL4jz4SMJERGBRhfgz5hmf9BV/IyctYJz76/DdA=;
        b=juGlaQ4Y1oFjM3d8Gs5C+1iVx31Fks0fPMjK+iW5+9bW6K6Dxj9Z6G8ZhDNfgjbQeI
         XzAuUBRIney7lV56211NMBd3DehBDHcj9M5D9NPQPFTjWwHWuLGSPgoIxAGnEUrIocuX
         68GBhRKCtApaSLBVwqYxiKH2sA+Hki9YWt/Z1qkPx3Qov1ki2H2er2avh3CafaC5PdMa
         5rih2hvQsl2nZDND5cLc1L2XBJ7DXrhu/Yme+J48PB6KvR5kgX2vb8HWrG4zbce8C53s
         KGNXGHArtwg79Wek3vo6uRrlJePGDHc2M2D2bQVvLBlOzo4OMOlerNysq2NyTrh1HyEb
         xaxA==
X-Forwarded-Encrypted: i=1; AJvYcCXTqhYDAbwyPckx8Jt/FY+s0T72uOmmM5rCD7ASCh7vqHz5Ted1Z/v3sks9eWRWiBIdzoCylvyz2oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxccxS5PLL35rqs/DyQBeyQGw5aLAHgTneWZfZfsaYvIPITnDml
	uHPyUnFkoavSLAdPD2wCnq1+3pPgzfwHz0gLtSc0/Dqw1eWfwceHZwORheokLWgNQA==
X-Gm-Gg: ATEYQzzLXvUrLYiNdA/JRpkQqSaa9gaWtdRvO+2MxZZVvmym9D7ae6Ot/yY5SxYTOaV
	2oxT8WHlAqB2SxZMR+7ET2p5FX1TevMQYxTt8XV12edRnDZf7BNrX61tjTqP6MKwsB98rUAnwUK
	ri6i5/90vu0wR2Q/B8zZCXbeXc+9XXm4bmjZzQ+SSd8a8IkIbAQdeniryrhNFNn6CYFK+iJ5nHz
	SkTUQNMIryde0ZW6JfISHXGHZErkk8EFpd/r7eJxhuJAPk3UXp7lWslndsWyrYC61Bu4TzhbJ7t
	S7cDn6qkFOfWzrlvA3iCKr1bYysW6tt03rJpTQbekROIqwBLyoCbkVpWYJ2DixqY3zOEf7kHYV5
	IFmUEKK4k3ksFlH2DjNwRB9M1L2fTSM2ZefrEs6Dg5EA9lq56HPCBan0yzh1YkupXsf38z5Ex2M
	XSOrnWa2kl8z3Io/gBGVVw+7S+epGwp2lx/eEkFdXG3O+EtFcniwPjS+0seejspJSd5u/94iIPH
	8HJWYc=
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr28028415ad.31.1774425521733;
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:41 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Wed, 25 Mar 2026 15:19:49 +0800
Message-ID: <20260325071951.544031-6-wenst@chromium.org>
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both. While there is supposed to be two different
power domains to the GPU, MediaTek does not have any information on how
this is integrated internally. Assign the same GPU power domain to both.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 31 ++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 556e806b7787..169ba4fd183e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1002,6 +1002,37 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			/*
+			 * Binding and GPU core HW have two power domain
+			 * inputs, but MediaTek does not have information
+			 * on how this is done internally.
+			 */
+			power-domains = <&mfgtop>, <&mfgtop>;
+			power-domain-names = "a", "b";
+		};
+
+		mfgtop: clock-controller@13fff000 {
+			compatible = "mediatek,mt8173-mfgtop";
+			reg = <0 0x13fff000 0 0x1000>;
+			clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MEM_MFG_IN_SEL>,
+				 <&topckgen CLK_TOP_MFG_SEL>,
+				 <&clk26m>;
+			clock-names = "sys", "mem", "core", "clk26m";
+			power-domains = <&spm MT8173_POWER_DOMAIN_MFG>;
+			#clock-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8173-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.53.0.1018.g2bb0e51243-goog

