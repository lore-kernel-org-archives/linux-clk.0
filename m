Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA46FC25B0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbiHOPnG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbiHOPmf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:35 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132166563
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:34 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 8B8B53200805;
        Mon, 15 Aug 2022 11:42:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 11:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578152; x=1660664552; bh=jg
        tvztLQB/83oEqOPLglVohaIv+RzmjL0nBbyAOq+nA=; b=mtHMiy73DqJGkbFY5X
        IxY0XCRETL39wkLZFmK9qbGRP2+kyC36Eq7fJJmTIkWxzDD26HRr8B2/xv3wXiBH
        rq5ofmERHBSVDWH7fhpHYmo4tJmCFrjyMsQu53K+65IZEuY8qZ+q4wCyltNeyGvM
        RqJkE41+9x4wAY3CUgayyUnShqDQjahMfVtpEiTO7+6dK++IsE94nxYfFbVbRnvB
        V4NaqxPa3MbMGN2cPtwUWU2M3Z1UbUzHHF3YukAuHyknRSqDNcKQ07bEvzvcWWpY
        GYRipeoML6WN+E+rZiPZWSQ+W3qthbr88ZZmqPGZFLyQS6mVUf1C11IGL4k1BNpD
        NHlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578152; x=1660664552; bh=jgtvztLQB/83o
        EqOPLglVohaIv+RzmjL0nBbyAOq+nA=; b=U3NqO95uSBjYjbveYk3vlYcKLTBVE
        Lr3uKJVwwT2Z4RrUUN3dLJoNuexOmt6vbKV9KIMz8c965TzLuLFKtUOr8KanIYwF
        9qGe6R5vP/Q2bWS+gfZsXTOAGP3wXjyWtyK2fXRQkqgnajwdpPp3l9djAwkSVRSU
        Bc3OB+LHqVEKpaioYo8B03MY44KdZLA8J4Rlrvwrnv5TqHTDPVdWpTb/goKqmb8R
        FHGi+66PcQ/tDHqAzpX04kib0j5tnn8IGfVQo4XAFFCmRnI1pWMzJyYhMIw+AFS7
        qEa8EAdOqIEClHPzAroJLQ5mIgJqQQsbvP7cuOqKU+S6MuXb5gVKEafNg==
X-ME-Sender: <xms:Z2n6YnjXuakFygwfhAAN3wZ-_REMywaJq8RNQF1zowO8ly0xEYv3eQ>
    <xme:Z2n6YkCqTDZ6ejIjbt48U1FES-v2BCIj5yAXHJvs3C-E5DbOnY2DFk_Bfr96rHfZR
    mmRo_tXB0GXGEu6uuw>
X-ME-Received: <xmr:Z2n6YnFV-mkpwqVpqlDUATcHcuZuBZdwSjYQxvgyH1zvapphwfW_S7N6nyZ5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Z2n6YkRTaQ-ZLwSfsxYzg0hua6ndUZaB5YYkQpMnr8BIQfvHB1L_rw>
    <xmx:Z2n6YkxQmycEK4aAP_gflkhMATxyhiOQFA5N2hJeexxe_hMUv46ryQ>
    <xmx:Z2n6Yq4UPNaVPzNVkEbx8QThmWjfi7SCBKIE2jBYE1fEwc_h1DAivw>
    <xmx:aGn6YpqN5rdJxdvOG2ARbBOACK_v06SSlluNVG86i1yhAr9sIRW4SQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:31 -0400 (EDT)
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
Subject: [PATCH v8 09/25] clk: tests: Add tests for single parent mux
Date:   Mon, 15 Aug 2022 17:41:31 +0200
Message-Id: <20220815154147.1631441-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
2.37.1

