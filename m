Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA7CC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 16:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359737AbiCYQNa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 12:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376338AbiCYQN3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 12:13:29 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50393B8220
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 09:11:55 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B5E575C00A9;
        Fri, 25 Mar 2022 12:11:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 25 Mar 2022 12:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=XjQpG31LSEbEXjOa0VcieQ8Iv0Wl2V
        MQyEqwn2NVGls=; b=NfUk9ghOJJWP6Xr2GBG1Ysuy0ulUe4zwzCI5lxUeX3k2o/
        QX82Y16Je0xvpYIZmiPs4Ebxr9bucE2Z0A+yujKxQNvZKBnlDdq5FFmCoa8xzKx5
        cWtzZyjk5AJ5ec6yT+UYmcHObCK9tDU5NLclqCaXj7NhTF6QeoJtOgXFkx138ppg
        XnukmO4BSwxW3Z5l+RPlA3eAHEMYdk5dndOE5fYvXjY4U8aO5ioEdLRVReE8DGci
        qUOMHQrbZzO7tVLXXOIZaOGPu1yqKQkd/m0AcnLt59Xz7cfqNihr/j9U8iFT0Dnb
        suiO0HXX8IBlU+McKoqpQMTz7NfnFkMaBaqyKjOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XjQpG3
        1LSEbEXjOa0VcieQ8Iv0Wl2VMQyEqwn2NVGls=; b=lGe1mQXlamPpKKoAL6gzhC
        cSzwPuwK78m9KcK/AST5AdpJQrFR0Z31DP2r9DeCqvPEn/uYJysIZSKgOGU3sqih
        J3botHeSYK/iWoEoUNjaAdM6rXnaH9pm5pbZUFoLcgT+iTy3PTSSSUs/wldKDJSf
        kVaqadusYcYrdTVrcAzJbf0opJnsqmSoflKJcFfqMydg4ktwLmRScf1J7lyTOWhx
        eAv+aC/cXdLZqrjBVpWSwmoETbFAohQ1hVjVYjN2CBsd759oeFOIOik1bEn97XTZ
        7qT0c53VXcA/CZiHtby4T3dfiqaWhS3PXg8meHT3lpXNbpMjW71psQVO2lzlU2Yg
        ==
X-ME-Sender: <xms:yuk9YoTTGDqCJSUqdf5ViQC8aMUvFRyyCkbPXKkz-PWiuCNyuwhmng>
    <xme:yuk9YlzDQMgyzDpISQvn9dwbHz9z7nL9Mkhvz4mbgaVBLg08voE9iComKWENxnq_K
    w6WAlNOmev7G0VqXI0>
X-ME-Received: <xmr:yuk9Yl0uSEsFCcsa6BvYR3oUF5Kep-QwBAF3o3oDKYvQZOgAPkYvi_vPHDosb34ASsJ2eWW52XhNvpcwbcTIvVZhAZgjSqaKt-BtB24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yuk9YsC3ApBN6PHqXnjHnjhZDcJKmlgzhucbHdmCdW7Cig4wpmBtNA>
    <xmx:yuk9YhiBguM3UnGB9W4T_g3u58VxjM9sU1EP9_vV5UD4AkX_XY51DA>
    <xmx:yuk9Yoojk3EB22hv5AoTnVrAGaoMJEBybY441VOaIp1cSzA1nkNNiA>
    <xmx:yuk9YmuwpMUycMA-OeOZDRqzKhr1_FyBA7ejZf5tsVudXXrVRx89XQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 12:11:54 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Date:   Fri, 25 Mar 2022 17:11:44 +0100
Message-Id: <20220325161144.1901695-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325161144.1901695-1-maxime@cerno.tech>
References: <20220325161144.1901695-1-maxime@cerno.tech>
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
 drivers/clk/clk.c      |  42 ++++++++++------
 drivers/clk/clk_test.c | 108 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 136 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 915a2fa363b1..91f863b7a824 100644
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
@@ -4403,9 +4419,7 @@ void __clk_put(struct clk *clk)
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

