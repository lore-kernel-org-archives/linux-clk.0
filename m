Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E35C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 10:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346224AbiCYLAI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 07:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352917AbiCYLAH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 07:00:07 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957464C7A0
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 03:58:33 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 000EF5C0131;
        Fri, 25 Mar 2022 06:58:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Mar 2022 06:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=8SSTOccaUNCExmRl+Z4+r2gQ1J2Z5G
        J+pWFxiyH9Zdg=; b=Hx116PMZTkJBDp76MJqljFkmBd3/ARa3nJMde8D4rd5bXH
        MYTGbc7FpLM1pHyp46KRsyeiPRO3KxOWkuOH8bcGZEsCgyvxIGOZkzci5yXrK+3k
        /uR35h3JZY7aKPdx4oMnJlfKuhvFgpz9Wph6WMpaf8Ce9Y5cW/Igf3GA0+DViK85
        ZxuSTBjrJ/8WhXfO/puzO6DgYy4Vd9TqIFCmn9LicSjJ+sQs5LzjSq/zNktYVUWG
        8/kHUyjod+3vYkjuBu04fNtAfcykvIVWsxn7N87sDT4rLQWtgCxhpIppVjaKahxF
        eODj06eZCaEPOac5/jSyLPrYtOx5Ce3G1sJjwbcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8SSTOc
        caUNCExmRl+Z4+r2gQ1J2Z5GJ+pWFxiyH9Zdg=; b=ayb4LRQhy5TLqUk1rthyjP
        wTQDfgUmtuA9x/WXOJCNIPURe7b9oWe7C4d3Mn8iuTqYfK4fVcKDPUd5WO27UBmN
        rl7PwOO9XP5XKU8e/8jt+Jk/wFQ3fYebTiQ+Sg2urBt9RqQTdPVIc+uPV0WqfZWa
        8uX+o9VgXSS3I33OjK79oaZr3GFqTp/DK8tcolGXD+lrEpMcCDqkFiPRiT3VUC5g
        3LENQlYrgfqB7ZzZbn0kWwG1gt0VI6qQ2syptyRjb5pw6x3wn8+oLi613BnMa8Vw
        Kf6wMnmDIv6w3LntIzzAxJ168DMVAFsGxvEnup+3UiS0/tuIK/a4b3oEIyoYJXKw
        ==
X-ME-Sender: <xms:WKA9YvBKEZ0zADqFSTfYxWJF2U93e-zWgCcA3xa3RRK6-PIkFIlCIw>
    <xme:WKA9Ylik5ubZMVCJwLEGVDETY9vmRYJU9E3x8dyA_GsO5aBnKURul8N1J7hUGsuUB
    m4UhlA4LegLcbGvceo>
X-ME-Received: <xmr:WKA9YqlhW1BW5GVNQWUpNS3Cty3FI33F0_zj_GLoLlTRw7BqVyO4scdjBFK9NoJgYqUvFoD9_4sDUjiKRA6A4E9VY3C_qvD1iuNQEpU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WKA9YhzXVSvhjcPAN8u8mFVSXuT763wyVRfJpSUv3WdRNZys7Zq5ag>
    <xmx:WKA9YkSD42QMi_Ljwo079WxcEX2XVKtzm6p8TjYlX0HkLxV5DSM6nA>
    <xmx:WKA9YkaYZNh1yuE7WyI1lUXufkYvbrz3feJ9moON8FLHFShfyl7jbQ>
    <xmx:WKA9YqeAUcFH7zg9rpQy52FCMI7hOj42pyb_zJDoijnNzZ8vr3ouFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 06:58:32 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] clk: Drop the rate range on clk_put
Date:   Fri, 25 Mar 2022 11:58:22 +0100
Message-Id: <20220325105822.1723827-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325105822.1723827-1-maxime@cerno.tech>
References: <20220325105822.1723827-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While the current code will trigger a new clk_set_rate call whenever the
rate boundaries are changed through clk_set_rate_range, this doesn't
occur when clk_put() is called.

However, this is essentially equivalent since, after clk_put()
completes, those boundaries won't be enforced anymore.

Let's add a call to clk_set_rate_range in clk_put to make sure those
rate boundaries are dropped and the clock drivers can react.

Let's also add a few tests to make sure this case is covered.

Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  34 ++++++++++---
 drivers/clk/clk_test.c | 108 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 136 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 915a2fa363b1..f21901b83a9b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2340,11 +2340,15 @@ EXPORT_SYMBOL_GPL(clk_set_rate_exclusive);
  *
  * Returns success (0) or negative errno.
  */
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
 
@@ -2357,8 +2361,6 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		return -EINVAL;
 	}
 
-	clk_prepare_lock();
-
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
@@ -2402,6 +2404,28 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
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
+ * Returns success (0) or negative errno.
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
@@ -4403,9 +4427,7 @@ void __clk_put(struct clk *clk)
 	}
 
 	hlist_del(&clk->clks_node);
-	if (clk->min_rate > clk->core->req_rate ||
-	    clk->max_rate < clk->core->req_rate)
-		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
+	clk_set_rate_range_nolock(clk, 0, ULONG_MAX);
 
 	owner = clk->core->owner;
 	kref_put(&clk->core->ref, __clk_release);
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 146b1759798e..b205c329cf32 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -760,9 +760,65 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 	clk_put(user1);
 }
 
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed, including when a user drop its clock.
+ *
+ * With clk_dummy_maximize_rate_ops, this means that the the rate will
+ * trail along the maximum as it evolves.
+ */
+static void clk_range_test_multiple_set_range_rate_put_maximized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
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
+}
+
 static struct kunit_case clk_range_maximize_test_cases[] = {
 	KUNIT_CASE(clk_range_test_set_range_rate_maximized),
 	KUNIT_CASE(clk_range_test_multiple_set_range_rate_maximized),
+	KUNIT_CASE(clk_range_test_multiple_set_range_rate_put_maximized),
 	{}
 };
 
@@ -877,9 +933,61 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 	clk_put(user1);
 }
 
+/*
+ * Test that if we have several subsequent calls to
+ * clk_set_rate_range(), across multiple users, the core will reevaluate
+ * whether a new rate is needed, including when a user drop its clock.
+ *
+ * With clk_dummy_minimize_rate_ops, this means that the the rate will
+ * trail along the minimum as it evolves.
+ */
+static void clk_range_test_multiple_set_range_rate_put_minimized(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
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
+}
+
 static struct kunit_case clk_range_minimize_test_cases[] = {
 	KUNIT_CASE(clk_range_test_set_range_rate_minimized),
 	KUNIT_CASE(clk_range_test_multiple_set_range_rate_minimized),
+	KUNIT_CASE(clk_range_test_multiple_set_range_rate_put_minimized),
 	{}
 };
 
-- 
2.35.1

