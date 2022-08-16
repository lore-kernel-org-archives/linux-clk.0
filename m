Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA145C28B2B
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbiHPLxN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbiHPLwy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:54 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007764620E
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:27:31 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 5EE0D32002FB;
        Tue, 16 Aug 2022 07:27:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 16 Aug 2022 07:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649249; x=1660735649; bh=At
        3V6ZkUa2LFlTQMXRTxt/5U1TKMVvb4QVZVWFkJh9E=; b=r6PWWUvSwEbnbibExr
        05sM983ne0J27YnrCj40KWj8xoyd41RKUL5i0eXq8KBJk4iUv5lj03uYNNdo7Tgb
        5h3DxCvBFpDqqME81M3FtPMTXO653KBjX4snBE8IU94ubI4v1+Ay+XAOXwRb24Uy
        GHiUDDKc++U84bwk0XOQGH+wNGScCVhf2u9X0kKulvNioytPiV64GwRuoKWcaseW
        bvgHCXSVp4AZAbwxchSepeUxxfSTnL+lbTBZGvoJ8ezPyfK4ridrdeXK8yLKBqZW
        1BZ/pAyZry48QU3sWEH0CG7Av8IQlDuEck0kAVdrvECSoKHry8cV8xjzl7h80PwK
        j1mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649249; x=1660735649; bh=At3V6ZkUa2LFl
        TQMXRTxt/5U1TKMVvb4QVZVWFkJh9E=; b=3fNJM/oC8dz2FOawh4cwpgWL/gpsu
        vmAPTXPBRSpCTSBb1eMIFZtFvyTVcOBOZHn2T9JRWkYktSjMCvCXv9frKAIdj3lH
        YTULa1OWEY6nyOdyGGVXFYYRjfpPnvj5ZfHwBXfNzEDoHhWrCSEDxHwdIuQDB3vc
        Nf9D+Em9MHKkQTfOntG9T9QGPN1aF7f0zS75F1jP6O/4ZDj2Mq0AauT7jfVmkn6f
        r1/WfL46Sn6VO8Z0eRn/XCcnQFZVGu84vPh3rjv+kBH9me5XZ5idQ52IkjajG9yv
        F4Yl6YHA8qKPNwzbBONKtlOEb0+wjJ3ouky0dF0CFTdcCgyUY86mUTBgg==
X-ME-Sender: <xms:IX_7YtiEg-a0he2iRsvO_gyRV_XuB0hogrrP29mvAst9JmtqaUM-Nw>
    <xme:IX_7YiC8b14pQQjkysrS6tqJz3ook20-Vf1hwu5E6ZHKMh1W8aS9h3XilIu_A5QT-
    zGPvyRZfOFqit-JtaU>
X-ME-Received: <xmr:IX_7YtExeL3kx4ljPmzr5vr2ICdUjkb7eiXkA0oNkk8kLbFopkJlhbiw_Ds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IX_7YiRofhgRZ0AuE9jRr9JeeHsYw7_6b_L8b5SU_udHP-ZpvCEWNw>
    <xmx:IX_7Yqxz1nRLjExuflcEKSBuieCw8P9SytqKdBqPOSm4KVcgclEPlg>
    <xmx:IX_7Yo5ksrbE8GIuRZVhbf95xBIgbv6xcH0AK82X5r5a-FRB9vVevA>
    <xmx:IX_7YvpIsdFyYBhBrN4XVIe7T29KyG0mgxrOgniLPsImRC2BEhOEbQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:27:28 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 25/25] clk: tests: Add missing test case for ranges
Date:   Tue, 16 Aug 2022 13:25:30 +0200
Message-Id: <20220816112530.1837489-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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

