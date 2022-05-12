Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520B5C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356252AbiELQFU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356262AbiELQFS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:18 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2002655F7
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:17 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0B6255C01D2;
        Thu, 12 May 2022 12:05:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 12 May 2022 12:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371517; x=1652457917; bh=sq
        RfGdeQAqJMPxO9VUcDlzAvt058Yt2DTJa/DUBaKS0=; b=c0Z73Yl0zrp9+8kbLC
        IhwzdycFlmFN2hFDdL7tqtvvciON5DcAF/sRRL1PqPVcv8fwSGswetZBdAGK4Vp6
        +5mAzPeKM9jJvWfOfIkUfiHVdS0n4Z0Q8YHXIcj4qeME5nBJ6XhqVn+EZQLMsSA1
        WZPF73x4jccFPbq3lTcTuvRFwGv01DODFu1WbST9TDOsfKVkFopDOJt6yhNQs+Db
        iDg/J7YWs3zrgNYReWUQ+Gr1nIOcceHZQBS3rl329jjDogAj1xBAFLZB6oGuNRau
        6pIgqUuPqQm7SBI3DVUyqfmIRy8pkxK5EQpmMjR0XFXazXy8q1WQ/pp+Tasjig5S
        PcJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371517; x=1652457917; bh=sqRfGdeQAqJMPxO9VUcDlzAvt058Yt2DTJa
        /DUBaKS0=; b=X2C3XfE3j1E0OqO7heQmOrVEXDeRg5mJ+PbvYVJQGKPMXcLo3UT
        gxGd41jXVjqSMn94RDWLNK4Wv/+izXNAih+OXdg/uxXkk0bJnE8o3fqFrcpLV7uE
        C+DXoHb78+k7R09m8Qlobu8zThfuNtyBmKR9UFlGfayAqHBs37B3Xkx7btCk3E2Y
        RC9XGhzmK0xUAgJVVXwF46lnSCL4bQYTO9rod26QICywqDt9F3euZWfHWZURMS0O
        cRaueecuAbumLmBYCI+F0kCmhiICx59KaPUvHE19PwJvlQ3ArnMkYz2vh1cd7hkA
        Lw4tFBHpqC3m2v6JP53B4mqyXKXSELnH1wg==
X-ME-Sender: <xms:PDB9YqoJZq0F5IyPOQbgxys_k8-71d_W55Jc9dIXAEmVkpXDRfKvGQ>
    <xme:PDB9Yor1zh13sN65iDjXXaB3coQMJTu7rrVDJjZM4PrarO3YEWcC-EqQv3c7EUykO
    w6G1dSXuOUCq2prUjE>
X-ME-Received: <xmr:PDB9YvPfUKBI1TPGd3SAHaV64vFO2MESs-FYEO3-q_onrtbSD-nktMr1OlJjJQLaMHZfkYFTLW8gSC39soTDYbh__UkPWCuJlRe4o5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PDB9Yp4Yi150eCcKXQWl3NZp-OAM99xNJpI4axv3huMtWkAU4FsxkA>
    <xmx:PDB9Yp4zQyvFxx5CsRdJ2haVdiWrVJHeP9k0qzcsFy4vW_KnQK-oYg>
    <xmx:PDB9YpiKi-YMbbodGrqP7UQhpdYHjgO2DMGDiiIBDIfH92ifVZ9nLQ>
    <xmx:PTB9Ymzpdbb6dGfXKvCergfWZvBUOzW4arvYzuE1r59HKY5brAc_bQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:16 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 28/28] clk: tests: Add missing test case for ranges
Date:   Thu, 12 May 2022 18:04:12 +0200
Message-Id: <20220512160412.1317123-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let's add a test on the rate range after a reparenting. This fails for
now, but it's worth having it to document the corner cases we don't
support yet.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b4ae6eec7758..8226f2c6c8a3 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -488,9 +488,61 @@ clk_test_multiple_parents_mux_has_parent(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, ctx->parents_ctx[1].hw.clk));
 }
 
+/*
+ * Test that for a clock with a multiple parents, if we set a range on
+ * that clock and the parent is changed, its rate after the reparenting
+ * is still within the range we asked for.
+ *
+ * FIXME: clk_set_parent() only does the reparenting but doesn't
+ * reevaluate whether the new clock rate is within its boundaries or
+ * not.
+ */
+static void
+clk_test_multiple_parents_mux_set_range_set_parent_get_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent1, *parent2;
+	unsigned long rate;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent1 = clk_hw_get_clk(&ctx->parents_ctx[0].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent1);
+	KUNIT_ASSERT_TRUE(test, clk_is_match(clk_get_parent(clk), parent1));
+
+	parent2 = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent2);
+
+	ret = clk_set_rate(parent1, DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(parent2, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 - 1000,
+				 DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_parent(clk, parent2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+
+	clk_put(parent2);
+	clk_put(parent1);
+}
+
 static struct kunit_case clk_multiple_parents_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_multiple_parents_mux_get_parent),
 	KUNIT_CASE(clk_test_multiple_parents_mux_has_parent),
+	KUNIT_CASE(clk_test_multiple_parents_mux_set_range_set_parent_get_rate),
 	{}
 };
 
-- 
2.36.1

