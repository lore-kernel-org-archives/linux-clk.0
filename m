Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE20C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbiDHJQA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6502B12A8EB
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:57 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id CAD205C00FB;
        Fri,  8 Apr 2022 05:10:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 08 Apr 2022 05:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=IVetLbsFqs1VbVHf1K+zxVwktmy6B1
        evD+8th6s9PkY=; b=MFPBRGPSfW6KXI5s8w7tvmQahd5jNJTPKXFmtMTsBwu/wf
        ff2Jp3xGrVMP9I5S+XCIBeo73zKADGXQf3WI333Q02POl6nTOnzk8DFXQEl+Pq17
        co1yMRlFPSFo4MwNPB2tyZLNqzWQLmId2l0oUq2QBE2qO0V/+1vizxnQVSjK1d/U
        c+Q8nquI0iVvud+wX4Iv+o3UL6ReDkJDKvFkjPr8eEMre6CRAqM6nWjQhjRJv+NG
        O+JRY8ifUPwMwQ0E8wr50am1Qv/9ejNsAIAMhVRE+KH9KNrT16BqQorZZ2VSSNTK
        KLZmlI4EQrv8kH9+towJ5lOl6Cd1wzaSotH8+TZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IVetLb
        sFqs1VbVHf1K+zxVwktmy6B1evD+8th6s9PkY=; b=VT3NTTm/9TgqFTxosqv7zN
        z+OHhwPWu3q11EZrC7Y5NAtL1SIAmTZdn2iJG9qu3I4qKJcwXcz/2S/2dvKt2fPN
        jOKSt669zwx46GWTSFKML0pVS1SNvGuHK+b9Atb4ByM6Ep8kp1n2XqYDiFCKjWgv
        FLJplF6K48XzWaZDzuDTTAQ8UVj5pK0QnTXWKOKap3rAUU3KBR8WOAaRlFMrmm9Z
        38YgjbXFYm1FTHkbdsb/xMkyDeIG6fUONJtoQsNF0MYZgU88AMT2zi/HL4e/GokF
        quN7hOWgGGzRKOxTKAgeqzvs6O3eAPe92agWIemGs/dqvqLB17oPHEqJC3xTrONg
        ==
X-ME-Sender: <xms:IPxPYo-uWnTCIhoYBnQZdt5rAOu0V2EytszvPQbWKF9SS_dDd2PO-w>
    <xme:IPxPYgvpOjmp5MR1T_j6wyUrFwxG50eqrBxFYYuSPBct8IuxuD4A1Bd8PksSc7Lon
    Nkc0zF2TlUH-TKSv8s>
X-ME-Received: <xmr:IPxPYuBz-aKmBQ4r5K5IJZVNlb_EVWohktpCk7kIfac7FK8fMof-eBDPp0yUaG9Q--9VvjVWYXC3UqNNgIUZmDli_ns7LoZ7W6O4k0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IPxPYocCtdlD_d7ik1_8asyu6Lh0vvnwnk4U2CcULw2NUc4RpgPn-w>
    <xmx:IPxPYtMhD_W58E2aByFeTPD-PGqWQRHOQy2Xp49e4ePPiXTZ39zVSg>
    <xmx:IPxPYimVP5lJNYYE00jDgeeUseeqck3l-TJHRhhmJrmz6_R1od-eKg>
    <xmx:IPxPYgrTO5OaJRHvmzZBP-ZY2ie-mj2MeyhfZvuJssl25xxcOEwdIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:56 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 07/22] clk: tests: Add some tests for orphan with multiple parents
Date:   Fri,  8 Apr 2022 11:10:22 +0200
Message-Id: <20220408091037.2041955-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 173 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index caf2a28ac4c3..f51a9ec3e452 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -465,6 +465,178 @@ clk_multiple_parents_mux_test_suite = {
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
+ * Test that, for a mux whose current parent hasn't been registered yet,
+ * calling clk_set_parent() to a valid parent will properly update the
+ * mux parent and its orphan status.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_parent(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
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
+	struct clk *clk = hw->clk;
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
+	struct clk *clk = hw->clk, *parent;
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
+	struct clk *clk = hw->clk;
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
+}
+
+static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate),
+	{}
+};
+
+/*
+ * Test suite for a basic mux clock with two parents. The default parent
+ * isn't registered, only the second parent is. By default, the clock
+ * will thus be orphan.
+ *
+ * These tests are supposed to exercise the behaviour of the consumer
+ * API when dealing with an orphan clock, and how we deal with the
+ * transition to a valid parent.
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
@@ -1410,6 +1582,7 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_orphan_transparent_multiple_parent_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-- 
2.35.1

