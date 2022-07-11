Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B837CCA47B
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbiGKPYj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbiGKPYi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:38 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AB51C104
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:36 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 234DC5C0190;
        Mon, 11 Jul 2022 11:24:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 11:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553076; x=1657639476; bh=I7
        ozYDzbO/QPTjsT2ocFF227MHR1sI6jJVmujxV89Y8=; b=uI3jpaBQIRzd12I0u9
        rWt5kGjMIrKOTdMJ2QfPijIOf2eS6Yq1mWFNzL+FodVppoItj2xUr2JX5PqjzHRf
        74v3sK89b2+Ls24/7SgivWZOvINm9JPXYJCNoi82EpXH1LEgoqtULoxZG8O8C4Hq
        Z2tS1ofStWctajU57zlsQdQ1C+DVXwnbpdYMGvgOsFspzHqAxJ0vZ8F17gGishg9
        OQ7mCKxZOciEcku+d7PUAfbRQjQMnhvniNInuz1RMP0MNDSPT8Zv1TaajDzKW1hC
        BsriwIqkEA87C480PrWCgBV8SSztqnRG1/Cya614VyGHNjcFD6krfatMams5zFpI
        qYsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553076; x=1657639476; bh=I7ozYDzbO/QPT
        jsT2ocFF227MHR1sI6jJVmujxV89Y8=; b=cQBEvfR05Wjo7cjYSMfcIVM1NrweO
        k5df3M6ULnOr7hutd/6yigoSs3mOoHXTD7EJGy5qM9kHV1LrrkFHtOpFunQ3DYg3
        txeli0ROAkKZBOXZorAHVTTliDXkEvnpQR3U5tr6DCBCK+RyuDXyx6upHcQDcbnC
        JK4tzsigs/O5LJTxnMpWlNgfF5D/2VqP8qXV10VBGJI5ZYEKewtFe/pOYc6CyXK7
        ujdB6H6oJm3T/z9odtEhOp4j3CIxFiXyfGUqyWPUtY2yBK4GYOS7xqIXww3vCd/f
        wCHft0osRCaeCiB7qae3RNhyidrt9SWl4CHToKURm66N7oijZlnZnt0bA==
X-ME-Sender: <xms:tEDMYuN8OMhyFXs_ZAO1voNjgzAlSV-YkJha9H6IKTes6EvbmlUs7A>
    <xme:tEDMYs86e0P23fUWmlzaoqDhKCtv9lK03yFmjixhu1483UICMKxtVWKhuPP6cqcRY
    IJ5T58Jb9JXgYp7bT4>
X-ME-Received: <xmr:tEDMYlRcgiLHItGOtDK8tfOvwD9LIKrSxKR4RqwEZzvMKbza8ajY4xWg4nG-C9MH66GwUpiwj3pSYqTXuqMZTo3H28chM7rgi-VCyOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tEDMYuszyArhF3n2muOklQ6zj0-BQOheybsO9-jCINaEk6Gu1VxUMQ>
    <xmx:tEDMYmcBy1h2FOXZw8oPSrbUDoPReUedA2ohT7XeFOsjdPtRNKqk3Q>
    <xmx:tEDMYi2_jE9lfHtApMZJ83ZdhN-8elAdZgniSXf-QF5BVMHxyNx_DQ>
    <xmx:tEDMYnW7oPQvSVAIoyk6bnpsi5PIifgOfPHyqJYo4hjiIo_4NgTGBA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:35 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 04/28] clk: test: Switch to clk_hw_get_clk
Date:   Mon, 11 Jul 2022 17:24:00 +0200
Message-Id: <20220711152424.701311-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

