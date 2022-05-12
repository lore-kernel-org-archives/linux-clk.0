Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62101C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356214AbiELQFT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356254AbiELQFQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:16 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3D2250E8C
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:15 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 37FBA5C0240;
        Thu, 12 May 2022 12:05:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 12 May 2022 12:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371515; x=1652457915; bh=hf
        MzKPgdvRzACC1MXTmAZaomT5laNSZetqpKpmoDTo4=; b=B2bjpNKKry9zIGG4rJ
        rcxRcbMIpCFmWOcmfj80YjA+BXdPfZHFGm6E2QbpQjvSKHZs3+UgN8lS63/x6jXi
        JouwOxaJsRyJX+fmpQZIIPNTX+rGTC81lI3kFmQGRlzQnfVH25d/mTehD3bgjGqU
        KNkWYD14eljttOimgDz5tlCqnqeLNjcXfQDRCR4zGpkf+JcPYiiaZf0hppnzs+kM
        bCWeol74QxDbLIN6KhnLHzABbnAUI5MikfbawX1Qps0yTDR5mP3TN8bEttgo+ze5
        ggfkiuNL7LnIWil9776aBK7L+J3JnH/xWc/hPY5Zh9cibjx/i75PS/acllurjydw
        HT+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371515; x=1652457915; bh=hfMzKPgdvRzACC1MXTmAZaomT5laNSZetqp
        KpmoDTo4=; b=QOvyRDIDfv1gLHEjwAM9pnnCnCTOVMCCAIEZkUZVFts1sQ30J5m
        zffD5Ao8oyq0aiOlZteExcbxqpJm6Dd0093JyJgKiW4Di0F37KFQr9nIznlv/LGF
        ysbvBDUp1dc5j/W10KIsvPUe+l8c2KeNEHuEyzbYrqBAR9Ey+Qpb3H+BAPGExtQs
        AbkJGezpq6pz7tKSKjt8ADHiyXFLUllcCBZGQaytQbCqSvwRN3s/CLGbH9sgB1Jt
        S6g9hLZROzXFtxgRN+RwlG3BVasqG+iZ68b5niBz5/3QYBMjGF4/+veCsQyDIBOD
        6ULzLKRJZ0wwDzW3psikuSL7OuwZZIOZzcg==
X-ME-Sender: <xms:OzB9YmF2gtKTzfIvqi7TAZw3TQRr6ljwdK0Ef5Dj2zFmljcLmCPpww>
    <xme:OzB9YnWpSV9n_i3UKsC52FiWhl3xG8fG5TT_jx48tM5ZIMweZXanMEVQP2OXzwYvT
    lH_ekwLCOeQKH30Yy0>
X-ME-Received: <xmr:OzB9YgKd2GX8D8BDl8mNz8FvW7EA53ZOCK6VGo4LNu5Ig2QR38qW8akRah2SFQt_4RQjWOxf4hDV1rJ9cakN5Udihww-g0ARGHt_ItM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OzB9YgESBrmJxj7cw1YQ_iSup2Hv6oHA0Baevq9l8uEnXDwSa9f_ng>
    <xmx:OzB9YsVU8u4xVwxnSm2q0k6xtHr3bmbXgjZcGZmoyl74Fct1VoMSlQ>
    <xmx:OzB9YjOy2fGuWNgMPgfwH4kpS9YQtFE8LtvJc5083kU7imfqfwYY3Q>
    <xmx:OzB9YlOi22mNmdOqE05kEjvIwFXJIF4z0BMHNIU3mp8wwrs01kCcUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:14 -0400 (EDT)
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
Subject: [PATCH v4 27/28] clk: tests: Add some tests for clk_get_rate_range()
Date:   Thu, 12 May 2022 18:04:11 +0200
Message-Id: <20220512160412.1317123-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

