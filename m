Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72736C3F6B0
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbiHPLvf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235075AbiHPLu0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:26 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6A69019E
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:25:47 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 909D732002B6;
        Tue, 16 Aug 2022 07:25:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649145; x=1660735545; bh=WD
        yaqM8srmU1YTrUZgp/e7Vi6T4o1cvbz4ny/A1rc0w=; b=t03F0Hjb6SNv4L6i/h
        sFL8+aiO+TpG4lT9Rjir6Ot+KsdGfGiI4B1apXRJ+r4sAfkNdOZ+GC/EdcstgB2K
        ofjHvyTUzyqq1pAVXsE/wwoY7eJNG20QcuucsQSMj0dH7pT+xmTjgl4NpqyObBFy
        sD3146ptMrb5gSU4jXdvDAgf85aepnFwrTJ7mPvWLl82FucycPF7M6D297r/QZKA
        yRCKbukc879F+X1er49wmO/FarKwb1a3mSIGn+Kg6ELPRJCi8lEh3IFZwXcN63CH
        dhTcyGnTdro695gIJFLydGixqHhq6hzA3tEckCVNWBZuUQQUAwkLUf1TqHdcEJ6j
        EvyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649145; x=1660735545; bh=WDyaqM8srmU1Y
        TrUZgp/e7Vi6T4o1cvbz4ny/A1rc0w=; b=dcaCcOUnl3a6Y4hROSIs9Cp6lMbL1
        apKGs9JLqPPaDBieM3wZXtAwrqS3GdgdOWKqocBmbKL4g3PD43IkCjmbfbwjPqTH
        bTIRVhhlYiM8sG9eZAhpCUrhFWywMsS14fbY0ht/wVR97tZj+XWi0aMn0khxKh5j
        h6wyt3RDXwryb4CI29kkjNSHH0NCfGNeMGh+auEQu44Pe7HY+qQ7qFRL/cXb9ILc
        fOmyOgI/gxJHzYnJ+c9lZZ9fK247HTQVbb0nyVoUZK6ao2jDEMTS6TclVzX7sPk8
        dzOO3HmTpNqeTd+lvi8IroCP2Fcav3+oSsAD4DwqsKoxt8k1MMUbdXx9Q==
X-ME-Sender: <xms:uH77YlcVOlQw1MaeZmp6HZ5fG-oyW2QSl5vITN5vL1M3PwpqKVq6Kg>
    <xme:uH77YjNcEXJgWjJVRYMXjxiOZiQ_xW_vrPJy4WhKm5aoDXBVPGlFRbT2l3PbeVdnP
    qFjaH0MBQhFtbeBgKU>
X-ME-Received: <xmr:uH77YuhrnlrmM9F9rit45GqKS1TkdJsy5h_I9aYWcNi7lTinEpIDZJsSvJo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uH77Yu_NKdmhxZQNYpsD5aSq5XTqH0UCP6YqOiIsT4LC_ML-q5Wo-A>
    <xmx:uH77YhstaVw3R7Cw1suzx8TJ-R43ZK0e2T7vzwpYgVeMYk9wwXNUFA>
    <xmx:uH77YtESGVcyd1nf4LrrQNfUTm5FaePWp6yObeFPeli1Sfm6Bt8QbA>
    <xmx:uX77Yik8sWn85ahWhC4KYjrQFMiN4XsJhN31EAl8B7S5PZbJBbNEtA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:25:44 -0400 (EDT)
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
Subject: [PATCH v9 02/25] clk: Drop the rate range on clk_put()
Date:   Tue, 16 Aug 2022 13:25:07 +0200
Message-Id: <20220816112530.1837489-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
2.37.1

