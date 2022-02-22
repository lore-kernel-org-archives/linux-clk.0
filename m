Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29A9C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 13:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbiBVNTf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbiBVNTe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:19:34 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C73BD2F5
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:19:09 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 83EAF5C02A6;
        Tue, 22 Feb 2022 08:19:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 22 Feb 2022 08:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=F5hlwkWWLUOYvn2+6aTbJBkVygHP5w
        s1cq2srwCw7xw=; b=hjmCGJIyn5zH2XFYvk2PU/gnTk4fLYE5jjY8az34aSyx4c
        SPwLkHT07D4Rfrf2ese315JhAXDYdv3L1or9pG0WQn0apKrS2mxLS91Pm1uFhlEi
        05zH1UGYHrJgq71MXgYpwNKHOSLB4ZiQymmRbDBK5NI4gFIzukltV1j1nrFyGSKa
        Kc860DVGHFJ5zM1a6B7sc0AWnTt5S8Fjv9NN+7PMzky+Rikg56Dp/jt+YFjgBhgl
        jUiqyea7Xb1MLPP7jrUj0FrwxSEAVkYf0hHQyOEgt270N+8GmpWDiNDwNWIPmkRx
        EydsPLHjjUaGqMFrAlT4yRvcA2B4ZgGILxoShrfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=F5hlwk
        WWLUOYvn2+6aTbJBkVygHP5ws1cq2srwCw7xw=; b=Ii/q4+uUb8KEFBvG31arVG
        tibbw4KUZEvoAzMj14zrMG/c0o4Co12rqxSXEadGWVjQn3OLRqeQSL6s/m7vSe4S
        OAgn2wrucjtK3wQk/YulUGj24XxHf7tzC0pqaorO3slOPs2LUJ1aYFF3ButC0BnU
        Q0uXfc/jQJIDx+z6Fvdvo82tYzuCf3II6r9r7j+IA43N5y8d+MkCAkk32hOCmln9
        9U801ZyspcLcMYHjM9sM7pfzgXFe1GnmUkU794XF/NNvIpVgG8wJUEBE+83ofwu8
        wBa0VBsXgKSEVQWskp27OAIqOw3l5LP5zmH7JYV9JKkIZzmhuvtS9e6nORRRc9vg
        ==
X-ME-Sender: <xms:zOIUYh9bAvA3PAQJDFI6W2G1PVNPc5wwcpk5nMSQyw-lTJIPLb4BYA>
    <xme:zOIUYlvCaHljVLn5G8qdoEwi21WEm4a5qqAS4Vu2cTHMUBC8BW3KTAL-As8PYzX1e
    2noeJzD594FVZao68U>
X-ME-Received: <xmr:zOIUYvDafN3iVsKusYAa1CqE-tUccFut6vTSswQp9f4GrehfMjPnMAt-eVHlzIFjLi2x7E0Hr1JviPyeaQTKJxk0G-id-Vc7KhKzfy4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zOIUYldEALV311DyDq8XT_7Vnv3Ri-c_kQhMWT2QpeKueCuVRQxRCg>
    <xmx:zOIUYmMH-_y6MFcQqpeqNHxGo0b_ZzRE0LSCnYINSuOPBAn1NmkF3Q>
    <xmx:zOIUYnmzr2ksa8gU_n1dq310ohYLhB8PjVz242IiWYl8-BPO1OBoAw>
    <xmx:zOIUYleZw8g8Og6-A7HGpj2rUAP_QGAO2zhAtKCZY1qQXfJP1ED_uw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:07 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 05/11] clk: Always set the rate on clk_set_range_rate
Date:   Tue, 22 Feb 2022 14:18:47 +0100
Message-Id: <20220222131853.198625-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When we change a clock minimum or maximum using clk_set_rate_range(),
clk_set_min_rate() or clk_set_max_rate(), the current code will only
trigger a new rate change if the rate is outside of the new boundaries.

However, a clock driver might want to always keep the clock rate to
one of its boundary, for example the minimum to keep the power
consumption as low as possible.

Since they don't always get called though, clock providers don't have the
opportunity to implement this behaviour.

Let's trigger a clk_set_rate() on the previous requested rate every time
clk_set_rate_range() is called. That way, providers that care about the
new boundaries have a chance to adjust the rate, while providers that
don't care about those new boundaries will return the same rate than
before, which will be ignored by clk_set_rate() and won't result in a
new rate change.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      | 45 ++++++++++++++++----------------
 drivers/clk/clk_test.c | 58 +++++++++++++++++++-----------------------
 2 files changed, 49 insertions(+), 54 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fd3daa11bfa4..9ee9ef0601c5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2373,28 +2373,29 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		goto out;
 	}
 
-	rate = clk_core_get_rate_nolock(clk->core);
-	if (rate < min || rate > max) {
-		/*
-		 * FIXME:
-		 * We are in bit of trouble here, current rate is outside the
-		 * the requested range. We are going try to request appropriate
-		 * range boundary but there is a catch. It may fail for the
-		 * usual reason (clock broken, clock protected, etc) but also
-		 * because:
-		 * - round_rate() was not favorable and fell on the wrong
-		 *   side of the boundary
-		 * - the determine_rate() callback does not really check for
-		 *   this corner case when determining the rate
-		 */
-
-		rate = clamp(clk->core->req_rate, min, max);
-		ret = clk_core_set_rate_nolock(clk->core, rate);
-		if (ret) {
-			/* rollback the changes */
-			clk->min_rate = old_min;
-			clk->max_rate = old_max;
-		}
+	/*
+	 * Since the boundaries have been changed, let's give the
+	 * opportunity to the provider to adjust the clock rate based on
+	 * the new boundaries.
+	 *
+	 * We also need to handle the case where the clock is currently
+	 * outside of the boundaries. Clamping the last requested rate
+	 * to the current minimum and maximum will also handle this.
+	 *
+	 * FIXME:
+	 * There is a catch. It may fail for the usual reason (clock
+	 * broken, clock protected, etc) but also because:
+	 * - round_rate() was not favorable and fell on the wrong
+	 *   side of the boundary
+	 * - the determine_rate() callback does not really check for
+	 *   this corner case when determining the rate
+	 */
+	rate = clamp(clk->core->req_rate, min, max);
+	ret = clk_core_set_rate_nolock(clk->core, rate);
+	if (ret) {
+		/* rollback the changes */
+		clk->min_rate = old_min;
+		clk->max_rate = old_max;
 	}
 
 out:
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 2b906c594328..b23859d1b460 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -544,13 +544,12 @@ static struct kunit_suite clk_range_test_suite = {
 };
 
 /*
- * Test that if:
- * - we have several subsequent calls to clk_set_rate_range();
- * - and we have a round_rate ops that always return the maximum
- *   frequency allowed;
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), the core will reevaluate whether a new rate is
+ * needed each and every time.
  *
- * The clock will run at the minimum of all maximum boundaries
- * requested, even if those boundaries aren't there anymore.
+ * With clk_dummy_maximize_rate_ops, this means that the the rate will
+ * trail along the maximum as it evolves.
  */
 static void clk_range_test_set_range_rate_maximized(struct kunit *test)
 {
@@ -591,18 +590,16 @@ static void clk_range_test_set_range_rate_maximized(struct kunit *test)
 
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
 }
 
 /*
- * Test that if:
- * - we have several subsequent calls to clk_set_rate_range(), across
- *   multiple users;
- * - and we have a round_rate ops that always return the maximum
- *   frequency allowed;
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed each and every time.
  *
- * The clock will run at the minimum of all maximum boundaries
- * requested, even if those boundaries aren't there anymore.
+ * With clk_dummy_maximize_rate_ops, this means that the the rate will
+ * trail along the maximum as it evolves.
  */
 static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 {
@@ -648,7 +645,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
 
 	clk_put(user2);
 	clk_put(user1);
@@ -668,14 +665,13 @@ static struct kunit_suite clk_range_maximize_test_suite = {
 };
 
 /*
- * Test that if:
- * - we have several subsequent calls to clk_set_rate_range()
- * - and we have a round_rate ops that always return the minimum
- *   frequency allowed;
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), the core will reevaluate whether a new rate is
+ * needed each and every time.
  *
- * The clock will run at the maximum of all minimum boundaries
- * requested, even if those boundaries aren't there anymore.
-*/
+ * With clk_dummy_minimize_rate_ops, this means that the the rate will
+ * trail along the minimum as it evolves.
+ */
 static void clk_range_test_set_range_rate_minimized(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
@@ -715,19 +711,17 @@ static void clk_range_test_set_range_rate_minimized(struct kunit *test)
 
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 }
 
 /*
- * Test that if:
- * - we have several subsequent calls to clk_set_rate_range(), across
- *   multiple users;
- * - and we have a round_rate ops that always return the minimum
- *   frequency allowed;
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed each and every time.
  *
- * The clock will run at the maximum of all minimum boundaries
- * requested, even if those boundaries aren't there anymore.
-*/
+ * With clk_dummy_minimize_rate_ops, this means that the the rate will
+ * trail along the minimum as it evolves.
+ */
 static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 {
 	struct clk_dummy_context *ctx = test->priv;
@@ -768,7 +762,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 
 	clk_put(user2);
 	clk_put(user1);
-- 
2.35.1

