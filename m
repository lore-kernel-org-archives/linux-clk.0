Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E2EC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Mar 2022 23:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244331AbiCSXCQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Mar 2022 19:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbiCSXCQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Mar 2022 19:02:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5841A9C82
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w27so19369497lfa.5
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iF7f+YuPVTRi8/OtdYzPSS+79uOmDZgHpByS8AI+rlI=;
        b=y8DEAJvf8bHQOKd3g2r0L6qRb+URkmzJrvVb1jzec0vxJsFNBM5BHjj8fpmMuz3XEE
         RliLoAK6oYLMq1C//cwyV2Zp8Q5rgTzsVjhWA8UnbZVz1dL2gDHOZ9SoZKHUeb2AFHe8
         at/4NreY1lP6Dv68YEkbrL/GvQOPUD59msc4BhFSvFCR/TWd56Eg0j0IPOakxd8nOgLv
         OjPXKr/5uRzOKWoBWan2GvLX7LeB5IblE7yv2ama+oExnF7m4oOZ/iGkUbLXyQFlnAAD
         I9FaBsI9Qbmpc9oUKLHLfkPknokN8rkcpdp87p0+w0gqk1Emy3AONsnY3kKfe5XGRRNr
         Lqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iF7f+YuPVTRi8/OtdYzPSS+79uOmDZgHpByS8AI+rlI=;
        b=Np9n8IMnLy4auUC/KtV0l9CbTb//atyl1UsHfOIFb0pTjglp2EpyKXbM1sIFjF8j74
         9K6o5AC7BrgWYVQ0Vc+7v6OZZ9ZVSp//DpLvwQ3kLdqrLg4ALQHLpUEmXRp0MMgVK4ZC
         /zXWJIT94OJROKLMtm1ZBoaHDbP1UMX01d6JisZkiUrQtK71WIPq8nLnthUjDE0xjub5
         1yKgTUCDVoxZ4vQISfQBSSCfqI6yRDsZ9qggN4NcUV8+muiDVHFRoHWbDt77jCd/LO2B
         WeFLo50XwXGcM27meT8TGP6E0jhOZu00YoeIXUatiiRNcqXGRU57Mql2AHFOj31ITLwO
         RU3Q==
X-Gm-Message-State: AOAM533Vas8WQRUJnb00yhkpNVzMFJ5jUdXQ7yBMc+mpDswHlFtLJ3/U
        W7zALlVenNMEMzE1u0KgQzGiQQ==
X-Google-Smtp-Source: ABdhPJxnF59UUTAvTpNiFsSQZnUkLohfA5GVUvqvnsEubqW1Vk2EY9LGnRMyxLl/Cczpvo74hySAKQ==
X-Received: by 2002:a05:6512:2037:b0:448:92de:21de with SMTP id s23-20020a056512203700b0044892de21demr9830755lfs.52.1647730852597;
        Sat, 19 Mar 2022 16:00:52 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z5-20020a196505000000b0044a12b953f9sm581520lfb.45.2022.03.19.16.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 16:00:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/5 v2] clk: ux500: Drop .is_prepared state from PRCMU clocks
Date:   Sat, 19 Mar 2022 23:51:54 +0100
Message-Id: <20220319225156.1451636-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319225156.1451636-1-linus.walleij@linaro.org>
References: <20220319225156.1451636-1-linus.walleij@linaro.org>
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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

