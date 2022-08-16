Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADE0C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiHPLwA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235286AbiHPLuc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:32 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6708860C4
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:14 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 7D64F320091D;
        Tue, 16 Aug 2022 07:26:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Aug 2022 07:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649172; x=1660735572; bh=rw
        oNKB726coAm6yHYIeVayj1tOCaVHcOUrWOEZLnCuE=; b=PXAApfhOZDt+DrkMGt
        EdBIZtbg7zWpdzgODDTVwjwjPxmYjTYYpMpsKhOuPxS1fefK3ONXYp3q0TWkeKuI
        o+ctjAFj1Qiw1QLBPc4/V30ZC1KgZy/T6AeEz6d/EEtcqxWlzO61ZqeS6oyqUfw6
        tcxNhb+0+NFIuHeFpLQ62GV2OA144Q6jFn2dN3zNwCN+QX4xpRBAYJKYgvMwtbtj
        9AZd+4Phv7XbuXmSThaV/QRpxeTbp5CU8wzDQZWrf8B/BlqNAl4b5vYTfjW8oTEo
        1PUVYhsnnf4n6XbXefI+gipyPKhTckgQA1vZVd8ce4/EGU4rwQ05z5g15y7t2IMp
        blfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649172; x=1660735572; bh=rwoNKB726coAm
        6yHYIeVayj1tOCaVHcOUrWOEZLnCuE=; b=ZaIdcr20sZS4s5o367+5WHhaxCf/L
        uRLD2pkMzYsLsAP3lt7Nd0pa7UCddZBKzUSZLyKMmInt1BSgHfIUUIh69mVW8FeQ
        tmMgIYRRry1qzaO3fxkEvJwyL6BNXDuOvndZIUSbKjJL6F24lDWxoFs8eBwTKBB9
        n8IetLfYXYSVGyocfzFr3Vm0VWAYGo0e4/B22QwGdnT6KDrLMpMg5DCyMfQUsvBv
        YjBRVoELIGvuqLUWgw2aCP/e+rM2uVCPVynniSMnfc3+oWVVJ2omBsljvtVJil8d
        0HUB0q1GzmJZACDi69RmVX1HQCzIePYa83+gp0SXCuLSvTAr2P26cEyZw==
X-ME-Sender: <xms:0377YpTJZiulFxRPFGqO4cabMChY86xOtI_gBVCimYjAsY2DAIosFA>
    <xme:0377YizoREjrRoBr2RW4klO0bNcmPZTDLthwmiY5bD1Pu4xdtb8ABbFtbHRmG24oe
    kVLufQyFUBBDEMxszc>
X-ME-Received: <xmr:0377Yu263tUfqgXYjxFyONpuscM_jyfLA7KOKtwWx6Z5BiKNxVxPfR50360>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0377YhDxJUmn8xXY8itghtuRlkH-8fS-dnLgfjxR6aLolMD89mZfFg>
    <xmx:0377YijIv5K8Uu03EKW1JqDiSsqFbCpxUrjtAzC50rw-YXgsUGmD_g>
    <xmx:0377YlrFQn8NmHssydkA651Evd0CMkrFz2lkyDvHdesRamj9tKpyuw>
    <xmx:1H77Yna0yASgHtYi3nfB3mD_CCQ94dRAB97s7FgTELwhk9jDJCijWg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:11 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 08/25] clk: tests: Add tests for uncached clock
Date:   Tue, 16 Aug 2022 13:25:13 +0200
Message-Id: <20220816112530.1837489-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 93 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b8e32406a6e4..b269420dafcc 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -270,6 +270,96 @@ static struct kunit_suite clk_test_suite = {
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	unsigned long rate;
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_INIT_RATE);
+
+	/* We change the rate behind the clock framework's back */
+	ctx->rate = DUMMY_CLOCK_RATE_1;
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
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
+
+	clk_put(clk);
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
@@ -1077,6 +1167,7 @@ kunit_test_suites(
 	&clk_orphan_transparent_single_parent_test_suite,
 	&clk_range_test_suite,
 	&clk_range_maximize_test_suite,
-	&clk_range_minimize_test_suite
+	&clk_range_minimize_test_suite,
+	&clk_uncached_test_suite
 );
 MODULE_LICENSE("GPL v2");
-- 
2.37.1

