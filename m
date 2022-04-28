Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFBDC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349263AbiD1Qr6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350327AbiD1Qr5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:57 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAE3B3694
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:41 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 609885C013B;
        Thu, 28 Apr 2022 12:44:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 28 Apr 2022 12:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164281; x=1651250681; bh=5Z
        n6ZK0b0wyuzKsz4FbRx4wD3Xe39Nb0j+MLEyzUH1w=; b=PTc+t5yzHRWAp5K9c/
        6WSfSMtEeCSoayDcffTI9Mjkip/WSPDKgpDciMJTRINV1ZJKRW5ZVK1hVpMXO/Y2
        u3Ud8ZmCK80c/i24iUwh6aAuKFoUyOjERngWO8QheLWtLDnodozB2VO6EkEaComj
        mz9PdEVJQ0Us3s1BluxaOiUqlYynH24t9MmY8cKW/y8EiVgk8u5l7QFguyAcnrxt
        rPUY9JefdtEZaQzxQP3gwU1vL1cYlgFhsFN9JRZ4VpMIgCBcUBBP1yrClEhU2S63
        KlDLPcoQTDZBUVqkncKonW4wNvqnzkynDDAvbTeGTxIxPxbHnJ3o5P7Oa0IaTMc9
        PguA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164281; x=1651250681; bh=5Zn6ZK0b0wyuzKsz4FbRx4wD3Xe39Nb0j+M
        LEyzUH1w=; b=GC3Buc72xSLQiUQbWIvaBIzCT0XcO6Tj+8U8JVi19FWa1Lu4akt
        91PL9f+YfynMaHZiVgZsTQ/GYClLj2opoVEKyhkZIhPZ8r8X7DgNgy4BQfqvY+Sh
        VvGaB0aVImEAf5eeujz4Dh9voj7rj1FPhk2tyEAMmVm/Haro3FYNlgJHaTsTbjgp
        jxgnjeEOtRQ7MDc7LvBClHuhuIA4Hg/kU1+pU/M/KCTFM90KdBpKKDCIt+QQYeZo
        LG+7nZs7ahqJsgVF2YMFUNZCQl/KT9vTaqe0Divv5L8ZSfA9lpL4PRgQ92lQqr8M
        XUtGxglzxkUNOoKEOEcB/REjsMrmGurDZ2g==
X-ME-Sender: <xms:ecRqYpMfpNxV7U2hmcD4HDdzvyKM-Jyi9duLmdnPnalU5Nohe6GTmg>
    <xme:ecRqYr-fuUO9SwlmD2HezVrt296IHAcFCt4JBcRQ0lsmtg_MIQAG3MCQ9uL9YaToa
    ugNha3YnCJZptehDlI>
X-ME-Received: <xmr:ecRqYoT2Ann18IL6GlPosydSlwFVCRaCY9KlluzYLFe7f25es7MGbdG7Efpt30IRq_dATYwZ0JwxaHPpO9hIk5EQdSo_e_IHTNNpcgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ecRqYlv6UC7xHJnXxg_yK7il3CGn1mirAs9ZKi6HLpc9-yR-8IahaA>
    <xmx:ecRqYhcfkGuLVXdDesDvUqiTJ5pSlCMQpjtZ25tq8kyPDHE4EWWW2A>
    <xmx:ecRqYh2DZmQpSt5FLwcoBW_NyupiYDnh2XIIi5Nc-9um6KTAPxG9Ww>
    <xmx:ecRqYiWlqLZbX28iIXUmli-TjJ6BWEWtekX4LJHbq1AzrgIUaDfr6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:40 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 28/28] clk: tests: Add missing test case for ranges
Date:   Thu, 28 Apr 2022 18:43:38 +0200
Message-Id: <20220428164338.717443-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
2.35.1

