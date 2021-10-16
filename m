Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D53C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 10:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C6E611F0
	for <linux-clk@archiver.kernel.org>; Sat, 16 Oct 2021 10:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240224AbhJPKwz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Oct 2021 06:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240280AbhJPKwy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Oct 2021 06:52:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50B3C061765
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 03:50:46 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id o20so30992682wro.3
        for <linux-clk@vger.kernel.org>; Sat, 16 Oct 2021 03:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nsJVxt8L+XZV9YE+JVUgOE99LWlH5mcvJoxYldOfzTc=;
        b=DETKPaoU4uf8+2aEz5dAo0MShBv5MIUtC4NMOqVbN1F/0mvDLKRg+uO7ClahDHFSBh
         dJsOlIlBfR9zpq8PgHG7w/Yd8aCFx7YpBT8tQ1jORcQcpKtpK0oB6PBaLOzSD3J763kw
         ZzoTZBGpoYyA3GlpehN7gb7Es9VzwOCuDth175xVFOjG9MeoEvt6NzbKjnKK3TsCVtx6
         rXWWhT/QUYLPD4oZxYkzXxfEF9kGOfXALOp9/drHsEXP8Vp8gxsqT+ANsg8YiGZMVFJN
         E67MR2iFzMj/Ww+GzJwgddZzbwqhWcLIK6b28BU/qHyYBDc816vbiDEhfsu1cnp2v2Ds
         fghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nsJVxt8L+XZV9YE+JVUgOE99LWlH5mcvJoxYldOfzTc=;
        b=tMlj7hLU2H2yKJQAbiaHL6nkttwg1OZc7SXKxcSModcCKVxBj6+x0EOMxNv7hOSgbH
         7N23IUeyqPyw4c0zLnw71nVLXkSPY+KCRTI27vTdz9/NzKmNRv6AWWZS4DU32/gcVgO1
         fB5tdzsQu9bVf65oBvgFBuQJy6ApUKNOe6ig2qX23m7ojRL6SubWRCfBMngYq0SGSYeB
         22C+QGqVs3cvhqyuevRCjKRrRMPOEpEP2MIMz5/PhrO9mV3mjyWhzc/xba+5qoMs+xt4
         2Mheq+IpFT2Q6GZfKR5VZImHdGxsAUcCCn7HdfO9lMCx0Dz4dYjQ7Gk4dPQV462YgcvR
         hlhQ==
X-Gm-Message-State: AOAM5307DI8pqG513a66QPX7rvv1S2AvsePFSZoyre/kblF4XG8c721a
        iMBMrD9dPqJuO9KGjWBz/6+VW2j75jQ=
X-Google-Smtp-Source: ABdhPJzcKsZd4XMEP+DPgJDTQ91kEtQh09xeWNI+Boff2jfUZVEUYC8Qe+djRzkjgWHaHY2Nr5vKdQ==
X-Received: by 2002:a05:6000:1884:: with SMTP id a4mr21325970wri.356.1634381445303;
        Sat, 16 Oct 2021 03:50:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b82-9800-f22f-74ff-fe21-0725.c22.pool.telefonica.de. [2a01:c22:7b82:9800:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id d8sm7415796wrv.80.2021.10.16.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 03:50:44 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-clk@vger.kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, knaerzche@gmail.com,
        mturquette@baylibre.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH clk-fixes v1 2/2] clk: composite: Use rate_ops.determine_rate when also a mux is available
Date:   Sat, 16 Oct 2021 12:50:22 +0200
Message-Id: <20211016105022.303413-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
References: <20211016105022.303413-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update clk_composite_determine_rate() to use rate_ops.determine_rate
when available in combination with a mux. So far clk_divider_ops provide
both, .round_rate and .determine_rate. Removing the former would make
clk-composite fail silently for example on Rockchip platforms (which
heavily use composite clocks).
Add support for using rate_ops.determine_rate when either
rate_ops.round_rate is not available or both (.round_rate and
.determine_rate) are provided.

Suggested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk-composite.c | 68 ++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index ba8d4d8cf8dd..c04ae0e7e4b4 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -42,6 +42,29 @@ static unsigned long clk_composite_recalc_rate(struct clk_hw *hw,
 	return rate_ops->recalc_rate(rate_hw, parent_rate);
 }
 
+static int clk_composite_determine_rate_for_parent(struct clk_hw *rate_hw,
+						   struct clk_rate_request *req,
+						   struct clk_hw *parent_hw,
+						   const struct clk_ops *rate_ops)
+{
+	long rate;
+
+	req->best_parent_hw = parent_hw;
+	req->best_parent_rate = clk_hw_get_rate(parent_hw);
+
+	if (rate_ops->determine_rate)
+		return rate_ops->determine_rate(rate_hw, req);
+
+	rate = rate_ops->round_rate(rate_hw, req->rate,
+				    &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+
+	return 0;
+}
+
 static int clk_composite_determine_rate(struct clk_hw *hw,
 					struct clk_rate_request *req)
 {
@@ -51,51 +74,56 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 	struct clk_hw *rate_hw = composite->rate_hw;
 	struct clk_hw *mux_hw = composite->mux_hw;
 	struct clk_hw *parent;
-	unsigned long parent_rate;
-	long tmp_rate, best_rate = 0;
 	unsigned long rate_diff;
 	unsigned long best_rate_diff = ULONG_MAX;
-	long rate;
-	int i;
+	unsigned long best_rate = 0;
+	int i, ret;
 
-	if (rate_hw && rate_ops && rate_ops->round_rate &&
+	if (rate_hw && rate_ops &&
+	    (rate_ops->determine_rate || rate_ops->round_rate) &&
 	    mux_hw && mux_ops && mux_ops->set_parent) {
 		req->best_parent_hw = NULL;
 
 		if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
+			struct clk_rate_request tmp_req = *req;
+
 			parent = clk_hw_get_parent(mux_hw);
-			req->best_parent_hw = parent;
-			req->best_parent_rate = clk_hw_get_rate(parent);
 
-			rate = rate_ops->round_rate(rate_hw, req->rate,
-						    &req->best_parent_rate);
-			if (rate < 0)
-				return rate;
+			ret = clk_composite_determine_rate_for_parent(rate_hw,
+								      &tmp_req,
+								      parent,
+								      rate_ops);
+			if (ret)
+				return ret;
+
+			req->rate = tmp_req.rate;
+			req->best_parent_rate = tmp_req.best_parent_rate;
 
-			req->rate = rate;
 			return 0;
 		}
 
 		for (i = 0; i < clk_hw_get_num_parents(mux_hw); i++) {
+			struct clk_rate_request tmp_req = *req;
+
 			parent = clk_hw_get_parent_by_index(mux_hw, i);
 			if (!parent)
 				continue;
 
-			parent_rate = clk_hw_get_rate(parent);
-
-			tmp_rate = rate_ops->round_rate(rate_hw, req->rate,
-							&parent_rate);
-			if (tmp_rate < 0)
+			ret = clk_composite_determine_rate_for_parent(rate_hw,
+								      &tmp_req,
+								      parent,
+								      rate_ops);
+			if (ret)
 				continue;
 
-			rate_diff = abs(req->rate - tmp_rate);
+			rate_diff = abs(req->rate - tmp_req.rate);
 
 			if (!rate_diff || !req->best_parent_hw
 				       || best_rate_diff > rate_diff) {
 				req->best_parent_hw = parent;
-				req->best_parent_rate = parent_rate;
+				req->best_parent_rate = tmp_req.best_parent_rate;
 				best_rate_diff = rate_diff;
-				best_rate = tmp_rate;
+				best_rate = tmp_req.rate;
 			}
 
 			if (!rate_diff)
-- 
2.33.1

