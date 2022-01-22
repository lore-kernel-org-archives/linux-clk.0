Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D95FC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbiAVJT5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbiAVJTN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:19:13 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389D7C061774
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:36 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id f8so10240226pgf.8
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/yYGXqDxo/eWqrROn24aC9cA0IymJmQ8zZXIQFx6Mzg=;
        b=E3fL9k4nB0J+U7dhnH/244EmdfdD1ulLNX+eG5dBwQJtHMj/EcLeIsfa2TRUuWcGd9
         oiNAiHupmkNXYOFsXFJ6LIF2ndolec9H7eZ97eKqnFFN80k3IizBuZjLwuQ1VELWkx31
         mochVNtqJ50lh6iJe00VnTcom/Wyt65N6eHLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/yYGXqDxo/eWqrROn24aC9cA0IymJmQ8zZXIQFx6Mzg=;
        b=8O8luk7/oh1FmUJsXAIjNX4qoXVlvSUlRmGs2NqxNULfSLRyD264CuUqAL8eVsL9bI
         drW2nIBLUQfHt4bDVG89HyLsPlOuVBqo1tWKSD02iUWaDuhEYdQ2TFhbTCuQ2aHELupZ
         aZPMWzi2ETdTllnkBdO+9gEvcPlKDAKd4TeiFHx7di32BerKKXOfKcEpgyvEz6fM/hvR
         9u1lA6mmbO1cDlOCrX/3kzO5LYvLVsIbRHo1H2BoYlSfp3ihUtHcWLgWGpR0/XsEc9xv
         Np1Ush7VRMo8vh4yRPN96bJiXWWY7kytGUUFBwms9rFBmjYGn8WGQ4qwIFU9oCrLl4z+
         hkTw==
X-Gm-Message-State: AOAM533gAH/+C8mgOkfHnBy6mFzyIuTNCVExRPNe6Nt9sQybiFs9vJX5
        F3RYLWVDaqL7D4td8/tLe6USng==
X-Google-Smtp-Source: ABdhPJyf9HKfNksySR0iObSvFPhmBF8ZKz+iwD2Gd4unIv10qS1uI5MvXPoHzlLDKI0sSrcTb0B6jA==
X-Received: by 2002:a63:6845:: with SMTP id d66mr5494690pgc.199.1642843115668;
        Sat, 22 Jan 2022 01:18:35 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:35 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 23/31] clk: mediatek: mux: Reverse check for existing clk to reduce nesting level
Date:   Sat, 22 Jan 2022 17:17:23 +0800
Message-Id: <20220122091731.283592-24-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
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
2.35.0.rc0.227.g00780c9af4-goog

