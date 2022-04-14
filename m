Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139EBC43219
	for <linux-clk@archiver.kernel.org>; Thu, 14 Apr 2022 22:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346957AbiDNWXS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Apr 2022 18:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbiDNWXS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2022 18:23:18 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5115391ADB
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b21so11426607lfb.5
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lfz4zluqccgJsJoOrpEpc8bM5MU7KBuqDdn25u2UFH4=;
        b=MnG3NDU9kbPQw2U6sLFH7T8KcGVnwaFso21dVbhtInEvV+sJxkCOqCibqhBLczufvw
         9bOQmQlbsRpcS0whW/SA2wOKL/i6z4v9y/EUh+Xrc87p4pM7mlJIus/dwqJaTDsrysid
         UmM8JD8C5eFmjTBcYi39HlMvcLLVant0YgOgDI4REKOxz4KceoXyxqH6h9AN7ObtQAzl
         4q+p8pJ8zU/169eRW0WOS+6vcoWjvgbXNcw1HJIOQiqgb1yM775yIWxLqY43ZSOM9Ik6
         Z1TGQ4NUj6w9XGvC7hhBAu6KRXKV4yjUGWCLUBeS23ULvQ19o3UADPQR+elRcp/x6hA4
         w5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lfz4zluqccgJsJoOrpEpc8bM5MU7KBuqDdn25u2UFH4=;
        b=CtEiRpcDrFPPH9PcNhNH34cjUlnEqgCpngUM5wqbVpruPNZQ+AyzFU9bm8pcqro+/F
         dRHFmlNnuHVjrPDTgceixLUKBrkhjQM1CQ+bZfPErvv+bVEk+NdnA0F60JLihSW6Gaef
         a+b/6KfGBjtgfSgXk/s9Vxr7E8TwH58hedvJuBMdqMrRWm+MFYT1sQg6qMZbmCH99A02
         qLA0gyS5LWnLTeLY+cfarog1GYAeCLuKUCJcmjvk6GYfxh/Pz/9S5/zy6xCG25nbTUYY
         KBJt7ppCbzYhcKqrQ1qapXZxuILLsteHnU7N9HYWNMIVCM1XqVCc2awW0gc5fz6yNYOy
         MmEg==
X-Gm-Message-State: AOAM532wxRIh2q6MeFYMTB6rywtYJZjU8oq3h/XY7rTrI5Fi8s15kWei
        vPR8lYqdzh9ZuZLIUJb/ufPKxA==
X-Google-Smtp-Source: ABdhPJz8wGcvjtL/BbWBVoyXGkZyLlTq41fJfqls6hozLQ+noO95SqU1OlCFIAuJswc4clUfB59DXw==
X-Received: by 2002:a05:6512:10c3:b0:45c:d26a:d5e with SMTP id k3-20020a05651210c300b0045cd26a0d5emr3108791lfg.296.1649974850629;
        Thu, 14 Apr 2022 15:20:50 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512029200b0046b9ba1c0edsm125169lfp.224.2022.04.14.15.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 15:20:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 3/5 v3] clk: ux500: Drop .is_prepared state from PRCMU clocks
Date:   Fri, 15 Apr 2022 00:17:49 +0200
Message-Id: <20220414221751.323525-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414221751.323525-1-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The core already keeps a software prepare count. Drop this
custom software prepare count.

The only semantic difference is that if disabling the clock
fails, .is_prepared() will still return 1, but this will only
serve to confuse the framework, the error message is
sufficient.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Pick up Ulf's ACK.
- Rebase on v5.18-rc1
---
 drivers/clk/ux500/clk-prcmu.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index fffdb6326191..6627ed1ef37e 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -18,7 +18,6 @@
 struct clk_prcmu {
 	struct clk_hw hw;
 	u8 cg_sel;
-	int is_prepared;
 	int opp_requested;
 };
 
@@ -26,14 +25,9 @@ struct clk_prcmu {
 
 static int clk_prcmu_prepare(struct clk_hw *hw)
 {
-	int ret;
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
 
-	ret = prcmu_request_clock(clk->cg_sel, true);
-	if (!ret)
-		clk->is_prepared = 1;
-
-	return ret;
+	return prcmu_request_clock(clk->cg_sel, true);
 }
 
 static void clk_prcmu_unprepare(struct clk_hw *hw)
@@ -41,15 +35,7 @@ static void clk_prcmu_unprepare(struct clk_hw *hw)
 	struct clk_prcmu *clk = to_clk_prcmu(hw);
 	if (prcmu_request_clock(clk->cg_sel, false))
 		pr_err("clk_prcmu: %s failed to disable %s.\n", __func__,
-			clk_hw_get_name(hw));
-	else
-		clk->is_prepared = 0;
-}
-
-static int clk_prcmu_is_prepared(struct clk_hw *hw)
-{
-	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	return clk->is_prepared;
+		       clk_hw_get_name(hw));
 }
 
 static unsigned long clk_prcmu_recalc_rate(struct clk_hw *hw,
@@ -98,7 +84,6 @@ static int clk_prcmu_opp_prepare(struct clk_hw *hw)
 		return err;
 	}
 
-	clk->is_prepared = 1;
 	return 0;
 }
 
@@ -117,8 +102,6 @@ static void clk_prcmu_opp_unprepare(struct clk_hw *hw)
 					(char *)clk_hw_get_name(hw));
 		clk->opp_requested = 0;
 	}
-
-	clk->is_prepared = 0;
 }
 
 static int clk_prcmu_opp_volt_prepare(struct clk_hw *hw)
@@ -143,7 +126,6 @@ static int clk_prcmu_opp_volt_prepare(struct clk_hw *hw)
 		return err;
 	}
 
-	clk->is_prepared = 1;
 	return 0;
 }
 
@@ -161,14 +143,11 @@ static void clk_prcmu_opp_volt_unprepare(struct clk_hw *hw)
 		prcmu_request_ape_opp_100_voltage(false);
 		clk->opp_requested = 0;
 	}
-
-	clk->is_prepared = 0;
 }
 
 static const struct clk_ops clk_prcmu_scalable_ops = {
 	.prepare = clk_prcmu_prepare,
 	.unprepare = clk_prcmu_unprepare,
-	.is_prepared = clk_prcmu_is_prepared,
 	.recalc_rate = clk_prcmu_recalc_rate,
 	.round_rate = clk_prcmu_round_rate,
 	.set_rate = clk_prcmu_set_rate,
@@ -177,7 +156,6 @@ static const struct clk_ops clk_prcmu_scalable_ops = {
 static const struct clk_ops clk_prcmu_gate_ops = {
 	.prepare = clk_prcmu_prepare,
 	.unprepare = clk_prcmu_unprepare,
-	.is_prepared = clk_prcmu_is_prepared,
 	.recalc_rate = clk_prcmu_recalc_rate,
 };
 
@@ -194,14 +172,12 @@ static const struct clk_ops clk_prcmu_rate_ops = {
 static const struct clk_ops clk_prcmu_opp_gate_ops = {
 	.prepare = clk_prcmu_opp_prepare,
 	.unprepare = clk_prcmu_opp_unprepare,
-	.is_prepared = clk_prcmu_is_prepared,
 	.recalc_rate = clk_prcmu_recalc_rate,
 };
 
 static const struct clk_ops clk_prcmu_opp_volt_scalable_ops = {
 	.prepare = clk_prcmu_opp_volt_prepare,
 	.unprepare = clk_prcmu_opp_volt_unprepare,
-	.is_prepared = clk_prcmu_is_prepared,
 	.recalc_rate = clk_prcmu_recalc_rate,
 	.round_rate = clk_prcmu_round_rate,
 	.set_rate = clk_prcmu_set_rate,
@@ -228,7 +204,6 @@ static struct clk *clk_reg_prcmu(const char *name,
 		return ERR_PTR(-ENOMEM);
 
 	clk->cg_sel = cg_sel;
-	clk->is_prepared = 1;
 	clk->opp_requested = 0;
 	/* "rate" can be used for changing the initial frequency */
 	if (rate)
-- 
2.35.1

