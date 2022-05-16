Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEAAC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243467AbiEPN01 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243910AbiEPN0P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:15 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445DEF7F
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:13 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 7288B32009A7;
        Mon, 16 May 2022 09:26:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 16 May 2022 09:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707570; x=1652793970; bh=93
        qSW5tCBL9m0AUDvvIcCoO1oWwK/zzOeVCHTLLxBoc=; b=w1ZMo8t0ipb5FlXpQ+
        u5+1Wjs0tMSbi2bHj/LIEGqHjMV/VMY6Z/KOrUdAXd4LKre8h1Cn/0qN9L8p0b3p
        OrXaecCeEwn7O8PxQjlSNe5QTj6Rn/ARAvVmRVEwTw67zn5hIYFyZB1wgch5FxzP
        gGYgPZ8wnaMZ1cpV0P/fWUn2+DUO8Ma9DQaHAJf2suD6XPEjxNfxljoS19giKXxm
        PCVtg0BwgYstr1pTN1AVnPCaNH/0nSlx5H+Y+O/GOgyExOHQXRaI6uDTTRAQv/zK
        XB/gChj/NR5t3DiYse1NhzysUJU0iYB6lxOa1PO49IRu6L0bwTi6yGi67p4L72iW
        wqAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707570; x=1652793970; bh=93qSW5tCBL9m0AUDvvIcCoO1oWwK/zzOeVC
        HTLLxBoc=; b=GFS8ALmxz3Fothlte2OJ5KFxa9Z0BkT6UfndJzU87v/qsN8xUqO
        CSNU3lSQ38RFWBjxKq0VwEG3ix+r8WfiOczzNJlai35+bz8Y00jR2ADUMz2o0BfB
        Rh+aDoEPx1GwSZgK/RXMUbbG7/8GvXVGDqMR/fol1jKMY8LPsaYTZcWOt9zm7WQa
        ZqgeCHRHb3raNwHZ+lxgTMmItOTNeFm4tujAhJKLkoJxvle5cd2h54rnSyDz3UhS
        j7vEWIW5/f3XYJc9y9UYN7wIU6658L1mr0tGL3LkVd78Dec8B7AUtuxSMUs1EzHc
        zZQRTbhVzalYwjFm1MIu5jXBHxI9lt8bUsQ==
X-ME-Sender: <xms:8lCCYjMvYHa_sKbqq5TIbGg7baLv1JqDAVX4d1h36veY6TEt_XyD0A>
    <xme:8lCCYt8GVtaVe7T18ZoXvZnqK5FQic8oGhK-9qefhi2412dkCbLHs9Ejj4PNWFpYH
    lxjCWvaVmNcSZwwUHg>
X-ME-Received: <xmr:8lCCYiSfwTt5KfuI1OiqNolTp7sQ3BHquKqqvtMGUjIk3af19nd3J5XxLvh1N24l88rDk36mMlPVT4rRG6xvShQa0Dazo_YD2LnrlJs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8lCCYnuGfphUK52ANOj35MuhZj3yRSIHhHO3YqlMkU_Pz3a_YnjZfQ>
    <xmx:8lCCYreIWXoRFcOPorYwjx2SM4pH3-8ucnMdX3CI4fTSjij06BdrkQ>
    <xmx:8lCCYj08jsS4XDqwaJtAM0XVBTPrCgUHYIrXcgbvoBUdgd-KfLydmA>
    <xmx:8lCCYsW2H-e1dkCxNguiquVnaU6yODOYwG2ow7kNA_MfgALM5WlWvA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 11/28] clk: tests: Add tests for mux with multiple parents
Date:   Mon, 16 May 2022 15:25:10 +0200
Message-Id: <20220516132527.328190-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 119 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 87f581c2e1e1..26468fb24819 100644
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
@@ -347,6 +380,91 @@ static struct kunit_suite clk_uncached_test_suite = {
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
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+
+	parent = clk_get_parent(clk);
+	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parents_ctx[0].hw.clk));
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
@@ -1288,6 +1406,7 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 
 kunit_test_suites(
 	&clk_test_suite,
+	&clk_multiple_parents_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-- 
2.36.1

