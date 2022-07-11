Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC55ECCA47B
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbiGKPY5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbiGKPYw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:52 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5062AC5C
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:51 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 7F2195C019A;
        Mon, 11 Jul 2022 11:24:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 11 Jul 2022 11:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553090; x=1657639490; bh=xE
        l929ncoIMFe5zOZSiu+2fwSMSOhtxkr3soh3N5dG4=; b=K4ZnQYVQyigwCly2vk
        xZWKiWcGGFlalrZ7mdrUj2vcshFB2Rf1a9Q8Cg3H2xPs5NnlD1V/w70MJ+en72q8
        tAf8WlO9xQ5YXgdbZNu6xaCT9GWAhLwLOv4mL/IHawl8xPDcTdgf57Ld9pGwZi2l
        Oct055CVYlHAl8aOMQ38VRo5I9yJOJMsNNT2NqL4iPV+emPZ3zYb02Vnzer+EhBA
        4nFjqLBnEEBwyORkv81drjGsUkGKYiFOhq6gG6GUIfEc2lq286m/yGZHQtD1oQND
        Lia8ceN8s91l/vlYmsU8yyVBZnEekPQNPS96iZkSWm8cHQWGkf7821ad2jqf8nu5
        +xeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553090; x=1657639490; bh=xEl929ncoIMFe
        5zOZSiu+2fwSMSOhtxkr3soh3N5dG4=; b=zynNVpP990CpAaDaF9QayKbhXbEnk
        cZqYFeZjSwMIYz8NWygWYQXRh7yIME3gXZRIAaXbvos1TDUpXbxzm6SjD4Xe4kux
        QAB4Ih3SC26Glzu4PlvVMV+VLDTNTQVb3U001JvPhNgvoD1I9r0BNLhofcEWs6VB
        aaUImz9xXtPfVu6+1W9xQO5Ykr2vRukk+BeW190bqaK/hDLE7SiUI1G0zQI31P0L
        ahT/+p9VHwukjkl4FEHvHUvhPMBirRuq4H7W6Tbb7nKDyAJxN7/6GTtO+6eQOnqx
        MtjLv57+frrbdItqfQbhiCbV8zmNsZFrYUxz/dUt0L1HLDuAaX52JiPRA==
X-ME-Sender: <xms:wkDMYukRFF7KqGn8CRkWBdGpGgFfmrCRsAmNPfVMRVfLrVvjF-Dg1Q>
    <xme:wkDMYl0SZe83Wib6OywMoankjtLkkQZJV72kNCkgEXTgSt3Vfj2sqyIGGt9_dFYAW
    _q1OTWGxprhXc3QZTI>
X-ME-Received: <xmr:wkDMYsq3pEedAv2PN21vidXPfSlpzXvA4MqkIH6--TDcwN9oIM3CmOCs_tyny0kVSvnincCwZfFBBPPGHjQV4ONFzHxdJf9W5yH4TNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wkDMYikpXV07R4Sg0tCkVmeH3CMaLiY__BCSQls2kKrVqrtuK8Yw_g>
    <xmx:wkDMYs0gtS_x3S58K96eHpmyh02MGLofFZi4uGAmCCnU8F0m4DNhZA>
    <xmx:wkDMYpvBeY-9OB5jffXZ2d9QWve0PZWk98tibYKBMY8u3q0BDPr0vA>
    <xmx:wkDMYluAidTGw-GLrTzEEc3HlkeSNPjIztvb3Mu9qg23MKcN9Zsc7w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:49 -0400 (EDT)
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
Subject: [PATCH v6 12/28] clk: tests: Add tests for single parent mux
Date:   Mon, 11 Jul 2022 17:24:08 +0200
Message-Id: <20220711152424.701311-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We have a few tests for a mux with a single parent, testing the case
where it used to be orphan.

Let's leverage most of the code but register the clock properly to test
a few trivial things.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 194 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 185 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b269420dafcc..06c9220873bb 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -365,6 +365,189 @@ struct clk_single_parent_ctx {
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent = clk_hw_get_clk(&ctx->parent_ctx.hw, NULL);
+
+	KUNIT_EXPECT_TRUE(test, clk_is_match(clk_get_parent(clk), parent));
+
+	clk_put(parent);
+	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
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
+
+	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
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
+
+	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
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
+
+	clk_put(clk);
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
+ * These tests exercise the consumer API and check that the state of the
+ * child and parent are sane and consistent.
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
@@ -401,14 +584,6 @@ static int clk_orphan_transparent_single_parent_mux_test_init(struct kunit *test
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
@@ -455,7 +630,7 @@ static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] =
 static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
 	.name = "clk-orphan-transparent-single-parent-test",
 	.init = clk_orphan_transparent_single_parent_mux_test_init,
-	.exit = clk_orphan_transparent_single_parent_mux_test_exit,
+	.exit = clk_single_parent_mux_test_exit,
 	.test_cases = clk_orphan_transparent_single_parent_mux_test_cases,
 };
 
@@ -1168,6 +1343,7 @@ kunit_test_suites(
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
 	&clk_range_minimize_test_suite,
+	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite
 );
 MODULE_LICENSE("GPL v2");
-- 
2.36.1

