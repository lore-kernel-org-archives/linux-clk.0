Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DE3C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbiDHJPt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE8D1E8689
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:53 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 234715C0066;
        Fri,  8 Apr 2022 05:10:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 08 Apr 2022 05:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=y9fxfpZL053af4cRM1FVqO2VttyG1h
        kOTdJDWtbpmXk=; b=Mn7Kw018aus3PaMHaoZnMxwEYghr4E/UeRTzQlENHTBME+
        xD3mJ0NfULcFT+78WgTm4nDXWjKNBh4Jjyo392buCSNCwUwvfAyfMzfQOzHE98Ev
        Dzyg7ymc4aQN4hUQS8kfz28Rxg01PDtXeNuPiI0U5Tn7TKO1M90DBIxf3pQfqN1n
        ZyPMYYWGIe/TUBySd1lksIlCS2uI4rlQj2Nd8VfX5nFp5MCChWfVGB9MO8EgOwHc
        4FtMjyAOntCadPq50P90OXpvsMzAWhpCQtZbqRE2EmALEDsaimbrhFBVc9ZxXq9h
        Ix2Pnd/82mBD/xjbVS/kszEIDlABfqUQa5eYhYdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y9fxfp
        ZL053af4cRM1FVqO2VttyG1hkOTdJDWtbpmXk=; b=W9yunDYbRwE4zhQQN+dWl+
        tU+zer6YeRNrvhAjDCDQA3OHbMoVAWu8Pazix3vXph9n3KvqVFhreWkbr4iGu5OV
        LoUc67TF3TaXqGPU5gTOJK/TErtsJwHq83+tGDb+5YY89gonTmrJJql5D+kKWC+t
        BhXcZpeq38KJd+2uRp+rscbHzm3Fcw9ZVd9KpyvtktFQMOG7ompkrCuay4vtMjnX
        +WYZXxmTNT0uJOQYxtZtMBIiPpUQCX8eM8CyIk9B3mzQlvCNVy0UYmEOlBaSIzG5
        3Cssch+zECoJqy6ytw+bUYkADAn44rZQeIgAu7Cx4HFJSadLbUcQNwlsLkfJMdJA
        ==
X-ME-Sender: <xms:HPxPYjc0ICf5hIbQAphQkOsMOS3N2Erqvvc0R01IjPRxc35A_Grueg>
    <xme:HPxPYpPBSbQjCGqBUJM2NdrM6uNxQEk5yaCOkEBxWjKvsMuMyRR7-oewF_ijWlrym
    rVmLK-7QGYRL8fz9TY>
X-ME-Received: <xmr:HPxPYsjVNewC8HLl1zCf4qiELEVYdJ-v1esNvJ_bLee0gknhWDRp6qm_HACjS69exJD4-1i_RZ0zgJpNKQYSRxPGRBCOsWrGWokIiBc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HfxPYk8iQbpKS86bKzPdh1ucJLrCejrIoJL7Q_ILKeaP3PbeodoomA>
    <xmx:HfxPYvtZpjGPjHpmWhwycXEkNFR1lBu4YekQaCYP1IeA2P1bOhFiSA>
    <xmx:HfxPYjFu9rYmofO6C0buVdXpfDhv6SJ65MWX_aKAej0UviX7KFET7w>
    <xmx:HfxPYtJ0rxXOrFXzljJ25ivSe78Oi3WvXRZpnXw_nMWuQk_meUUQ3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:52 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 05/22] clk: tests: Add tests for single parent mux
Date:   Fri,  8 Apr 2022 11:10:20 +0200
Message-Id: <20220408091037.2041955-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We have a few tests for a mux with a single parent, testing the case
where it used to be orphan.

Let's leverage most of the code but register the clock properly to test
a few trivial things.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 186 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 177 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 38a2d6abd28a..59661144d7a0 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -352,6 +352,181 @@ struct clk_single_parent_ctx {
 	struct clk_hw hw;
 };
 
+static int clk_single_parent_mux_test_init(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parent_ctx.rate = DUMMY_CLOCK_INIT_RATE;
+	ctx->parent_ctx.hw.init =
+		CLK_HW_INIT_NO_PARENT("parent-clk",
+				      &clk_dummy_rate_ops,
+				      0);
+
+	ret = clk_hw_register(NULL, &ctx->parent_ctx.hw);
+	if (ret)
+		return ret;
+
+	ctx->hw.init = CLK_HW_INIT("test-clk", "parent-clk",
+				   &clk_dummy_single_parent_ops,
+				   CLK_SET_RATE_PARENT);
+
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+clk_single_parent_mux_test_exit(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->parent_ctx.hw);
+}
+
+/*
+ * Test that for a clock with a single parent, clk_get_parent() actually
+ * returns the parent.
+ */
+static void
+clk_test_single_parent_mux_get_parent(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+
+	parent = clk_get_parent(clk);
+	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parent_ctx.hw.clk));
+}
+
+/*
+ * Test that for a clock that can't modify its rate and with a single
+ * parent, if we set disjoints range on the parent and then the child,
+ * the second will return an error.
+ *
+ * FIXME: clk_set_rate_range() only considers the current clock when
+ * evaluating whether ranges are disjoints and not the upstream clocks
+ * ranges.
+ */
+static void
+clk_test_single_parent_mux_set_range_disjoint_child_last(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, 1000, 2000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk, 3000, 4000);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that for a clock that can't modify its rate and with a single
+ * parent, if we set disjoints range on the child and then the parent,
+ * the second will return an error.
+ *
+ * FIXME: clk_set_rate_range() only considers the current clock when
+ * evaluating whether ranges are disjoints and not the downstream clocks
+ * ranges.
+ */
+static void
+clk_test_single_parent_mux_set_range_disjoint_parent_last(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(clk, 1000, 2000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(parent, 3000, 4000);
+	KUNIT_EXPECT_LT(test, ret, 0);
+}
+
+/*
+ * Test that for a clock that can't modify its rate and with a single
+ * parent, if we set a range on the parent and a more restrictive one on
+ * the child, and then call clk_round_rate(), the boundaries of the
+ * two clocks are taken into account.
+ */
+static void
+clk_test_single_parent_mux_set_range_round_rate_child_smaller(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long rate;
+	int ret;
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1 + 1000, DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
+static struct kunit_case clk_single_parent_mux_test_cases[] = {
+	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
+	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
+	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
+	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_child_smaller),
+	{}
+};
+
+/*
+ * Test suite for a basic mux clock with one parent, with
+ * CLK_SET_RATE_PARENT on the child.
+ *
+ * These tests are supposed to exercise the consumer API and check that
+ * the state of the child and parent are sane and consistent.
+ */
+static struct kunit_suite
+clk_single_parent_mux_test_suite = {
+	.name = "clk-single-parent-mux-test",
+	.init = clk_single_parent_mux_test_init,
+	.exit = clk_single_parent_mux_test_exit,
+	.test_cases = clk_single_parent_mux_test_cases,
+};
+
 static int clk_orphan_transparent_single_parent_mux_test_init(struct kunit *test)
 {
 	struct clk_single_parent_ctx *ctx;
@@ -388,14 +563,6 @@ static int clk_orphan_transparent_single_parent_mux_test_init(struct kunit *test
 	return 0;
 }
 
-static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *test)
-{
-	struct clk_single_parent_ctx *ctx = test->priv;
-
-	clk_hw_unregister(&ctx->hw);
-	clk_hw_unregister(&ctx->parent_ctx.hw);
-}
-
 /*
  * Test that a mux-only clock, with an initial rate within a range,
  * will still have the same rate after the range has been enforced.
@@ -440,7 +607,7 @@ static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] =
 static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
 	.name = "clk-orphan-transparent-single-parent-test",
 	.init = clk_orphan_transparent_single_parent_mux_test_init,
-	.exit = clk_orphan_transparent_single_parent_mux_test_exit,
+	.exit = clk_single_parent_mux_test_exit,
 	.test_cases = clk_orphan_transparent_single_parent_mux_test_cases,
 };
 
@@ -1128,6 +1295,7 @@ kunit_test_suites(
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
 	&clk_range_minimize_test_suite,
+	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite
 );
 MODULE_LICENSE("GPL v2");
-- 
2.35.1

