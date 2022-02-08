Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDDEC35273
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350410AbiBHNQS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358760AbiBHMlf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:35 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33067C03FECA
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:35 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id d9-20020a17090a498900b001b8bb1d00e7so2597998pjh.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=haCUKocersM2g//bqn162Qgjk6DgHWiyvTJMF5LIhWw=;
        b=M5jgrIfhxC3Ll3awR5T/EnAv44rvXW+k+Lm7AQnR3Voo/+J434lWom64lKJIfHW/cl
         bbJ4/NkcAMG7j9u2VNGPeha843F9tsH16GYZcBXjNE1AifaS85v+HaHEIl1Evh2aglFz
         VWZ5L03Ul4UGHHUuej8bAw7/iQcTu3MZubKqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=haCUKocersM2g//bqn162Qgjk6DgHWiyvTJMF5LIhWw=;
        b=VRBmdzSoRPwtGsEh6bPFBUiYV33PgzmtQH7gjs0r9jojTd9PoAmQQB0onP/8RSye5h
         8h4VYhJJx1WxdFXKWLwOmraYFtneQbB3L6cDqS5HJmU+VtK0YZVJ0I0ZuLHuJd8ixjRe
         PteKfqde8TuoCogmKbGq/LkjxKcsHoODQNPDunfRaZgKLhqZKs4ao8t19gFHF2G/xxA+
         PYZNcilmUcYib51I1KuAFIVgxffautSVi+WYjIA+Rrfs3lqhfHPb/ZrfteAKEREDydmh
         gh7xAbBpVS0iSOfVLEdWn+vFU4dxW5lJ1fOuZNBhMHdmQ2aDGt0d0Zhh5dM9A6Kuj58G
         OOYQ==
X-Gm-Message-State: AOAM533l2m9GHw7bV4kZ/fzAmdNrZk9CegcPLzJsqOf/gKuZcWakaIcu
        4dvRWWA/2eSKxQAGChDEeKcp5A==
X-Google-Smtp-Source: ABdhPJwC7im+Wu7WK7r8anEyQqm3GCI3zaun1ihNvzqAS141M0dKaySmYd4Yoapf0HcUrCF7/0wMeg==
X-Received: by 2002:a17:903:187:: with SMTP id z7mr4252301plg.123.1644324094451;
        Tue, 08 Feb 2022 04:41:34 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:34 -0800 (PST)
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
Subject: [PATCH v3 21/31] clk: mediatek: cpumux: Implement error handling in register API
Date:   Tue,  8 Feb 2022 20:40:24 +0800
Message-Id: <20220208124034.414635-22-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cpumux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 658aee789f44..499c60432280 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -123,13 +123,26 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 		clk = mtk_clk_register_cpumux(mux, regmap);
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_composite *mux = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_cpumux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
-- 
2.35.0.263.gb82422642f-goog

