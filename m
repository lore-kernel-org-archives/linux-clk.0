Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4E8C2BB41
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbiHPLv7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbiHPLuc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:32 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4BCC9268
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:22 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 7903C3200925;
        Tue, 16 Aug 2022 07:26:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 16 Aug 2022 07:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649180; x=1660735580; bh=aI
        FEmTlt/OZHkRxIBntXZoBmDd6aKA3+9acaKfKYgBI=; b=KthzlkESyPqueZ6rNn
        DtpYimLnN1hcVSykPnawIln00vPb/HrLKG0Zpzvswnf1odCsaKIFCxwj5nBAvT6K
        QBeT6ROtX4BHc2vBKE8gzdVlk6xu/Sg8ZBRbCN9C+w+PyL2qNfIZBHjYl4y+K8df
        RyijKWNfRn6uaS7HPd0oUEvB4UE6jtMnbCLD7pCdm86NrAN6KDuDJeZUNEku7VK0
        px13Qpng35R0uxIrdvx3eKitqIgM7hSNku9AoHvHg1dHq9DT1Ii7ExUZ8dkgVqcj
        Zoe/SGx2aEjaAA+ST6Xzqb6hC8AEARmTBVv1iV+mup4jl+PCMyRGB1/QJRF74Ry9
        XSzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649180; x=1660735580; bh=aIFEmTlt/OZHk
        RxIBntXZoBmDd6aKA3+9acaKfKYgBI=; b=YTM6/N5USxGjE0gHrJAaKHgNwLxdw
        il03kV2RjhbQkfFTbiCu/LILDEJFpS8WJD7RNTnN5nHk6uFYvQZkTd0sPeU2YuVG
        CZIBDPqytsYR+pj1lkMAVXXx/AGKg8uOFaj18CYl4XpCouCIE7PUjXi6B0/HAoX9
        bwSuAUgFxc+/NslZMDOcBf7rCQi+HyDdBImuJJt11sU7zkYG7OXXPI0jVwo4vKG6
        0zz8uKACPutSn/BBkuq8Mbw168ECPDsSwyrdb42ljZstfaDJi11iU+sQqAuOwqTu
        b9ynHEHt247xZTlQIQZX1yo/ujqr4dga4uCE7dTo28K/jpWe/MkJ96Brg==
X-ME-Sender: <xms:3H77Yo213ElzBxE6hRsnFQyotwoP8NXCjUnDBGl77LloOR1eCU0g5w>
    <xme:3H77YjEXCKoJFQn4lKqDnpMb2cwQESdsnllQ6NkRyMv9gny8pm6XKm5Dm8GF0Vkll
    IOcJRjv9iPC2bQWZq8>
X-ME-Received: <xmr:3H77Yg4-1IB0SHWb9xg9hPqElsG6gqX9CyWV9QAvFtc5rDOgs8ElVISMSRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3H77Yh1s6idMCkyDtuJDbSHuGiFTaPA-Kc5LM0l_1Q21qfIobMgEng>
    <xmx:3H77YrHa8ajYpHrTWzmrOKp8Qg9GDUCSyd5nRhmChfw8_tIc4dEk3A>
    <xmx:3H77Yq-_h9NwJbkE6S1EDeEPcweXCrWlhHRoarUQZbYruTvFbXP-zQ>
    <xmx:3H77Yj97uNHQAJWhEyD_jKD5qHfe_hA8iw0oDCTR_5DVc3ptOrrGPA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:19 -0400 (EDT)
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
Subject: [PATCH v9 10/25] clk: tests: Add tests for mux with multiple parents
Date:   Tue, 16 Aug 2022 13:25:15 +0200
Message-Id: <20220816112530.1837489-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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

