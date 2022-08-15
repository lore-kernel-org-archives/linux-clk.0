Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93461C28B2C
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbiHOPoL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232390AbiHOPnp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:45 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C39B1DC
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:44 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id F06B6320095B;
        Mon, 15 Aug 2022 11:43:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 11:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578222; x=1660664622; bh=At
        3V6ZkUa2LFlTQMXRTxt/5U1TKMVvb4QVZVWFkJh9E=; b=RHfu+T9zebNV2jOm3r
        UpMwO5NbQS+XxQ0lo/F3sG6f6FqogpZEbM4DWPOVDwcE42lo9o1ylD+/KAtiawBS
        ymnCioFUTudoxnjwpt7j5Ms9n8mw+flyK31uSJHouG+nnv5qkcipv8SMHP0lSfX9
        PsLaet56R1LGBt0ezFoSACCUlJkt9xFOcLIYXJ+35W1CpbLEpE8hbkvj5hGwAurO
        h2Y+9Bwu/wrnrJ0hOew5r06jLY/Zf6YY1yLLldIa21Gh+NaNnR2ea+MpXXbG/bEP
        s0LGGYcWJibYykGPIcfr6mUUR34txvWGnoGHVUjjo2l8qDrniBGUApWVQQLIeqdO
        abUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578222; x=1660664622; bh=At3V6ZkUa2LFl
        TQMXRTxt/5U1TKMVvb4QVZVWFkJh9E=; b=lPf4OsAS4Mjb56irdn+OkJ+IeHaps
        fMe8fuRUKt8DrXta2+8vE1/DRbFvCGz1bsvBzio0XteIvUrcZKZhsR9G2NE3oJ/4
        k/yn0J/DGkVFPCozNjPUGGrHU2Utgqtn6UiiuwWi5mTIPRWMiRrfqD8pU1opQqW/
        Bjs6RRSjpvVEfq/r1hM3Q8I9D1B7aq5UfWIRw10RgcvdNWLjP2q51R1h1lTMc18D
        1w7vLhLDAXYIyL3vn01mvfu3j5IXre5bYnYPmzpvIDZCfUnSfRykDLmfZRKxTIpU
        iVyMynjXd3a5h5ymL/t2QQZkirIbfHQtLLJ8NDamfF26ZbWg/wgrlDFKg==
X-ME-Sender: <xms:rmn6Yjmlj-WA0-6591SGkvAH2i56oIue6m8iwp44ViqD3RkOfwwzJw>
    <xme:rmn6Ym2rHNPxEbkMihYvWbEFIARa7m5ZXeNP6u_5dgPYZaC61yV2T66LnkZknAkfb
    GecFkTFEB8NOz-RXx4>
X-ME-Received: <xmr:rmn6YppDFSvAsUHXtUgalfYN5N6oQxSurvpXWxBO7kp8zeMqAOl1stbS2zG_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rmn6YrmQpZWJ6mIz9L0u6WIQPMwA8eHe9-_rSICLZNtfZClDRm7l1g>
    <xmx:rmn6Yh2ZVIz4KdpgF90Sc3NnScXiTgxkSfUL_Qswf-8tff8dUHxmDg>
    <xmx:rmn6YqvbN4_Ydx2WvYqLKsRTESK1HmoMe_zpUw_laigksj3y2tLbqg>
    <xmx:rmn6YqusNxzOHr6Fz4Tp_gh0mczyIckk2bfG8pSB5WhUfy_7CUctIw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:41 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 25/25] clk: tests: Add missing test case for ranges
Date:   Mon, 15 Aug 2022 17:41:47 +0200
Message-Id: <20220815154147.1631441-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
2.37.1

