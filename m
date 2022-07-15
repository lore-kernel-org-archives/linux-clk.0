Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9EEC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbiGOQBZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiGOQBT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:19 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9435774379
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:14 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E8D7D32009C5;
        Fri, 15 Jul 2022 12:01:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 15 Jul 2022 12:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900872; x=1657987272; bh=Ec
        hzXUy/WMG0ajsswLpy/svRs16rcNc/splRKRFm/2k=; b=UqFNJm+JXwARQjzO2R
        +mtSBxZfp+Yintg6PtA2fXp9q751q5zoMLOhWu0SNVzziCVSiN7wIQcjgEpgr5tY
        YoOMM4AweOCUPZg9p0mzcI+EI4ozGMmc/Azpj3rR6Xofcg7uGzQkxTibTHUdGclt
        TPCwzoumiXSJcMP1sdb5nh1Vn0/jC0FATJN9ZT9VdSCoIoP/GtutyHaisM1KEu2A
        nYiq4fsLHcXM6QQkBZMcOTzFhsWDViRGeQ02m2L2V1Bdp53wqv145zNnlKk/FMKD
        o2UZdTkuzlmhh56q+NVNzDhF7IHskKi/JNhZAGLw6InHmLUObHXmmKFOjJytpTi4
        xSNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900872; x=1657987272; bh=EchzXUy/WMG0a
        jsswLpy/svRs16rcNc/splRKRFm/2k=; b=nxaQgtEf1TgAEPHa+YK4+FFr8nSmF
        o/yedsEjHAbZ/si8iW2CKpWPNskGDu7hm0OjWRYy00U4Te5CB7Dh10w6aQWsqael
        LQxXOP63i+dtAjk6pJpNfd5w9eZk6iSv4neQkYB0MxfCVpRtZ3WyIYUyksWbTzDt
        ww/MgK2E+82ZXK1+FFy3wIW+OV3bqivq9Raxm7lTk/3FJ4QMp5en3xBF994MEEpD
        8YYOW/T4NzY1rv/kN9Nsjt46a1iUIe1g1PTZyr+JIvoJfvod9tXHqN2Pi5jqTK0C
        +1Y/S3HjFK6cyserok+6JofxnqqLBUKgQn807t0MbHEXpkWXSscrLD5cg==
X-ME-Sender: <xms:R4_RYnG4AjOlQKabo18q98UE8IK6UEONUCXSGo8XZzXiI_JEILM3wQ>
    <xme:R4_RYkUqAHhQ-m6vjwAIe30a0ImlEZznw0ymCKZPOqzdQ-4eNC1UIFaRXSdUgkh27
    lxjGhyJDDzyTvWAHNg>
X-ME-Received: <xmr:R4_RYpJVCAMaGRSK74Ss6pDuOh9iv7P-W2QDhQyTg1a50lh46pVSQrWQG-KRxmG2kFE-VMqI44XFKrrEIusgIq-zUldlGYBp8lPnUCk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SI_RYlEH6YpB_5AmM9yAOgwhvroyvjus4puIE8Nmcfo0uqGiRrPTIg>
    <xmx:SI_RYtWnuroQ0oJphwh4gkbinybLr7xkoppVy589g6OjR8VOTJNssA>
    <xmx:SI_RYgNwhSN0cK-i7exM4lq1Lx8QwxRDQICZVje_75WrBPbfmhxs0A>
    <xmx:SI_RYmPZnlv5O82MaudryhWau8Uf5qazw0a1BJ3gxt1QaR1lo7EBoA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:11 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 13/28] clk: tests: Add tests for mux with multiple parents
Date:   Fri, 15 Jul 2022 17:59:59 +0200
Message-Id: <20220715160014.2623107-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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
2.36.1

