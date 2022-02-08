Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1CEC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbiBHNQl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358837AbiBHMlo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:44 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9580DC03FECA
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:43 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d187so18625543pfa.10
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rT0ZvlEjSEX8tKc4measdB3BcCgivnDIA3yZFD+PibQ=;
        b=kox8FsUbNjIpYMZjXcKa8GmJjInsgqKSj6osghdWW2iJEPN5D0RfPCqjSjc0mBLHm3
         cWKgdgVcYOe/kIJnYOhYLE1pzYP7ghXt3SJm85YA6d4HNNzZPzVzFNs0MgtJbmp8p13+
         SbAKAiMbVvblV3oKQC17IG7WEoFyeSha3YpuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rT0ZvlEjSEX8tKc4measdB3BcCgivnDIA3yZFD+PibQ=;
        b=wlYy59u/vRPcxVCOb+usvrZpbh6LoLZCY8ZYdt/mbKjNWPU6No8MTdSp8sH2lUKwdu
         mHuhTjRmRODEQ5ONBMh3gMgtaa1AN6czCU61cZ1YpmqswHhhRRu/x1GvK2RSQvngHcgh
         auwbGhF+4A+92xo3t/FfN67jl1VM/I2OeL9YNigxcgQKvuPVx2c+ybex9kMuEeupHeGx
         0Zld/aHTPkB9okenoRC5EP93Di7tz3am4EYaAvn7utMvb/MsmTgCMc45novVYBRCCo2f
         fRsxG2xyk6kq0SuSPJXoSQqrDlTqG+Ycw33939/Ii0aq2jxvs51did0/I/RtrDDia+qn
         s3Qg==
X-Gm-Message-State: AOAM53370g/WzknUPfpLoYI41iqosS8HYlGDlQy613ZRWPbvWhjZhUZ7
        9eEIpqWIo2LI6wqtS0kdnLUEFg==
X-Google-Smtp-Source: ABdhPJx1ycT0FAJzg22IJjUEMsQqtSxdDyCkyduFu9zf4zZCUNd6bsoPyFYslN+f4ib6yI/1sZfQNA==
X-Received: by 2002:a62:86c9:: with SMTP id x192mr4244674pfd.54.1644324103129;
        Tue, 08 Feb 2022 04:41:43 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:42 -0800 (PST)
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
Subject: [PATCH v3 25/31] clk: mediatek: pll: Implement error handling in register API
Date:   Tue,  8 Feb 2022 20:40:28 +0800
Message-Id: <20220208124034.414635-26-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pll clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, and unmap the I/O space, is done in the new
error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 23 +++++++++++++++++++----
 drivers/clk/mediatek/clk-pll.h |  6 +++---
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 8439d37e354d..817a80293bfc 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -377,8 +377,9 @@ static void mtk_clk_unregister_pll(struct clk *clk)
 	kfree(pll);
 }
 
-void mtk_clk_register_plls(struct device_node *node,
-		const struct mtk_pll_data *plls, int num_plls, struct clk_onecell_data *clk_data)
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data)
 {
 	void __iomem *base;
 	int i;
@@ -387,7 +388,7 @@ void mtk_clk_register_plls(struct device_node *node,
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
-		return;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < num_plls; i++) {
@@ -397,11 +398,25 @@ void mtk_clk_register_plls(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", pll->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[pll->id] = clk;
 	}
+
+	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_pll_data *pll = &plls[i];
+
+		mtk_clk_unregister_pll(clk_data->clks[pll->id]);
+		clk_data->clks[pll->id] = ERR_PTR(-ENOENT);
+	}
+
+	iounmap(base);
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_plls);
 
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index a889b1e472e7..bf06e44caef9 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -48,9 +48,9 @@ struct mtk_pll_data {
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
 };
 
-void mtk_clk_register_plls(struct device_node *node,
-			   const struct mtk_pll_data *plls, int num_plls,
-			   struct clk_onecell_data *clk_data);
+int mtk_clk_register_plls(struct device_node *node,
+			  const struct mtk_pll_data *plls, int num_plls,
+			  struct clk_onecell_data *clk_data);
 void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num_plls,
 			     struct clk_onecell_data *clk_data);
 
-- 
2.35.0.263.gb82422642f-goog

