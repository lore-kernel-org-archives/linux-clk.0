Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DB1C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233582AbiDHJPb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB66E1E817A
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:51 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 4C50D5C00A8;
        Fri,  8 Apr 2022 05:10:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 08 Apr 2022 05:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=g0N0NBSFwIPR4Sp3tNa1RzhzViiY+a
        Sp4ox1vlIUQYo=; b=NLyGXJIf5nb38UeQ5kg2j1061xy0tV1L2fUKnNbvxbyH/W
        3duFE+4WO1XQMPMofMRyDaeyTMJCzfuUThm2CYX41A8sX2k8u+/rb09OMEIlNSXi
        FEYEYZPkIuJ2P0dyJkv0oh8rWVTc6g5rwTBj1NDuh59Nzp0rzq01lk9udfkNYFiZ
        vGxLlBQ+Gp8nQb5fzZ/pK/y27NKllwA2fsupz334LfPYsTmmUPR8RNeswls9UjMz
        WxDLjgFBsQ8NZLElwCt8CuQcBgAjJIcxDPx166YrI67UeNCoeUVmmf0Q9IKmDnOt
        ysaHOvT973yuqFSlEeLToZBC8vuFN5QoqZuLZ20A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g0N0NB
        SFwIPR4Sp3tNa1RzhzViiY+aSp4ox1vlIUQYo=; b=Q815otxp4vAv2YLTNfZw6X
        VD1aoTcdQRhdxuIWNPt4E7zE+Boq7uwd2h1Zx0eK8C3Z3KBAKPrb7zyZXn/+9b4R
        xPcHvP2d/MFSwzp1SLHQde30efkyWGhwBEyPrsLjSz2PBe2Tqza1NwxYaaUAJ2n6
        xMjmggsI7RQFOGWWuERo5Lv5P8RN4pAriI4tybL9M/NqqpZKdDQd7tClzKVxQiqi
        wyUTV2hrtmydu7MKhLP5RnzObBSc8f3III8yuoWb82lctfbUpxbKIh5nYS/oO22w
        c5yREB0iOnOdd/lPlTyBJl9wQ2W6XZCqJbopPYhS7MwM/oes7l/P0djlUElxa7DA
        ==
X-ME-Sender: <xms:G_xPYj6Wfb67AlZgUcBO-KWjbr17OiN4tZUILE0hgneJNyS_X0iO7g>
    <xme:G_xPYo7Ikn1QUCdGgI7OTVbT82WvHnOL0UCtcuycsXjZxJsb_vFgFswv5iHagOi2o
    t6RJ9_YCBoeyAPtkEc>
X-ME-Received: <xmr:G_xPYqdQ91Xk4JYpsQSRvFpbrw6mVL5eycQzhXr9nNQ7BXjn9mqnAHjUl6aJQdS42h45SHzRvdNfkpNbaby3_qzoulWH8u_Mjf7W4uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:G_xPYkLNmj1oOefHw1TIxgzeZJh8wzZy5DARae34Pw_7pH9DXcxn3Q>
    <xmx:G_xPYnJ1bgB4YOV4HEG8vE0QFkUQ-HRnDngu9ujG3WCypTiXyU2JDQ>
    <xmx:G_xPYtwJiw6pxWWta9K3VI6A2VOXCJU1enEAlv49bZTOtutHasA-gg>
    <xmx:G_xPYoXC5bgWOSQMsX8ZN8r6WO8KWkoWBukbvB4faCxWcxWc7YLcwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:50 -0400 (EDT)
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
Subject: [PATCH 04/22] clk: tests: Add tests for uncached clock
Date:   Fri,  8 Apr 2022 11:10:19 +0200
Message-Id: <20220408091037.2041955-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 88 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index e86212be74e2..38a2d6abd28a 100644
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
+ * These tests are supposed to exercise the rate API with simple scenarios
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
@@ -1042,6 +1127,7 @@ kunit_test_suites(
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

