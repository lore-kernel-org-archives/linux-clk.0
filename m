Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9019DF66;
	Wed, 18 Dec 2024 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519264; cv=none; b=GXRjngSNNRrBP5ruW2vR1gmrIwG42i4+qtwalKNa+8+zY4jM5mIW04ibnc0Qbex8FDswXX+0Uq5WEfXAnrol4RzQesxJv5EfGLYdnETp+ilz3DQcPkAU1mzDJ8Gml0diyf0KyrLeBfl6J8RvvGNZxn+dbbTb6ChHHh5dTODI/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519264; c=relaxed/simple;
	bh=OsjV3elgMWob1PcNsx0uzAzBC5S2A9aK2c3a0YIZJWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saxSgoo0AY/CmMzR8lvs4kSGmbIoAAO+1b7ZGpAwQMKcevq/acse+t4wjhkPx4qnL3ZL4jiRmrwHAIKAb4KGk26Fegb32obnSi4A6iLa4tqlcmmL+QEoQ4wpJf4/Y4sZx1MtT7BIeGqxVcGfwNzTz6Ui94/WrfbdP4PopZCbuTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Rtwn3GkV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Rtwn3GkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519261;
	bh=OsjV3elgMWob1PcNsx0uzAzBC5S2A9aK2c3a0YIZJWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rtwn3GkV1oiRZ4RaWsyO5f65mq/RNZ0Ht8J+TheL+5gXDy7QgEAHKpuFJuuBSqf6i
	 SQPbjhHRRV8jJIzwI9gq8WDfY+iWA0uSp092Xpuc5DDH0DBYc78XujUZMte1U95tYV
	 CnGK3i3DqWEAiokZ+N74PtzYVFXirH1Ucd5AstF/lhYfBhrSpAnHp5QS9RZrdsRtnB
	 0nsnc6JGQMeKzol64/K3VYhUt31pUeAJenhy14IPvIQpt5HMrHnLBgv41mkXJWUT9p
	 LPFOpWOOahLLGV9FuIHD+e5WaJ5AWfVZ9yP1KHH9qzIEfZz1h7CvahQbOeL3RV2Oa4
	 5N0JpXkgAGrsw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7DB8817E3614;
	Wed, 18 Dec 2024 11:54:20 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 1/2] dt-bindings: clock: mediatek,mt8188: Add VDO1_DPI1_HDMI clock
Date: Wed, 18 Dec 2024 11:54:14 +0100
Message-ID: <20241218105415.39206-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
References: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the HDMI TX clock found in the VDO1 controller

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/clock/mediatek,mt8188-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mediatek,mt8188-clk.h b/include/dt-bindings/clock/mediatek,mt8188-clk.h
index bd5cd100b796..8af44560a74c 100644
--- a/include/dt-bindings/clock/mediatek,mt8188-clk.h
+++ b/include/dt-bindings/clock/mediatek,mt8188-clk.h
@@ -721,6 +721,7 @@
 #define CLK_VDO1_DPINTF				58
 #define CLK_VDO1_DISP_MONITOR_DPINTF		59
 #define CLK_VDO1_26M_SLOW			60
-#define CLK_VDO1_NR_CLK				61
+#define CLK_VDO1_DPI1_HDMI			61
+#define CLK_VDO1_NR_CLK				62
 
 #endif /* _DT_BINDINGS_CLK_MT8188_H */
-- 
2.46.1

