Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBFCC3527A
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350202AbiBHNQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358802AbiBHMll (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:41 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B69C03FECA
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:41 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id z13so1010145pfa.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UxXHG53mykHwbXXXl6QinzYax9pQXchal111embQm8Q=;
        b=oX4x1gvQjxvxSt4a/L+sGTUd80SmwHzdFN5Di9Fue38kDqvXUicpxO4zseU/lOEIYT
         cCZpokdDjO6vKZyA+BfDjWw73ltev/kGx/z465m1SrygfkxAGYV584mSARhMIv/6FS3C
         zKkYrGl7gWKvOYNIBF4QdYZIzlKskCD0Ca5v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UxXHG53mykHwbXXXl6QinzYax9pQXchal111embQm8Q=;
        b=BND+zv+1hR2phxDfeVsnpErjyNqbAXDpnOVDvKnTJcCXs/uEoa8mTT6iAOuPGz9F9+
         OGt7WOij++0MMiX74suOWD5VgrHmJdk7W2lVDf8ejr8Hfce3bqsMw8fkDWGxaPmxAKgA
         JB5m4qcIpjBmQLePYYNkHBOQuLgzYcjn3in30ZnhJC3VHLe7d1w1dsAySMPiXvRJld6L
         t3SLfjYNZk1rgDIrW2o8TuOmL0lVkwewl7Av8TNUOhWKndBIlV3Y76evQg2GgIBJ6aev
         CSi+1oCH+NdcrvSagnzM+HbBFeawkYHMhT5Ediln148MUmWnOrNd0F4ZQuxDSNnvJmGX
         lznw==
X-Gm-Message-State: AOAM532zwF/ySa/sdC5So5IcdvtmkDaGY3JXvDWd2/X7opO4RXf5bUt4
        dB9SjQgsnp//m2ZU5NrHGaqg5A==
X-Google-Smtp-Source: ABdhPJxTJoAFPatZ+sQYfPsLCiW0XuU5pPQ74xytkcecYomRMstYp5V5YnaiscvqnVCpRyddm8Fe7Q==
X-Received: by 2002:a05:6a00:1253:: with SMTP id u19mr4397090pfi.8.1644324100988;
        Tue, 08 Feb 2022 04:41:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:40 -0800 (PST)
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
Subject: [PATCH v3 24/31] clk: mediatek: mux: Implement error handling in register API
Date:   Tue,  8 Feb 2022 20:40:27 +0800
Message-Id: <20220208124034.414635-25-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The mux clk type registration function does not stop or return errors
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
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 70aa42144632..f51e67650f03 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -215,13 +215,26 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
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
+		const struct mtk_mux *mux = &muxes[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
 
-- 
2.35.0.263.gb82422642f-goog

