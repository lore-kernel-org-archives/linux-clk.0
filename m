Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CE1C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239177AbiEPN2C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243421AbiEPN1O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:27:14 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EC329CAF
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:27:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 5593232008FB;
        Mon, 16 May 2022 09:27:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 16 May 2022 09:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707627; x=1652794027; bh=hf
        MzKPgdvRzACC1MXTmAZaomT5laNSZetqpKpmoDTo4=; b=L+78EqeW+GGriU4DY1
        5IiPEtkhj+R4V2o/+++jFItOvxd/4/IM4WjqCNcdNWeDOv2nFiz/8jc3MR1826Kt
        xe+Hsj7/odkCVgMo2dfl3U1OFMy32p+HXVq60OEpy8gRvPg1/naC7SqpCH5JkX92
        LrwJOSFarP/Z9a+zYAgL6z9N6ACioPFeFz5x2fqw22DwSpuNMyRXJZZ++4e/aShW
        9RZQ+ydrpy2zBJnpvCGKlFhsrDiw0jPyrPaGmzhRvQ7oSTaQrepYrE4GfEyhf0rm
        aEqCWclDJxOmic0qdx7Fe5+TZ+zm0VIP3jMY6QTbJw/a3ye0yxtNGv9KOJBrNpAA
        vynw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707627; x=1652794027; bh=hfMzKPgdvRzACC1MXTmAZaomT5laNSZetqp
        KpmoDTo4=; b=E3DbiM9YU4JigGRv1mm3fNKJlBjQrnds85MQW6sWZQD+yHywWEq
        0TIt7ScebMAesQWfAxxBnV0pq2u+JzlqmUcyOhB/ZRb9/MINJ0EEffFZDUyWY31i
        uRsPVFCgP4Mo62t7ItUyXEAPJxD22rtqfNnxMTPPagOBmwD1/BbjuVqkRz0rSxre
        i6gEZ5EhqkIaQnQRsCqek7lXTxt7HScc26XcsaLq59/aQRBjqwzkBeAElH1KmW0T
        TAouOWYaNgR3+VVYQAYPZH9g4yTsCv42EQerCsIUl9eo5izlEeL9mPIY5uHWke3a
        +fNmCcZjs9KbXTX4RyBnX2OqT7sYdslCsgg==
X-ME-Sender: <xms:K1GCYlrk-Rt1H9jNTvt6uuBMVg5s4RstmMQ7x6V_ttsGfCiS5N-6bg>
    <xme:K1GCYnoyfUMMNKAX7FcbndYI4Aa0od2oX6jgYWj_wM5cmIOA2jWPdqCPvp5x3xHrD
    qhUnbOjHlLhES-qyFo>
X-ME-Received: <xmr:K1GCYiNygIPHWQTSVjgUAQunMjGZhyfcCfvEWdnh3Zqt4BmjUQmrZgGU3MV7d51fq52_GVcy4dEBNIuERXwba4lOaxhGnRb1eViwY4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:K1GCYg53Yzs5FI_W-qRJWu8fz8M27h3-iYBXacbEcGhfsjP3-tHglA>
    <xmx:K1GCYk4JfMfX-g1Kl8DtwU2SIAyLPIeKs5xFWFALbgNGaf_QphHXDQ>
    <xmx:K1GCYoim-hjbakmkBuFjbp1cSEStg97ZNVCncZlGpdXdWXAEeDpDYg>
    <xmx:K1GCYhyLT6anRVRUuEztl3ygWmYu_ffo0pXGzvR1tt-PMhz4Y6bhHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:27:07 -0400 (EDT)
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
Subject: [PATCH v5 27/28] clk: tests: Add some tests for clk_get_rate_range()
Date:   Mon, 16 May 2022 15:25:26 +0200
Message-Id: <20220516132527.328190-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let's introduce a bunch of unit tests to make sure the values returned
by clk_get_rate_range() are sane.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 182 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 865457b566d4..b4ae6eec7758 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -900,6 +900,109 @@ clk_test_single_parent_mux_get_parent(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parent_ctx.hw.clk));
 }
 
+/*
+ * Test that for a clock with a single parent and CLK_SET_RATE_PARENT,
+ * if we set a range on both the child clock and its parent, with a
+ * smaller range on the child, the rate range returned by
+ * clk_get_rate_range() is aggregate of both ranges.
+ */
+static void
+clk_test_single_parent_mux_get_range_both_child_smaller(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long min, max;
+	int ret;
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
+/*
+ * Test that for a clock with a single parent and CLK_SET_RATE_PARENT,
+ * if we set a range on both the child clock and its parent, with a
+ * smaller range on the parent, the rate range returned by
+ * clk_get_rate_range() is aggregate of both ranges.
+ *
+ * FIXME: clk_get_rate_range() (and clk_core_get_boundaries() in
+ * particular) doesn't take the parent range into account when the clock
+ * has CLK_SET_RATE_PARENT.
+ */
+static void
+clk_test_single_parent_mux_get_range_both_parent_smaller(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long min, max;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
+/*
+ * Test that for a clock with a single parent and CLK_SET_RATE_PARENT,
+ * if we set a range on the parent clock only, the rate range returned
+ * by clk_get_rate_range() on the children clock matches the parent
+ * range.
+ *
+ * FIXME: clk_get_rate_range() (and clk_core_get_boundaries() in
+ * particular) doesn't take the parent range into account when the clock
+ * has CLK_SET_RATE_PARENT.
+ */
+static void
+clk_test_single_parent_mux_get_range_parent_only(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long min, max;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_2);
+}
+
 /*
  * Test that for a clock with a single parent, clk_has_parent() actually
  * reports it as a parent.
@@ -1077,6 +1180,9 @@ clk_test_single_parent_mux_set_range_round_rate_parent_smaller(struct kunit *tes
 
 static struct kunit_case clk_single_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
+	KUNIT_CASE(clk_test_single_parent_mux_get_range_both_child_smaller),
+	KUNIT_CASE(clk_test_single_parent_mux_get_range_both_parent_smaller),
+	KUNIT_CASE(clk_test_single_parent_mux_get_range_parent_only),
 	KUNIT_CASE(clk_test_single_parent_mux_has_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
@@ -1311,6 +1417,79 @@ clk_orphan_two_level_root_last_test_suite = {
 	.test_cases = clk_orphan_two_level_root_last_test_cases,
 };
 
+/*
+ * Test that clk_set_rate_range() and clk_get_rate_range() are
+ * consistent on a simple clock without any parent.
+ */
+static void clk_range_test_get_range(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long min, max;
+	int ret;
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2);
+}
+
+/*
+ * Test that, on a simple clock without any parent, if a rate range is
+ * set on a clk, it's properly reported by clk_get_rate_range() on all
+ * the clk structure of that clock.
+ */
+static void clk_range_test_get_range_multiple_clk(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *user1, *user2;
+	unsigned long min, max;
+	int ret;
+
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	ret = clk_set_rate_range(user1,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(user2, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2);
+}
+
+/*
+ * Test that, on a simple clock without any parent, if a rate range is
+ * set on struct clk_hw, it's properly reported by clk_get_rate_range().
+ */
+static void clk_range_test_get_range_with_hw(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long min, max;
+	int ret;
+
+	clk_hw_set_rate_range(hw, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
 /*
  * Test that clk_set_rate_range won't return an error for a valid range
  * and that it will make sure the rate of the clock is within the
@@ -1599,6 +1778,9 @@ static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
 }
 
 static struct kunit_case clk_range_test_cases[] = {
+	KUNIT_CASE(clk_range_test_get_range),
+	KUNIT_CASE(clk_range_test_get_range_with_hw),
+	KUNIT_CASE(clk_range_test_get_range_multiple_clk),
 	KUNIT_CASE(clk_range_test_set_range),
 	KUNIT_CASE(clk_range_test_set_range_invalid),
 	KUNIT_CASE(clk_range_test_multiple_disjoints_range),
-- 
2.36.1

