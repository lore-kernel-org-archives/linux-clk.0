Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B0DC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbiAVJUe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbiAVJT4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:19:56 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4825C06178C
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:51 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 133so10297380pgb.0
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2tVyD3kCR8VI41xLDJPrU9Qy3ho9fuGcyr93woETCtQ=;
        b=eOG+9BqGEp9yE6If/djlk8qPoDc9YyJud438PAYl0npRctcACveC92QRCKlaJfRRwK
         FhJoFkugw+IrHJljeBXz1R046xaB4XIpF0OrsCUYkk2Ma/RPDluCpN4Yw/8R6z6O39wq
         ls1PrMpFi6S6SnEVEQDTNxg2gdKqWj4Ior96s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2tVyD3kCR8VI41xLDJPrU9Qy3ho9fuGcyr93woETCtQ=;
        b=zyCBUXFh4z9+RKG87NxwTkWpdRljqS0R1JbO/UICOdTqzyCO75cSVK+oSt//PK2jyg
         6o5MaJ9v/NVlwly/ft/mI9EKfe5/CTFfw/jJ9h7SJLCrOaJ+W8mq/lJmcHu0NGp/2DGL
         FrzC7XPQDiJF/uH4yK+fhP+yE4TYwbmMBc7JHAmTO/38pdqPnWztjfmqH8joBVDIoK5C
         6oichbA0nzzwpFU9x5XlhsweepLs/JAQrgfCb8xL966SkMC1ksr96Zb7AlRSBQFPAIOH
         da67VM2cj5oPCAbzq1jleNMroVz0BR+FgwRPl5Zv4XPMhYlHzFHvPZlnnVvuAYk1efBB
         XWYQ==
X-Gm-Message-State: AOAM530kFnSv4Aj0fRiT9ocRIzjuPx9Gf4pS4vVhNbI2HkTDST04/f0j
        E48kXMEYdoAHTt5kANFAHpZAGrVL1aMe7Q==
X-Google-Smtp-Source: ABdhPJw3ygJrl6yteSRDfjOvQdB2WYEUn+GrOoTwni+HNy/7bK2tJUwjJ+Tq1xzBp18rW197UKqTfQ==
X-Received: by 2002:a05:6a00:2186:b0:4c6:50ea:6701 with SMTP id h6-20020a056a00218600b004c650ea6701mr6649364pfi.12.1642843131254;
        Sat, 22 Jan 2022 01:18:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:50 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 30/31] clk: mediatek: mt8195: Implement remove functions
Date:   Sat, 22 Jan 2022 17:17:30 +0800
Message-Id: <20220122091731.283592-31-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
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
---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 13 +++++++++++++
 drivers/clk/mediatek/clk-mt8195-topckgen.c   | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-vdo0.c       | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-vdo1.c       | 16 ++++++++++++++++
 5 files changed, 81 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index af8d80f25f30..29cac3cf5f53 100644
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
index 1fff6f3d2dc7..8cd88dfc3283 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -85,6 +85,18 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
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
@@ -92,6 +104,7 @@ static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
 
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
2.35.0.rc0.227.g00780c9af4-goog

