Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3814ACC7F;
	Tue, 15 Sep 2026 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486356; cv=none; b=LFSb1YmwhzisxIpBf178cGBMFlYooB0TGg46/luyNugzPNsIOg7ORF92FmVylYKSmokkw2BAk/bMA6zdR5ux2DqgnzaPBQL3TF1rk2GHosqTxQE4cJAPtZ+gBWrMk8YpUHyK39UBjrDyJwELQhrnnw5wP9PDO3/nYjvvmBHMjto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486356; c=relaxed/simple;
	bh=zjwU0n0UUhU+jGlVxEa7hMZuywsgqWurludawJtAjaA=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=khbOH2cy3JJ0KGEgyiswgYx9I+LDURbd488bxm/p1rg+Du+b7W5lVTi7ayBhRJxtBY9JpE3z6lMZqUpIkfKGd5nQTJ9NLWswjatG4brh0zeqvx4Gak7ILBB9lSBfMduU0irNYG09KCuR3SGg9tEyqlZqeslo8N2zi0DmY6CUyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aooQGV0T; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aooQGV0T"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260915153228euoutp0155f179673c872409fc2e3b9244f51a99~ViFpAQ_iL0794407944euoutp01R;
	Tue, 15 Sep 2026 15:32:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260915153228euoutp0155f179673c872409fc2e3b9244f51a99~ViFpAQ_iL0794407944euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789486348;
	bh=OQcHsNYHyfrJipnWdQ4Q/LMwmJvrymtwU5A2V7mGYwc=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=aooQGV0Tf0GXM8zCoNpaLOY3QWn2eRkOi4h081keRNiBylB7jL9jPxHtDA9pYG1tx
	 rZYx7818WeTgpqX6Dq2UwWED13rdnsLCEdnHC86vDGOlVpHYVwd2iGNVN2k/8D2Ydl
	 wfMDOBS1shgbj/bGpcsUsOhegq5KdkBkTI8HiTiQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260915153227eucas1p2c51b87dc8da5d9dfacd6db6bb7d6774e~ViFosbQOs0983909839eucas1p2d;
	Tue, 15 Sep 2026 15:32:27 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260915153226eusmtip1b8862067e39eb9b8c67522b01c52aff8~ViFnFT_Cd0424304243eusmtip1x;
	Tue, 15 Sep 2026 15:32:26 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 15 Sep 2026 17:32:16 +0200
Subject: [PATCH v4 08/20] drm/bridge: inno-hdmi: Allow the register map to
 come from a parent
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-jh7110-clean-send-v4-8-f0e4fd6f2cc8@samsung.com>
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org,  Marek Szyprowski
	<m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260915153227eucas1p2c51b87dc8da5d9dfacd6db6bb7d6774e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153227eucas1p2c51b87dc8da5d9dfacd6db6bb7d6774e
X-EPHeader: CA
X-CMS-RootMailID: 20260915153227eucas1p2c51b87dc8da5d9dfacd6db6bb7d6774e
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153227eucas1p2c51b87dc8da5d9dfacd6db6bb7d6774e@eucas1p2.samsung.com>

On some SoCs the HDMI controller does not own its register window. The
StarFive JH7110 documents one 64 KB block, u0_hdmitx, that holds both
the controller and the PHY, so the parent device maps it and owns the
regmap while the two children share it.

Use a regmap supplied by the parent device when there is one, and keep
mapping our own resource when there is not, so platforms that own their
register window are unaffected.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index 840f1c7bc202951d3dfee3711f61105f328c3326..1264152fb1434acda584e4af3d54e4986b57aa3e 100644
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
 
@@ -1102,9 +1117,19 @@ struct inno_hdmi *inno_hdmi_probe(struct platform_device *pdev,
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

