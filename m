Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D0EC25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbiHPLwQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbiHPLvj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:51:39 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0233AD7CEF
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:37 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 769133200914;
        Tue, 16 Aug 2022 07:26:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649194; x=1660735594; bh=0G
        Bu8Lv6/Ut0aPm48+KGch458504b71SfZ4XD6/Ek+A=; b=ShnyYqWRbaL7mq+xy0
        lgsqMuHuzSapnldcREMPHW4n0FHtxlG3kWIXPjWkGiP3L8aMgCW6fg9INMyak86g
        yTfSNjIjWjysssFwGDx7v73IshyUxDXpAP1Y7tsDgxl/TroblxEPYbQZ5AejicMC
        4x8Cf0S7eOZhlWj2/+w0RoCasGwxAp2sAeSu0Q9E2OE29oecczMYcBGoNq8DcJPa
        nemPqoEt8hxvQwAQO7pLFRN0BClXXyiX/mqrfOJntupDBCdN+apK0gBq2oSLFIdJ
        DXu9ByJO+z8Pb8lT8E3b1T+gCnGypWqruFjiR5ueeeBQW9v38LGEJmloHLIpLOkc
        g6qQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649194; x=1660735594; bh=0GBu8Lv6/Ut0a
        Pm48+KGch458504b71SfZ4XD6/Ek+A=; b=ZROhIqPLA7/rkRewwzJvN5cUnqsK7
        gRgQkXLt2lfq4fhMxs5/ansl8pcsNLWiriUSCtDx7Oykp/vhC/nkNwZLml6ZfGTn
        AIvkt7mHBfPNq6tEs6C1WU6quba8slbYre8kddfy2d+aQ8ACeZ8nklg2BgTMRBUE
        Uho3vBuJJcQkr4VoXK8KDrwKy5z2Pm+DiQJwUlHIMdTotBLE/i0unSxzxTbJ0CJ0
        PemZxHbDY4Deq1079pfNJhTSd/WL4Ca3YvBJ6xhl1z3tANs2MuOS1xa/wvce4kFf
        4eG9N2yadrDahn5JBt7fqfPr/pYs51+VY+vs61gdM9xARMklLWxu4oqVw==
X-ME-Sender: <xms:6n77YqDVEHz4Mp_B_dAmEA_knvk_qjupegBUKwxGuUwV8JFuKV6JSw>
    <xme:6n77YkjRjupr27f0tCgQYNdlHn5cU23P-JEr0ceHvuDeLJpcUXwTo5M_qVleX0WQx
    RBeXT4v-ZMuSVKWbPw>
X-ME-Received: <xmr:6n77YtkjloQuST6iME10wwIscR6wGAobFI71z3Z750gUWcvb0-u39V6SovY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehleetfeejteeivdetveegtdetgeffffdvkeeuheejuedvjeefvdekffel
    gfefieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:6n77YoylEdfTLyQ-50Tl-tL--VL-KJsyGDvMLrn5iNOuMkNi3W-kfA>
    <xmx:6n77YvQIk657p__S9UfGbhZtSiRGSL2HPraxkc9rpFlXWzW6qTzNaQ>
    <xmx:6n77YjakfMhQY3FoTz491xh_cBPvvOqjlY3xRSra67jM0lneCc_DIg>
    <xmx:6n77YkLAXZglv-uTK1KkWESd_jnT80n-YHGspkI7ntgOIFBNS0NzDQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:34 -0400 (EDT)
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
Subject: [PATCH v9 13/25] clk: Set req_rate on reparenting
Date:   Tue, 16 Aug 2022 13:25:18 +0200
Message-Id: <20220816112530.1837489-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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

The natural solution to this would be to update core->rate and
core->req_rate in clk_reparent() by calling clk_recalc().

However, this doesn't work in all cases. Indeed, clk_recalc() is called
by __clk_set_parent_before(), __clk_set_parent() and
clk_core_reparent(). Both __clk_set_parent_before() and __clk_set_parent
will call clk_recalc() with the enable_lock taken through a call to
clk_enable_lock(), the underlying locking primitive being a spinlock.

clk_recalc() calls the backing driver .recalc_rate hook, and that
implementation might sleep if the underlying device uses a bus with
accesses that might sleep, such as i2c.

In such a situation, we would end up sleeping while holding a spinlock,
and thus in an atomic section.

In order to work around this, we can move the core->rate and
core->req_rate update to the clk_recalc() calling sites, after the
enable_lock has been released if it was taken.

The only situation that could still be problematic is the
clk_core_reparent() -> clk_reparent() case that doesn't have any
locking. clk_core_reparent() is itself called by clk_hw_reparent(),
which is then called by 4 drivers:

  * clk-stm32mp1.c, stm32/clk-stm32-core.c and tegra/clk-tegra210-emc.c
    use it in their set_parent implementation. The set_parent hook is
    only called by __clk_set_parent() and clk_change_rate(), both of
    them calling it without the enable_lock taken.

  * clk/tegra/clk-tegra124-emc.c calls it as part of its set_rate
    implementation. set_rate is only called by clk_change_rate(), again
    without the enable_lock taken.

In both cases we can't end up in a situation where the clk_hw_reparent()
caller would hold a spinlock, so it seems like this is a good
workaround.

Let's also add some unit tests to make sure we cover the original bug.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  22 ++++
 drivers/clk/clk_test.c | 239 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 261 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 53b28e63deae..91bb1ea0e147 100644
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
@@ -1834,6 +1851,8 @@ static struct clk_core *__clk_set_parent_before(struct clk_core *core,
 	clk_reparent(core, parent);
 	clk_enable_unlock(flags);
 
+	clk_core_update_orphan_child_rates(core);
+
 	return old_parent;
 }
 
@@ -1878,6 +1897,8 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 		flags = clk_enable_lock();
 		clk_reparent(core, old_parent);
 		clk_enable_unlock(flags);
+
+		clk_core_update_orphan_child_rates(core);
 		__clk_set_parent_after(core, old_parent, parent);
 
 		return ret;
@@ -2506,6 +2527,7 @@ static void clk_core_reparent(struct clk_core *core,
 				  struct clk_core *new_parent)
 {
 	clk_reparent(core, new_parent);
+	clk_core_update_orphan_child_rates(core);
 	__clk_recalc_accuracies(core);
 	__clk_recalc_rates(core, POST_RATE_CHANGE);
 }
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
2.37.1

