Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC2EC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233666AbiDHJP6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9641E868C
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:55 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id F1A295C00F7;
        Fri,  8 Apr 2022 05:10:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=6+hvzgyMX/60YjgPcopiSgknvMQX9K
        ZvM9UUCse0J7E=; b=pD9piM/ML/jrrP3FPEnBr3BcH/0W38Aj2A+2vWO2jAairg
        ubSiITnpplUhCV0Bm/ZkuvOh+J3dGK/x2ouwdMhA4ZyekWYYmVsbeDDcA2pgnBe4
        eP+qAlG1cGeuVif30kPO/c8UccSZOSSmMmipGtSBjBw5sxcEL4YSzORVfVRfZ3Lx
        cGMTbRaqWpw96KQz2lbwFa/npkiaSctLG2lqDS2/UFbn/nTdW8vNqPvaFJNpR5//
        gmyZgTzKbUJks0LfaTmxdiSemuzGUsS8Cac/U2C+NfRPkdkXmM5oKhcWmLtkbimj
        n/VbY2txxaxHjLxQAeWfOr4D91DWs2lEH9pn4wUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6+hvzg
        yMX/60YjgPcopiSgknvMQX9KZvM9UUCse0J7E=; b=Y6END1TPbFbdO8rQouGAyF
        hLxv9UQMv3SSb0lT5bK6e70gdfvTlDo2RE9sIRlQfOHitlNuhgdO51sZG5HSBKkX
        mf+7D3C/+Zc3UVMEuz1UAiux0RfhGONbz4voYC0YzZ/+lwiEgRRI5m/mC127XVrw
        73NgU0YmqS4KRGRGSVQxvnF/ioHzTJrSjdsrcHEKbCcxu0PLNgD/MSDEF9k/9aIJ
        Uqc9SPD0qXfjALmyD1npw7KHUfTysFuZQaRBdmw5TAiRgADhnlqvPAd6R0QoP8cK
        ggD9XbJEZpvW2xh9DCulh37wt2+6ntuOGHjWa+AH3Zg6u+X4llpKkXsY+Hb6LoYA
        ==
X-ME-Sender: <xms:HvxPYiqUDAr5I9xSBSFdJx9s3u1wTxaEDqy_rHEDUdfvF1xE0qgR8A>
    <xme:HvxPYgruJt960Ua-ASwvvH1C6Zpxvqnk7TvyJyj_HGOsUqn-h2eVI1fZNUuJTdJPR
    U9LrlBAnLA4oFiQMvY>
X-ME-Received: <xmr:HvxPYnOuCBJa4h3s8oqL0h6FHUFbQYdO4oQ3v6U9Fj6XNNlPgkqhZCZSBZuk8Hvpgn25TYmoLBIPzrq6x39AGp_NdkeSuj0XHFGEYNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HvxPYh4FVUvdmTyJRQ5eDovzMS2KVdK83FS3eYT38iVmL6QFj8q9MA>
    <xmx:HvxPYh7mt20snGAwgH0OK9AtmhOTyEcCtv2OLkYsGSjdftmfz69M5Q>
    <xmx:HvxPYhiLmpgsUGwHG2apohNkbBX7QmmgRruInUEeZA3ONi4oCUfRhQ>
    <xmx:HvxPYmGpTXkD832hm5Eq9F6AScgVsbSVP7qQB4SE4_9NhM5LMr1kLw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:54 -0400 (EDT)
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
Subject: [PATCH 06/22] clk: tests: Add tests for mux with multiple parents
Date:   Fri,  8 Apr 2022 11:10:21 +0200
Message-Id: <20220408091037.2041955-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 119 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 59661144d7a0..caf2a28ac4c3 100644
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
+ * These tests are supposed to exercise the consumer API and check that
+ * the state of the child and parents are sane and consistent.
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
@@ -1291,6 +1409,7 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 
 kunit_test_suites(
 	&clk_test_suite,
+	&clk_multiple_parents_mux_test_suite,
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-- 
2.35.1

