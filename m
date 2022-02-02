Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1E1C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344697AbiBBNuz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344746AbiBBNum (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:42 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0688CC06173E
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:25 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id b15so18316301plg.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNRljrWOAeUndIQnSVvEuUfXq7FasZjB3yC6SLPOuYM=;
        b=U4vn34H0WZLQA8MoBFSj8XH+wsm8GLd/vRb1NzXQolOCQ6oqrB9XEHDXlwVR+0Yef6
         wkYdmZeZSVKK9vVy6IiPGuwINl7+oHUyqqzA63Zn+h4F4mV51am7/giIRB415XQRleoF
         nPc0iVKyIb/sVzkHaTRkm8kkWuk4z/cWbCzx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNRljrWOAeUndIQnSVvEuUfXq7FasZjB3yC6SLPOuYM=;
        b=kEJY5dnH5DguljcJwzNPSplW2+iog7bDqrtXtUjmnOjratXLtZQ+oCXE4tzuNv/aJW
         /DVy5gDpdmh3aHMp/q/+PzEMGD+2/qb2dl/qJWcxokLdw8CKSoFPVTDbBcIGAvvz+MhY
         xz75edfVCZkVPG1tAJj3ZjC1sGkNSk5Ou9hznJFoQQF5ZhlUBJ/dR/f8vB8yNqAJWQR+
         HT0Lp+pWa2AxtqIdRs6PKSAoQcf+Df1RlMwQlrKZnUzJfWNr7r0MP81CnIfmZE7plSzj
         rCKL85kfUg68KW5/T+Y4pMKkaTMh30VXpEuCMP9I86a+lNUXTlvVknQB1exaqHu9CM/N
         rWuA==
X-Gm-Message-State: AOAM533y0DhTkG5gautkiud2rECla3gH5K2bXoQQLhpQwE56hGOgOG5x
        oYG087jPxJUUtMSVa0Q9r2gadQ==
X-Google-Smtp-Source: ABdhPJxg9luWRJ9r/j2zVez342YUr/p2ncftDzjGtTu9Ak9s1/hRg0GpZyJdP3tIQGpruvbs2nlMjQ==
X-Received: by 2002:a17:903:1110:: with SMTP id n16mr32138856plh.120.1643809824608;
        Wed, 02 Feb 2022 05:50:24 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:24 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/31] clk: mediatek: mux: Reverse check for existing clk to reduce nesting level
Date:   Wed,  2 Feb 2022 21:48:26 +0800
Message-Id: <20220202134834.690675-24-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk registration code here currently does:

    if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
            ... do clk registration ...
    }

This extra level of nesting wastes screen real estate.

Reduce the nesting level by reversing the conditional shown above.
Other than that, functionality is not changed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 01af6a52711a..70aa42144632 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -208,16 +208,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	for (i = 0; i < num; i++) {
 		const struct mtk_mux *mux = &muxes[i];
 
-		if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
-			clk = mtk_clk_register_mux(mux, regmap, lock);
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
 
-			if (IS_ERR(clk)) {
-				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-				continue;
-			}
+		clk = mtk_clk_register_mux(mux, regmap, lock);
 
-			clk_data->clks[mux->id] = clk;
+		if (IS_ERR(clk)) {
+			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
+			continue;
 		}
+
+		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
-- 
2.35.0.rc2.247.g8bbb082509-goog

