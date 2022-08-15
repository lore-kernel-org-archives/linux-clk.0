Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D4EC282E7
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbiHOPnH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiHOPmn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:43 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943C364E6
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:42 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 15E2A320085B;
        Mon, 15 Aug 2022 11:42:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578160; x=1660664560; bh=Aw
        WgPoVHSnPTo2IMwshR52Q1Z+CTHlsgj0mUcoF0ftM=; b=WKlp2tjfd4RYwI4Dq/
        mLTINlbxQGzLhRrZAoYXn2g4vlQClK3j7aqOH0DbaRUEW4ODCT80Rywv8vsmRzc5
        PezI9EPi900RSM/bF+Gn+O4VNm0LEX6GhkXKYTDInhmvY9/BykBTyc3Vypf8IG0H
        7gUgKi/ofIdQ9JecjIlLsQ4c27WXBRQPAkghzASAg+UFYx3bMJTOxjfhV8aS3Nuc
        tm0vIRcZYx/34bP9tbUCZiWCmuGAO5q3SYUbY3J9wZ4Om/bpg3y8wGkW7NZPFSVy
        58U7/ck4+1tI2TmgdM5ZS+lo13C8OPnoe02W9iSttDHdIFsm972zCWLGZpl7VNKV
        3b6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578160; x=1660664560; bh=AwWgPoVHSnPTo
        2IMwshR52Q1Z+CTHlsgj0mUcoF0ftM=; b=oYYrUtrrs3lByoMLtAqWq0Tikpn+z
        X1ooBME/OCJZhJL5Z9R+Ej1SnZdGjr+ZhvgOWRVXpDGiNI16VencxYou/L///FHb
        1j+9IWHexqeWv6+45c6rb6/qhjhqQm36Qxh3yn9cMCRrBOmhGJ5iyhfr16aFp9tD
        E7cntpMhr6Bd+6sxsQQ2KVCWt7zImGjIa1PRCUNi36bqvlaxctgn32UVvbJz/OYB
        z12svt1S+oX9ojJUl/aL8p5qRP2ybSFJ00LH5LxRoZxXyYCC6L+OfJp7dA4Jh+gC
        zdcH1FM5P/O/qaCVdl5odmV+wCIM04eVnkMxXg/6zs+ivH6/c3Y36IEbQ==
X-ME-Sender: <xms:cGn6YizJF9V7fPIoN0UbmdA3pxD8lmrnK-GUtBd7XJdOuVlGYcyeFg>
    <xme:cGn6YuRLZP4zTOvlPq46ZZfCIaMb9uixe55mBAEx8LvTLCOBxJR1haU51shxsv1Y7
    MvB8SqAttLt2y9DclQ>
X-ME-Received: <xmr:cGn6YkWAcxLXX6gPo8pwemdLxnTLEFtdKzfbaVzPwF9nuNYBt2YAWuEjIasl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cGn6YogH6_pX4zzDDzXsqcVS7calAImR4pisNuyIwVJTT7nv0FBicQ>
    <xmx:cGn6YkApehxie7VmY6qEtDH0DaFPJZ-8YoUN0EdWjpbPHrGis5szHg>
    <xmx:cGn6YpKs-ehT8zmy6oYUqnxGhAhL0YkiqJAj5d0M4-dy4mevwnFOug>
    <xmx:cGn6Yo6LvXAbCbp9RjGMwXVEsZUeLrG5uQ0oTqNcZKWgzHOAxXAhpQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:39 -0400 (EDT)
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
Subject: [PATCH v8 11/25] clk: tests: Add some tests for orphan with multiple parents
Date:   Mon, 15 Aug 2022 17:41:33 +0200
Message-Id: <20220815154147.1631441-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let's leverage the dummy mux with multiple parents we have to create a
mux whose default parent will never be registered, and thus will always
be orphan by default.

We can then create some tests to make sure that the clock API behaves
properly in such a case, and that the transition to a non-orphan clock
when we change the parent is done properly.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 237 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 237 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1ccafd4fabff..ceed49c5a88b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -480,6 +480,242 @@ clk_multiple_parents_mux_test_suite = {
 	.test_cases = clk_multiple_parents_mux_test_cases,
 };
 
+static int
+clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx;
+	const char *parents[2] = { "missing-parent", "proper-parent"};
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("proper-parent",
+							    &clk_dummy_rate_ops,
+							    0);
+	ctx->parents_ctx[1].rate = DUMMY_CLOCK_INIT_RATE;
+	ret = clk_hw_register(NULL, &ctx->parents_ctx[1].hw);
+	if (ret)
+		return ret;
+
+	ctx->hw.init = CLK_HW_INIT_PARENTS("test-orphan-mux", parents,
+					   &clk_multiple_parents_mux_ops,
+					   CLK_SET_RATE_PARENT);
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+clk_orphan_transparent_multiple_parent_mux_test_exit(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->parents_ctx[1].hw);
+}
+
+/*
+ * Test that, for a mux whose current parent hasn't been registered yet and is
+ * thus orphan, clk_get_parent() will return NULL.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_get_parent(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+
+	KUNIT_EXPECT_PTR_EQ(test, clk_get_parent(clk), NULL);
+
+	clk_put(clk);
+}
+
+/*
+ * Test that, for a mux whose current parent hasn't been registered yet,
+ * calling clk_set_parent() to a valid parent will properly update the
+ * mux parent and its orphan status.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_parent(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent, *new_parent;
+	int ret;
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	ret = clk_set_parent(clk, parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	new_parent = clk_get_parent(clk);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, new_parent));
+
+	clk_put(parent);
+	clk_put(clk);
+}
+
+/*
+ * Test that, for a mux that started orphan but got switched to a valid
+ * parent, the rate of the mux and its new parent are consistent.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent;
+	unsigned long parent_rate, rate;
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
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, parent_rate, rate);
+
+	clk_put(parent);
+	clk_put(clk);
+}
+
+/*
+ * Test that, for a mux that started orphan but got switched to a valid
+ * parent, calling clk_set_rate_range() will affect the parent state if
+ * its rate is out of range.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent;
+	unsigned long rate;
+	int ret;
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	ret = clk_set_parent(clk, parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(parent);
+	clk_put(clk);
+}
+
+/*
+ * Test that, for a mux whose current parent hasn't been registered yet,
+ * calling clk_set_rate_range() will succeed, and will be taken into
+ * account when rounding a rate.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	unsigned long rate;
+	int ret;
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(clk);
+}
+
+/*
+ * Test that, for a mux that started orphan, was assigned and rate and
+ * then got switched to a valid parent, its rate is eventually within
+ * range.
+ *
+ * FIXME: Even though we update the rate as part of clk_set_parent(), we
+ * don't evaluate whether that new rate is within range and needs to be
+ * adjusted.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent;
+	unsigned long rate;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	clk_hw_set_rate_range(hw, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	ret = clk_set_parent(clk, parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(parent);
+	clk_put(clk);
+}
+
+static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate),
+	{}
+};
+
+/*
+ * Test suite for a basic mux clock with two parents. The default parent
+ * isn't registered, only the second parent is. By default, the clock
+ * will thus be orphan.
+ *
+ * These tests exercise the behaviour of the consumer API when dealing
+ * with an orphan clock, and how we deal with the transition to a valid
+ * parent.
+ */
+static struct kunit_suite clk_orphan_transparent_multiple_parent_mux_test_suite = {
+	.name = "clk-orphan-transparent-multiple-parent-mux-test",
+	.init = clk_orphan_transparent_multiple_parent_mux_test_init,
+	.exit = clk_orphan_transparent_multiple_parent_mux_test_exit,
+	.test_cases = clk_orphan_transparent_multiple_parent_mux_test_cases,
+};
+
 struct clk_single_parent_ctx {
 	struct clk_dummy_context parent_ctx;
 	struct clk_hw hw;
@@ -1460,6 +1696,7 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_orphan_transparent_multiple_parent_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-- 
2.37.1

