Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370524A0EFF;
	Fri,  4 Sep 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528448; cv=none; b=hOeJ8iN2/ukUlKZ07YYB/yXB6ILx66ERp3K8lgjIvM8nEQZlBWu2QZ/l7mUJe1NFE0whABXTV4a9oY/WMLYUC3MdkfajaC4yLbsS8F4mbAdPhFsqPL4pZ+8EIXNItWQZTjH4anWfWx0lTLxXUwiQ8G9+WeD04wZ/0Z8SErAWR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528448; c=relaxed/simple;
	bh=f0E0jwDYuaoQTfR5U5JgKn6x4cs8iKdokH6pW8L451w=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=XVrdGv46u8OlyqBLPQggrpF+Ttg/Sdprnmev7ew6v3mZy1hzHxIkYIKVs9SUTJXdntbFQlbwmq0/5+LS3kjfar/vNjfpc2Myh9akoIGyfl+lXFfcIxAQZR+2NhgSw77zxTnCzCzukS/s9PDm80tTNaEZyyTCRkPPvsMwvEEjnNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hjUmAcNW; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hjUmAcNW"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260904132724euoutp016efd9ea601323277ff1cd6aceb27658a~SISTo_-Hu0653306533euoutp01P;
	Fri,  4 Sep 2026 13:27:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260904132724euoutp016efd9ea601323277ff1cd6aceb27658a~SISTo_-Hu0653306533euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788528444;
	bh=hz9w3z/OoLk7Gh4v7MHQAOqRI2Q6SCEAbaw1cH6haGk=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=hjUmAcNWdbXZB5n+KyHc70+bIS0vRo5420RALuFHalqRb8l99E4aTNks+Xa+7dyRv
	 zD790x5IBYD/O8VLY0bTr4Tr9bTEySQktRDcWf6tQ3OhpCNzOcrIfgeH61H3AWKUGj
	 gx4oD4JPNuiZDR9si6hOORCx+AaBy9vzgbZ5LPKg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132723eucas1p14cdff81f7ccdc02ec811179c5d401d69~SISTH4Y2s3177031770eucas1p1R;
	Fri,  4 Sep 2026 13:27:23 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132721eusmtip13029b99384470933fe5a29daa46c2513~SISRWwWJl2098420984eusmtip1E;
	Fri,  4 Sep 2026 13:27:21 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Sep 2026 15:27:09 +0200
Subject: [PATCH v3 08/19] drm/bridge: inno-hdmi: Allow the register map to
 come from a parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-jh7110-clean-send-v3-8-484f9ae72715@samsung.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260904132723eucas1p14cdff81f7ccdc02ec811179c5d401d69
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132723eucas1p14cdff81f7ccdc02ec811179c5d401d69
X-EPHeader: CA
X-CMS-RootMailID: 20260904132723eucas1p14cdff81f7ccdc02ec811179c5d401d69
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132723eucas1p14cdff81f7ccdc02ec811179c5d401d69@eucas1p1.samsung.com>

On some SoCs the HDMI controller does not own its register window. The
StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
the controller and the PHY, so the parent device maps it and owns the
regmap while the two children share it.

Use a regmap supplied by the parent device when there is one, and keep
mapping our own resource when there is not, so platforms that own their
register window are unaffected.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index aab474740f7f57aa34007e6dac49e2414561593f..8bd771761180473d221f59d5c0cd2a636e96ac4c 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -397,6 +397,7 @@ struct inno_hdmi {
 	struct clk *pclk;
 	struct clk *refclk;
 	void __iomem *regs;
+	struct regmap *regmap;
 	struct regmap *grf;
 
 	struct inno_hdmi_i2c *i2c;
@@ -470,11 +471,25 @@ static int inno_hdmi_find_phy_config(struct inno_hdmi *hdmi,
 
 static inline u8 hdmi_readb(struct inno_hdmi *hdmi, u16 offset)
 {
+	u32 val;
+
+	if (hdmi->regmap) {
+		if (regmap_read(hdmi->regmap, offset * 4, &val))
+			return 0;
+
+		return val;
+	}
+
 	return readl_relaxed(hdmi->regs + (offset) * 0x04);
 }
 
 static inline void hdmi_writeb(struct inno_hdmi *hdmi, u16 offset, u32 val)
 {
+	if (hdmi->regmap) {
+		regmap_write(hdmi->regmap, offset * 4, val);
+		return;
+	}
+
 	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
 }
 
@@ -1095,9 +1110,19 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
 	hdmi->dev = dev;
 	hdmi->plat_data = plat_data;
 
-	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hdmi->regs))
-		return ERR_CAST(hdmi->regs);
+	/*
+	 * On platforms where the controller shares a register space with
+	 * other blocks, the parent owns the regmap. Fall back to mapping
+	 * our own resource where it does not.
+	 */
+	if (dev->parent)
+		hdmi->regmap = dev_get_regmap(dev->parent, NULL);
+
+	if (!hdmi->regmap) {
+		hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(hdmi->regs))
+			return ERR_CAST(hdmi->regs);
+	}
 
 	hdmi->pclk = devm_clk_get_enabled(hdmi->dev, "pclk");
 	if (IS_ERR(hdmi->pclk)) {

-- 
2.34.1

