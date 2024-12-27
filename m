Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BD1F37B4
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297783; cv=none; b=i+inKOK6B+N7LEEN4fE51JcFj4jMwbB/3a/zgV9lDQ0H0J9Xn8Fy+6mndpFzNisb3NUEj/cId5vCmUtoHa8K6bWF+eJQ6BCSX0bJe2hRGvTkz9Hd4RQ5Ow9CZovWSvUe2V+lZt/vNCQESLNyugi3FLNFYIDPRSrIDenC2LwNtDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297783; c=relaxed/simple;
	bh=AkiOtlTE4u/lst3b/C31pu+RJ7eNIYaDQvfAJLBj/Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtCBzszcZRLB6cx+oRjiE0AeUvK74/GB4z2J8BvGBElwCsaiZFLkaxsCoZbYA+VkQAi3Q51vFqgeqHUSPkRmuiXvQ9UtIdaeR+V0SzotfYvuRrYo6WRBqlneDFx9u6uU7jdaI7z4iKxp78aqRDDwlJTKSvZRVH2jP+1AdpSRGMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=S0je0AqP; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="S0je0AqP"
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id QosFtFf4fumtXR8DutzkPO; Fri, 27 Dec 2024 11:09:42 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8Drta1HymNYjR8Dst9mHr; Fri, 27 Dec 2024 11:09:41 +0000
X-Authority-Analysis: v=2.4 cv=fb9myFQF c=1 sm=1 tr=0 ts=676e8af5
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=8YUH2e0Ys_Mie9xma7wA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YrLVykqlMMRYoAZ40Gm5GHLbrDBKpbvHh222+1nl1sg=; b=S0je0AqPcG82mvVT7NzzfWeAoV
	V/1xVazSgiLrIsd7BH6MZP6YuM0JTgYGrc3NJc03czxEXxgumtgMHFkq2vowagvWHxM+YCutze28f
	6caIqEol2DjO9Z0epKFb1W73R5V2F2niJ+QUjn2lK0vb08uVYgr1pvOK8GWZtfa1QRJ5jCRBTNrBY
	/3E+752KR3zdKCvkcNaq3AQD93tYFpGH2KhaVspyvtA2h5VRmH4BB7rtB6SVIUwJpSbopnFSqHqRQ
	2VzZmbFc7ZvGDF++qsdu//xh6qlRZsBRemSAKsgAmSascCedCDP6hLjUxJT+zb53VxODrDymGw7PB
	kfJTwKoQ==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8Dj-000bEK-2P;
	Fri, 27 Dec 2024 16:39:31 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:38:02 +0530
Subject: [PATCH 15/22] clk: sunxi-ng: sun8i-de2: add pll-com clock support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-15-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=2447;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=AkiOtlTE4u/lst3b/C31pu+RJ7eNIYaDQvfAJLBj/Lc=;
 b=Y/xSmjtv1wT7leATqqeVpkuBgaCwMamcw8IupbHZtK5ZTIFCre5utab4tDMAUu0XYTzig7ggy
 94CMKQxZvP1DNpxHqykapRq5BwdB3O29zw8ZDzOR3aH0aJp7q9TxfZ5
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8Dj-000bEK-2P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 453
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH1j0kRcN26IaTVV8aRWR32UQyyedgV2NxK1bFOels8cjQVsEKs8NxGAHUD5bewnmOjAsgm0RFuyEQC/aDNRPis/w5hwdpQVERp9+WpcEtLFo1DGzHEt
 7TH1clax0Oc4zXUGsajhpxFnCazNyrCg8emAeUnTyCz40ouuEaFY6sp7GfrzAXX/WZ8E8jG8PcqafGQQySjF4otRyxwbljJ95KE=

add optional pll-com support which is available in some platforms
like A100/A133, which is used by the display clock. There is no
documentation reference or details in DE 2.0 specification.

But these changes are needed to get the display clock to work and
this is inherited from the vendor BSP.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index f2aa71206bc2..3e28c32050e0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -241,7 +241,7 @@ static const struct sunxi_ccu_desc sun50i_h5_de2_clk_desc = {
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
-	struct clk *bus_clk, *mod_clk;
+	struct clk *bus_clk, *mod_clk, *pll_clk;
 	struct reset_control *rstc;
 	void __iomem *reg;
 	const struct sunxi_ccu_desc *ccu_desc;
@@ -265,6 +265,11 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(mod_clk),
 				     "Couldn't get mod clk\n");
 
+	pll_clk = devm_clk_get_optional(&pdev->dev, "pll-com");
+	if (IS_ERR(pll_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pll_clk),
+				     "Couldn't get pll clk\n");
+
 	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
@@ -283,12 +288,20 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 		goto err_disable_bus_clk;
 	}
 
+	if (pll_clk) {
+		ret = clk_prepare_enable(pll_clk);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't enable pll clk: %d\n", ret);
+			goto err_disable_mod_clk;
+		}
+	}
+
 	/* The reset control needs to be asserted for the controls to work */
 	ret = reset_control_deassert(rstc);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Couldn't deassert reset control: %d\n", ret);
-		goto err_disable_mod_clk;
+		goto err_disable_pll_clk;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
@@ -299,6 +312,8 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 
 err_assert_reset:
 	reset_control_assert(rstc);
+err_disable_pll_clk:
+	clk_disable_unprepare(pll_clk);
 err_disable_mod_clk:
 	clk_disable_unprepare(mod_clk);
 err_disable_bus_clk:

-- 
2.39.5

