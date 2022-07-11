Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D670BC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbiGKPYl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbiGKPYj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:39 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C93824BFB
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:38 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D85145C019F;
        Mon, 11 Jul 2022 11:24:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553077; x=1657639477; bh=6Q
        91st6+y695I3q4xUIdCE37c+o9VbduCWFFOMEhzS4=; b=XwMDW/J6kNojV1jIoC
        G1Tb3Pl4Wx5xi3XdVUUo5bIFhBnZxY9oBPeA8wfiIm9KmaWmR/cEPY4KlQpC+sbj
        K3RWgolsJNxDrxeRc8C1IIppM2V+4IgkwpYFLTRIhc1Z0BIIjRPirqAVNKW9ciIp
        QfkpYqemYeoKcULLMiDdPWW2SLEdl6DebmATf33Is/MB5vmTeILfLLe/8sG0sowN
        mzvAMyJL5Ix1DzF7il0SKe5VI8fjzKgQS6xID3NHCqi3Hazi4uPHweu3sGbvxmlc
        r5CGuxrykmOvUVnS3u/1oylix72cU8SXh+M+duT7WcqAlK61fVzMjV17PuAIbCHh
        /D4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553077; x=1657639477; bh=6Q91st6+y695I
        3q4xUIdCE37c+o9VbduCWFFOMEhzS4=; b=xmOppQupN+15NugOOtsc9hjKJVuHp
        9gXrqOp6astqa+z45QjveklKTmg5AmgsegZYgoqVFvRrDIRdsJgyvsFmVCAkjbKK
        sAASeEzr+Z8iQW//YDpQMtKkURzlUlhuJ1qFy85H/p5GlHNULJHMRP6skCY9c1HT
        daI327oUZ+U0jp5jIEdHhxCR8YI6PoZ2wzzgDe0QS0bXBPoBnD+LRUeQ34tkAmRx
        m/oUYJbwtDpZJyMsvpCCEVaRGTWmo622mBbz7xlm88Pp6ZEgyC/k8Y4Ykn1ATkB3
        og38RufoMjtHxff2i2Mntm7qNPkMR1IRUAFN1jk+F71VoIIOUREBU4BHw==
X-ME-Sender: <xms:tUDMYmGpLGwo_DlwQjz3Kl9aHPVIQxb4wRO45Vc9DhifCP1GhayNzw>
    <xme:tUDMYnVgk7o0Zw-Z9y-X_D8zero_v6CzNdlBs9yKpw0pgS_wMd1FqA-Y7v6W7YTeO
    ZFKeJ8Q0BNQLK3RJ2A>
X-ME-Received: <xmr:tUDMYgKIpTJQay2svf9OkENT5rLY0uENsMmpw5qdTd17sUMhOWKKutRAh8ZOX9nkZiNIKJT4N5c2iXqrW9x_uObon6r0m2BUjhdj8R8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tUDMYgEhaKsbkK6EJZ-dVKg7LOaH4vtS_uKVB8J4kJiWOeBNAZq8pA>
    <xmx:tUDMYsW3LBAuWFDNRZdCAuSs567P4Xz9MyQwbtoUT0LuGEFlYkRgAQ>
    <xmx:tUDMYjPZp9D7NTDD7hakvjKdpRmrPuBwEJQT1n_G7a7ULChE-ZRUqw>
    <xmx:tUDMYlPFdCqjsPruxmZ-pfXm4BciKtjs-AQxbub5sdFeXCZZp1pU2g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:37 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 05/28] clk: Drop the rate range on clk_put()
Date:   Mon, 11 Jul 2022 17:24:01 +0200
Message-Id: <20220711152424.701311-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When clk_put() is called we don't make another clk_set_rate() call to
re-evaluate the rate boundaries. This is unlike clk_set_rate_range()
that evaluates the rate again each time it is called.

However, clk_put() is essentially equivalent to clk_set_rate_range()
since after clk_put() completes the consumer's boundaries shouldn't be
enforced anymore.

Let's add a call to clk_set_rate_range() in clk_put() to make sure those
rate boundaries are dropped and the clock provider drivers can react. In
order to be as non-intrusive as possible, we'll just make that call if
the clock had non-default boundaries.

Also add a few tests to make sure this case is covered.

Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  45 +++++++++++------
 drivers/clk/clk_test.c | 110 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc191c15507..a5e0ab8bd6be 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2325,19 +2325,15 @@ int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
 
-/**
- * clk_set_rate_range - set a rate range for a clock source
- * @clk: clock source
- * @min: desired minimum clock rate in Hz, inclusive
- * @max: desired maximum clock rate in Hz, inclusive
- *
- * Returns success (0) or negative errno.
- */
-int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
+static int clk_set_rate_range_nolock(struct clk *clk,
+				     unsigned long min,
+				     unsigned long max)
 {
 	int ret = 0;
 	unsigned long old_min, old_max, rate;
 
+	lockdep_assert_held(&prepare_lock);
+
 	if (!clk)
 		return 0;
 
@@ -2350,8 +2346,6 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		return -EINVAL;
 	}
 
-	clk_prepare_lock();
-
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
@@ -2395,6 +2389,28 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 	if (clk->exclusive_count)
 		clk_core_rate_protect(clk->core);
 
+	return ret;
+}
+
+/**
+ * clk_set_rate_range - set a rate range for a clock source
+ * @clk: clock source
+ * @min: desired minimum clock rate in Hz, inclusive
+ * @max: desired maximum clock rate in Hz, inclusive
+ *
+ * Return: 0 for success or negative errno on failure.
+ */
+int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
+{
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	clk_prepare_lock();
+
+	ret = clk_set_rate_range_nolock(clk, min, max);
+
 	clk_prepare_unlock();
 
 	return ret;
@@ -4348,9 +4364,10 @@ void __clk_put(struct clk *clk)
 	}
 
 	hlist_del(&clk->clks_node);
-	if (clk->min_rate > clk->core->req_rate ||
-	    clk->max_rate < clk->core->req_rate)
-		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+
+	/* If we had any boundaries on that clock, let's drop them. */
+	if (clk->min_rate > 0 || clk->max_rate < ULONG_MAX)
+		clk_set_rate_range_nolock(clk, 0, ULONG_MAX);
 
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 7646356f30cb..7d9da88c39ee 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -793,9 +793,66 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 	clk_put(clk);
 }
 
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed, including when a user drop its clock.
+ *
+ * With clk_dummy_maximize_rate_ops, this means that the rate will
+ * trail along the maximum as it evolves.
+ */
+static void clk_range_test_multiple_set_range_rate_put_maximized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *user1, *user2;
+	unsigned long rate;
+
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user1,
+					   0,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user2,
+					   0,
+					   DUMMY_CLOCK_RATE_1),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(user2);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(user1);
+	clk_put(clk);
+}
+
 static struct kunit_case clk_range_maximize_test_cases[] = {
 	KUNIT_CASE(clk_range_test_set_range_rate_maximized),
 	KUNIT_CASE(clk_range_test_multiple_set_range_rate_maximized),
+	KUNIT_CASE(clk_range_test_multiple_set_range_rate_put_maximized),
 	{}
 };
 
@@ -913,9 +970,62 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 	clk_put(clk);
 }
 
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed, including when a user drop its clock.
+ *
+ * With clk_dummy_minimize_rate_ops, this means that the rate will
+ * trail along the minimum as it evolves.
+ */
+static void clk_range_test_multiple_set_range_rate_put_minimized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *user1, *user2;
+	unsigned long rate;
+
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user1,
+					   DUMMY_CLOCK_RATE_1,
+					   ULONG_MAX),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(user2,
+					   DUMMY_CLOCK_RATE_2,
+					   ULONG_MAX),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(user2);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_put(user1);
+	clk_put(clk);
+}
+
 static struct kunit_case clk_range_minimize_test_cases[] = {
 	KUNIT_CASE(clk_range_test_set_range_rate_minimized),
 	KUNIT_CASE(clk_range_test_multiple_set_range_rate_minimized),
+	KUNIT_CASE(clk_range_test_multiple_set_range_rate_put_minimized),
 	{}
 };
 
-- 
2.36.1

