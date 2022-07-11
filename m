Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AEBC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbiGKPZC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbiGKPZA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:00 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4790728729
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:58 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id ABB1F5C0178;
        Mon, 11 Jul 2022 11:24:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553097; x=1657639497; bh=j+
        450msN/qkOhPAjcDtkcZDnhXgTSUgz1R9TIpE5B7Q=; b=EyVfzYpqlxWvPtm43y
        MMqHa6gxJ/dWE3uECb2pBH2+PG5w8FsUBCI5RHN0YYo275AV2vAiPWNKyy57zEYC
        LhHEPXKQBDBF/8BirsZ9X+2nv+nN2s6Lo9YqfnDtMad7nf3KSWCQ6YFsHXxJKmA8
        TU6Q3IZ9PUk6G2OwHAy3rbVQnROY7zNi4fc5KiqZqFofF4tGCb4XeOhBj5e6r6L9
        nSaXIeeu/RUCq+99FraGhbMK1336hIDqv1yXK91QUyG4v0IjJma3g9Wa4GnWDNzC
        IDfmrhn+D1uHyNg+3YTlfD7gbf6zd1MvGF3OTLNawm7MkUHUMoI/4K9JywcHG+TM
        E8FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553097; x=1657639497; bh=j+450msN/qkOh
        PAjcDtkcZDnhXgTSUgz1R9TIpE5B7Q=; b=oVowMiYDEeZnpXP7oH30eaXbAtbKL
        AJvZ9u2NYzGvaYE6nfoKWHb/6Fo0PrQrPp+o2kGOhbBMPp1FKejX6/gDyAnP8LvY
        ecVFzo9OO1QBZCPAt9MzYyHOJ2vczQ3C92IKJeLw0ekkx12mKQ3t770Ngzuk16vs
        lf7Z68eKY7JddSH8XJufIRmdw1jwZg5Ma1umhIwaKgZFl/XMO+JvmGrAImRYgaTF
        j7poPVAuKTDn0yZ1HwlVHVBOrEoEbZjJBpJuLBHCL1JJAkYAMNXRgKWf6L9znxiR
        yROKxirFDXeFxPcnuJJ5PiKf09xf72L/7ZvCRS3kK4NZujTfyGT4jIH6A==
X-ME-Sender: <xms:yUDMYpJFPqewVVaSz9xds9wveJ_Ym0BRDBmz8czxaA26ShwfyqHCcg>
    <xme:yUDMYlLnki47E9FtLobWl1s8q91bSXg8wBnNBxK94PnWqFysqgZmwmp6VfaFhGY0l
    oAQ8RPpsS6LzBo6PeU>
X-ME-Received: <xmr:yUDMYhuCWCMMq1hgWTVG_zvu-TlBUF0tNC7miqDTvaEq_8ANwef9-4F6G_Qfqhjiw7wG_kNMzSVJMT0jNkC6REZHdcuMAHLrVJQAMZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehleetfeejteeivdetveegtdetgeffffdvkeeuheejuedvjeefvdekffel
    gfefieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    epudenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:yUDMYqYTWzEVYvN7R4hvG5rdfenVwX9WNGfaQgi_edMzYbKIh9jj4w>
    <xmx:yUDMYgZGuiQ0QVSTf_Q2K80HuDoTDKw3WoVXFkZX9qXRlPQLLB-1Aw>
    <xmx:yUDMYuDQp0ARhlYiRn_dcaf7xy5kOo2qq49mdGEIGokss1LBfGLmZg>
    <xmx:yUDMYtRl9lI5RE0f_am74Iwi38L7DL9fOzj0PJcbwvt4vRiXBoaUqQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:57 -0400 (EDT)
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
Subject: [PATCH v6 16/28] clk: Set req_rate on reparenting
Date:   Mon, 11 Jul 2022 17:24:12 +0200
Message-Id: <20220711152424.701311-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 239 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 257 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 53b28e63deae..6f5284f6cab5 100644
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
index d3e121f21ae2..d1b1372f7aaa 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -594,6 +594,41 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent(struct kunit *test)
 	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent;
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
+	clk_put(clk);
+}
+
 /*
  * Test that, for a mux that started orphan but got switched to a valid
  * parent, the rate of the mux and its new parent are consistent.
@@ -625,6 +660,39 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate(struct kunit
 	clk_put(clk);
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
@@ -658,6 +726,43 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified(st
 	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent;
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
+	clk_put(clk);
+}
+
 /*
  * Test that, for a mux whose current parent hasn't been registered yet,
  * calling clk_set_rate_range() will succeed, and will be taken into
@@ -724,8 +829,11 @@ clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate(st
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
@@ -1021,6 +1129,136 @@ static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	unsigned long rate;
+
+	rate = clk_get_rate(clk);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
+
+	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
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
+
+	clk_put(clk);
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
@@ -1729,6 +1967,7 @@ kunit_test_suites(
 	&clk_multiple_parents_mux_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
+	&clk_orphan_two_level_root_last_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
 	&clk_range_minimize_test_suite,
-- 
2.36.1

