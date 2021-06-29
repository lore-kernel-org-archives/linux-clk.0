Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA56C11F66
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 10:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 523AB61DB3
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jun 2021 10:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbhF2KcZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jun 2021 06:32:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34477 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbhF2KcY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jun 2021 06:32:24 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lyB08-0000Lx-BV; Tue, 29 Jun 2021 10:29:56 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] clk: lmk04832: Fix spelling mistakes in dev_err messages and comments
Date:   Tue, 29 Jun 2021 11:29:56 +0100
Message-Id: <20210629102956.17901-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are handful of spelling mistakes in two dev_err error messages
and comments. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/clk-lmk04832.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index 0cd76e626c3d..274c1004e938 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -519,7 +519,7 @@ static long lmk04832_vco_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	vco_rate = lmk04832_calc_pll2_params(*prate, rate, &n, &p, &r);
 	if (vco_rate < 0) {
-		dev_err(lmk->dev, "PLL2 parmeters out of range\n");
+		dev_err(lmk->dev, "PLL2 parameters out of range\n");
 		return vco_rate;
 	}
 
@@ -550,7 +550,7 @@ static int lmk04832_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	vco_rate = lmk04832_calc_pll2_params(prate, rate, &n, &p, &r);
 	if (vco_rate < 0) {
-		dev_err(lmk->dev, "failed to determine PLL2 parmeters\n");
+		dev_err(lmk->dev, "failed to determine PLL2 parameters\n");
 		return vco_rate;
 	}
 
@@ -573,7 +573,7 @@ static int lmk04832_vco_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	/*
 	 * PLL2_N registers must be programmed after other PLL2 dividers are
-	 * programed to ensure proper VCO frequency calibration
+	 * programmed to ensure proper VCO frequency calibration
 	 */
 	ret = regmap_write(lmk->regmap, LMK04832_REG_PLL2_N_0,
 			   FIELD_GET(0x030000, n));
@@ -1120,7 +1120,7 @@ static int lmk04832_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	/* Enable Duty Cycle Corretion */
+	/* Enable Duty Cycle Correction */
 	if (dclk_div == 1) {
 		ret = regmap_update_bits(lmk->regmap,
 					 LMK04832_REG_CLKOUT_CTRL3(dclk->id),
-- 
2.31.1

