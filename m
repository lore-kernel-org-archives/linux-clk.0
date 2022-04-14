Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E15C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 14 Apr 2022 22:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237524AbiDNWXS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Apr 2022 18:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbiDNWXR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2022 18:23:17 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F140F91ADB
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id bn33so7720366ljb.6
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7IYqsEP5VjPUjz5sDcZEaAL4J2iFz4Trc4940d1ft3o=;
        b=X9UnUqwQHG7a6j/KvaT4i7D0kCiJsBwUh9WW+JEzNUHE8VS9Aer3gWmO9ppnsaa0zt
         roW+pkGNTVAt//H/Dm3EMH2bsN+jgavxWDSGPzE3wuF4MpoA3CVWoxx+/uvJPmKVxb34
         IRGI65Z645/o6XoRZWQJCHVgEZhpeP7BuF1YN8BxArB0DkTnZ3dpbm0JIqKgkCMIL4Bf
         GmYvwK+moQBrPtRss3CtHZRv5FeyteM9V1zycwSVBCELAowXcmV2ZtzZsGIVya6NSb5h
         2Vs++6Lp4E9J9iDbQLUrbr1G+xfndyi3oNOn1rCDKAM262PxF9aShaWmpTCeADH/RhXP
         EKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7IYqsEP5VjPUjz5sDcZEaAL4J2iFz4Trc4940d1ft3o=;
        b=qoXgCL1vQJqVLiUNhbhKRb4npQuWJ3bQIbOlYPvuRilrrTNghRL+Ka2piaVOXxHJv7
         ZXG2IE42pjKaE4jqzhJX85VNfH7Kh2uyrGuOAcx5GmytNUkwF9gmJ/9CP4KBRjw7dTVN
         FGCtH+N5vUgQo5vvhwqk2MvMgC9WdaRsQsFqXEDdLmpWxETkheA4gZRcQ0fk8zjM7jqS
         vB44D4axWCLIhSizJdN5xRqV4FHupolOUKrrYf5mjSWaislhrmNef2GREiNSf06euDOy
         AIO9wQ/D79DpXKveI1/cpIzEKtgeurC0APOlRW0b6mBtsavSKa+unK/FK2dD1cK5Z5x4
         iAeA==
X-Gm-Message-State: AOAM530cDOJyeeAkoiosd1eFfCVvy4WnRXC4uhN4fZqzcj73+P/KNcwY
        V3SACCD4TxXXFvZn5z/fckkdfEHrl6psIw==
X-Google-Smtp-Source: ABdhPJxHnYXjj/hS+FpSOb9r9RqMqPrTTrqyLER3JEsezEzCtQ+L2xSPE+WPvmWhOq3+optKXwRl2Q==
X-Received: by 2002:a2e:86c4:0:b0:24b:54a2:cde with SMTP id n4-20020a2e86c4000000b0024b54a20cdemr2676127ljj.190.1649974849234;
        Thu, 14 Apr 2022 15:20:49 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512029200b0046b9ba1c0edsm125169lfp.224.2022.04.14.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 15:20:48 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 2/5 v3] clk: ux500: Drop .is_enabled state from PRCMU clocks
Date:   Fri, 15 Apr 2022 00:17:48 +0200
Message-Id: <20220414221751.323525-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414221751.323525-1-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The core already keeps a software enable count. Drop this
custom software enable count.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Pick up Ulf's ACK.
- Rebase on v5.18-rc1
---
 drivers/clk/ux500/clk-prcmu.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 937b6bb82b30..fffdb6326191 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -19,7 +19,6 @@ struct clk_prcmu {
 	struct clk_hw hw;
 	u8 cg_sel;
 	int is_prepared;
-	int is_enabled;
 	int opp_requested;
 };
 
@@ -53,25 +52,6 @@ static int clk_prcmu_is_prepared(struct clk_hw *hw)
 	return clk->is_prepared;
 }
 
-static int clk_prcmu_enable(struct clk_hw *hw)
-{
-	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	clk->is_enabled = 1;
-	return 0;
-}
-
-static void clk_prcmu_disable(struct clk_hw *hw)
-{
-	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	clk->is_enabled = 0;
-}
-
-static int clk_prcmu_is_enabled(struct clk_hw *hw)
-{
-	struct clk_prcmu *clk = to_clk_prcmu(hw);
-	return clk->is_enabled;
-}
-
 static unsigned long clk_prcmu_recalc_rate(struct clk_hw *hw,
 					   unsigned long parent_rate)
 {
@@ -189,9 +169,6 @@ static const struct clk_ops clk_prcmu_scalable_ops = {
 	.prepare = clk_prcmu_prepare,
 	.unprepare = clk_prcmu_unprepare,
 	.is_prepared = clk_prcmu_is_prepared,
-	.enable = clk_prcmu_enable,
-	.disable = clk_prcmu_disable,
-	.is_enabled = clk_prcmu_is_enabled,
 	.recalc_rate = clk_prcmu_recalc_rate,
 	.round_rate = clk_prcmu_round_rate,
 	.set_rate = clk_prcmu_set_rate,
@@ -201,21 +178,16 @@ static const struct clk_ops clk_prcmu_gate_ops = {
 	.prepare = clk_prcmu_prepare,
 	.unprepare = clk_prcmu_unprepare,
 	.is_prepared = clk_prcmu_is_prepared,
-	.enable = clk_prcmu_enable,
-	.disable = clk_prcmu_disable,
-	.is_enabled = clk_prcmu_is_enabled,
 	.recalc_rate = clk_prcmu_recalc_rate,
 };
 
 static const struct clk_ops clk_prcmu_scalable_rate_ops = {
-	.is_enabled = clk_prcmu_is_enabled,
 	.recalc_rate = clk_prcmu_recalc_rate,
 	.round_rate = clk_prcmu_round_rate,
 	.set_rate = clk_prcmu_set_rate,
 };
 
 static const struct clk_ops clk_prcmu_rate_ops = {
-	.is_enabled = clk_prcmu_is_enabled,
 	.recalc_rate = clk_prcmu_recalc_rate,
 };
 
@@ -223,9 +195,6 @@ static const struct clk_ops clk_prcmu_opp_gate_ops = {
 	.prepare = clk_prcmu_opp_prepare,
 	.unprepare = clk_prcmu_opp_unprepare,
 	.is_prepared = clk_prcmu_is_prepared,
-	.enable = clk_prcmu_enable,
-	.disable = clk_prcmu_disable,
-	.is_enabled = clk_prcmu_is_enabled,
 	.recalc_rate = clk_prcmu_recalc_rate,
 };
 
@@ -233,9 +202,6 @@ static const struct clk_ops clk_prcmu_opp_volt_scalable_ops = {
 	.prepare = clk_prcmu_opp_volt_prepare,
 	.unprepare = clk_prcmu_opp_volt_unprepare,
 	.is_prepared = clk_prcmu_is_prepared,
-	.enable = clk_prcmu_enable,
-	.disable = clk_prcmu_disable,
-	.is_enabled = clk_prcmu_is_enabled,
 	.recalc_rate = clk_prcmu_recalc_rate,
 	.round_rate = clk_prcmu_round_rate,
 	.set_rate = clk_prcmu_set_rate,
@@ -263,7 +229,6 @@ static struct clk *clk_reg_prcmu(const char *name,
 
 	clk->cg_sel = cg_sel;
 	clk->is_prepared = 1;
-	clk->is_enabled = 1;
 	clk->opp_requested = 0;
 	/* "rate" can be used for changing the initial frequency */
 	if (rate)
-- 
2.35.1

