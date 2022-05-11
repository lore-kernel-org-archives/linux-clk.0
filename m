Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E22C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244937AbiEKOoA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245032AbiEKOn4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:56 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D06FE6B69
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:54 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B8AFE32009D1;
        Wed, 11 May 2022 10:43:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 11 May 2022 10:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280232; x=1652366632; bh=5j
        X42W+RkpqO5N4EhtBOIw5P2Hc5RJSbpJu/g2m2v3Q=; b=BlydZ386f9LYeleGcZ
        +2ryBN6XrA2h6/TOFw6zt299VvH8wRuaZqOYYf2VXvmahjKDz3/uzTBnPbHcH0t8
        UhV3oGDjlHsKrnedwbp+OT3vihsmkiuX9dXjuIIBWtdgTOPQY2afcTfViSa9duSs
        s464yDe+MGekTeKN4jkeDErUXxZMygdd9f3RdVLCbETBM5Aq5jg/PwjaFND9mvSV
        smW1WtkHymDlHCT5LrX739T2gqzoOCzIEm/+j49HDs2DPEfSII0bGku+Ti2NUU62
        yAL3kYQPKaK8ZCEcUo5oYpnBbPxI27uJ+Huc6/5YL+6wtXUvlVQvG20osXG4UeiC
        Q7IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280232; x=1652366632; bh=5jX42W+RkpqO5N4EhtBOIw5P2Hc5RJSbpJu
        /g2m2v3Q=; b=x/2SocClwuBDVSGd2KL+crlHdHVu1kSb2wULvumbL9xUz0gZH6h
        L41qKbCoR4FPgTEVnd3OymM5ph4wgGoS9GyMPZO8VwUEfbajss0aBHKtEi8FneZb
        T6w323WV5u9d2A/jI0ZvNkWRgG7cXpKFdPX1I/HIoBA8+f5lvmbL3bD1ejopkGHs
        qcxeUmDWvdfaIuBrC2LvB/4T88lfQOSb3F6zoq4I1mjBweC+MdjAIV/ybxKBWdGe
        68LtNH0DTZ48bcdKGCiDm2aXzkmIH1fa2rSqH9HZWcimCoCqnfGvJDH/vdyFZ6FJ
        0tU2KZSbq1fveaR6KBXVmmyxbxtkuvuJuqg==
X-ME-Sender: <xms:qMt7YvA_UOV4VtbhfWlEylkD2oEOANg0v_Bmuf3p36HcsCaVcPLEIg>
    <xme:qMt7Ylj10hUuSEfY7WUctr3tdL6dqk7faof3Mouhy2RCrbGkOmCxbo6bqxutOMMnT
    ex1IC0URdkee2_oQXY>
X-ME-Received: <xmr:qMt7Yqnev0ee6QJiEGk9rq2KEiQq06ujFuGmHF9eObgr8DjbM3W1hr4Rf_prPqiZfgSgJpS7rvbMynfiIKAq_zQSS4e5C7QVvW4BzaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepheelteefjeetiedvteevgedtteegffffvdekueehjeeuvdejfedvkefflefg
    feeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qMt7YhwQbQVzZRo_MOBp0tN3a9jbYGnIM50LwTR_JaVzq5gPAQuF2A>
    <xmx:qMt7YkTI_Km_fFFOPhAYLFWcPlCUHrT0wDMNLeK9j-rxJvQmEKEOwA>
    <xmx:qMt7Ykb5JJSxqWk79J0uC662N6vWO8DpVM1aWBWafZ4cKYtn_l2d4A>
    <xmx:qMt7YpLz9fHOZhG933lAXw_LNHJEnAvLpEyLE3zWwmybWmE-h5SeDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:51 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 15/28] clk: Set req_rate on reparenting
Date:   Wed, 11 May 2022 16:42:36 +0200
Message-Id: <20220511144249.354775-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If a non-rate clock started by default with a parent that never
registered, core->req_rate will be 0. The expectation is that whenever
the parent will be registered, req_rate will be updated with the new
value that has just been computed.

However, if that clock is a mux, clk_set_parent() can also make that
clock no longer orphan. In this case however, we never update req_rate.
Let's make sure it's the case for the newly unorphan clock and all its
children.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  18 ++++
 drivers/clk/clk_test.c | 231 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 249 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 09849453047c..263c893d3b09 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1765,6 +1765,23 @@ static void clk_core_update_orphan_status(struct clk_core *core, bool is_orphan)
 		clk_core_update_orphan_status(child, is_orphan);
 }
 
+/*
+ * Update the orphan rate and req_rate of @core and all its children.
+ */
+static void clk_core_update_orphan_child_rates(struct clk_core *core)
+{
+	struct clk_core *child;
+	unsigned long parent_rate = 0;
+
+	if (core->parent)
+		parent_rate = core->parent->rate;
+
+	core->rate = core->req_rate = clk_recalc(core, parent_rate);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_core_update_orphan_child_rates(child);
+}
+
 static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
 {
 	bool was_orphan = core->orphan;
@@ -1789,6 +1806,7 @@ static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
 	}
 
 	core->parent = new_parent;
+	clk_core_update_orphan_child_rates(core);
 }
 
 static struct clk_core *__clk_set_parent_before(struct clk_core *core,
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index c52098e463d3..4c71c6570021 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -575,6 +575,39 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent(struct kunit *test)
 	clk_put(parent);
 }
 
+/*
+ * Test that, for a mux that started orphan but got switched to a valid
+ * parent, calling clk_drop_range() on the mux won't affect the parent
+ * rate.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_parent_drop_range(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk, *parent;
+	unsigned long parent_rate, new_parent_rate;
+	int ret;
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	parent_rate = clk_get_rate(parent);
+	KUNIT_ASSERT_GT(test, parent_rate, 0);
+
+	ret = clk_set_parent(clk, parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_drop_range(clk);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_parent_rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
+	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
+
+	clk_put(parent);
+}
+
 /*
  * Test that, for a mux that started orphan but got switched to a valid
  * parent, the rate of the mux and its new parent are consistent.
@@ -603,6 +636,39 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate(struct kunit
 	KUNIT_EXPECT_EQ(test, parent_rate, rate);
 }
 
+/*
+ * Test that, for a mux that started orphan but got switched to a valid
+ * parent, calling clk_put() on the mux won't affect the parent rate.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_parent_put(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk *clk, *parent;
+	unsigned long parent_rate, new_parent_rate;
+	int ret;
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	clk = clk_hw_get_clk(&ctx->hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	parent_rate = clk_get_rate(parent);
+	KUNIT_ASSERT_GT(test, parent_rate, 0);
+
+	ret = clk_set_parent(clk, parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_put(clk);
+
+	new_parent_rate = clk_get_rate(parent);
+	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
+	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
+
+	clk_put(parent);
+}
+
 /*
  * Test that, for a mux that started orphan but got switched to a valid
  * parent, calling clk_set_rate_range() will affect the parent state if
@@ -634,6 +700,41 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified(st
 	clk_put(parent);
 }
 
+/*
+ * Test that, for a mux that started orphan but got switched to a valid
+ * parent, calling clk_set_rate_range() won't affect the parent state if
+ * its rate is within range.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_untouched(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk, *parent;
+	unsigned long parent_rate, new_parent_rate;
+	int ret;
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	parent_rate = clk_get_rate(parent);
+	KUNIT_ASSERT_GT(test, parent_rate, 0);
+
+	ret = clk_set_parent(clk, parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_INIT_RATE - 1000,
+				 DUMMY_CLOCK_INIT_RATE + 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_parent_rate = clk_get_rate(parent);
+	KUNIT_ASSERT_GT(test, new_parent_rate, 0);
+	KUNIT_EXPECT_EQ(test, parent_rate, new_parent_rate);
+
+	clk_put(parent);
+}
+
 /*
  * Test that, for a mux whose current parent hasn't been registered yet,
  * calling clk_set_rate_range() will succeed, and will be taken into
@@ -696,8 +797,11 @@ clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate(st
 static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_drop_range),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_put),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_untouched),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate),
 	{}
@@ -983,6 +1087,132 @@ static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
 	.test_cases = clk_orphan_transparent_single_parent_mux_test_cases,
 };
 
+struct clk_single_parent_two_lvl_ctx {
+	struct clk_dummy_context parent_parent_ctx;
+	struct clk_dummy_context parent_ctx;
+	struct clk_hw hw;
+};
+
+static int
+clk_orphan_two_level_root_last_test_init(struct kunit *test)
+{
+	struct clk_single_parent_two_lvl_ctx *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parent_ctx.hw.init =
+		CLK_HW_INIT("intermediate-parent",
+			    "root-parent",
+			    &clk_dummy_single_parent_ops,
+			    CLK_SET_RATE_PARENT);
+	ret = clk_hw_register(NULL, &ctx->parent_ctx.hw);
+	if (ret)
+		return ret;
+
+	ctx->hw.init =
+		CLK_HW_INIT("test-clk", "intermediate-parent",
+			    &clk_dummy_single_parent_ops,
+			    CLK_SET_RATE_PARENT);
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	ctx->parent_parent_ctx.rate = DUMMY_CLOCK_INIT_RATE;
+	ctx->parent_parent_ctx.hw.init =
+		CLK_HW_INIT_NO_PARENT("root-parent",
+				      &clk_dummy_rate_ops,
+				      0);
+	ret = clk_hw_register(NULL, &ctx->parent_parent_ctx.hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+clk_orphan_two_level_root_last_test_exit(struct kunit *test)
+{
+	struct clk_single_parent_two_lvl_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->parent_ctx.hw);
+	clk_hw_unregister(&ctx->parent_parent_ctx.hw);
+}
+
+/*
+ * Test that, for a clock whose parent used to be orphan, clk_get_rate()
+ * will return the proper rate.
+ */
+static void
+clk_orphan_two_level_root_last_test_get_rate(struct kunit *test)
+{
+	struct clk_single_parent_two_lvl_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	rate = clk_get_rate(clk);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
+}
+
+/*
+ * Test that, for a clock whose parent used to be orphan,
+ * clk_set_rate_range() won't affect its rate if it is already within
+ * range.
+ *
+ * See (for Exynos 4210):
+ * https://lore.kernel.org/linux-clk/366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com/
+ */
+static void
+clk_orphan_two_level_root_last_test_set_range(struct kunit *test)
+{
+	struct clk_single_parent_two_lvl_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+	int ret;
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_INIT_RATE - 1000,
+				 DUMMY_CLOCK_INIT_RATE + 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
+}
+
+static struct kunit_case
+clk_orphan_two_level_root_last_test_cases[] = {
+	KUNIT_CASE(clk_orphan_two_level_root_last_test_get_rate),
+	KUNIT_CASE(clk_orphan_two_level_root_last_test_set_range),
+	{}
+};
+
+/*
+ * Test suite for a basic, transparent, clock with a parent that is also
+ * such a clock. The parent's parent is registered last, while the
+ * parent and its child are registered in that order. The intermediate
+ * and leaf clocks will thus be orphan when registered, but the leaf
+ * clock itself will always have its parent and will never be
+ * reparented. Indeed, it's only orphan because its parent is.
+ *
+ * These tests exercise the behaviour of the consumer API when dealing
+ * with an orphan clock, and how we deal with the transition to a valid
+ * parent.
+ */
+static struct kunit_suite
+clk_orphan_two_level_root_last_test_suite = {
+	.name = "clk-orphan-two-level-root-last-test",
+	.init = clk_orphan_two_level_root_last_test_init,
+	.exit = clk_orphan_two_level_root_last_test_exit,
+	.test_cases = clk_orphan_two_level_root_last_test_cases,
+};
+
 /*
  * Test that clk_set_rate_range won't return an error for a valid range
  * and that it will make sure the rate of the clock is within the
@@ -1663,6 +1893,7 @@ kunit_test_suites(
 	&clk_multiple_parents_mux_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
+	&clk_orphan_two_level_root_last_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
 	&clk_range_minimize_test_suite,
-- 
2.36.1

