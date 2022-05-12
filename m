Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1B0C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355985AbiELQEr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355936AbiELQEl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:41 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D455F26F
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:40 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 06F255C01D7;
        Thu, 12 May 2022 12:04:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 12 May 2022 12:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371480; x=1652457880; bh=7j
        Umg9fflQZndbMyfj+08Cjg6URp44e4iyBNWKgBr9Q=; b=qy9M/0txxr80wHGmGD
        /9BU8SA0a/KchkEtg8rwx4T7u6tD1LYGVAmyByJrKsTOYNRXqH2zZp0PcxcASAu4
        KixlFflgvHr5h6DNNBB3vgOpWGRqlakElNfTQXfMrc6F3bkF+E/JjuKeTRdQQ0c8
        rC0PAlFHAnILYvbXM00sLRGsW7WJP/YZ/qcBRf3xYMYU3atPKeBBR0vFeAkDA1qW
        JBgfgFnkrWB1oD27wxK/PuPYF5XoGpFxK0TN8+pDYs6TS5cR/kuSVTqsVECxVMcb
        3Nb9ogv5ksoyPNpfqZ8bFWwlrkzcH73vgd9us3vsmIfEin4uPxvhR8IHj1DDtL48
        Xemg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371480; x=1652457880; bh=7jUmg9fflQZndbMyfj+08Cjg6URp44e4iyB
        NWKgBr9Q=; b=fIiHkFynEhyxVbFKC84LQfjtynjEDOsOY/IHePxCdc8QODPAE1X
        lAJllr98hAvhOufq6OU3aPSo0CgJIi9Xp8Vb223G8AwX9xK1wVl2U5X6HW3vpfQg
        Xgiy2tpgdPxgPZBrYfg/QoDTQHL4jCRoANqKOd/ROonoxMfsvLzfKp6aY6U4NJLf
        C41QOf1tpEbKZSUhCIIZWuty6X4QB97QAMYQqhoHtadlUM4JGXxyboM66RNQ5ym/
        8ncWG5yvo2cf+1ACkWRN58eDnM3BOZQ6lRrHZPPHgSw68iowce6ftkhfYE7xaAVW
        RV//rhdQlbMB4dCw8dKG9mz/clDtQgvS09A==
X-ME-Sender: <xms:FzB9Yv0y_qTYqdhP6IChl5nqlcy97k_zgiYax94dQ99XPXfDcs-Xkg>
    <xme:FzB9YuEfPVFyUWhNJvZKMzs99tmRTh1zNfTM8kqar5JD0s-O_URWa18fUsS06wLXk
    vuvTas2YUpGjbeO548>
X-ME-Received: <xmr:FzB9Yv4Qd_oGykQmJxWoAmLdRhUW8TbzKBSWURsq5LUwnXE9zMpGdmVK9neqGZctfVisX9_YEkORKmkCDwQkvtRTFiR3Pp22rLd41X4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FzB9Yk3cAdEJBfgFSFdVCSdIxpk1WsWUjcCxu2Mn2sWwYm_Qh7d2Pw>
    <xmx:FzB9YiG_98LIs2js23etOSHy6G8vD_zSqaByS2YcPSO7esbh4lgr4g>
    <xmx:FzB9Yl-jhuq453yK15G6dpXJ_pK7jyXoVhvZBCyE4pUlj2AH7M4vSQ>
    <xmx:GDB9Yq9bwPvXdhPxyuhERcnCTKq1FUdzIf42chI8e3jNcTwTbChYSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:39 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 10/28] clk: tests: Add tests for single parent mux
Date:   Thu, 12 May 2022 18:03:54 +0200
Message-Id: <20220512160412.1317123-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 186 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 177 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 429e96796c66..87f581c2e1e1 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -352,6 +352,181 @@ struct clk_single_parent_ctx {
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
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+
+	parent = clk_get_parent(clk);
+	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parent_ctx.hw.clk));
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
+	struct clk *clk = hw->clk;
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
+	struct clk *clk = hw->clk;
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
@@ -388,14 +563,6 @@ static int clk_orphan_transparent_single_parent_mux_test_init(struct kunit *test
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
@@ -440,7 +607,7 @@ static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] =
 static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
 	.name = "clk-orphan-transparent-single-parent-test",
 	.init = clk_orphan_transparent_single_parent_mux_test_init,
-	.exit = clk_orphan_transparent_single_parent_mux_test_exit,
+	.exit = clk_single_parent_mux_test_exit,
 	.test_cases = clk_orphan_transparent_single_parent_mux_test_cases,
 };
 
@@ -1125,6 +1292,7 @@ kunit_test_suites(
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
 	&clk_range_minimize_test_suite,
+	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite
 );
 MODULE_LICENSE("GPL v2");
-- 
2.36.1

