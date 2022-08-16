Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264D6C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbiHPLvd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235039AbiHPLuZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:25 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F258275B
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:25:42 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 147B23200914;
        Tue, 16 Aug 2022 07:25:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 16 Aug 2022 07:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649140; x=1660735540; bh=zT
        KOvMlWhmDMPDVX2j5zwmCEJLFnRU2TChEvF1cvZwU=; b=pBjPhj4Q61dl2JKmKL
        M9M14IvAySWiVYs/A+TORiLfLEZ2qZWpNc4hhP6DOGrgwg3Vdap1w6jk8DogE5al
        QX+N446nBL8CEsueK04918zuQoIpVWqb918qxTEdT/ndO8kM0koI1CXZHSQIlQ8i
        lJhdy/6pYQPR2oNqioiP35B6U2JX0pkleCRLlCbFu0y6ypiKD+107Z+ppjuJmAoL
        qegLsXanvRv/UndRNPb6aSiexHhV6HIGOauieK1/BJpQ1aCw0jZ64v+NsJtqHr7s
        IhNR7Jxg7xkJxIJXdf4twVKOSdpRzBwnWDb9gTh2tPxgaAZI9b7ixHEtjjW+RGKR
        UtGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649140; x=1660735540; bh=zTKOvMlWhmDMP
        DVX2j5zwmCEJLFnRU2TChEvF1cvZwU=; b=MmL2pEf2IH35bb3Sm41bT4QkP/s9Q
        LWEUFZxOttqIcuX4HmMg8x3RIkWdppjIULluE09bjNvlsMPcLTbtwdT3MejBtMh8
        A54T+U9XiitwdlBDW4cCZL48tj6x0WaCCWdJa1JTk0g0kEBJ1losM/ExAOnrpBAZ
        J5coCX+zUIyUXGscFrSn0carzwoqmvZRkyeohJlbXWE/++tEGeokJyz8hMzu6Xle
        agd1qxNgFWyw41Iyg4lPiyR+sPOtpw8I6mRGIiwpFYhkC4+owc9ThK2qaqzqUIlN
        ZzZC7q00kmeOTC4TRAqGwFSDKBZFf5O9FsKm4zZ7KnJ9Iinm20Lp+Kcmg==
X-ME-Sender: <xms:tH77Yo7Ou_iTeWJDDCTCu1dfyKbvc_WWYfLRyjpuerPaYOW6WVkWVQ>
    <xme:tH77Yp6iaHrRDS5l1eM7CEj5yeTV8SRATp0MfRimRx8AfhHU6dRpOWOfHSH5xluJs
    8USapfj4VN_G7u5Y9s>
X-ME-Received: <xmr:tH77YneJrwV_BsYxjet6HcInlQBwxoKlOKOCxvm8oKs1HtE0Sk-4mINejwE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tH77YtLd1VEsFQ5hDOes8ao_P36a2maO5VRdEu50migA13Hmjc2dxw>
    <xmx:tH77YsLiNdPrr1Eru8L2Qbco4rCwqs4vczUsWx0xFcc2mgPYewN83Q>
    <xmx:tH77Yux0ah_jJB4mT8NoEhBC9IOckw8d1AxnCALGteBkwt8CMcMpWw>
    <xmx:tH77YpCpwhzZ90Kv8aOtpXn_qQywc9FeupmzEjvL4tceZ-NdChmDpw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:25:39 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 01/25] clk: test: Switch to clk_hw_get_clk
Date:   Tue, 16 Aug 2022 13:25:06 +0200
Message-Id: <20220816112530.1837489-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
2.37.1

