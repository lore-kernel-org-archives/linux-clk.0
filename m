Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789B5C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 16:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376287AbiCYQN3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 12:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359683AbiCYQN2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 12:13:28 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BDFBB0B3
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 09:11:53 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id BB9C05C0126;
        Fri, 25 Mar 2022 12:11:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 25 Mar 2022 12:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=RFquksmpacjSeTqjfsccpJfJmo3zhB
        IHT1ConYdBl6s=; b=ibgXTv8SAYM3UyOwArIt8WvbdbZ4i6Rux5Sf8/DLNgXAfk
        lcD/nm0WeVOqptuic64XY+LRUrzScm5Y5Z1D0FkloDzOhsSBpRuiBQWI2ZDeiJE7
        MARobzi98IJrx25NeCxC+M5WnsyYpgdBW/sv5zJGhUenyscNEDVP7pvPrWEsPwj/
        yI3sxqzPum94uZWoBbGQsEkiq78VPJEAw3Oh8ROI6zvnzN88vc7Ts0JntOBkrVKY
        tKfZtA5DE7e7RIP4qFr+Wa54DpXDHK4cU+0azXnMqveit2wnhjJALTCcIdXtQ5je
        cMRiwozZFlT9QAim3oRX8a3FrC5NwwfYtr19384A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RFquks
        mpacjSeTqjfsccpJfJmo3zhBIHT1ConYdBl6s=; b=h6uLBh8reKAAhs8aAqVkGr
        /ydf+/HBv+bqHjy12h9T7fHHXt8vjeTzDrWdfdaykIQtuMNb01qLY4uzBC1u1c4v
        m6s22LPRcXNQXQnrfZMgJvxv/4r5RkhHzPdidFEQT1ZpYFSo2hVRl0I2pkm8EtNK
        G44HZp5T4zJvdl0C2THUnQGGx0uMZWAWNhsxPfuAOQqY1g6iYS0+JgA9nfhfnIa8
        2a/qDVfJP4Y9FDheEJems4SO8hq/w5X30dSxcGSI+AJhXP/nEloYEg2uHiejxrjD
        io5roP6l1/84S3axQMUkg8Hv9a3GGh6QUHQV5mQmKBaLcfmU6CIiiUxE80xEm4pg
        ==
X-ME-Sender: <xms:yOk9YsulV3JnWFWAv_BCjR5iPO179s3LbxzGqNP6woEPi3CNAo6YAg>
    <xme:yOk9YpcVYJdxipy69X8fOe_GsudTJidzCc78vIzCxFsrYYWl-1dGzy6jaER_E-L8D
    Nklgmjt01LAYwfsD-Q>
X-ME-Received: <xmr:yOk9Ynwz45eOvN2E21cD241ha26ZHzcmbTq8MdXH4m3wluHHz3Kh8dkFQId-Jau3N9YawtSckfxdxSYLWPP6pGMANE4vRAQSk6zbHKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yOk9YvO_MQ9ggI9fCHZ_8aVd3rekoG04eeLAlL8BcdmLpOZ4E2a78Q>
    <xmx:yOk9Ys_Q6hTsLn-juIfTVzTLCSM4QM9dply-OR-ikYJAyaEaecrvlQ>
    <xmx:yOk9YnV-T2HEK62yiBg7gmoCXr7EwlbjYmhHNxrlEJClBE_UQz1jCQ>
    <xmx:yOk9YrZdW8JGd8FVhCLlQjbMTQ_b0byfI6ULiK0rHTYp5bJGVX2CMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 12:11:52 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 2/3] clk: test: Test clk_set_rate_range on orphan mux
Date:   Fri, 25 Mar 2022 17:11:43 +0100
Message-Id: <20220325161144.1901695-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325161144.1901695-1-maxime@cerno.tech>
References: <20220325161144.1901695-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

A bug recently affected the Tegra30 where calling clk_set_rate_range()
on a clock would make it change its rate to the minimum.

This was due to the clock in question being a mux that was orphan at
registration, which lead to the clk_core req_rate being 0, and the
clk_set_rate_range() function then calling clk_set_rate() with req_rate,
effectively making that clock running at the minimum rate allowed, even
though the initial rate was within that range.

Make a test suite to create a mux initially orphan, and then make sure
that if our clock rate was initially within a given range, then
enforcing that range won't affect it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 105 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a92600311506..146b1759798e 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -72,6 +72,19 @@ static int clk_dummy_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_dummy_single_set_parent(struct clk_hw *hw, u8 index)
+{
+	if (index >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	return 0;
+}
+
+static u8 clk_dummy_single_get_parent(struct clk_hw *hw)
+{
+	return 0;
+}
+
 static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
@@ -90,6 +103,11 @@ static const struct clk_ops clk_dummy_minimize_rate_ops = {
 	.set_rate = clk_dummy_set_rate,
 };
 
+static const struct clk_ops clk_dummy_single_parent_ops = {
+	.set_parent = clk_dummy_single_set_parent,
+	.get_parent = clk_dummy_single_get_parent,
+};
+
 static int clk_test_init_with_ops(struct kunit *test, const struct clk_ops *ops)
 {
 	struct clk_dummy_context *ctx;
@@ -239,6 +257,92 @@ static struct kunit_suite clk_test_suite = {
 	.test_cases = clk_test_cases,
 };
 
+struct clk_single_parent_ctx {
+	struct clk_dummy_context parent_ctx;
+	struct clk_hw hw;
+};
+
+static int clk_orphan_transparent_single_parent_mux_test_init(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx;
+	struct clk_init_data init = { };
+	const char *parents[] = { "orphan_parent" };
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	init.name = "test_orphan_dummy_parent";
+	init.ops = &clk_dummy_single_parent_ops;
+	init.parent_names = parents;
+	init.num_parents = ARRAY_SIZE(parents);
+	init.flags = CLK_SET_RATE_PARENT;
+	ctx->hw.init = &init;
+
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	memset(&init, 0, sizeof(init));
+	init.name = "orphan_parent";
+	init.ops = &clk_dummy_rate_ops;
+	ctx->parent_ctx.hw.init = &init;
+	ctx->parent_ctx.rate = DUMMY_CLOCK_INIT_RATE;
+
+	ret = clk_hw_register(NULL, &ctx->parent_ctx.hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->parent_ctx.hw);
+}
+
+/*
+ * Test that a mux-only clock, with an initial rate within a range,
+ * will still have the same rate after the range has been enforced.
+ */
+static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate, new_rate;
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   ctx->parent_ctx.rate - 1000,
+					   ctx->parent_ctx.rate + 1000),
+			0);
+
+	new_rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, new_rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, new_rate);
+}
+
+static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] = {
+	KUNIT_CASE(clk_test_orphan_transparent_parent_mux_set_range),
+	{}
+};
+
+static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
+	.name = "clk-orphan-transparent-single-parent-test",
+	.init = clk_orphan_transparent_single_parent_mux_test_init,
+	.exit = clk_orphan_transparent_single_parent_mux_test_exit,
+	.test_cases = clk_orphan_transparent_single_parent_mux_test_cases,
+};
+
 /*
  * Test that clk_set_rate_range won't return an error for a valid range
  * and that it will make sure the rate of the clock is within the
@@ -788,6 +892,7 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 
 kunit_test_suites(
 	&clk_test_suite,
+	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
 	&clk_range_minimize_test_suite
-- 
2.35.1

