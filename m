Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06343C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbiDHJP2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbiDHJOB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:01 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07D511F7B0
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:44 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 30FD75C0245;
        Fri,  8 Apr 2022 05:10:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 08 Apr 2022 05:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=ZXHFBXkRMe+iMdzu7an/QX5RkNJmIw
        WIlbBYf62iOqA=; b=TYOeUfR7IruaWq/XIOjcl7A6aCNlAoixepvJGfEpJ7dOCZ
        Np6IUamJiFxgfJtFNxx/G8uoImfDp6lu0V/BsFXe+p1RfDHJanxRX8hyo57TevFO
        ju3S746SvyfRadBR6K9ZhhDk94XLE9Jgx2BpVWFCrcIYgVeRdz2ttY/Lb2WreEuR
        mqFKTiFTyve9YhCoqkhnuHlNf60bJ8DFdNPc9YLWQUdtz6HUNN/xR9NXTbX+J6HF
        Ty4r5GeqYhAY0SLIgjiCB8N617abVvpeZyWAY0UT4m6TtpTNmdyYlPg4ZZiJc8rn
        THOIPJhNfulKdp0SWJChvkfBXPJ7wb6f6QGwmfXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZXHFBX
        kRMe+iMdzu7an/QX5RkNJmIwWIlbBYf62iOqA=; b=keOnynoXJ4xQmDpAxYSJm9
        5sDGyHMoOgzIFl6CggppJ4sOWBsBmVFdjNGEo5Cpw+TZv31HitUBpDBovf8oy79N
        +qOD7CM7+nfWhFkq/USbceTBlUrxgwzvQMt/En3k1c2fHNR1cMXkzVUY7pFiF0RF
        wGzcOHXtE5K9Wighi3MYKQcFxUy2wLI2jNmieUprNm/cW4K8iT0Sp0mItM6tCHKl
        P+cKE0PSVNfgYajbQ3ZRRmq6otrEBaecn5/dYT+cFCmgn3wMfvDp0ZrEJijX7mbJ
        7IFd5Yxtj+kofnsPXSjZh3rzNVhtZ7XZJdteMcY9o4TLVXweCvjJ6GAWpaBOkrWQ
        ==
X-ME-Sender: <xms:E_xPYnZT953_TvGQWOxTXWoNkEYlFVgNEkYXwp3jzDjJUmCUAwkOEA>
    <xme:E_xPYmapCAR_gkWr-GnMF-4qb9z5Td9rslit6pTz20tQqUnUZd0oO18e8QgpDH-ME
    15vZ0uuiwz_JSsxa-w>
X-ME-Received: <xmr:E_xPYp8cShWecszxQqmuL3paluDk9ywexc_hwCVUewFsQe1Z8lrSnkUDFpYHIoWtXSuOBTvE4Txghn4-62xlyKGkDp4yXnAC0_H1u2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:E_xPYtp1vC-RSJ-5JqFMditp4WxSEnz68wSTVzejteFPzca_2xqQBQ>
    <xmx:E_xPYirOW5JbX-NgWNH2QeJgOe1tTo3IwCSSRK-X2Soi-gLoE5onfQ>
    <xmx:E_xPYjQg78fxhMr7MCYjh7tlTDL-bAGdAB-qkzLlNYKW7ZIUuKkAGw>
    <xmx:FPxPYh3Botsy9jNuG0c8ouu-7JslYo4hdK-J5Fw61DkFVZK2Sr8xlw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:43 -0400 (EDT)
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
Subject: [PATCH 01/22] clk: Drop the rate range on clk_put()
Date:   Fri,  8 Apr 2022 11:10:16 +0200
Message-Id: <20220408091037.2041955-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  45 +++++++++++------
 drivers/clk/clk_test.c | 108 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ed119182aa1b..4ccf52d31a21 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2332,19 +2332,15 @@ int clk_set_rate_exclusive(struct clk *clk, unsigned long rate)
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
 
@@ -2357,8 +2353,6 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
 		return -EINVAL;
 	}
 
-	clk_prepare_lock();
-
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
@@ -2402,6 +2396,28 @@ int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max)
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
@@ -4403,9 +4419,10 @@ void __clk_put(struct clk *clk)
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
index 6731a822f4e3..fd2339cc5898 100644
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
+ * With clk_dummy_maximize_rate_ops, this means that the rate will
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
+ * With clk_dummy_minimize_rate_ops, this means that the rate will
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

