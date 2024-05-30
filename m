Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4B176196
	for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717058143; cv=none; b=DI4jiaLOD/snDEKEWtaKarUFMDjhSsRLkHJJo0ZoL22NnyFoUUeB29xcy03/L7IfIxRhiO7qam1mmf+cAKD98pjBWqAmgHddr8jCe1ls+quWJkfifhjZDSpCaMXoYpRfiKlab0YTntvX82c0Wzp6jvLyw38SZrPkowNEI7MWXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717058143; c=relaxed/simple;
	bh=3sS+9gSsossoY+rGrRHB96KNj3HXC+IUQnbd1IFwUWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWv4ycFV7vIMCUtG3cO/CA2j+c0sEb7Kqvxl2F6J1JD2/5Dq7M43ADIhdhFs/iPVtcZxuVjd26+DS8kxmWJ0ESdoyEZQzBbjdkiVfyAfFGT90jIGRyR2jfCm2h6K9wxfik4H3QYQQVBjbzPuCCrou+byPMOINUYVqNIAytCve7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I64wiQ3U; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I64wiQ3U"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f8ea5e3812so539630b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 30 May 2024 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058141; x=1717662941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3dPYP7w2xcwwD4ezxBwzChfzLxfVatZgNqWhWYFewg=;
        b=I64wiQ3Ub+DvAtsc0QmifTY54MOf3Tm8Q8CG4wE3gJARTBLhbTMb0MU65Rg52+OHDB
         BkrqLi07nIiPIDvle4VjDFDyrhhmGb7PoUJXZueHZyQngQh280nL1dG1svOKqKjC9K5/
         qIyPxBruLj61waIabnYZlKTUG3PELMCspqlus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058141; x=1717662941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3dPYP7w2xcwwD4ezxBwzChfzLxfVatZgNqWhWYFewg=;
        b=oCwQTAix09UpsTs2CipWnZCKp3C0R9H/G+wpWV5aChCX6BU6iqzyME5H8Dh8Oe17MP
         ZCYGcsD77184f73kz9k2o3qS723go883ZUmOL8Rq9hwwau9FiVrByRAi5aq8eakMTnwX
         jTYycvKLG/9iyeltj3JoBuHbjR3uuewcMdAnAikYg3srC/tYaE9Q+ttCki/6dhkRYUHC
         JBl88TBNpWR31zciPyvo9cZieMXrQj32GrdKFGNBMDVOblJmduRlZBxxoR4mDIeVR/lx
         ljIOMUNUhmLxsxKJ7SePTFsxJGym11s888EgSCWbQWL/Gp8AzjsqmugoH6i9rIPhl2rp
         ijww==
X-Forwarded-Encrypted: i=1; AJvYcCV0VOL6d8dkN11I2hnVFbsU/PBZ6y4L72X9VrB9Cw8od/+qdmIiWAzOlslAEZp9GxORbMexCWIabppbLu/+jHp4viev2YvuISgu
X-Gm-Message-State: AOJu0YxQ8mJ1Ln57D4r5fXdWQ7MYEQNhUaehVt3ClX9a7rtUUJdadJnb
	paynlYEL8XI8TRX9CkVby+Ge0aAUXAH+lvDpJJKkvsQFwcK6Yxiol421pmXPFw==
X-Google-Smtp-Source: AGHT+IFl9n7DktKEcpEJ4WGQz7AcjFouxFiRzMPk6dDKBcDqPpXqbxbt5Utw0hXKMF4XUXofIeg46w==
X-Received: by 2002:a05:6a21:99a3:b0:1b1:ec17:e59c with SMTP id adf61e73a8af0-1b264618a95mr1679425637.61.1717058141165;
        Thu, 30 May 2024 01:35:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:40 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Thu, 30 May 2024 16:35:05 +0800
Message-ID: <20240530083513.4135052-7-wenst@chromium.org>
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

On top of the GPU is a glue layer that handles some clock and power
signals.

Add device nodes for both.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 136b28f80cc2..3d7b9cc20a16 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -993,6 +993,30 @@ u2port1: usb-phy@11291000 {
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "mediatek,mt8173-gpu", "img,powervr-6xt";
+			reg = <0 0x13000000 0 0x10000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&mfgtop CLK_MFG_G3D>,
+				 <&mfgtop CLK_MFG_MEM>,
+				 <&mfgtop CLK_MFG_AXI>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&mfgtop>;
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
2.45.1.288.g0e0cd299f1-goog

