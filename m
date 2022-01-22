Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75A0C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbiAVJTR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234145AbiAVJSk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:40 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52FA4C06175F
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:27 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id e8so10880281plh.8
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4dLgzVu3UPZmPwEvYWiLff/Jy1kChuWKg74HILKInho=;
        b=gvpLT+OdMi/dn6Dv46g2q0G1XapqMDfLybAIlxoP4Ayr5j4S/KvK9rv/+vCyBlQ1iy
         2oTd9OqTJ9lEf2gY7L2QkJr1k9eKXK4uIBF6TCpPlZw5eqpxT+obPum79TTyWO4vY00k
         /uoM9jLUdRSy39Sb3qF+pNjr3o77BCBo2yzxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4dLgzVu3UPZmPwEvYWiLff/Jy1kChuWKg74HILKInho=;
        b=PzG+f2bKRCAkrUwavIGMLUQ/xIggtHobf/cE09OgpS4M23WEgnekr1BsxSEvOv55oQ
         vmNqmfzcsiiA+dd9hdYv5+oGgV0gApYrtnMUiQ/QiJzaYkBAHS1TmYIETmOywyMC9yj0
         GP3Giko+RHcREJgUclLLXVteoCNQIr3LE8n+uE17iqlwqpSqPl5CV+nt5Ba+6dEhdfdT
         qjyma6Sig3h1WaGCkAtyAu5p6ehVc/qFEgUMvYUPLE8jReZXVMhzvCmjbO/IL2p8RojS
         hPP/n7NpzBuUCrDSRvJ0AF6mG/loVgrrHmOijm7m4Ou/+gPpJG4Y4kotQaayVw5hE/Ck
         C4DA==
X-Gm-Message-State: AOAM530IuVE3ArVdfxfXLGWN3ougZih8zfJqZogGShQQ73d91KdZuhu9
        We/kOvxYnv/tJwGLlELBKcSX7Q==
X-Google-Smtp-Source: ABdhPJwrAq/6QES+b7lFgZS4hCPr/6p1PUXBrtNXH0twTGUh/4YxyTn0GKRlHBgLrCyy4BiumuQBmw==
X-Received: by 2002:a17:902:d2c6:b0:14a:6e28:591c with SMTP id n6-20020a170902d2c600b0014a6e28591cmr6956198plc.85.1642843106909;
        Sat, 22 Jan 2022 01:18:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:26 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/31] clk: mediatek: Add mtk_clk_simple_remove()
Date:   Sat, 22 Jan 2022 17:17:19 +0800
Message-Id: <20220122091731.283592-20-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In commit c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to
simplify clock providers"), a generic probe function was added to
simplify clk drivers that only needed to support clk gates. However due
to the lack of unregister APIs, a corresponding remove function was not
added.

Now that the unregister APIs have been implemented, add aforementioned
remove function to make it complete.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 2150ed8678e0..cd76e1d80242 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -369,6 +369,8 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	if (r)
 		goto free_data;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 free_data:
@@ -376,4 +378,17 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	return r;
 }
 
+int mtk_clk_simple_remove(struct platform_device *pdev)
+{
+	const struct mtk_clk_desc *mcd = of_device_get_match_data(&pdev->dev);
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
+
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 3c3a934f53cd..4fa658f5d934 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -202,5 +202,6 @@ struct mtk_clk_desc {
 };
 
 int mtk_clk_simple_probe(struct platform_device *pdev);
+int mtk_clk_simple_remove(struct platform_device *pdev);
 
 #endif /* __DRV_CLK_MTK_H */
-- 
2.35.0.rc0.227.g00780c9af4-goog

