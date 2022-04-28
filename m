Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB3EC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350249AbiD1QrS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350251AbiD1QrR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:17 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3ADFB246E
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:02 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 338535C0154;
        Thu, 28 Apr 2022 12:44:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 28 Apr 2022 12:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164242; x=1651250642; bh=rf
        r/oiCJH7hWgq5ZfWGzeMcg5VTS7ipE712RUAbDPyA=; b=O7OljO6XUUuDZWCJmL
        bLkCn0rZUhLPAb7tLx1BoSUHRz4mQp3RBlW6zQyfEt03szt/t+dHgZwFRJG102hV
        pEQSXBMbmZ7K9MVRCtNuby9WwqR52XhzgYC7UbxQcsB8ro0OAIb+hLCU5zKrBqSj
        b7nOkCJMu7Ay33aAd0VIDKQ+DPCJQflo2gwpkCqaHyyVfrK53TMeq+FzONiNDU/8
        J0ZsgP09k1zCjO+9pqXY4pbA0u5klvShXFsPKYDuTvnqujEotv+FLHCpsEXfnXji
        1NagLWHXNF9cdoQaoRJaPlDfU5IM93mPouzm/nPU9kL8eUsWCKUopQ+lgMm8d8ra
        h9GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164242; x=1651250642; bh=rfr/oiCJH7hWgq5ZfWGzeMcg5VTS7ipE712
        RUAbDPyA=; b=zzXvR5xL0gRP7McLodYCXWkSdkHcq4YuHXrN5sG4F7K0ckobXw9
        Ou05uxUv0wbEfoFf8c9eAd8T9Pa3VZD0qU3wzlfWsgdvjSUDdYfEqFNOOaK3ILxY
        0XcxS6Xq8aEgjHBlL+QLqOTy1yd1+X1QRVBl9IMoJ+DSpv7gEMomx4yiRYteLPKa
        dXGsjhMBymsNZ9cbRrxftdLwwwUAQZXWCsA5LdMj1VBI95Q3CNuiX6Z6JdVbQhsn
        Tht3jvD1vRl2F+JCJEg0cWfXQGqHMDDHkIoJR1F3NhVZgY5wGO2YZ966rcEdJBNW
        laOXRpw8NFs3N09a7WVqqnToVBuE+qlZHnw==
X-ME-Sender: <xms:UsRqYhDZFh3dfJdRqPc3jzw2GKgx1rLC40Dek3xCOao52f8FrY2TGQ>
    <xme:UsRqYvjndCxaUPqB8IrqTkxyHRhF5jvyHgSSrJ7mvXpuQIiKdDLtdor5GbPYiqOhf
    T47_vHjiv6CO5b1Vg8>
X-ME-Received: <xmr:UsRqYsnsL9auwV1N4kticZH05-cAlMa8pBP6RE4daJ3p4Lc1EE1xZsxagDeZkqnf5IIOxl5NkXbezXLzu7Blt9vhLrRmt6-Bq4rGHdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UsRqYrzTUx2eQogI2ofrtv8JLvDBozznKunnCpTu3oA-u4Wnr8v3dw>
    <xmx:UsRqYmTTf0JZSNwKTJLz8HL4ZstCzzhyI_0XVOD_oaEvxsuWoYLm7Q>
    <xmx:UsRqYuZ1b0FFwqYduSBs2Xx-ZPuyrRwLoeFI-VllYfWWN7jlFgWTdA>
    <xmx:UsRqYrIG0rtJWJfOqU0bcEYzrmA9Fl0gpkdJ8NDwRfB4syiaSYxlYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:01 -0400 (EDT)
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
Subject: [PATCH v2 09/28] clk: tests: Add tests for uncached clock
Date:   Thu, 28 Apr 2022 18:43:19 +0200
Message-Id: <20220428164338.717443-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock framework supports clocks that can have their rate changed
without the kernel knowing about it using the CLK_GET_RATE_NOCACHE flag.

As its name suggests, this flag turns off the rate caching in the clock
framework, reading out the rate from the hardware any time we need to
read it.

Let's add a couple of tests to make sure it works as intended.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 88 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index be23c19813d0..429e96796c66 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -262,6 +262,91 @@ static struct kunit_suite clk_test_suite = {
 	.test_cases = clk_test_cases,
 };
 
+static int clk_uncached_test_init(struct kunit *test)
+{
+	struct clk_dummy_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->rate = DUMMY_CLOCK_INIT_RATE;
+	ctx->hw.init = CLK_HW_INIT_NO_PARENT("test-clk",
+					     &clk_dummy_rate_ops,
+					     CLK_GET_RATE_NOCACHE);
+
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Test that for an uncached clock, the clock framework doesn't cache
+ * the rate and clk_get_rate() will return the underlying clock rate
+ * even if it changed.
+ */
+static void clk_test_uncached_get_rate(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
+
+	ctx->rate = DUMMY_CLOCK_RATE_1;
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+}
+
+/*
+ * Test that for an uncached clock, clk_set_rate_range() will work
+ * properly if the rate hasn't changed.
+ */
+static void clk_test_uncached_set_range(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
+static struct kunit_case clk_uncached_test_cases[] = {
+	KUNIT_CASE(clk_test_uncached_get_rate),
+	KUNIT_CASE(clk_test_uncached_set_range),
+	{}
+};
+
+/*
+ * Test suite for a basic, uncached, rate clock, without any parent.
+ *
+ * These tests exercise the rate API with simple scenarios
+ */
+static struct kunit_suite clk_uncached_test_suite = {
+	.name = "clk-uncached-test",
+	.init = clk_uncached_test_init,
+	.exit = clk_test_exit,
+	.test_cases = clk_uncached_test_cases,
+};
+
 struct clk_single_parent_ctx {
 	struct clk_dummy_context parent_ctx;
 	struct clk_hw hw;
@@ -1039,6 +1124,7 @@ kunit_test_suites(
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-	&clk_range_minimize_test_suite
+	&clk_range_minimize_test_suite,
+	&clk_uncached_test_suite
 );
 MODULE_LICENSE("GPL v2");
-- 
2.35.1

