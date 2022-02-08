Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02850C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbiBHNQg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358995AbiBHMlx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:53 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219C5C03FECE
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:52 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id e28so18651980pfj.5
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xQYgt3QgtF2LKqHQFrC88zvLPa0lBRjCLZf9LxJ/ets=;
        b=PTrB6iawyPIGirYG4b5/ASRbq8cAXNLl2+9H+SsEVOhpHDioapf8D795bOuyB1Vzt+
         D7iK/QAZBbVNs3n0Uh48XNOiKVqYmIJcav6+gLIRs2cHTzUwI9XmIC8iudvh87dIKEuE
         MKrB6vnf59XhrPYB9ENKj6YN1eXJbtBkiWBXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xQYgt3QgtF2LKqHQFrC88zvLPa0lBRjCLZf9LxJ/ets=;
        b=It9eOGygugphHCHFe2ci3yiSwAbfMo8ndrmiXEbMRKaytapi7IVsfcyj51mI5qhO+U
         YuUufdnm0H5aBLeYrVrbtHgAEsNU5JLDXg67R4fb/VBGmRhCBPdBslmzt6AKubtxe9Mb
         mnjvLbSW4xI161xPK001FWkXEJ+UozebywLhbAfCMThexwCHqReR1jV/24N2LOgHvEhk
         vwop8h+07iI6OClbq9XRrhTK0zynrpLGSFXk5jVicg3Vdk+6IR0Ejv6TSI1iTPu3Uzcf
         lCLBIZypfTHFyL6p6zMHwjMSEZmF6CFxyr28C/WIKtayHHabwhTObP8d21eUai8zsfKh
         v97g==
X-Gm-Message-State: AOAM531X/HtWotJVqZGkdutXrWyCahKpMQRmCuRsFJOcTKYg9698I1Ur
        fmLELtuKyFZbeVTt2VyXTxuHTg==
X-Google-Smtp-Source: ABdhPJye9xIwNE3PNFsoBEXbqwqREmnxZwGI394gtD4ROpx9kUF2yM+rAGbVJ76CmcyLN8yUhD1OGg==
X-Received: by 2002:a63:86:: with SMTP id 128mr3314659pga.13.1644324111661;
        Tue, 08 Feb 2022 04:41:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:51 -0800 (PST)
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
Subject: [PATCH v3 29/31] clk: mediatek: mt8195: Implement error handling in probe functions
Date:   Tue,  8 Feb 2022 20:40:32 +0800
Message-Id: <20220208124034.414635-30-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Until now the mediatek clk driver library did not have any way to
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of the probe functions for the mt8195 clk drivers
to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 13 ++++--
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  9 +++-
 drivers/clk/mediatek/clk-mt8195-topckgen.c   | 49 +++++++++++++++-----
 drivers/clk/mediatek/clk-mt8195-vdo0.c       |  4 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c       |  4 +-
 5 files changed, 61 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 5b1b7dc447eb..d0fdb5a4a921 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -120,17 +120,24 @@ static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	if (r)
 		goto free_apmixed_data;
 
+	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	if (r)
+		goto unregister_plls;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_apmixed_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+unregister_plls:
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
 free_apmixed_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index db449ff877d7..f489b57e325e 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -66,13 +66,18 @@ static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
 	if (r)
 		goto free_apusys_pll_data;
 
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_plls;
+
 	return r;
 
+unregister_plls:
+	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
 free_apusys_pll_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index 3e2aba9c40bb..3631f49a5e5a 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1239,25 +1239,52 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 		goto free_top_data;
 	}
 
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    top_clk_data);
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
-	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
-			       &mt8195_clk_lock, top_clk_data);
-	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
-				    &mt8195_clk_lock, top_clk_data);
-	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
-				    &mt8195_clk_lock, top_clk_data);
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
+					top_clk_data);
 	if (r)
 		goto free_top_data;
 
+	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+	if (r)
+		goto unregister_fixed_clks;
+
+	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
+				   &mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_factors;
+
+	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
+					&mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_muxes;
+
+	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
+					&mt8195_clk_lock, top_clk_data);
+	if (r)
+		goto unregister_composite_muxes;
+
+	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	if (r)
+		goto unregister_composite_divs;
+
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
 	if (r)
-		goto free_top_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+unregister_composite_divs:
+	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
+unregister_composite_muxes:
+	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
+unregister_muxes:
+	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
+unregister_factors:
+	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
+unregister_fixed_clks:
+	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
 free_top_data:
 	mtk_free_clk_data(top_clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
index f7ff7618c714..af34eb564b1d 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
@@ -105,10 +105,12 @@ static int clk_mt8195_vdo0_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_vdo0_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(vdo0_clks, ARRAY_SIZE(vdo0_clks), clk_data);
 free_vdo0_data:
 	mtk_free_clk_data(clk_data);
 	return r;
diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
index 03df8eae8838..6b502bbc730c 100644
--- a/drivers/clk/mediatek/clk-mt8195-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
@@ -122,10 +122,12 @@ static int clk_mt8195_vdo1_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_vdo1_data;
+		goto unregister_gates;
 
 	return r;
 
+unregister_gates:
+	mtk_clk_unregister_gates(vdo1_clks, ARRAY_SIZE(vdo1_clks), clk_data);
 free_vdo1_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.35.0.263.gb82422642f-goog

