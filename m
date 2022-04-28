Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E99C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350325AbiD1Qr6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350323AbiD1Qrz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:55 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3337B368D
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:39 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 5A7945C0058;
        Thu, 28 Apr 2022 12:44:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 28 Apr 2022 12:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164279; x=1651250679; bh=yR
        66UaP+8oGiM4eM8+cWLGFS/GujmYwWPTNs5h13+ic=; b=CTB1eURZyqfxgsgf50
        ZhvX5rlBDf8e8vcaTAJI9wbafmdpKDyl0YxZS3BxXI8Y56WR5SW3vof2d32JbAJp
        vdyclXn60/YpOre8cWEMx3p23/gqH/1Nkn+xQkOOk6P2nvXBgTj/iUk5Hvav3+3t
        GQPeAljvvue00gg9evG3OG1zQDKGnoNzm2dqWMuB/VoXqkHpumexx7xQ6d+o6mNb
        l8NBjbVIwtBBolf0t/h5K16EzvqW8qYtU3ttuk9K1sX3EFYIkuXX6Cr9Zgj4rCKm
        7eumHgYtJXXvDJHQZw+r5NSmyUNf3LUM6nhXm1S+z094kLbYjS+gGm31aI/Qsu8p
        HZhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164279; x=1651250679; bh=yR66UaP+8oGiM4eM8+cWLGFS/GujmYwWPTN
        s5h13+ic=; b=QNC/rjNnxH9+pDvrQv8NIMr/wZHwH0sYwvXUvgkHUORWqWN9UXo
        NL3Y95gGKjq9lIaqijnAkdibKGu40OQ9Y7Es+jci3s7YXkwrJFI89UEhJZLmPPbo
        2zpUWxzV4Db5oVMs1g7lO528kRxF0GnvwidCo01CbYJraOVZCG5EuIOyk3rBGxkb
        CkJEp3M9dngDzUT0+Jv2ZZAbY5FHPqRau0bpFu9YZcJ5kjW2tLFY0Cx2qr7Ubjv3
        5vnIE3By/72WwuwUM6rrSNL6jT5McIqlpUxjQqjJFbEygGK3i3EIJWdEWBl0yhia
        WEIurLDAEsMBXs4g3PQD9gIUmMGuXBShIBQ==
X-ME-Sender: <xms:d8RqYmaYQ0gVU2JmF5zK4hpHa0hMDbmlqsoPmJtBoMyD2_vC19JCWw>
    <xme:d8RqYpajsbmEf43JE8Xu_FrD2DrEriHJBTQTD1FCX0hUFoTyQHeiB2u5RGh2658Ks
    LsGE69RAQHINoHzgo0>
X-ME-Received: <xmr:d8RqYg_DQ4MhsQjy9SZOi9mRg5SeR_rQh4i7q2L6a6X9lBNmG4B3L6kkQ1_bVgVKT6oT49Mohq6tPvJC6U2et237oHTwNZbX_Ah2oEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:d8RqYorz0N1MuW1Qd5pWGwfgAwQF7XIRJ2718YRTxo3ZgJDj70bE0A>
    <xmx:d8RqYhpyQZiuDAIKTyPHF8VIHi3yctWCLruMZM88JYbYkcC_5fBghw>
    <xmx:d8RqYmSNP92D8W78jExd3lI26RqVtSp7NsHznwp07V5JcCkvtJM7Dg>
    <xmx:d8RqYui-sC_um6bWG7FqJ2D2GwVICTdl8m0LfsuPAOBJdAXqeUsEVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:38 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 27/28] clk: tests: Add some tests for clk_get_rate_range()
Date:   Thu, 28 Apr 2022 18:43:37 +0200
Message-Id: <20220428164338.717443-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
2.35.1

