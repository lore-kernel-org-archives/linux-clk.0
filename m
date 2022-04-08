Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7341EC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbiDHJQa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbiDHJOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:37 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FD310F6D9
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:19 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 8E9EE5C00F7;
        Fri,  8 Apr 2022 05:11:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=rF/wQo2B70z7ZRj9NXQ0gGYdakQuqm
        DLJ3gk0movMEw=; b=LMt8X4hvQwr+OSweV/qifpeMpvprTc7z0UdKIEyBDk7mad
        0IMHGzwR7s2br54VHbsKB+7ULSRN8CyI+UWt9Q0SNWTU/4BC2MA1PWaIh3rnhawJ
        cWQMyaBDof09717gm1jU9aDr3oiPqLFAHVa6JrWV+dDss2E0V2lN5eil+UsIEDVv
        jyY3Crydr+R4jqIzWGUbzYTHZXbcS+Ume3hejXBSvhvXsgnXJAuR6XZ/0psWrb6N
        QShgjO2Zy6APPN7w+3fWv70H05TRj9ygmwimk/SBKI+szKT5Tz00HeUHSYH/xJQd
        RmIfDuBWLTkGrJ3+gOoNcMjoKfTrjhNSjdG+pcHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rF/wQo
        2B70z7ZRj9NXQ0gGYdakQuqmDLJ3gk0movMEw=; b=eKlBYaNaP/Td2+j2GwsjdW
        3D/4Bv9asVER2XgiO+roZ2gJ7GsE3RoTBXKkSJMJL3Ta/tkUIJLNGGL2rtJzV9SS
        OdLh2j+FMxpe+Lqp7zkSpjiYSqLmaOP/fvDu9sm12Z+0FyFpkkY0iTDE6vAA+5Sx
        InWtPJCG/6w/MJiSBJ/7V76Y8+ijEnRp2t38zMxvQoqKfPvFGe+sXLEN1QoQv/ph
        /4Hc6iBnbNw795xXzdkfoB6A36a5LsJ2JbbMCzijLzOvVhPy3a9a7xvAKk2cMP14
        ONLtNbJjdKGiPPaNT94XsLQdeQLPCydmIBS9LE+uQrvM0sbZMZMqVtyy0VvUq63g
        ==
X-ME-Sender: <xms:NvxPYpUAPS9MY0A2d_VjgUIxWeQETsL416947h7jRWWhO-HinmRU7g>
    <xme:NvxPYpk50fLCRRBSEPmEhaLF1LKsMS2xdlv7xbpW6vOjzC5fd9J7d1XQSBvQINiqo
    4FM01heMQQU8QXh4yQ>
X-ME-Received: <xmr:NvxPYlZUQRuYm-bbcm-tCJ7s_daScuX_JwhDJLt2s97-AtEUBSPeMxiRh_2RWpntsJmzX29F333WYfe1OZ7Q_-87y2WHTCG5JHbwoS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NvxPYsWYweSFDAW58wiaFdq-9m7vqf6604gQX8XiMXyJSkP9-ags7g>
    <xmx:NvxPYjnOjj32bCBIXT5qAnYGAh1uXqbruT-gYDP23ZiOjYQeb8pnCQ>
    <xmx:NvxPYpegh46S4W6MzxOi9R26Vhb2PIsXSjd5PfRI0mfbie_7TU8dMw>
    <xmx:NvxPYsh0ss46VYv06YGhzLypeOf2Jo8xuWxXqdnoS5Vqem3LNOkP3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:18 -0400 (EDT)
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
Subject: [PATCH 19/22] clk: Stop forwarding clk_rate_requests to the parent
Date:   Fri,  8 Apr 2022 11:10:34 +0200
Message-Id: <20220408091037.2041955-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If the clock cannot modify its rate and has CLK_SET_RATE_PARENT,
clk_mux_determine_rate_flags() and clk_core_round_rate_nolock() will
call clk_core_round_rate_nolock() with its parent clock but use the
request of the child node either directly (clk_core_round_rate_nolock())
or by copying it (clk_mux_determine_rate_flags()).

Both cases are problematic since the parent will now have a request with
the best parent fields of the child (so pointing to itself) and the
boundaries of the child as well.

clk_core_round_rate_nolock() is even worse since we would directly
modify the caller structure if the parent was ever to modify its own
parent or its parent rate, then returning to the caller a best parent
that isn't a parent of the clock we just called clk_determine_rate()
onto.

Let's create a new function that will create a new request to forward to
the parent, clk_core_forward_rate_req() and update the relevant call
sites to that new function.

Let's also add a test to make sure we avoid regressions there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  58 ++++++++++++--
 drivers/clk/clk_test.c | 176 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 227 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2bbeeb2f729e..53f5f7434be0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -543,6 +543,10 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
+static void clk_core_init_rate_req(struct clk_core * const core,
+				   struct clk_rate_request *req,
+				   unsigned long rate);
+
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req);
 
@@ -566,6 +570,24 @@ static bool clk_core_has_parent(struct clk_core *core, struct clk_core *parent)
 	return false;
 }
 
+static void
+clk_core_forward_rate_req(struct clk_core * const core,
+			  struct clk_core * const parent,
+			  struct clk_rate_request * const old_req,
+			  struct clk_rate_request *req)
+{
+	if (WARN_ON(!clk_core_has_parent(core, parent)))
+		return;
+
+	clk_core_init_rate_req(parent, req, old_req->rate);
+
+	if (req->min_rate < old_req->min_rate)
+		req->min_rate = old_req->min_rate;
+
+	if (req->max_rate > old_req->max_rate)
+		req->max_rate = old_req->max_rate;
+}
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -573,17 +595,19 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	struct clk_core *core = hw->core, *parent, *best_parent = NULL;
 	int i, num_parents, ret;
 	unsigned long best = 0;
-	struct clk_rate_request parent_req = *req;
 
 	/* if NO_REPARENT flag set, pass through to current parent */
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT) {
+			struct clk_rate_request parent_req;
+
 			if (!parent) {
 				req->rate = 0;
 				return 0;
 			}
 
+			clk_core_forward_rate_req(core, parent, req, &parent_req);
 			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				return ret;
@@ -601,23 +625,29 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	/* find the parent that can provide the fastest rate <= rate */
 	num_parents = core->num_parents;
 	for (i = 0; i < num_parents; i++) {
+		unsigned long parent_rate;
+
 		parent = clk_core_get_parent_by_index(core, i);
 		if (!parent)
 			continue;
 
 		if (core->flags & CLK_SET_RATE_PARENT) {
-			parent_req = *req;
+			struct clk_rate_request parent_req;
+
+			clk_core_forward_rate_req(core, parent, req, &parent_req);
 			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
+
+			parent_rate = parent_req.rate;
 		} else {
-			parent_req.rate = clk_core_get_rate_nolock(parent);
+			parent_rate = clk_core_get_rate_nolock(parent);
 		}
 
-		if (mux_is_better_rate(req->rate, parent_req.rate,
+		if (mux_is_better_rate(req->rate, parent_rate,
 				       best, flags)) {
 			best_parent = parent;
-			best = parent_req.rate;
+			best = parent_rate;
 		}
 	}
 
@@ -1451,6 +1481,8 @@ static bool clk_core_can_round(struct clk_core * const core)
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req)
 {
+	int ret;
+
 	lockdep_assert_held(&prepare_lock);
 
 	if (!core) {
@@ -1460,8 +1492,20 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
-	else if (core->flags & CLK_SET_RATE_PARENT)
-		return clk_core_round_rate_nolock(core->parent, req);
+
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
+
+		clk_core_forward_rate_req(core, core->parent, req, &parent_req);
+		ret = clk_core_round_rate_nolock(core->parent, &parent_req);
+		if (ret)
+			return ret;
+
+		req->best_parent_rate = parent_req.rate;
+		req->rate = parent_req.rate;
+
+		return 0;
+	}
 
 	req->rate = core->rate;
 	return 0;
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 0b9088cdb8fe..23e92f2d8445 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -997,6 +997,34 @@ clk_test_single_parent_mux_set_range_disjoint_parent_last(struct kunit *test)
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
+/*
+ * Test that for a clock that can't modify its rate and with a single
+ * parent, if we set a range on the parent and then call
+ * clk_round_rate(), the boundaries of the parent are taken into
+ * account.
+ */
+static void
+clk_test_single_parent_mux_set_range_round_rate_parent_only(struct kunit *test)
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
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
 /*
  * Test that for a clock that can't modify its rate and with a single
  * parent, if we set a range on the parent and a more restrictive one on
@@ -1033,12 +1061,50 @@ clk_test_single_parent_mux_set_range_round_rate_child_smaller(struct kunit *test
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
 }
 
+/*
+ * Test that for a clock that can't modify its rate and with a single
+ * parent, if we set a range on the child and a more restrictive one on
+ * the parent, and then call clk_round_rate(), the boundaries of the
+ * two clocks are taken into account.
+ */
+static void
+clk_test_single_parent_mux_set_range_round_rate_parent_smaller(struct kunit *test)
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
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1 + 1000, DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
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
 static struct kunit_case clk_single_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_has_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_child_smaller),
+	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_parent_only),
+	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_parent_smaller),
 	{}
 };
 
@@ -1945,7 +2011,117 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 	.test_cases = clk_range_minimize_test_cases,
 };
 
+struct clk_leaf_mux_ctx {
+	struct clk_multiple_parent_ctx mux_ctx;
+	struct clk_hw hw;
+};
+
+static int
+clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
+{
+	struct clk_leaf_mux_ctx *ctx;
+	const char *top_parents[2] = { "parent-0", "parent-1" };
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->mux_ctx.parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
+								    &clk_dummy_rate_ops,
+								    0);
+	ctx->mux_ctx.parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
+	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[0].hw);
+	if (ret)
+		return ret;
+
+	ctx->mux_ctx.parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
+								    &clk_dummy_rate_ops,
+								    0);
+	ctx->mux_ctx.parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
+	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[1].hw);
+	if (ret)
+		return ret;
+
+	ctx->mux_ctx.current_parent = 0;
+	ctx->mux_ctx.hw.init = CLK_HW_INIT_PARENTS("test-mux", top_parents,
+						   &clk_multiple_parents_mux_ops,
+						   0);
+	ret = clk_hw_register(NULL, &ctx->mux_ctx.hw);
+	if (ret)
+		return ret;
+
+	ctx->hw.init = CLK_HW_INIT_HW("test-clock", &ctx->mux_ctx.hw,
+				      &clk_dummy_single_parent_ops,
+				      CLK_SET_RATE_PARENT);
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void clk_leaf_mux_set_rate_parent_test_exit(struct kunit *test)
+{
+	struct clk_leaf_mux_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->mux_ctx.hw);
+	clk_hw_unregister(&ctx->mux_ctx.parents_ctx[0].hw);
+	clk_hw_unregister(&ctx->mux_ctx.parents_ctx[1].hw);
+}
+
+/*
+ * Test that, for a clock that will forward any rate request to its
+ * parent, the rate request structure returned by __clk_determine_rate
+ * is sane and will be what we expect.
+ */
+static void clk_leaf_mux_set_rate_parent_determine_rate(struct kunit *test)
+{
+	struct clk_leaf_mux_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk_rate_request req;
+	unsigned long rate;
+	int ret;
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_hw_init_rate_request(hw, &req, DUMMY_CLOCK_RATE_2);
+
+	ret = __clk_determine_rate(hw, &req);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, req.rate, DUMMY_CLOCK_RATE_2);
+	KUNIT_EXPECT_EQ(test, req.best_parent_rate, DUMMY_CLOCK_RATE_2);
+	KUNIT_EXPECT_PTR_EQ(test, req.best_parent_hw, &ctx->mux_ctx.hw);
+}
+
+static struct kunit_case clk_leaf_mux_set_rate_parent_test_cases[] = {
+	KUNIT_CASE(clk_leaf_mux_set_rate_parent_determine_rate),
+	{}
+};
+
+/*
+ * Test suite for a clock whose parent is a mux with multiple parents.
+ * The leaf clock has CLK_SET_RATE_PARENT, and will forward rate
+ * requests to the mux, which will then select which parent is the best
+ * fit for a given rate.
+ *
+ * These tests are supposed to exercise the behaviour of muxes, and the
+ * proper selection of parents.
+  */
+static struct kunit_suite clk_leaf_mux_set_rate_parent_test_suite = {
+	.name = "clk-leaf-mux-set-rate-parent",
+	.init = clk_leaf_mux_set_rate_parent_test_init,
+	.exit = clk_leaf_mux_set_rate_parent_test_exit,
+	.test_cases = clk_leaf_mux_set_rate_parent_test_cases,
+};
+
 kunit_test_suites(
+	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
-- 
2.35.1

