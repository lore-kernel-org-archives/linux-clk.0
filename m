Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A452EC43334
	for <linux-clk@archiver.kernel.org>; Wed, 13 Jul 2022 08:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbiGMIXr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Jul 2022 04:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbiGMIXO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2022 04:23:14 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3B22ED61
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 01:21:21 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id j3so9616634pfb.6
        for <linux-clk@vger.kernel.org>; Wed, 13 Jul 2022 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mHyeUQJdYIKoGxaGh8GhuqJCqLId0c4uymSzWL5ah+k=;
        b=DOrORcUIpO3bIcq5mvbqgBwsoGpPNo8J5EQp4QRXgfAWhrd6BtDAXS/8u/JFee+tPn
         spKJNC7hu9wllOFfzrO6vyeRE6XQzZ6K6R0VoyPaa0Mi/Imd3X1QDgtvoidaPXLbCykb
         y4gAahfqffsMc54O+yutFBdUx6LgSi2ggp4e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mHyeUQJdYIKoGxaGh8GhuqJCqLId0c4uymSzWL5ah+k=;
        b=MSWtr4IKAOB22byv80ZpemBby8bvKiKdgUvOlTZ2xDsUw6+v7TwLLZ2cJI4a7+Ps/V
         BgA6/4FV9ZzXLQcDeMoNMd7HDG4rNJA0mWm69WP2WS5FgM8ByRWo+c7UOYK5rX/vR6a7
         qu/DNR+0CB7n6s206tOQpqSrlPNGcxP1xuydmztkZn0kc0mXJm6EW20/K89cjj7eMou5
         08/oFpqvl44gXicIa7WfVEd9n7aQqvK3J6KFIpqtiIeduiUaIgO3mUHj1SuBe9xt54wD
         bPpeHcP100je3nBDYSNkAQavNrCcRyzauXYh3e+sU+bbaMloqDCnCRswHJ/4we2EXf9N
         nhow==
X-Gm-Message-State: AJIora8lwrZ1na++ZTNyIaBmgwZxNjvSApLpbfvBtnv9BxbZ0W4bIoFH
        BDEBpzW+jNbULb/eI2gCQDSgaQ==
X-Google-Smtp-Source: AGRyM1tS7JahWvLt1w8JAVRW4I4+Aa0EiNeuGUU4qnjy10lqhxel9oniuebbxHptr3VTQIgz92RGHw==
X-Received: by 2002:a62:ea18:0:b0:52a:c12b:9313 with SMTP id t24-20020a62ea18000000b0052ac12b9313mr2173174pfh.49.1657700480832;
        Wed, 13 Jul 2022 01:21:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1a9:ca7d:e86f:cf6f])
        by smtp.gmail.com with ESMTPSA id k11-20020aa7972b000000b005281d926733sm8220461pfg.199.2022.07.13.01.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:21:20 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
Subject: [PATCH v2 2/2] clk: core: Fix runtime PM sequence in clk_core_unprepare()
Date:   Wed, 13 Jul 2022 16:21:11 +0800
Message-Id: <20220713082111.2233016-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220713082111.2233016-1-wenst@chromium.org>
References: <20220713082111.2233016-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In the original commit 9a34b45397e5 ("clk: Add support for runtime PM"),
the commit message mentioned that pm_runtime_put_sync() would be done
at the end of clk_core_unprepare(). This mirrors the operations in
clk_core_prepare() in the opposite order.

However, the actual code that was added wasn't in the order the commit
message described. Move clk_pm_runtime_put() to the end of
clk_core_unprepare() so that it is in the correct order.

Fixes: 9a34b45397e5 ("clk: Add support for runtime PM")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9b365cd6d14b..2e29a72c68e1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -859,13 +859,12 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (core->ops->unprepare)
 		core->ops->unprepare(core->hw);
 
-	clk_pm_runtime_put(core);
-
 	trace_clk_unprepare_complete(core);
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_disable_lock(core->parent);
 	clk_core_unprepare(core->parent);
+	clk_pm_runtime_put(core);
 }
 
 static void clk_core_unprepare_lock(struct clk_core *core)
-- 
2.37.0.170.g444d1eabd0-goog

