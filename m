Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE5341D203
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230317; cv=none; b=qzfwwS2GztwrC6qKkG51757eG2MOd216bTyA6aO8w76gbG0B0IYL0w+9ewWYS8VhxQ4Ndqv0/1VT8ffjBnLq6gcULrYYffEKupK7xGsgvahJcTk48aQNNtsBWymOBNw8kgxhR8aadLbQDBJ43ayI5So4lzi+V4H8vhn6XzvGs5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230317; c=relaxed/simple;
	bh=yhY7mLjZfGOCMMgNPHfCV2Pu5mgEkzZsyZuduXNnUDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FT4Lf5IM7BhcffT6gzZsTglP3Kgk0bqLoQBY8jhv953QrgLxUb4OneiH0zT7WLGsGPYu2CK+UW/PV7pfxjNJxdhU5b6mUO+f8+xfPV4fdI9xmxdcuQm7gVl1+j3sgTq8KqVl4VpZHycHDUH8OvoCYF+lkA5KTTgjeipM0PiY3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i7v0Ew4m; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i7v0Ew4m"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d01663d816so3715435ad.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230315; x=1785835115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=i7v0Ew4meJNgNnTbQUMhdPeZp2uWzz/mQ5qdVy7NtRNnYqn5qeHGjqAnkBX/ZkoQkQ
         VronlCISSWrZIOwCVUU4MItur+fynTB3iW5WcwG73alCnI+CbAIevvebO6DbSuorFjYo
         2vd+DVrghuoasJ1wnuLJzqrrXpX31v5ErgItk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230315; x=1785835115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=eYYAqPffqfcFx9owg3UQMmJQP825Fh2XmtcqwEub/QqZqGaf9NpQwaI5JDFeVXeiyB
         asy4wid2I0G5FymQ9OEJUoWtlB2ud5vUY8u8SjM2RQ3w5j6y2aJu1n/dbte/vlBvsxTh
         fwTGuUjc26nx6FG+TaR527z5hVsuVkqKDnNlayxp+XHZhJLs/p2HR7aPDFhpIVpfhGSJ
         MguhWYisdQQAVsDurgcgdS7ez4KfKi41ZQpVjK53n4El0sDhoi7NRSdDRZyax+sYvl8T
         IP1wML2Qp+tKaKcLHB59QOLjITgVo3BHmlTWILenBOVf9ji3zPiAKFLnN/TVvTdnJE8I
         tovw==
X-Forwarded-Encrypted: i=1; AHgh+RqPU6x3eXMnmQRWsUNjdRIfZWE41/aPAPC3yYmIqBEQZ6HOk0JjIOY31XGY5xgHmPSaFybqS9b9ULM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn09rLOTKP2uEHg28c2Bgs2sdKSdPL3YbxOk+MsSXF/ZUWI8YW
	AwL50c2/TnHGZHpgLB7ZExH/pzQukYIxANbV4ObxK42IzIl9et13GheIiM7Jop1kVhVfkLqTOqP
	+PH9WwQ==
X-Gm-Gg: AR+sD11dAdY/OruMdQ2vUuqT09CqQPISiOjgGDKQbqWSaUKzdhptErepjL4ie1n0IKA
	46WUJOL1OfulFN0QZHODzGEyJJu2A/mUenOkXyBmtQ+adlwQS8rk6fCOzmUXFp+Dt8caA376VMa
	sdq26WAGjCC6oM7HJfF8bWRCw1U4Ez6HI+EFV0KwwLjn1Li1ppUphTWAW6/CkyLP1aIprtEP00l
	1VqXE2lexvfBrkjEXX3TrDxysRBulQYGVyu0Phyxl1r0P5Zy84NdUKn8JpV6joXmwQTzkI5rswx
	hYgyH+IWgVd8RCiF7aDTjTzOoeYqtwkFu5FlL/QIMkrGbyGUJjCLo5+PGiA4xTljZIzzrmHy36m
	XY5VAsFIQk7hkhJV3r1scdbDkjRRWc+BS8+NCHroObPKTRNf0WcLysgWliMvICXU0IBo7Df3KIy
	9SimZahDhSq4MmqEnlfnWuRqESbzMqyQxN4A4lbKzFzr/U8oqmmYLfNb0R6uo=
X-Received: by 2002:a17:903:8c6:b0:2cf:6f7f:55d8 with SMTP id d9443c01a7336-2d015cfb0e2mr18391495ad.37.1785230315142;
        Tue, 28 Jul 2026 02:18:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:34 -0700 (PDT)
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
Subject: [PATCH v4 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Tue, 28 Jul 2026 17:18:02 +0800
Message-ID: <20260728091804.382753-5-wenst@chromium.org>
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

