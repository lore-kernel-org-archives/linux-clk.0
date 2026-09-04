Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8C650C2AC;
	Fri,  4 Sep 2026 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537551; cv=none; b=kjm3bOaNXuPNZe4UWPKQP2k5mU8jC53mY8o+X3xwpI5nEsmcGt4LA1WTyEHZecjCc5/b4EONkAqyCxzwUsA59M1Hum0sOhhNP6TpEsAgoeEJRjQ1TOCnUZaYP5CXHpt93P7F7z3tzQGq0dOR4HIHhLpsZZgYUAqkm9V64P2baDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537551; c=relaxed/simple;
	bh=nMeyY06EOfx0vESy7Xk1OSBkWXqd9xnXY6V0LsKPumI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AF0q8dzmJ9y4nB64mpu+qKjXL6TLeeeyLA5/EHOdYWRWn6v/krLXofe6GmMLKmXnLJcNcBQsAyA6GRHYvHk6k9nl76Y6xzro4LNquyC5TBCMf1xpm9WNP9O1DGTdRVtHecvwQbSWExf8wHr671i0C7mhnCjrHw4vBA/IN6gIYmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pW1V5Eot; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pW1V5Eot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537547;
	bh=nMeyY06EOfx0vESy7Xk1OSBkWXqd9xnXY6V0LsKPumI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pW1V5EotjqK2xl77lsCVkRaqA7GirTiysnhTjDETrFu5bmSX9HzNuEDjgHQd3WEdj
	 1x1ClkEHUgfYuU23HbIayYlvgMyHa8xeGIolr59ol1DeVA38qEfbeExIYj5BVNcaaR
	 bWhKsRdI5VdMq+OlNOr2Tq+LGF4UNVrnXfsj3D093kRvpnxrtOnbnjH5kDVAnJUElm
	 Jui3hNgbe2vlTeZKeTAkmfdWPA3NxSPsk9mB6ETJv2+yMHRSkOiZcKSB+M1bqS9j4K
	 ADroX3Kf7nEjjmeb1ejXeZdm6Sp+OksCaHPrGlwRGyAlyZ3YFBpKQnoloNU8Jjgrah
	 Bv2TRAWEq2bZw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D12F117E1023;
	Fri, 04 Sep 2026 17:59:05 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:27 +0200
Subject: [PATCH v6 16/27] clk: mediatek: Move fhctl_parse_dt call into
 mtk_clk_register_pllfhs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-16-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=7115;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=nMeyY06EOfx0vESy7Xk1OSBkWXqd9xnXY6V0LsKPumI=;
 b=1SKsMeMoCDyzxqq0sn/6HXcDLmGa7Byn+TqzhC1ivIqdHMA9HOha2Y6aUfeud7WgV8eW58+sl
 duQqiRnNvGPAVBDAGv/zQs9rSPmJ4Y+Gx40aIK3GFFeQ7w6y+Tvi8jc
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Currently, in the probe functions of apmixedsys drivers with PLL
frequency hopping support (FHCTL), the call to mtk_clk_register_pllfh
is always preceded by a call to fhctl_parse_dt.

This function purpose is to prepare FHCTL-related internal data, that
are then used by mtk_clk_register_pllfhs. It is not used in another
case and both functions are implemented in the same source file
(clk-pllfh.c). There is little interest to keep as it this call
sequence in the several probe functions.

So, add an additional parameter (compatible name string) in
mtk_clk_register_pllfhs and move the fhctl_parse_dt call into it.
Finally, make this function private by removing it from clk-pllfh.h
include, remove its EXPORT_SYMBOL_GPL macro use and add the static
keyword.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  3 +--
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c |  5 ++---
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  4 +---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  4 +---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  4 +---
 drivers/clk/mediatek/clk-pllfh.c             | 10 ++++++----
 drivers/clk/mediatek/clk-pllfh.h             |  5 +----
 7 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..a860708ef908 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -151,8 +151,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-	ret = mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls),
+	ret = mtk_clk_register_pllfhs(dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				      pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (ret)
 		goto free_clk_data;
diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..8920eb1c3fa6 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -156,9 +156,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 		goto unmap_io;
 	}
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-	r = mtk_clk_register_pllfhs(dev, plls, ARRAY_SIZE(plls), pllfhs,
-				    ARRAY_SIZE(pllfhs), clk_data);
+	r = mtk_clk_register_pllfhs(dev, fhctl_node, plls, ARRAY_SIZE(plls),
+				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_clk_data;
 
diff --git a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
index d35dd2632e43..e8fc6bd90fcb 100644
--- a/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8186-apmixedsys.c
@@ -149,9 +149,7 @@ static int clk_mt8186_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..2e4f5aff9eee 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -160,9 +160,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_clk_data;
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index a120c3305547..12e51b39b764 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -178,9 +178,7 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
+	r = mtk_clk_register_pllfhs(&pdev->dev, fhctl_node, plls, ARRAY_SIZE(plls),
 				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
 	if (r)
 		goto free_apmixed_data;
diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index f36dbc7fa06d..398edad2a69e 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -69,8 +69,9 @@ static struct mtk_pllfh_data *get_pllfh_by_id(struct mtk_pllfh_data *pllfhs,
 	return NULL;
 }
 
-void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
-		    int num_fhs)
+static void fhctl_parse_dt(const u8 *compatible_node,
+			   struct mtk_pllfh_data *pllfhs,
+			   int num_fhs)
 {
 	void __iomem *base;
 	struct device_node *node;
@@ -121,7 +122,6 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 	iounmap(base);
 	goto out_node_put;
 }
-EXPORT_SYMBOL_GPL(fhctl_parse_dt);
 
 static int pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
 {
@@ -252,7 +252,7 @@ static void mtk_clk_cleanup_pllfhs(void __iomem *iomem_base,
 }
 
 
-int mtk_clk_register_pllfhs(struct device *dev,
+int mtk_clk_register_pllfhs(struct device *dev, const u8 *fhctl_node,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_fhs,
 			    struct clk_hw_onecell_data *clk_data)
@@ -261,6 +261,8 @@ int mtk_clk_register_pllfhs(struct device *dev,
 	int i;
 	struct clk_hw *hw;
 
+	fhctl_parse_dt(fhctl_node, pllfhs, num_fhs);
+
 	base = of_iomap(dev->of_node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index a9eb7558de1c..07269e467e34 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -71,7 +71,7 @@ struct fh_operation {
 
 extern const struct clk_ops mtk_pllfh_setclr_ops;
 
-int mtk_clk_register_pllfhs(struct device *dev,
+int mtk_clk_register_pllfhs(struct device *dev, const u8 *fhctl_node,
 			    const struct mtk_pll_data *plls, int num_plls,
 			    struct mtk_pllfh_data *pllfhs, int num_pllfhs,
 			    struct clk_hw_onecell_data *clk_data);
@@ -80,7 +80,4 @@ void mtk_clk_unregister_pllfhs(const struct mtk_pll_data *plls, int num_plls,
 			       struct mtk_pllfh_data *pllfhs, int num_fhs,
 			       struct clk_hw_onecell_data *clk_data);
 
-void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
-		    int num_pllfhs);
-
 #endif /* __CLK_PLLFH_H */

-- 
2.55.0

