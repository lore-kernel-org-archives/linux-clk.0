Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D263168F8;
	Mon, 15 Dec 2025 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765794299; cv=pass; b=anoO2lzZ7oB2rlg5FoALgSw47ZwR+aCm4VHb59d1mqnUlBtXTQngTjRe0KAqu/VCfno0opuQyU5d3lCCohVSAJJh7LeA52WNjC4g8CzbC4VZT0OWeMSzrs4XqcPG6kWrNuQ+2uDS1zzcX7SFNcMEIofKai1JWzBfboY8HDfjQOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765794299; c=relaxed/simple;
	bh=VtxUMJ2u5iFtXryn1TVJjZMq5ABYBMcLCbEzGhuXjr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcY9i5O5aeAwMekUw6bTa4jw5bQmK3oYlroKqOjRAKcidqn4r/W6twI6yRVmbk+xhvuGoBGXq29LBTj3NS0g4tVrhTAXGCfhUhLnYLisa1eL+p1O1wm3/omfnO+0jyAdVfV7tXR7d/XG97m41xGzlx42yzOkAY5Z4HS+fKh0fW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=dfzPHFfy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="dfzPHFfy"
ARC-Seal: i=1; a=rsa-sha256; t=1765794276; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ir9UolOP7t4wyoOT1Zg0OueEqT61AbAHbg5OATRhheHrcCDx9EShzztYsibIL5VGund1YLDZwYsAQUAi+3G/Ng1k7rere6otTMpqo3VErJHQuRDXV5eo8P76lzbuxzb3WuK1EAxYG7Aa/kEItEoNMUzeadLnBVszOam1oc3W0js=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765794276; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5wnIvJnjRhfBk6qtB3fLQeSiCeNNEma/7rlGEjrdp0U=; 
	b=ht0RPlyi99unN8hu8L8o52+JORAcWQ+vBMAHHOYOaYHT9pPNdgqp69m27UA1CMwJ59ZPjlYM2Ltu5dcyCOCUjBanGpLITvfT63ieMrbvmQHUHz5S6fJYg8wUGgwRw+XGTGoCBINJuhM/m414X37IRpMTQ174uavLs644sw8QIhg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765794276;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5wnIvJnjRhfBk6qtB3fLQeSiCeNNEma/7rlGEjrdp0U=;
	b=dfzPHFfyI38T7Yp6V2/FNi6MS2pv4jcW2OQZVNOZAIOaOqBwHqvJYpY8AHSfAqX4
	t0BV+gtbDGPAPBIZ/Ey/SgBlXObiHj4gSini+/FEgcbSI42z0UUoeBq/+b0K32+aURk
	rgx7dluAVWgTS9Kj4Q1PnpjRHaM16JvTDxfbkKW4=
Received: by mx.zohomail.com with SMTPS id 1765794275302442.97214045653334;
	Mon, 15 Dec 2025 02:24:35 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 11:24:01 +0100
Subject: [PATCH RESEND v3 4/5] clk: mediatek: Refactor pllfh registration
 to pass device
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-mtk-pll-rpm-v3-4-5afb3191e869@collabora.com>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
In-Reply-To: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Laura Nao <laura.nao@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

After refactoring all of PLL to pass the device, it's now fairly easy to
refactor pllfh and its users, as pllfh registration wraps PLL
registration.

Do this refactor and move all of the pllfh users to pass the device as
well.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
 drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
 drivers/clk/mediatek/clk-pllfh.h             |  2 +-
 7 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 91665d7f125e..123d5d7fea85 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -152,7 +152,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-	ret = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+	ret = mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls),
 				      pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (ret)
 		goto free_clk_data;
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index 95385bb67d55..d7d416172ab3 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -140,13 +140,13 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_apmixed);
 static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 {
 	const u8 *fhctl_node = "mediatek,mt8173-fhctl";
-	struct device_node *node = pdev->dev.of_node;
 	struct clk_hw_onecell_data *clk_data;
+	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	struct clk_hw *hw;
 	int r;
 
-	base = of_iomap(node, 0);
+	base = of_iomap(dev->of_node, 0);
 	if (!base)
 		return -ENOMEM;
 
@@ -157,25 +157,25 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	}
 
 	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
-				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
+	r = mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls), pllfhs,
+				    ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_clk_data;
 
 	hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REGOFF_REF2USB);
 	if (IS_ERR(hw)) {
 		r = PTR_ERR(hw);
-		dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n", r);
+		dev_err(dev, "Failed to register ref2usb_tx: %d\n", r);
 		goto unregister_plls;
 	}
 	clk_data->hws[CLK_APMIXED_REF2USB_TX] = hw;
 
-	hw = devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdpll_594m", 0,
+	hw = devm_clk_hw_register_divider(dev, "hdmi_ref", "tvdpll_594m", 0,
 					  base + REGOFF_HDMI_REF, 16, 3,
 					  CLK_DIVIDER_POWER_OF_TWO, NULL);
 	clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	r = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, clk_data);
 	if (r)
 		goto unregister_ref2usb;
 
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index 4b2b16578232..d35dd2632e43 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -151,7 +151,7 @@ static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 
 	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
 
-	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index 0b66a27e4d5a..b0563a285bd6 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -162,7 +162,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 
 	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
 
-	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_clk_data;
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 282a3137dc89..44917ab034c5 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -181,7 +181,7 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 
 	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
 
-	r = mtk_clk_register_pllfhs(node, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index 62bfe4a480f1..8ad11023d911 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/clkdev.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 
 #include "clk-mtk.h"
 #include "clk-pllfh.h"
@@ -149,7 +150,7 @@ static bool fhctl_is_supported_and_enabled(const struct mtk_pllfh_data *pllfh)
 }
 
 static struct clk_hw *
-mtk_clk_register_pllfh(const struct mtk_pll_data *pll_data,
+mtk_clk_register_pllfh(struct device *dev, const struct mtk_pll_data *pll_data,
 		       struct mtk_pllfh_data *pllfh_data, void __iomem *base)
 {
 	struct clk_hw *hw;
@@ -166,6 +167,8 @@ mtk_clk_register_pllfh(const struct mtk_pll_data *pll_data,
 		goto out;
 	}
 
+	fh->clk_pll.dev = dev;
+
 	hw = mtk_clk_register_pll_ops(&fh->clk_pll, pll_data, base,
 				      &mtk_pllfh_ops);
 
@@ -194,7 +197,7 @@ static void mtk_clk_unregister_pllfh(struct clk_hw *hw)
 	kfree(fh);
 }
 
-int mtk_clk_register_pllfhs(struct device_node *node,
+int mtk_clk_register_pllfhs(struct device *dev,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_fhs,
 			    struct clk_hw_onecell_data *clk_data)
@@ -203,7 +206,7 @@ int mtk_clk_register_pllfhs(struct device_node *node,
 	int i;
 	struct clk_hw *hw;
 
-	base = of_iomap(node, 0);
+	base = of_iomap(dev->of_node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
 		return -EINVAL;
@@ -218,9 +221,9 @@ int mtk_clk_register_pllfhs(struct device_node *node,
 		use_fhctl = fhctl_is_supported_and_enabled(pllfh);
 
 		if (use_fhctl)
-			hw = mtk_clk_register_pllfh(pll, pllfh, base);
+			hw = mtk_clk_register_pllfh(dev, pll, pllfh, base);
 		else
-			hw = mtk_clk_register_pll(NULL, pll, base);
+			hw = mtk_clk_register_pll(dev, pll, base);
 
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register %s clk %s: %ld\n",
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index 5f419c2ec01f..a4f337acad71 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -68,7 +68,7 @@ struct fh_operation {
 	int (*ssc_enable)(struct mtk_fh *fh, u32 rate);
 };
 
-int mtk_clk_register_pllfhs(struct device_node *node,
+int mtk_clk_register_pllfhs(struct device *dev,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_pllfhs,
 			    struct clk_hw_onecell_data *clk_data);

-- 
2.52.0

