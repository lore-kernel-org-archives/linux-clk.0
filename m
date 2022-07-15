Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4931C43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbiGOQAl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiGOQAk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:40 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64026C120
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:38 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 2FFFD3200928;
        Fri, 15 Jul 2022 12:00:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900836; x=1657987236; bh=I7
        ozYDzbO/QPTjsT2ocFF227MHR1sI6jJVmujxV89Y8=; b=FkeSFzR3m8k/1vLoJ9
        l0U3fwjtQx6L756/HdDWnrpAbHj36Pv5WnaAWgQPmf4jLnGl5mfd2Bt4MpWq+MFP
        hWB6NjrlB/CNHRk8UJds1pvUhFf+ZDWNemFmzbMEIjb9Cdck9jlWAAptJjW75VKd
        Y4NPiy6AxV3lcKHYI7MP7Lzic2LBuaCvBv6Va2Z3f+tQZWs2hdi5dW6EgYT+HmXZ
        9iCh+Jb9VuBcxqeocaEYmdL3djvJ6maLTr6M63BsYM1WKT5zA5BMncsi44kIdkhP
        vI7fb/qnL4MWa9ZGfz3OUOu/UJUdmocbQ84rSBmv7HUZIoS+0DQcYygRsMZUwfck
        6nuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900836; x=1657987236; bh=I7ozYDzbO/QPT
        jsT2ocFF227MHR1sI6jJVmujxV89Y8=; b=K1S4AD1sEd2AB0kCsPDC2y3qFeXug
        Z6wIJHCYw7hwD2D3df02/XBQF6tMaaGrmThhRvHjv0H4XN1PXcwe+v+bmNG5KgV3
        r0xvSacZKmy2pnroGHhNUZzn04gP8sGEL1mBGMS5zp+MHZH2YixevNbHdHaclype
        gGF+j03dWnYKRrJAucJgAjBdol8bE4+TWLAEztZbKOuowbq3nI8i8WBNef3JFJGy
        hYHBnI7WCZ/Jw9b018ZaeLjYirNcu0xwZSCmUFVkwpvGBhhIoILxMSHcHP+9m0rL
        h/iA5mU3LVS+rbNCr9v5O5lqJ1mnJwO99/Iz7fbMdYp8pOkhMbTMunLvQ==
X-ME-Sender: <xms:JI_RYkUSm2Omhtz28KScxcIrVWyY_hqP0VU4roA1QCEV2gEpHvtpEA>
    <xme:JI_RYonhArFyUjpex8_eEZEDSSHwRH0x-u0_YtrOBDvZt8xmAfTSF-rSzTkqHAiPw
    RPMgbUuuac1oJOOZks>
X-ME-Received: <xmr:JI_RYoZ1h6S3K2Gzq3TSKSEgyQNozwlOOFN2f0eOQ5akTVaB8aBKxVOXMO10di6CPk23YLSNrcqmmVnuidM1mBRCuxrGSSUvydXk2pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JI_RYjXarpGQ-dbRq3gJigyrGhWGgCVQ0sYvPBMPk6HrGa2-68s75g>
    <xmx:JI_RYulKnnrlsLojDT7BDEQ4SWF_t8l-W8tXoSMTmKxo8ocTQFhZGw>
    <xmx:JI_RYofXZQqx_OsKeJ7ncdiYA8Ix61rGIyW3T_UeyfVI2ve9jI8wVg>
    <xmx:JI_RYndpwUCoOEH4BC9v__w5Sim2f9qpWOxyoa_ARVTJEUSIm_h0Wg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:35 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 04/28] clk: test: Switch to clk_hw_get_clk
Date:   Fri, 15 Jul 2022 17:59:50 +0200
Message-Id: <20220715160014.2623107-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Following the clk_hw->clk pointer is equivalent to calling
clk_hw_get_clk(), but will make the job harder if we need to rework that
part in the future.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 74 +++++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 6731a822f4e3..7646356f30cb 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -160,12 +160,14 @@ static void clk_test_get_rate(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, ctx->rate);
+
+	clk_put(clk);
 }
 
 /*
@@ -179,7 +181,7 @@ static void clk_test_set_get_rate(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -189,6 +191,8 @@ static void clk_test_set_get_rate(struct kunit *test)
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(clk);
 }
 
 /*
@@ -202,7 +206,7 @@ static void clk_test_set_set_get_rate(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -216,6 +220,8 @@ static void clk_test_set_set_get_rate(struct kunit *test)
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 /*
@@ -226,7 +232,7 @@ static void clk_test_round_set_get_rate(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rounded_rate, set_rate;
 
 	rounded_rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1);
@@ -240,6 +246,8 @@ static void clk_test_round_set_get_rate(struct kunit *test)
 	set_rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, set_rate, 0);
 	KUNIT_EXPECT_EQ(test, rounded_rate, set_rate);
+
+	clk_put(clk);
 }
 
 static struct kunit_case clk_test_cases[] = {
@@ -314,7 +322,7 @@ static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
 {
 	struct clk_single_parent_ctx *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate, new_rate;
 
 	rate = clk_get_rate(clk);
@@ -329,6 +337,8 @@ static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
 	new_rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, new_rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, new_rate);
+
+	clk_put(clk);
 }
 
 static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] = {
@@ -352,7 +362,7 @@ static void clk_range_test_set_range(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -365,6 +375,8 @@ static void clk_range_test_set_range(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 /*
@@ -375,13 +387,15 @@ static void clk_range_test_set_range_invalid(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 
 	KUNIT_EXPECT_LT(test,
 			clk_set_rate_range(clk,
 					   DUMMY_CLOCK_RATE_1 + 1000,
 					   DUMMY_CLOCK_RATE_1),
 			0);
+
+	clk_put(clk);
 }
 
 /*
@@ -420,7 +434,7 @@ static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -433,6 +447,8 @@ static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 /*
@@ -443,7 +459,7 @@ static void clk_range_test_set_range_set_rate_lower(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -460,6 +476,8 @@ static void clk_range_test_set_range_set_rate_lower(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 /*
@@ -472,7 +490,7 @@ static void clk_range_test_set_range_set_round_rate_consistent_lower(struct kuni
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	long rounded;
 
 	KUNIT_ASSERT_EQ(test,
@@ -489,6 +507,8 @@ static void clk_range_test_set_range_set_round_rate_consistent_lower(struct kuni
 			0);
 
 	KUNIT_EXPECT_EQ(test, rounded, clk_get_rate(clk));
+
+	clk_put(clk);
 }
 
 /*
@@ -499,7 +519,7 @@ static void clk_range_test_set_range_round_rate_higher(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -512,6 +532,8 @@ static void clk_range_test_set_range_round_rate_higher(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 /*
@@ -522,7 +544,7 @@ static void clk_range_test_set_range_set_rate_higher(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -539,6 +561,8 @@ static void clk_range_test_set_range_set_rate_higher(struct kunit *test)
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 /*
@@ -551,7 +575,7 @@ static void clk_range_test_set_range_set_round_rate_consistent_higher(struct kun
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	long rounded;
 
 	KUNIT_ASSERT_EQ(test,
@@ -568,6 +592,8 @@ static void clk_range_test_set_range_set_round_rate_consistent_higher(struct kun
 			0);
 
 	KUNIT_EXPECT_EQ(test, rounded, clk_get_rate(clk));
+
+	clk_put(clk);
 }
 
 /*
@@ -582,7 +608,7 @@ static void clk_range_test_set_range_get_rate_raised(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -598,6 +624,8 @@ static void clk_range_test_set_range_get_rate_raised(struct kunit *test)
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(clk);
 }
 
 /*
@@ -612,7 +640,7 @@ static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -628,6 +656,8 @@ static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 static struct kunit_case clk_range_test_cases[] = {
@@ -664,7 +694,7 @@ static void clk_range_test_set_range_rate_maximized(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -700,6 +730,8 @@ static void clk_range_test_set_range_rate_maximized(struct kunit *test)
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
 }
 
 /*
@@ -714,7 +746,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	struct clk *user1, *user2;
 	unsigned long rate;
 
@@ -758,6 +790,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 
 	clk_put(user2);
 	clk_put(user1);
+	clk_put(clk);
 }
 
 static struct kunit_case clk_range_maximize_test_cases[] = {
@@ -785,7 +818,7 @@ static void clk_range_test_set_range_rate_minimized(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	unsigned long rate;
 
 	KUNIT_ASSERT_EQ(test,
@@ -821,6 +854,8 @@ static void clk_range_test_set_range_rate_minimized(struct kunit *test)
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(clk);
 }
 
 /*
@@ -835,7 +870,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
 	struct clk_hw *hw = &ctx->hw;
-	struct clk *clk = hw->clk;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
 	struct clk *user1, *user2;
 	unsigned long rate;
 
@@ -875,6 +910,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 
 	clk_put(user2);
 	clk_put(user1);
+	clk_put(clk);
 }
 
 static struct kunit_case clk_range_minimize_test_cases[] = {
-- 
2.36.1

