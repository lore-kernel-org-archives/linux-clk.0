Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9699C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbiHPLwL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234875AbiHPLvf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:51:35 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FBDD7439
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:28 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 115E732002FB;
        Tue, 16 Aug 2022 07:26:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 16 Aug 2022 07:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649185; x=1660735585; bh=Aw
        WgPoVHSnPTo2IMwshR52Q1Z+CTHlsgj0mUcoF0ftM=; b=iT/agXPwxKJ8V34q1K
        DtKa9H07apt9iR1j38iZKUo+fFwfAiBrnEAvdRy42K3RZyqR3xiVssmougx9eiFX
        jx5LdbkNcJ/RtBfOB4ar5H4l2qRmcLP0OUnM2S2gS/D2ivXzsxsI8CpfzJ9Sz9Ya
        J63MfKL09s+Z0EdaJ2KUvPCIwNSDbti6dhCullTkNaT7w+pBczadKwXB2sh4KGGn
        CkMPVRJR0rA/o8nbeRh80WcfGBxmxOp8zZ1QCdXO2x12ZgaJv0/b0xfI3XXW4x8x
        fztn+gbyWeLxvKwExpM65PyZYwaAaW9FHfLmsFPwUbc8nVb1CvDdOwfx8MQ5Ij74
        NI6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649185; x=1660735585; bh=AwWgPoVHSnPTo
        2IMwshR52Q1Z+CTHlsgj0mUcoF0ftM=; b=lX5lhCrcIO9hm2rsl92flEwgYnKDg
        k6UdQ4F9+UL9EMYXsIlZ6qyDspBfBhQLiFL0AnND72UKA39B1KFxsNrFTGmFpEMR
        DSi/c23Zdgcmaz/gRLpQte0RV5QYWeT1pjm4KGyPVogo7iIJ1IJUsjVawJzlC9bm
        z38YPTYrsJyO8X2NXHsOnBWhAvevJElBgYR87ctIa6r1RnIh9vWptrE+gEJQMbPg
        CDCGq5NDwfulgkM3DHqQ8Xc1PGu2YjHkKt3HpvqlMOgqYjaV5zOasKP3s1Sn3hjQ
        YPTAtHTVBJYWPUPQFOC8iL9ZjEoyJmWqmClSgqDp+MPjXbf69Lfjr1T+w==
X-ME-Sender: <xms:4X77Ym_UjPUGLWX2hFwojI0xpkz78EfAVKRZ09Ke1YqKbFD14G0jyg>
    <xme:4X77YmtJHHRaefQeSPmI0u-yZDzaORK3EORh4_UsS7WRGMYMNV97qUC5-MHc-IOb8
    _Rloy5pmZ4DgAc96v4>
X-ME-Received: <xmr:4X77YsC8BUr5qJ90-onCyc9PTFXx3nGX_GH6mMG4FFmPpZ6duXQpBVP6MwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4X77YudJ6XEuvhBqdq53h8LhN8jIwkzJnWgnzPJksyvuTlQeftYoQA>
    <xmx:4X77YrPF8ce-PXIIPfpaPzCrx_-Uq7YVaVjs9duQQGFzmumoq1z76w>
    <xmx:4X77YombelUs_dYaL3tcwt6JTIgOWiZJVZShi5Ot50iQHCriNlT-Fw>
    <xmx:4X77YsEqce09gfkFw4jRsbBkeeC26BENeuv1tZopHkEXaxqncrmLlw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:24 -0400 (EDT)
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
Subject: [PATCH v9 11/25] clk: tests: Add some tests for orphan with multiple parents
Date:   Tue, 16 Aug 2022 13:25:16 +0200
Message-Id: <20220816112530.1837489-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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

