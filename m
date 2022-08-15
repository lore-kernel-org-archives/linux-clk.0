Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DC9C00140
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbiHOPmL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbiHOPl7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:41:59 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371D66468
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:41:58 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id AD0933200902;
        Mon, 15 Aug 2022 11:41:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 11:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578116; x=1660664516; bh=zT
        KOvMlWhmDMPDVX2j5zwmCEJLFnRU2TChEvF1cvZwU=; b=otlLzeqyfgSesdW3S3
        jPg94JR+DolFlGD0dABLJENtJuZH+kLqq/IH44+mI6YNTRtmzEfsn0NbNUu5Pcpk
        ZbT+erVDq154KTbaPD/1lX8/fIoot2nWOb4d87+kRfINxUiBczQFDNumT2DLgC88
        RitfCwpGflXNHunv+dliFbSH49WAr2heVsTrfV9kkuKB2k7l3mpQXNBzNGvhu5nu
        Qr4ngN0C4EnIudpT1OUGwfZQIg2RaSE2YiWzbmXQqqAZqVqJWDnAIUD6zWXv3pCX
        /mUi+3kKeS3JEekxpGWhS5pJFuDEbX7x09AYz8be/M8+ru2XkOK24+46a7VwqNDo
        OyZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578116; x=1660664516; bh=zTKOvMlWhmDMP
        DVX2j5zwmCEJLFnRU2TChEvF1cvZwU=; b=GqUCjO7RfghViTLuUoT6+JsYOxcFO
        SFiaGcCX4diCA9Du5046gVwsTz7vusEMYBankSzVE0n5S5vpXfha1FxcM0kENqhu
        OLNUmxlrigAjFbSR2VW19Dh1ve+sYzmwfjyb6B6S+PuHhSwhOnY3EtbZapC3drcl
        f7pMilaYR92+6PTdQZ8Dwnot8yPV5cAWl854N9tMifU+oRn9P0iYO/44+CT6EqmJ
        Ygwzw1oKvdBYPZV2CdpixkPbXoYnynNLnojhQuF6vSicceLs/DQoop/9/OM79LP2
        zIBAaFcWPnrg2TjkUDVaJnY3a0dz2YFnuO2Zo+Hfd1K6YE62ZvexCsrtg==
X-ME-Sender: <xms:RGn6YgrgiXZKKKQ_ZDN5ljYEqHtC6FVytR8Zp9xod04j9hXHMn_zgQ>
    <xme:RGn6Ymp8K9XRzGmMcUTkuaK-bE_pFal4yHkvLmk8EDIR2LxUty3vFOxieTQrGuF-K
    jRt9rQCLklvwhJSVpw>
X-ME-Received: <xmr:RGn6YlONY2oYvI-gasKQd6QYB888Gl0z6n1jaRfNN1-2RmZVGJYy2gMKKOrN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RGn6Yn4qw0SdY-nEXDaytCGoN-z6gIMlztutgrBIxf1WYru6zHLAZA>
    <xmx:RGn6Yv4Psks0O6_P_7-E2UNo9GDbxpInwEwXyOXfoaQuktnqVayNfQ>
    <xmx:RGn6YnifPbhsh20V0remr6_CxIiGD_iI6s6Dz9WxGasnJlHYH39qRg>
    <xmx:RGn6Ysyd1KtjdSbWIG5FZSoFpLbZDXlNl6-6tBhPVrA-WM61TIvfPQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:41:55 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 01/25] clk: test: Switch to clk_hw_get_clk
Date:   Mon, 15 Aug 2022 17:41:23 +0200
Message-Id: <20220815154147.1631441-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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

