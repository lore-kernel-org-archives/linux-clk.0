Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0FEC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241812AbiBYOgZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:36:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241824AbiBYOgW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:22 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490B21AE677
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:35:48 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 602195C0167;
        Fri, 25 Feb 2022 09:35:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 25 Feb 2022 09:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=ZXcjPwmMy2uZ+61biEePE+BYdMuk+j
        L1u2pdaLSYFT8=; b=g6yOAhx0rs0cOH7mw1H9GzLONIaAqDsOaUrokyHIQDpKg6
        bVG8FJ9ZYh6Q3bFwiDvxX96siVkeRJw0hXEFVXqr7eJuIIq2WVw606ooejHFMpUy
        5SrTrq3NfFCi8iHVoCHJK5+SBK5LjIQhAc+3E4LcUIDV1si5zpDTbz6fn+2VU+EW
        T+K+/wpw3zLAh5uxm+uigTHIvoNOl/SSBl6/6ndBHmhTkB+St2julv7b0DiAaBKa
        xPyL251T5vbk4VrTb/WsBp09DMPeD8KtP09O1Dq+MnR521H3+nCAKD3V+RON312S
        NCyy1bwvm3AaOl3PqRBAvMQMdWlAITml5X95QdiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZXcjPw
        mMy2uZ+61biEePE+BYdMuk+jL1u2pdaLSYFT8=; b=B7muxjCFUZXGY8I0CY2Q1c
        9p3FtSumyp9bIZxk392EtUn4o+T5t/dK224nvxpylee1yxCGN2IrXB2lesXAaeIK
        UPLD4Akg9g+CZPnu+y3o7afojHuQLqORwzQIlsxUZjuZ7nm0oIOspM+mhhTlU7TX
        S3sgBZmZvhe6UOODpcep6/QOuBFFEuVqGPauBu2fFNhJX8qJ2aiMk05v0vHZY14s
        gxZifYRP/rnTnUud7RbyjClCV/7xxq/nthoVdDFKN85ZqptvxJ3oWQEkHmrzovk4
        Ikij92TK8IeOiqugd4iuC5LNmH6GbAz/py6dZ9QaVKvvpAF7q/pFo4lwlpbLW/mA
        ==
X-ME-Sender: <xms:ROkYYjl3TP7v4nhZLPbS7opclHnSWbku4WtOkPVhi1Nr4F2RiTuCNQ>
    <xme:ROkYYm0VLphqfvol0uZ00DVePYPFwIVoS2AF84UoS4SEtcJVTmmlRaqVhPtiRpM-s
    RiZGKkpN2Vo95MRgdc>
X-ME-Received: <xmr:ROkYYpplu3C7fvzxP5RxXQrBX4GfAXnF09ArIPMAC5whQlBoeOLLCE6-1_1XGJHsKnAuTq6eqlMazFshd_DE9yHltW31XbiK_1qZkbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ROkYYrkK7tc-RvWneKbPW3lK7fAIWgaOEgO55GDXYP049NKgKLiSDw>
    <xmx:ROkYYh2LzFr13U4ecurPkPjQcIXncWaEsc4LE1UqpUlATfoygORkkA>
    <xmx:ROkYYqvltVMAyOZhPJWfaWA5KIMgg_OfZM8hxHVcKDRzahGW-z5joA>
    <xmx:ROkYYunUq4ceWrej15BaHLh06N66dfnr6hsEJdQ9hMAK3KK-mvf1Hw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:47 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 06/12] clk: Always set the rate on clk_set_range_rate
Date:   Fri, 25 Feb 2022 15:35:28 +0100
Message-Id: <20220225143534.405820-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
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
index 2279be699001..2c5d30a9372e 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -549,13 +549,12 @@ static struct kunit_suite clk_range_test_suite = {
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
@@ -596,18 +595,16 @@ static void clk_range_test_set_range_rate_maximized(struct kunit *test)
 
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
@@ -653,7 +650,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
 
 	clk_put(user2);
 	clk_put(user1);
@@ -673,14 +670,13 @@ static struct kunit_suite clk_range_maximize_test_suite = {
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
@@ -720,19 +716,17 @@ static void clk_range_test_set_range_rate_minimized(struct kunit *test)
 
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
@@ -773,7 +767,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 
 	rate = clk_get_rate(clk);
 	KUNIT_ASSERT_GT(test, rate, 0);
-	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 
 	clk_put(user2);
 	clk_put(user1);
-- 
2.35.1

