Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AD0C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245590AbiBHNQz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359044AbiBHMly (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:54 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D2DC03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:54 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id v4so10211495pjh.2
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=su8yB3PhAikF3CbTDZ6t9xjvJ0+tVV3Q7sMK1qov3u8=;
        b=dawlL8uPpwEhEdNzpFhriSJEc1UtRFiXuNLnUzi+5qbBM87ysJgWjelVSEpVjER5Jx
         joGv/TplaF0PTc6D/bNC1/u/UXy0U65BtryhYLyNRH9tBW5x3jFSaV3tmczcjqcWZiQL
         b+ndNi9SCeiJkOOce7Rr7EGiWg81mozts7FXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=su8yB3PhAikF3CbTDZ6t9xjvJ0+tVV3Q7sMK1qov3u8=;
        b=z0CySq1Wb6oeU5Z0Z6JwOTBqQJF1xr8yIQ6oWI/wWIEW49T/01KK9C8hdKTWOQCgRC
         bqNSrPvnigDNX39j8oVgrMix1anL25eJQLMK9UGMJFJNG7wy6O++J49wflY7ClKuzvAe
         QniaLE3UKzdBbYSx9TMyW1rMmGs0fZrvSKYtakP1mkNzSZd4go1oK84Vkd3f21myh35w
         yoBTQfgNGjyZBjm7/E5gDWo0hFc11ULjm/d/5CKXkFQgTvXdAoKGUztNceVaR51ZcH1c
         qPvCvrBQA9Ec8uzpm8nVZwD7aGKGW+IXSR7WOZvPeb6H3+BHMhYVc1IjUYYm+rQ7D1ED
         8PMw==
X-Gm-Message-State: AOAM531P28RuxkST+n1C45mIapWdWX1ACU4oJyNZYtr7N7mbexjkk0ek
        EYpUusOC2VhCE9KwmdFzz1wNNRDM+2VPTQ==
X-Google-Smtp-Source: ABdhPJzfeIV9hW4JatNPV1xSEsdpC0w96N8R32l6fhq4Zd+WxyYTQiY+H/KMNwMzwxkzPNn53nCdVA==
X-Received: by 2002:a17:902:ecc9:: with SMTP id a9mr4084829plh.121.1644324113776;
        Tue, 08 Feb 2022 04:41:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:53 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 30/31] clk: mediatek: mt8195: Implement remove functions
Date:   Tue,  8 Feb 2022 20:40:33 +0800
Message-Id: <20220208124034.414635-31-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Until now the mediatek clk driver library did not have any way to
unregister clks, and so none of the drivers implemented remove
functions.

Now that the library does have APIs to unregister clks, use them
to implement remove functions for the mt8195 clk drivers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mt8195-topckgen.c   | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-vdo0.c       | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-vdo1.c       | 16 ++++++++++++++++
 5 files changed, 83 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index d0fdb5a4a921..eecc7035a56a 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -132,6 +132,8 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
@@ -143,8 +145,22 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_apmixed_drv = {
 	.probe = clk_mt8195_apmixed_probe,
+	.remove = clk_mt8195_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8195-apmixed",
 		.of_match_table = of_match_clk_mt8195_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index f489b57e325e..8cd88dfc3283 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -74,6 +74,8 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_plls:
@@ -83,6 +85,18 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_apusys_pll_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
 	{ .compatible = "mediatek,mt8195-apusys_pll", },
 	{}
@@ -90,6 +104,7 @@ static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
 
 static struct platform_driver clk_mt8195_apusys_pll_drv = {
 	.probe = clk_mt8195_apusys_pll_probe,
+	.remove = clk_mt8195_apusys_pll_remove,
 	.driver = {
 		.name = "clk-mt8195-apusys_pll",
 		.of_match_table = of_match_clk_mt8195_apusys_pll,
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 3631f49a5e5a..b602fcd7f1d1 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1271,6 +1271,8 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, top_clk_data);
+
 	return r;
 
 unregister_gates:
@@ -1290,8 +1292,26 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_topck_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *top_clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
+	mtk_free_clk_data(top_clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_topck_drv = {
 	.probe = clk_mt8195_topck_probe,
+	.remove = clk_mt8195_topck_remove,
 	.driver = {
 		.name = "clk-mt8195-topck",
 		.of_match_table = of_match_clk_mt8195_topck,
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index af34eb564b1d..3bc7ed19d550 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -107,6 +107,8 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
@@ -116,8 +118,22 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_vdo0_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_vdo0_drv = {
 	.probe = clk_mt8195_vdo0_probe,
+	.remove = clk_mt8195_vdo0_remove,
 	.driver = {
 		.name = "clk-mt8195-vdo0",
 	},
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 6b502bbc730c..90c738a85ff1 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -124,6 +124,8 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
@@ -133,8 +135,22 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt8195_vdo1_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt8195_vdo1_drv = {
 	.probe = clk_mt8195_vdo1_probe,
+	.remove = clk_mt8195_vdo1_remove,
 	.driver = {
 		.name = "clk-mt8195-vdo1",
 	},
-- 
2.35.0.263.gb82422642f-goog

