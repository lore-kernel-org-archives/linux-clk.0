Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025541DDFC
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230321; cv=none; b=Rv7uDmZ31rq2tVrEMHuv6ZPaQ+CmE6Q9/8uZqnsHEe277y+Pq2PrNa742JVgsWyV+B9B8nnw+7lI/EVioB3AZw5BThr2JRaBgii0U36+MHCEmfAs4p66OVEEJfCjyGGLUWZqntRvuAf6UzFUiAaGOs5LZuM1qHLsMsqiJ0Yqlwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230321; c=relaxed/simple;
	bh=9Pf42jTYd4BOZWSzwEb2fi7Fbo1AsB7wRyp4TwTJs3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5fa+Yj0RTeH+1DdoXxJX1dZ6WoGsDc4yUhZKYkw5HlL7hAsSx6nyphvQBH/PMtv5NyyZ7gN3g0hzOSFj7fvFoRf1DjcZVpyGfkOAtYwOAwKa3eaZbtyCkvCVr4th3n7mgIvaTG8rKwdPgAqH8x0WjdKKxzygBD0/REzNZWWLfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XaPNyYAg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XaPNyYAg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so53122325ad.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230319; x=1785835119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=XaPNyYAgYYfBJHWuxPo2imNXxmZHKGpNIz6moCpNat+oxEUJyfnX2EenK1zkW0t4LL
         RQlM/PgQKj+SEO7RGO+hocYUhX8KDgoQmNDrN6+7VGec2p2cFKOJ+Vl0cSYu0gFVOIx9
         3k/E/2CfptBus0BgkM0M9YNBkP6+ppqmImNV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230319; x=1785835119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AETGy+ANMs/4mEVJOXJB8nyO+6HDkmoHxo4KA1OMiIw=;
        b=mQKHEaNOZVYjk7cf2Gf4iJz3TbvgagSJqZcLZdUJyt4/xCXlO1qAkIA0cSn/gBmdrc
         JEtlxPJeqP/PD7Zyb8ZVOrdeGdVad01Ck07UgFY8HKMEWCJMPxtPSkiYD6DtHHUyZeZs
         d3QALxKruNIi6Mzd4poEcpNq5YcUQ+o9YYTi4vxlR5SWJhnAxhiXglTXgMaR5V7TEzWe
         +mwDHkh7McnCE8hf+4ZZ2gT7jZuKRi/ArNHu2+V4bvjIu3GAQ60ulADAVPD8sAbOA6kY
         OQUSdQj1kYPKan6c7/l+bFI/kZQ+W38syjJlWL8jLjKAeT9q2RfYst9TA7j3cu68pOtL
         Xubg==
X-Forwarded-Encrypted: i=1; AHgh+RoSWzWpOhMyHFRkzqXzQWWMN4s7YcnWjAlHdOgnZbEN0Jb/ktBpX323CggFbNqz5h77bluM9qe3+p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJc6xifhYyeoTtwdg8uIXMW3i0fkm7C/msgifyzPfO19paIZdJ
	wiIAAfMQWrxDNGTfA4J87YnVlkfy+147/zXeGM5N+SItE1Inw1a94n31wcFE1ACGqA==
X-Gm-Gg: AR+sD11VzER6HPLXMIcW0pi5Ptc1+x2i4IfU4tcA30YyFAuLz7gjzvTizGXQf92Cp4u
	M5bHHjxS5b4br5BTYuLfB1GkY9n/mSFiADUw+4TpafaFNhZI6PulA+Hnq1WsFaEPyXwq7smbIQB
	maFwyWBrmY7zrb9dD5G80IcLaQgJFMBHK28cRFpMqEEtsrVU5pGsIssrEPG211lLn3F8Utgm/YW
	IOKBo8g3wyGyZ9+UlcIa0UB1LF5/vUrHnXop4IjFq1oCA++L9bPGwfMNxbmiNluh9f1mctCHHor
	28NG7rLu5BMidCrd+zoRekRtVZ3dNsZlXtFI+iZGXVKap4AhddQcH/5CdX36j+tO/9+PF7IN47v
	wZUblYYCuLwlCysMDTU8y0XWKOxNimUphL/I77Nzw1s0CRPr77fBPEBOW4Pdi+gqr60lV+r/PPM
	m6PshQcKrPAvA1ga+uk/zdsGaj7HPS3KfqbPd/kv3EQ7mS84i6orYV9dnkoKq+M9bCf5Fl1Q==
X-Received: by 2002:a17:903:19f0:b0:2c9:fc14:588f with SMTP id d9443c01a7336-2d015f024b4mr18169045ad.29.1785230319419;
        Tue, 28 Jul 2026 02:18:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: mediatek: mt8173: Add GPU device nodes
Date: Tue, 28 Jul 2026 17:18:03 +0800
Message-ID: <20260728091804.382753-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

