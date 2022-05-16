Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BDEC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiEPNZk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiEPNZi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:25:38 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4B927CF1
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:37 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id BAB3032009FE;
        Mon, 16 May 2022 09:25:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 16 May 2022 09:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707535; x=1652793935; bh=xV
        QGV5aF6muznsh+wrXRc0KoGcw8HugWErZ/xX9uw8U=; b=jd5aFLsTFZ4o3eCpsW
        eMbSM2C4F5ZjNLXwIEGgosu4DIRJNZS9FTZZhA9MnFK2L55ioLOD9pCT7+WZPth2
        c/wo2PszNxyTWrw0FKTVE8tvC70V0zHm8WNs220YMsYsUh/uUK1ZnJhUwKFnjI2R
        NWKYMrU76+6MBqQb4vhcSNycahN76OrRTRIoAYQdT0aThM9+T3Jz6+GHkH6uHnm/
        bVGIu5Pr+Qcncy4QXOQ6ij8/egmgysrrCcDtgYtk6DhDId3Z5tJ2rczEK0jRfq2f
        F2vYmlyJYK3kPYndLYyyNAaFThfwqm3wwqKkPEQpOk0hllteTubSp4IJlpQ4oyaj
        7PXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707535; x=1652793935; bh=xVQGV5aF6muznsh+wrXRc0KoGcw8HugWErZ
        /xX9uw8U=; b=QT9oqt8QPuIamN1zZENBJCD5pUq/14vvNRcMiw89+w7DRtwmSKG
        eyWMWfpgRUn17MbEWx6R7aAi1p1vZG5bn610MxZVx5wLH7f0XeLmjTYAar8+z4WO
        gA1La0WsYcsSN/UfzRPotHVOEcr899AZRzEVma522qwq1VeCHnCEnsQtp449sjeN
        ydF1oP5vODMt9NRIUanYFWhbz2XE1wse92YxoOiZ9FQLrq6Luk9XuQWIB86AYo0O
        UEZcLVpL+hyhpJqzydXE8wuhyniGlwNoD3dY2NheMg8Xl91CHBfn7q0mCnaz9gh+
        Pc92nLPbs4z3BhsC6QFuRPKaDKhPTptG3/Q==
X-ME-Sender: <xms:zlCCYqBGlc71IaodARcBDjNciQrxuooGtjPav56nOYLsGh-p61FVmQ>
    <xme:zlCCYkjueDbt4-O9vCBVStlTkDzPShiICICMhZZiTcXQbhbrkgy6eQlb8_6dklZgm
    amdCzzneYGLiE_RNLM>
X-ME-Received: <xmr:zlCCYtl8Uukus_GItFqm4HhgOEMtqniDu4i9wRK4f4ox3TPZ33zTH-ZSujyskXj5xU0_Yq6UjCcx_ox3zev1Jf8bp14sTX4p6krzaME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zlCCYoyKOf_k8djDasqV3LsviiafPgoqXeEk__KzbF39Yktzvf_JJw>
    <xmx:zlCCYvSJTbsDd3pjXTP3VIR5kL8uXrc6sQI8ouWtSvvH8n4AwINDuQ>
    <xmx:zlCCYjaRy69U2rvVnJ6CZCreFmHmBbPJT9gsl-kiI-Bg29iFhIm4ew>
    <xmx:z1CCYkKBuryPE-ENtI4uxfpQutP0Nrso8JYwlb8SIdq83DIYRsVIZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 01/28] clk: Drop the rate range on clk_put()
Date:   Mon, 16 May 2022 15:25:00 +0200
Message-Id: <20220516132527.328190-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 108 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f00d4c1158d7..2a32fa9f7618 100644
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
@@ -4396,9 +4412,10 @@ void __clk_put(struct clk *clk)
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
2.36.1

