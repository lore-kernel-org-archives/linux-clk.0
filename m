Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E886C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 10:56:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbiBWK4r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:56:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239610AbiBWK4q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:46 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9249C8D6BC
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:18 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id EEDB05C0224;
        Wed, 23 Feb 2022 05:56:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 23 Feb 2022 05:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=AsUCOHZ8/xk+9V00hQVy1e1mvR69Dy
        363XNrvFqBx2E=; b=vAE7A7GGmP63GhU3QA96gHOFgQsUSORXHykBOlgNqFbT6X
        fRBBHK2yeKVvPRHHwvqfG5uiaaK8nNiP3JVVCVVvCA58qMQu+OAhdv6xHNjRt5yP
        e//csUFRfG3inyi1ITTGAQW/sIGnWRtPx2cJt7cVZzS1I+G7go4uihyvTM0NojLF
        rlKdEzp+kLscXcYOIJR8KykfSJ2K1XBCnBoG6Mm7IF8nSexclLqAGw53yi4A3a1z
        c5hZmfQZNqg/C2deFunijJLcz+gxnK0SSnSl/92iGAPJPAWjKemeI1BQpVuOzYXB
        N3ODKhxGgLckui3D8c/KIEmJ0y317GxySGRUOMng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AsUCOH
        Z8/xk+9V00hQVy1e1mvR69Dy363XNrvFqBx2E=; b=QWa7jOBULYrx60JCuW7AoM
        WFB8WaZOHq/XyV5V5OJ+kFQwgiYlQ2K4vjvQS8mWo0PH3/sZxRtpabCr4LqocNVJ
        f8DW+UcDIGAOG4cyTnIhg8aADNWqUiuHEasgji8w6nKKfnZDh826GFCjlbTLlL4P
        P4A0rC2TuW3ZoAUDVcacEC+IgymvADVZrbnE0uUtQ1X8h7ZOd3hBgK3C2leVFcLG
        IG+DLB/nlyHwDfAHepyKmldkc2taLPI4qYaTibO21KbGwsmuHkLi79cN5fP4JcwU
        xOXfSTFQys8Gn+t7w3pHRFNCTAN03ihebp6iBJjhH8NBzMMfDUKHb8svb51+61fQ
        ==
X-ME-Sender: <xms:0RIWYmTY2bzbxw6eK_u2q-SNrGRjmFmGmNlA3GZyA77jVD24ABPogA>
    <xme:0RIWYrwWUZ2wKQOsqvu73q6nhAgG452XGbTPgvJLYfBK-1j3kkmQzMzBNiaffBe51
    5rv3Q-xqWBEIRqKq9Q>
X-ME-Received: <xmr:0RIWYj3uo8rB_qaa2oZBx4saCF4KC3krdUVp4nHm8i6DPjuFdFDHFjZH2zhg2GDWJfyv6H_NmbE0MOraeyx21c0DzWR7Cw_qGlm-i28>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0RIWYiCq9loXIhGqWfAVcUHCyJcnzxwHqRcbFKgxsJNkOHm4XZ-13A>
    <xmx:0RIWYvjzoikiPE8EprWHmtNOYasXnWFl5iOv2cwdjWchXcmvsLwWIg>
    <xmx:0RIWYupMGZt1af0hXFv1VEflriLZZ7omAVrZk9Yz3tIVGxKzbVRxIg>
    <xmx:0RIWYvjHXVMbJtd7g89cvpPkZ77lEemLDYar0nAAeYskfztDkB_dmw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:17 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 06/12] clk: Always set the rate on clk_set_range_rate
Date:   Wed, 23 Feb 2022 11:55:54 +0100
Message-Id: <20220223105600.1132593-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
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
index c15ee5070f52..9bc8bf434b94 100644
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
index 5a740f301f67..60c206d1bcb0 100644
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

