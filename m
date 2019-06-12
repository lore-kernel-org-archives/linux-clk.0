Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38223C31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 09:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00E7E20874
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560331244;
	bh=wOMJ9aM4tSyEIdMjxMkyFSSJTeyrR+hlsRS+FtmB2EE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=TxHFmAucCLZrOaE/rGTVUv3k54Vee5Od8aqdpsfrx2mqcmMKt4iEyJntGiXsOy8nF
	 jTbC1UWSmgr3H83ELRLt92rcCMF4kTGVWgMmHPvlFOfQZX51sef7Xxu+ZrehOMuS5x
	 BIhif0o0D1wQ0AGUq3wY7ziqhMRWIyBuK+j3KYvA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406714AbfFLJUn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 05:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:38622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408705AbfFLJUn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Jun 2019 05:20:43 -0400
Received: from localhost.localdomain (unknown [106.200.205.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 751B120874;
        Wed, 12 Jun 2019 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560331242;
        bh=wOMJ9aM4tSyEIdMjxMkyFSSJTeyrR+hlsRS+FtmB2EE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ucwNcsF9fFzm52dfqMbOLO2bEYmFH2ojYb2pLQaRNl8tZalYQ21g5hlWX+TRnGMK+
         8wwDQ03J27J5NUNO/H+QuF/AkyfY2CSjOkeOVYUbbUyomGgXPRZGCzMgMXchFW1nZ+
         o3LH3+8wGo3o5nt6JFZmMItEe9braSOyEQSY6X2A=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 2/5] clk: qcom: clk-alpha-pll: Remove post_div_table checks
Date:   Wed, 12 Jun 2019 14:47:19 +0530
Message-Id: <20190612091722.9377-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612091722.9377-1-vkoul@kernel.org>
References: <20190612091722.9377-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We want users to code properly and fix the post_div_table missing and
not reply on core to check. So remove the post_div_table check.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index b48707693ffd..2c6773188761 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1036,11 +1036,6 @@ static unsigned long clk_alpha_pll_postdiv_fabia_recalc_rate(struct clk_hw *hw,
 	u32 i, div = 1, val;
 	int ret;
 
-	if (!pll->post_div_table) {
-		pr_err("Missing the post_div_table for the PLL\n");
-		return -EINVAL;
-	}
-
 	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
 	if (ret)
 		return ret;
@@ -1063,11 +1058,6 @@ static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
 {
 	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
 
-	if (!pll->post_div_table) {
-		pr_err("Missing the post_div_table for the PLL\n");
-		return -EINVAL;
-	}
-
 	return divider_round_rate(hw, rate, prate, pll->post_div_table,
 				pll->width, CLK_DIVIDER_ROUND_CLOSEST);
 }
@@ -1089,11 +1079,6 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
 	if (val & PLL_VOTE_FSM_ENA)
 		return 0;
 
-	if (!pll->post_div_table) {
-		pr_err("Missing the post_div_table for the PLL\n");
-		return -EINVAL;
-	}
-
 	div = DIV_ROUND_UP_ULL(parent_rate, rate);
 	for (i = 0; i < pll->num_post_div; i++) {
 		if (pll->post_div_table[i].div == div) {
-- 
2.20.1

