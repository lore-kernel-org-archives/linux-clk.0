Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9496C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 19 Mar 2022 23:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244328AbiCSXCP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Mar 2022 19:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbiCSXCP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Mar 2022 19:02:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFF11A9C87
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id h7so1907867lfl.2
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nFxyPSWQgNnYSdToqMqIOtKZOax2ae/NIGEv7b9utcI=;
        b=IqY2IupDSFmwlDjcEltOSl2rKTrmjAiq56Iss1XDpmtSml04NoxkEb+boPS2ZFiBGp
         UbhlNwKWUndOXt/aOXf+5pvstPov7hHHJmg6UZyg1Qf+atG+DzsBasC4aEr/wX1NuV35
         y8xKyhPjBWvwlUJIldUK97fEDLxMhTLf4ZKHMXgpyBPkiZ2NQ7QoV63J8rQw4YmbiZZ1
         Edpnk62kJj03Mv9w07pybSCDKoU8y9JVAkgOFlg72Rw1dI+3GZGdM5UL2MjGhYxCQa18
         qX01L+cWaTPTvX1QI1A0LTX3Rlbgqrlyfo4KrXcVOARgXBl6fM6nYECGkn+6HMzwWsD5
         5AZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nFxyPSWQgNnYSdToqMqIOtKZOax2ae/NIGEv7b9utcI=;
        b=YILEe23NBciQhV4f0QFS4wKbrMXppGPcyEBSReNNf97GNUTGcLjDK3LBdKZ0MrzQ59
         aHPlEq7ozUBwqRFyEzpl5BZd9KaMOgUIm8dPGI6P+NVtGIzClCtmOqSZag4XQT5bJdzQ
         Au5Pvjs50wf2USn9SpXJmBXxbkowOQOk2kUH0o7GuI/+4nNmcentaVXbSIZw3jmDe0ZV
         qgO8PitEhvPYhy916e49xJQk92AfRAHNS4oYKp0BSr2E6UbjDN+xFczms1rGI50elLpp
         U9a7PA6bCs817/LA91Jb+pKhr+YcsQlPAqgfGqsdw1MHU5hHOzDJ90F2GptYa3zC4yiS
         ZAJg==
X-Gm-Message-State: AOAM530NBOOJopBpUn7kmAkedrxvdAeslDOfs+9kjhcHM57Y/yS8MCoU
        qUhv2LBRptPSt0CtxyPUONSL1OAadGiFlw==
X-Google-Smtp-Source: ABdhPJxTUmh+dpVdzTg+Dr3c5B/NPySSj9nlgmtp0sx2/syuuYo9gucrrZnMwW1ZORok7j2naKOjRA==
X-Received: by 2002:ac2:4202:0:b0:444:14bf:86dc with SMTP id y2-20020ac24202000000b0044414bf86dcmr10280684lfh.126.1647730851181;
        Sat, 19 Mar 2022 16:00:51 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z5-20020a196505000000b0044a12b953f9sm581520lfb.45.2022.03.19.16.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 16:00:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/5 v2] clk: ux500: Drop .is_enabled state from PRCMU clocks
Date:   Sat, 19 Mar 2022 23:51:53 +0100
Message-Id: <20220319225156.1451636-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319225156.1451636-1-linus.walleij@linaro.org>
References: <20220319225156.1451636-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The core already keeps a software enable count. Drop this
custom software enable count.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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

