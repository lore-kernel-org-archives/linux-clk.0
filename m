Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36550C43219
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356165AbiELQEp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355985AbiELQEj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:39 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8C261615
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:38 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 218185C024D;
        Thu, 12 May 2022 12:04:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 12 May 2022 12:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371478; x=1652457878; bh=a7
        wDWYcn9zZArxZYptej+l93ZK8POHvuyhwB3qR/RoA=; b=HqDtzSzckcMlsBEwrx
        iR+GPVfN9vFuKBWN6le2QQm5me15jW4EZx5o+ES+FC+UCdJxjA2riJdiaaPR/wyx
        DX7zALaMq+oN7ZdBd/nrnrEul1LdjRqXFynV/vQRH/xOyPzrX51JNBz94CEYPoiW
        BF3Vy4TQauNzTTTwc+mLefGANm1HB5DUS6LODXuFtjrLUykAFOkGFWTSoS52GZvt
        qsMY3vSmp+KW72YL8ranzkhPAUHbZ40fnqo0J+RVDR3nGeYcloJI/uYdYfeVfsAC
        CcN5uGQHIgE8dhESggFe/J+FsvrAcEbykwiR7lVsduPMpkMjw3L+ec8yd/lR7HSh
        CBmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371478; x=1652457878; bh=a7wDWYcn9zZArxZYptej+l93ZK8POHvuyhw
        B3qR/RoA=; b=iIaG4gbg7RGE8jhpl/9MNcUpovaGN/dRTK09u6ndHrhb1iaF2GP
        Guu2+Xla5WuQdfEubyYOGnpGq1VUSynCBLC4VqvssFIGh9++ECqdmbNL/UFir+J7
        cb8kvhC5E/zYVlZMymP1t4MwHlCN/Oy/ryOalzUYeaVflGRnzZzbiQDYSKsM2qou
        GZHVDvdLs9LfYx+3YedIDaXO5fhwB0MQRfCXo36i09MV7nXKxT8HoiDQ1vjvOXXF
        tmhZYNYaGG7jl9WMbHbT1BaGsn9AVMT4FR3hu7INFFtXcnEu+5uEDCh7tIg1+6sg
        I3b52TB1Zi5nC9uj091Ds0FNgk1h3sgBZHw==
X-ME-Sender: <xms:FTB9Yq2me-6uEkb8lKvriewJ4kLI0R316cYRyT65e-qW8FCLXIQiLg>
    <xme:FTB9YtGB15dSSxLzyMzcvZo4J-twgbbJJAuCDWHm7j_miapZaYWU8uIAMX31AMMGl
    Xf2flhFqOTBlLfUoq4>
X-ME-Received: <xmr:FTB9Yi5kcCei3FOGbW1zfZcHBuE4aTljoNFoaAFvXgaSYe9edl-S6-9Sh8ZeKDBlbwf0q8g08g-lrLSlC1c6Vniu5UQQ_moM_gIowXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FTB9Yr1nJ0hvCdgZ4ksrwxnkMlXAn_lYRaOK5XKReaCZWuB2LhOG5Q>
    <xmx:FTB9YtG9euRdNrUmKKzwOitQWIJZo00A0a_8A2jJ2p09-I0JDFWy-g>
    <xmx:FTB9Yk80X0pBJLITXzQkyJmShHTwLXcHdLw1psbVlFRb16SbGtUvAQ>
    <xmx:FjB9Yl9mwOt_RODYi-IqIJoWr2p3KPYJpZ2h6NoZYX3pUYSb-onnnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:36 -0400 (EDT)
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
Subject: [PATCH v4 09/28] clk: tests: Add tests for uncached clock
Date:   Thu, 12 May 2022 18:03:53 +0200
Message-Id: <20220512160412.1317123-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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
2.36.1

