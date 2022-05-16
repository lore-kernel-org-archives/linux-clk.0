Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC696C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243983AbiEPN01 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243929AbiEPN0S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:18 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3168EFDD
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:17 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5F4FB32009A2;
        Mon, 16 May 2022 09:26:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 16 May 2022 09:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707574; x=1652793974; bh=6R
        ca0rgmY0A7TP/R/uG31fV4Y5zR+IGzDI5bvd2/7YM=; b=Vb3v4zIzHR+C5CDZbe
        cZ14GcqyRYJGtOPM+OgsFKvZJRWUjflGsAfDKVj/cXT/oSjRW83jqdo/EkP6Fx7Y
        srAXu8eE1TJXPxxKj4VZQ54kvjVdWYr6lMkWYRQNc1OpfypS2PNzAUQRoaOOPZrW
        xDcQnF/mcxK5lkg1r9rmCXd4qUIGfLeKp3v1fV1k9RxBfJIiQkA96547ojpYN5y1
        dSRS2MQvUh8lbBOs/LQDw90tDyadixGbl2nTzGE1QBUbtckkkooBQ4GENHaV9dzx
        9jAOvXl3w5m1syoLB3ChO+OwEf8a7SZWpKbHtV/2d6YRHHz85GNENl9t51pLJZQD
        xCow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707574; x=1652793974; bh=6Rca0rgmY0A7TP/R/uG31fV4Y5zR+IGzDI5
        bvd2/7YM=; b=Ebok9fdwQjJCJtv7UWIinvzJJkLOtRbZhjxMvu8ypOSRoxjTDPk
        87/iGs7WTtzDHOzXkzp98XT7lJEsfnZH6ja/rcSUP33IyNM1Uwgq4fpZHuxzbda3
        4H/Aw3J6AJ2pZZBNYgxG7VIMyCrY5ew7vXUjx1z2pj6IFJXxTFWgPjwALidNt1wc
        byL7jqxyMvFfd4ioEKLFtKobxMezR7kuMVcvK4+snSxTWEzlZtsrWGawu9dauBcK
        /hu7ZH0RvlasKItziZ3zOjXqdlnGJr0yCuZ/+fJx2awoT8O0OqG8M+ffHl1Ar/0Y
        tiKWedSC9Q5Vm/jzA9PgdOLkPDGAHGfEO+A==
X-ME-Sender: <xms:9lCCYvUF0Hwj2RfappNya8fBQuLN9y8SpC2GDGhhkbh3aGnYX9TzVw>
    <xme:9lCCYnnDvkUIjeqxrr6yScs8Iekd-HPUHDeHjCIDhFCE2177p_0EMOlEX58quL5Qm
    YcFJUdEJFtT5nZKvHU>
X-ME-Received: <xmr:9lCCYrZIxC7OKPIPs2ATq2s4syzGtAXlt9H0CbF6srCGogUwyaM2-Ar4trstlij-iPCuCKuIOZNgBCaGV5upN_eA73ZODpBC7ZW0Erk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9lCCYqXlkWNI6erfSkvBcymYiGDbFc-RHFVsxAwwrdx_J4gGZvHiCA>
    <xmx:9lCCYpnJ0H8eFNLp4rIWSly0mh5Ly5yvrsqy6iQFtbJ3NXxyKKaTdw>
    <xmx:9lCCYnfo9whm_Kt5a6l6H5B-tmOrIkhQhWc-SKi2TasNxCp0W2j2ew>
    <xmx:9lCCYif0UF9GkLJ2kVq38yPpJ7CbYut5gnqp0xKrxaNoG7r7NzD_eA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:13 -0400 (EDT)
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
Subject: [PATCH v5 12/28] clk: tests: Add some tests for orphan with multiple parents
Date:   Mon, 16 May 2022 15:25:11 +0200
Message-Id: <20220516132527.328190-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 210 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 26468fb24819..8de6339f4f8d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -465,6 +465,215 @@ clk_multiple_parents_mux_test_suite = {
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
+	struct clk *clk = hw->clk, *parent;
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
+}
+
+static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
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
@@ -1407,6 +1616,7 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 kunit_test_suites(
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_orphan_transparent_multiple_parent_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-- 
2.36.1

