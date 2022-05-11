Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6489C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244941AbiEKOnd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiEKOnc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:32 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11D6A6E34
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:30 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id F18C9320099C;
        Wed, 11 May 2022 10:43:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280208; x=1652366608; bh=a7
        wDWYcn9zZArxZYptej+l93ZK8POHvuyhwB3qR/RoA=; b=UU/PcytIysKxqDS7eJ
        tGZcN3TPG3Re6eege4qVjAvrqcnY5Q8a6XSd3JV3Rsz/r5rxwB8yKVjF1+7QlNrx
        d3mVtNeZ2+nvp4ku6H+HOsjXiL2bFvu5aJLVKfQOPGcECuOoHWh9UpBY1G4UOMMj
        yWP3Xk2HTjN7xZjjB3+VEwTtSGbnzM+trYJzfU+Ej3Fd85dM03qAw/QFFDaltRRU
        sBSaD7QnUYuNnjx05HhOEBulFkbP4HrVWP1Zdu2M+O8n+hi8w/7m4kTsvjYYSz6m
        Sv4L3bywCIEhKs/ZZ2/XIdumM7g2fJdaWTPQPcD8IzT/7SrJeuJ1iT8EWnwdabtw
        zvWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280208; x=1652366608; bh=a7wDWYcn9zZArxZYptej+l93ZK8POHvuyhw
        B3qR/RoA=; b=BfDrw9sABI9xMsHgoLfLWYRHpUFnSb9Cr39X3xj9PXcQTQ5cRtF
        ysWJ4NrJdi5WdKQsx0Ad6mohbk05LrZpFaPHiVxS7Nno6jzk4v7Dlr0dAoPxVmvk
        x6oLpe/PUtdeJsC8OpoxJB0UcIzxA7VzpgKQX2oRYKN2TASveKIb3v3pS4mCQUc7
        foRwoHZjQtuHML6xAC5AmFzKvc9kdpXDbGmwBDiAgvByH4f1LZhsZvKXFrJkOmBX
        3rHzzIk1Md8HeTc29mwknYRRFmRXQhFzrWi4fo7NMZmWFg3ZL45/ntj12Ckqxi7Z
        GZQOQyvj7ThLM70pfKGxMQOnFXGwv6dF89Q==
X-ME-Sender: <xms:kMt7YuGxNNrT18Ptm9fxViRJPqJttq1AqXL3N9vVAAOllQLrMZgL3A>
    <xme:kMt7YvX-oaGYBVnBgROA1PhTxaAjG-2yhGoJHk_pyLjH4Cl-N4WlR1K-pePx_Eb1q
    RpyLdcUsZaU6iyqerU>
X-ME-Received: <xmr:kMt7YoIERtSCjtJgnEdUmG6g-aLoQowgPMmcmGCanoxf3n2lfyuZN-JRj6DfCoNx2Xjgu0ERfa6yG5MF4RQ4dn3e0-j_QMjzUZazA8o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kMt7YoEjmHKxD4GT67med5uyjQ9phmsiEAuYd321FeDiPbR43xmTEg>
    <xmx:kMt7YkXI3E-aa8w13g8fR9RXTtXgOs8fazz8xyeDgkV9kPIFpycnvw>
    <xmx:kMt7YrPfcVM4uS2tLLYjsGBky-8hOhXk6f-kGOQYGrgOf4_G6e9LaQ>
    <xmx:kMt7YtP1STCpqJuBXTe-b7fDBkkQofRsY7itWvcc9zlfnpPbXMrtVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:27 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 09/28] clk: tests: Add tests for uncached clock
Date:   Wed, 11 May 2022 16:42:30 +0200
Message-Id: <20220511144249.354775-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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

