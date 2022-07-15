Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B35C43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbiGOQDO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233129AbiGOQC3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:02:29 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A36A7390D
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:02:27 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 425E232009D7;
        Fri, 15 Jul 2022 12:02:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900945; x=1657987345; bh=h2
        Fl3vSMcRu20SwFKzmHS9Q6gvuP02p9iCYZ1kTPdtQ=; b=G9WDlHxHgutiLSWLTC
        DhaSXbaVHeSbzmAvayEh377i4ng3KEbiBgW4ZzCV4nBBeFq5br2l67HIlEmuFkqW
        bLsELQMoJyAlJ5/NuA0Hfk0+KCdf9V64UwuWpzzWTRmeo++VwHn5EgaORrFeUNcl
        lvoqsQc/7R3UTYdTpHYTMGNEGVDwXxwFJJcpOOTeFG15b4rJcJ6HMcaJ7ACEi0vr
        b2z8BtwGte9wRebgOHEjTxsvuLWsoDMj+D9TEmxyce21X7VEkWOh40sstWh0r9Mi
        Q9ysjFYfe8YawtfKvtCxmhiIkDUiZamUYn0N8WqCpSJ1wK6UMGKuFK1aYEtmIcui
        ifHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900945; x=1657987345; bh=h2Fl3vSMcRu20
        SwFKzmHS9Q6gvuP02p9iCYZ1kTPdtQ=; b=qKuNVBAVP3ItBUlHWSdI7JJ8PEg9e
        mq62skL/R8ncKRpONmd7nPTLJeU/BHBO1Jl5wvgOOz6wZ+bhJRCqgtnIPBWICjas
        b/NyN3iXOoK7rbhZSxPSQmg+DAgDj/un/+/XHUzobqJYJxtROqkVxgxmoPZefIXC
        PCaPQx9WyHN89pKFcFqvdTV2bIB/MqmtzMQdl7a2a0VpwZ0X9nggmZQIpzPl9EGL
        gphwgk5mM3Xg65OQ/8K7onLnYiV1yqXVc+Ow6tJlEuBE9HhIu8CKWy6WUiVMnx1b
        WrpwbxsRPsl+xIr3R37T7PCWj2bic7RkvZuZ8DYOf1nfJxj/hE7OFnYxw==
X-ME-Sender: <xms:kI_RYt7BzvLtCbxHMhfzx5PoHOacBCs1VoaFZPBzt6VfyQSCfmWsSQ>
    <xme:kI_RYq4b1KgKoKGeBC4ujuCZ_7p2DgAB8U1zxuWtjZV6dV-gF30F26DPZDhi-S8_h
    1LahZ3sjwiw3uNroKk>
X-ME-Received: <xmr:kI_RYkd19tLkn1cRi8fLwfCmDISr3mf1Xk7Oanpd48vC0RlDCunDcjWp93K5oj4z1NjtsEHQf8M-8S1UqQwEf5OCLxvc96Rmqz8z7lE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kI_RYmIlpTSSprV1HIxx0nJiwtYop8xKddv9N7HXe2pwNXUlvwtvGw>
    <xmx:kI_RYhK7gniF32VA6ONXXNEUdtoCQY1nbDiBG0j0kLGRuMIZ9HAH6g>
    <xmx:kI_RYvxuOlVoKSYU0wIuYw38dQvZfKqDbrexIAgUEiO1l8_YXic5xA>
    <xmx:kY_RYuA1NrMisrt0XXddpYilIKIDrZY2G1WKgaXzOdhN1Gn9oZ7MVA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:02:24 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 28/28] clk: tests: Add missing test case for ranges
Date:   Fri, 15 Jul 2022 18:00:14 +0200
Message-Id: <20220715160014.2623107-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 5a5b7a8baba2..8e0c76ab1a6d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -514,9 +514,62 @@ clk_test_multiple_parents_mux_has_parent(struct kunit *test)
 	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
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
+	clk_put(clk);
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

