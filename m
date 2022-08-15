Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5DBC25B0D
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbiHOPnG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbiHOPmj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:39 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F91F64E6
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:38 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id C7122320085B;
        Mon, 15 Aug 2022 11:42:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 15 Aug 2022 11:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578156; x=1660664556; bh=aI
        FEmTlt/OZHkRxIBntXZoBmDd6aKA3+9acaKfKYgBI=; b=bk7zl80LII5fWHnitv
        AQ2pKLri/5h8/Nbvmbu23M3ukm1q1l+dlGLSnF7Vq5w80mLOyDJMs7ovglz04aV9
        G6obJJqW2yiMIOh1QNByVMA0jj1JkEmeEiiHfz+/KjAADx4WJJ8EFaq6tM/mmdrn
        HgV1+Y9bLeAyK3gXxGfhLOSwtXpTxJieIJi7lcfDPyO7GmO/IoIXZ5xLN6o2LMyO
        BkEc46Rd2R7+YMr7mho+g90qW2CWEFtiOr1xCAf12t/GaEaOCgvPw3sZ7YMYYcH0
        AI2+xNr7uLANmeoCUjjigVkXqLzuKHH88wFS67FMPR8du1FXDM+6fv5ypbhsC1OM
        oSCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578156; x=1660664556; bh=aIFEmTlt/OZHk
        RxIBntXZoBmDd6aKA3+9acaKfKYgBI=; b=PYAE1DmZb1ZdRM7TY5oz4wIZrpmON
        i/F7XuL4Tdugid0Eq8MZs3lwdULewU0282p9qKzrZeq6TDY0Y0xMLIPpp6kvf1Ih
        T4gQh4HmA/JN5jnpCx/oDxGig5xZkGJqlGAz3WuabEg/m7ulHzFwF3bf6OYAQ9aS
        RaRFSVhJxXwbT9FnvMcXcvKWwFYCY/BZwKDxW/dVUV1wp538IS9pcsptuk/3pYhp
        LvpY8tO9/v2OxfhWhIXPMl0szZMqL5f8LxC0LTq0voxT5AT3GFUK5hK1NwjPSbgb
        heIvfQBhA4LvpGNBZFIeplbvAqhwkMWFGdUHtUF2RQBGybqw72kDln5Hg==
X-ME-Sender: <xms:bGn6Ytvj27GCsKkIrREmeipZ1ICMVUWTJ4nb8k7zMQPxmlUe99JDaA>
    <xme:bGn6YmfiMIl-L5ceaZ4LehVJHzzMQ0lN_2_CybPds54X9I52i-Kbxsm_aKnXbKKsi
    FUqnJeOikMpZXelB_I>
X-ME-Received: <xmr:bGn6YgxIjVUf4KLmKbKxn8M1rtFID2OHp8dNHzuWp9Y0yqt6xeWIpyjj_rZf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bGn6YkPh1XNIH_vx2KEfZxw0qTuev9k4NN3zCy7FOtaO11aJCVL8Rw>
    <xmx:bGn6Yt_fenpQaz0TL55e4QTgLqMWoJ8ctq69EqoIP9lLmgwSXifxNg>
    <xmx:bGn6YkVI7s91Kho-IlC0gd8FGaJGp9hVuFPvGnGD64PCZIxVvUQCGA>
    <xmx:bGn6Yu0nZbB4-hkhPF3IuhgCUmJwKPhCffXLhENXw-Rrty_GGQvhJQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:35 -0400 (EDT)
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
Subject: [PATCH v8 10/25] clk: tests: Add tests for mux with multiple parents
Date:   Mon, 15 Aug 2022 17:41:32 +0200
Message-Id: <20220815154147.1631441-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We'll need to test a few corner cases that occur when we have a mux
clock whose default parent is missing.

For now, let's create the context structure and the trivial ops, along
with a test suite that just tests trivial things for now, without
considering the orphan case.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 121 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 06c9220873bb..1ccafd4fabff 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -108,6 +108,39 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+struct clk_multiple_parent_ctx {
+	struct clk_dummy_context parents_ctx[2];
+	struct clk_hw hw;
+	u8 current_parent;
+};
+
+static int clk_multiple_parents_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_multiple_parent_ctx *ctx =
+		container_of(hw, struct clk_multiple_parent_ctx, hw);
+
+	if (index >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	ctx->current_parent = index;
+
+	return 0;
+}
+
+static u8 clk_multiple_parents_mux_get_parent(struct clk_hw *hw)
+{
+	struct clk_multiple_parent_ctx *ctx =
+		container_of(hw, struct clk_multiple_parent_ctx, hw);
+
+	return ctx->current_parent;
+}
+
+static const struct clk_ops clk_multiple_parents_mux_ops = {
+	.get_parent = clk_multiple_parents_mux_get_parent,
+	.set_parent = clk_multiple_parents_mux_set_parent,
+	.determine_rate = __clk_mux_determine_rate_closest,
+};
+
 static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 {
 	struct clk_dummy_context *ctx;
@@ -360,6 +393,93 @@ static struct kunit_suite clk_uncached_test_suite = {
 	.test_cases = clk_uncached_test_cases,
 };
 
+static int
+clk_multiple_parents_mux_test_init(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx;
+	const char *parents[2] = { "parent-0", "parent-1"};
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
+							    &clk_dummy_rate_ops,
+							    0);
+	ctx->parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
+	ret = clk_hw_register(NULL, &ctx->parents_ctx[0].hw);
+	if (ret)
+		return ret;
+
+	ctx->parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
+							    &clk_dummy_rate_ops,
+							    0);
+	ctx->parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
+	ret = clk_hw_register(NULL, &ctx->parents_ctx[1].hw);
+	if (ret)
+		return ret;
+
+	ctx->current_parent = 0;
+	ctx->hw.init = CLK_HW_INIT_PARENTS("test-mux", parents,
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
+clk_multiple_parents_mux_test_exit(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->parents_ctx[0].hw);
+	clk_hw_unregister(&ctx->parents_ctx[1].hw);
+}
+
+/*
+ * Test that for a clock with multiple parents, clk_get_parent()
+ * actually returns the current one.
+ */
+static void
+clk_test_multiple_parents_mux_get_parent(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent = clk_hw_get_clk(&ctx->parents_ctx[0].hw, NULL);
+
+	KUNIT_EXPECT_TRUE(test, clk_is_match(clk_get_parent(clk), parent));
+
+	clk_put(parent);
+	clk_put(clk);
+}
+
+static struct kunit_case clk_multiple_parents_mux_test_cases[] = {
+	KUNIT_CASE(clk_test_multiple_parents_mux_get_parent),
+	{}
+};
+
+/*
+ * Test suite for a basic mux clock with two parents, with
+ * CLK_SET_RATE_PARENT on the child.
+ *
+ * These tests exercise the consumer API and check that the state of the
+ * child and parents are sane and consistent.
+ */
+static struct kunit_suite
+clk_multiple_parents_mux_test_suite = {
+	.name = "clk-multiple-parents-mux-test",
+	.init = clk_multiple_parents_mux_test_init,
+	.exit = clk_multiple_parents_mux_test_exit,
+	.test_cases = clk_multiple_parents_mux_test_cases,
+};
+
 struct clk_single_parent_ctx {
 	struct clk_dummy_context parent_ctx;
 	struct clk_hw hw;
@@ -1339,6 +1459,7 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 
 kunit_test_suites(
 	&clk_test_suite,
+	&clk_multiple_parents_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-- 
2.37.1

