Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC453FD26
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904878; cv=none; b=nSPYHv72ppxihZ7H4T8cB8WrorTToLjngQJwq8Z9qkdP2uBGgS7cKVWBL/gassZvA38OvO1FH+Yo99s49XtJ6nrA6aJh1syI+i7LmntpwLpK+AYQDCSOolLBGuzFjW86L0BRlDfHyNiDuRdVk8CStb5NJWenQx5KCZGzh1R3KPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904878; c=relaxed/simple;
	bh=LPzlvasuU6X0i/2jyuvhLwS0z/0nrObxyfYYL1SWtaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VlfmqmreW0G5rK3I45AFWAsr4lgNujLBALkzHnLPl9Jwucv2LPrVg1HqRxUyxOr/oD7xLG5Ofxzy8/Rug2fNj47HGEDarI5A4lqaHXPDVfAAoHrI866SsQPOeTwmm9LhIYq1efD2q/RAtDM03Y/cab81e30hBcYrFt5gY+q9C3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6I9JCsY; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6I9JCsY"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-85377c8bc96so1293641b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904876; x=1792509676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blKBpa6d1QxFuHcDjoFRFZPKTGb7lQOeRuaZy3wA9IM=;
        b=Z6I9JCsYWpXcxfQlPsaEeeBf4xsNx1six1QxxMjEXkUnts4IvMzfrj7Fea29TFlzkv
         4oQZg1h/HnffsOL7vscuF6h8LNEi4CJdssKrenBMf51ZeUznn1PH+zuRfYg7glnZBrD6
         YyA0inuirvlr1HeHeKeoRHblra8kITmi6bNp2OKz4Y4CfgvijgWDsJ5oGj64CS4wa1QQ
         R2x6F0PZywIdi1wC1eNEd73X4l2j4wz+nQ8GN6oBuG9pqAmL7SkYQDyZ+dJQNoCcadyS
         R7v228Jf4UU6JvzfVHoFs6vRiCZAil0AkKKkRB7MWDRcoIbuWZOmBYGSEhHLR3knKL64
         wn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904876; x=1792509676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=blKBpa6d1QxFuHcDjoFRFZPKTGb7lQOeRuaZy3wA9IM=;
        b=EC2cc0kZg/QFo7I77nqEA0fCxTeCZsCZNngHkF3U50GNc/B8057Y/+nLJ42VO7Hp6o
         KQOi80eJAg+ff4RpQwxjmnqsoo/5knrHzystES7aAui/7MNHRQTjEb4WE2JK3hElywUS
         Qt3tI6HIwtQew/oYc7T8YglCL3ti5gdsaR8Vw3rFTOi7xI+dqjGkYguX2bfILFbzyax2
         iedbFH5JYsFAQR+OZG++P9jorPVwEa4zDbeTXBknVQJMdOQD1kpk56asfP+guK1OJG17
         5lfIy7Du8/SLvn/o0KA9ctVDLhZBK1ZKUXVnyU1jn76FR3w7IYiCH60Cx7CHEe0w+YdF
         pl5A==
X-Forwarded-Encrypted: i=1; AKwUvBwX1eEbOiZov4ect04R/GIv5+Fl1Aka+qK94FbmJVy3tNNSxk+icuWq3L85cz8eHug9w08C+UBfPy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwsqEnGEpiOu7srDxEwkCDG8NTDlf0S7HP5SvkHvxgvbUYZScQ
	hjb/aZGqS3536+LiAIrSFM9Jp9U5KHbJHxxlIQwPMtrt415ZOXVp55/V
X-Gm-Gg: AYBFou3ATN3f8V6lLdpyElYo157IyrWuHIf2+tdAJqB2mngMg72BM5IPrtDFVkUbbOb
	mJDCBISqOcDqwoA8n0uwY41+fv2cC2061lUGgF9/Jx/UWpxxu5o/1dp/RGUGLWm/hz+dHp5GWIi
	45o9gW5BuvxQI46NtUSQSLw/LWiKTcKe6dHQBNrvC/I++ZUPXtoctw2pbB69gAz83GLTuvt0O/F
	bIBxfOJl5ojBvAH674IZWAjsm+HX0KMc4xF164M/4P4jp+O996YUvjwVnMJUmAtQbzexC4eKhkJ
	k/NJaOYXoqKW8jyUQ9RCLQE0FcXUeyb6U0U98NIc/qLGGyzTsmmB3Rez9Qvnu+f04s5Dgt5WyYV
	B/245LMKX3OHdvMMpec2iXb63oCTgQyVcnJDAex0dLnKv5wLEdQSYA1Usx8cPcHcLSTqf8DzQiR
	qcNhah/lna7ONaI9ywcQd+PpvXXQXz1gAQzlddUE+fhEKg5vRMEkmSGh674AZ6rw2mc7+6ZmhBC
	PufszuvNrWC6ZMVLNG+IOGmbmOY
X-Received: by 2002:a05:6a21:394c:b0:3de:3f4d:f2bc with SMTP id adf61e73a8af0-3e16badf2a9mr12161934637.1.1791904875448;
        Tue, 13 Oct 2026 08:21:15 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:15 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 34/35] clk: mediatek: mt8196: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:33 +0900
Message-ID: <20261013151734.3177690-35-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8196 apmixedsys, mcusys, and mfg drivers use
MT8196-specific PLL descriptors or pass PLL data directly
as match data, requiring custom probe/remove callbacks.
Represent these PLL configurations using struct mtk_clk_desc
so the drivers can use mtk_clk_simple_probe() and
mtk_clk_simple_remove().

Keep the vlpckgen driver unchanged because its probe callback
also initializes APLL tuner registers, which are not yet
supported by the common helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 67 ++------------
 drivers/clk/mediatek/clk-mt8196-mcu.c        | 96 +++++++-------------
 drivers/clk/mediatek/clk-mt8196-mfg.c        | 84 +++++------------
 3 files changed, 63 insertions(+), 184 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
index c4ebb0170b82..a20fa02070a8 100644
--- a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
@@ -86,11 +86,6 @@
 		.ops = &mtk_pll_fenc_clr_set_ops,		\
 }
 
-struct mtk_pll_desc {
-	const struct mtk_pll_data *clks;
-	size_t num_clks;
-};
-
 static const struct mtk_pll_data apmixed_plls[] = {
 	PLL_FENC(CLK_APMIXED_MAINPLL, "mainpll", MAINPLL_CON0, FENC_STATUS_CON0,
 		 7, PLL_AO, MAINPLL_CON1, 24, MAINPLL_CON1, 0, 22, 0),
@@ -110,9 +105,9 @@ static const struct mtk_pll_data apmixed_plls[] = {
 		 0, 0, SGMIIPLL_CON1, 24, SGMIIPLL_CON1, 0, 22, 7),
 };
 
-static const struct mtk_pll_desc apmixed_desc = {
-	.clks = apmixed_plls,
-	.num_clks = ARRAY_SIZE(apmixed_plls),
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = apmixed_plls,
+	.num_plls = ARRAY_SIZE(apmixed_plls),
 };
 
 static const struct mtk_pll_data apmixed2_plls[] = {
@@ -132,57 +127,11 @@ static const struct mtk_pll_data apmixed2_plls[] = {
 		 0, 0, TVDPLL3_CON1, 24, TVDPLL3_CON1, 0, 22, 6),
 };
 
-static const struct mtk_pll_desc apmixed2_desc = {
-	.clks = apmixed2_plls,
-	.num_clks = ARRAY_SIZE(apmixed2_plls),
+static const struct mtk_clk_desc apmixed2_desc = {
+	.plls = apmixed2_plls,
+	.num_plls = ARRAY_SIZE(apmixed2_plls),
 };
 
-static int clk_mt8196_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const struct mtk_pll_desc *mcd;
-	int r;
-
-	mcd = device_get_match_data(&pdev->dev);
-	if (!mcd)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(mcd->num_clks);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, mcd->clks, mcd->num_clks,
-				  clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8196_apmixed_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_desc *mcd = device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static const struct of_device_id of_match_clk_mt8196_apmixed[] = {
 	{ .compatible = "mediatek,mt8196-apmixedsys", .data = &apmixed_desc },
 	{ .compatible = "mediatek,mt8196-apmixedsys-gp2",
@@ -192,8 +141,8 @@ static const struct of_device_id of_match_clk_mt8196_apmixed[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_apmixed);
 
 static struct platform_driver clk_mt8196_apmixed_drv = {
-	.probe = clk_mt8196_apmixed_probe,
-	.remove = clk_mt8196_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-apmixed",
 		.of_match_table = of_match_clk_mt8196_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8196-mcu.c b/drivers/clk/mediatek/clk-mt8196-mcu.c
index 13642fc673c2..e392408c93b2 100644
--- a/drivers/clk/mediatek/clk-mt8196-mcu.c
+++ b/drivers/clk/mediatek/clk-mt8196-mcu.c
@@ -68,29 +68,44 @@
 		.pcwibits = MT8196_INTEGER_BITS,		\
 	}
 
-static const struct mtk_pll_data cpu_bl_plls[] = {
-	PLL(CLK_CPBL_ARMPLL_BL, "armpll-bl", ARMPLL_BL_CON0, ARMPLL_BL_CON0, 0,
-	    0, PLL_AO, BIT(0), ARMPLL_BL_CON1, 24, 0, 0, 0, ARMPLL_BL_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_bl_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPBL_ARMPLL_BL, "armpll-bl", ARMPLL_BL_CON0, ARMPLL_BL_CON0, 0,
+		    0, PLL_AO, BIT(0), ARMPLL_BL_CON1, 24, 0, 0, 0, ARMPLL_BL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cpu_b_plls[] = {
-	PLL(CLK_CPB_ARMPLL_B, "armpll-b", ARMPLL_B_CON0, ARMPLL_B_CON0, 0, 0,
-	    PLL_AO, BIT(0), ARMPLL_B_CON1, 24, 0, 0, 0, ARMPLL_B_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_b_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPB_ARMPLL_B, "armpll-b", ARMPLL_B_CON0, ARMPLL_B_CON0, 0, 0,
+		    PLL_AO, BIT(0), ARMPLL_B_CON1, 24, 0, 0, 0, ARMPLL_B_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cpu_ll_plls[] = {
-	PLL(CLK_CPLL_ARMPLL_LL, "armpll-ll", ARMPLL_LL_CON0, ARMPLL_LL_CON0, 0,
-	    0, PLL_AO, BIT(0), ARMPLL_LL_CON1, 24, 0, 0, 0, ARMPLL_LL_CON1, 0, 22),
+static const struct mtk_clk_desc cpu_ll_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CPLL_ARMPLL_LL, "armpll-ll", ARMPLL_LL_CON0, ARMPLL_LL_CON0, 0,
+		    0, PLL_AO, BIT(0), ARMPLL_LL_CON1, 24, 0, 0, 0, ARMPLL_LL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data cci_plls[] = {
-	PLL(CLK_CCIPLL, "ccipll", CCIPLL_CON0, CCIPLL_CON0, 0, 0, PLL_AO,
-	    BIT(0), CCIPLL_CON1, 24, 0, 0, 0, CCIPLL_CON1, 0, 22),
+static const struct mtk_clk_desc cci_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_CCIPLL, "ccipll", CCIPLL_CON0, CCIPLL_CON0, 0, 0, PLL_AO,
+		    BIT(0), CCIPLL_CON1, 24, 0, 0, 0, CCIPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data ptp_plls[] = {
-	PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
-	    BIT(0), PTPPLL_CON1, 24, 0, 0, 0, PTPPLL_CON1, 0, 22),
+static const struct mtk_clk_desc ptp_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
+		    BIT(0), PTPPLL_CON1, 24, 0, 0, 0, PTPPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
 static const struct of_device_id of_match_clk_mt8196_mcu[] = {
@@ -106,56 +121,9 @@ static const struct of_device_id of_match_clk_mt8196_mcu[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mcu);
 
-static int clk_mt8196_mcu_probe(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const int num_plls = 1;
-	int r;
-
-	plls = of_device_get_match_data(&pdev->dev);
-	if (!plls)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(num_plls);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, num_plls, clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, num_plls, clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return r;
-}
-
-static void clk_mt8196_mcu_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, 1, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8196_mcu_drv = {
-	.probe = clk_mt8196_mcu_probe,
-	.remove = clk_mt8196_mcu_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-mcu",
 		.of_match_table = of_match_clk_mt8196_mcu,
diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
index a317183f1681..a209162f6207 100644
--- a/drivers/clk/mediatek/clk-mt8196-mfg.c
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -61,22 +61,31 @@
 		.parent_name = "mfg_eb",			\
 	}
 
-static const struct mtk_pll_data mfg_ao_plls[] = {
-	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0,
-	    PLL_PARENT_EN, BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
-	    MFGPLL_CON1, 0, 22),
+static const struct mtk_clk_desc mfg_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0,
+		    MFGPLL_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_CON1, 24, 0, 0, 0, MFGPLL_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data mfgsc0_ao_plls[] = {
-	PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
-	    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC0_CON1, 24,
-	    0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
+static const struct mtk_clk_desc mfgsc0_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
+		    MFGPLL_SC0_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_SC0_CON1, 24, 0, 0, 0, MFGPLL_SC0_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
-static const struct mtk_pll_data mfgsc1_ao_plls[] = {
-	PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
-	    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0), MFGPLL_SC1_CON1, 24,
-	    0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
+static const struct mtk_clk_desc mfgsc1_ao_plls = {
+	.plls = (const struct mtk_pll_data[]){
+		PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
+		    MFGPLL_SC1_CON0, 0, 0, PLL_PARENT_EN, BIT(0),
+		    MFGPLL_SC1_CON1, 24, 0, 0, 0, MFGPLL_SC1_CON1, 0, 22),
+	},
+	.num_plls = 1,
 };
 
 static const struct of_device_id of_match_clk_mt8196_mfg[] = {
@@ -90,56 +99,9 @@ static const struct of_device_id of_match_clk_mt8196_mfg[] = {
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mfg);
 
-static int clk_mt8196_mfg_probe(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const int num_plls = 1;
-	int r;
-
-	plls = of_device_get_match_data(&pdev->dev);
-	if (!plls)
-		return -EINVAL;
-
-	clk_data = mtk_alloc_clk_data(num_plls);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, plls, num_plls, clk_data);
-	if (r)
-		goto free_clk_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(plls, num_plls, clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-
-	return r;
-}
-
-static void clk_mt8196_mfg_remove(struct platform_device *pdev)
-{
-	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(plls, 1, clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8196_mfg_drv = {
-	.probe = clk_mt8196_mfg_probe,
-	.remove = clk_mt8196_mfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-mfg",
 		.of_match_table = of_match_clk_mt8196_mfg,
-- 
2.56.0

