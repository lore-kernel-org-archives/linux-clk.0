Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BD3C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244965AbiEKOoq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244899AbiEKOop (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:45 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16165C9EEF
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:45 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 415403200993;
        Wed, 11 May 2022 10:44:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280282; x=1652366682; bh=sq
        RfGdeQAqJMPxO9VUcDlzAvt058Yt2DTJa/DUBaKS0=; b=fAd2uKgC9cvbjWEqtg
        WXk3W10WxzMxoZyhf9ekDMPh2q4HT7jfcmLEq4eJqHX+MvroWM+sNzEe2AKupEqD
        Xh7G320bBy7TIfHzVgdWep5SeTEEmDGNVU1ig5JUJIPfozkrrJSPgTTGUuqsqZ2U
        Hl+ahf/zUF4ZsxEUgIjZo9N7nNdXzJT2SlEobUH7PHbLA8GEw97DNwHxkeN2H8Ya
        SNZpPBiOLdfqpcowMV7cjqAWG35QTfDeOfs1Qf37F8tE01qgR91qW3YGC76vOpFQ
        nPVVYUSAYlb2ArD7IBEPWgWqUvrC4lUlxX4vGEUVHyj9+pEu931gyltJtDRPRQkf
        llsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280282; x=1652366682; bh=sqRfGdeQAqJMPxO9VUcDlzAvt058Yt2DTJa
        /DUBaKS0=; b=tqgzm69gmVjPuXEqD5ntjDtU+YbOYdzT/3Dw6Jrt4L+wAvldOI5
        EV2VtzMavhYLS2DNY+4DMijNE6WamauxMv5vEtOql6h2UPlslHznT/IN1q0I4MaO
        UOJr78W14qwW3aYlnfgrYagpBV3uXBrEu7LNpHpaXjA1YqQgVeABmvSmmDau0T0a
        Arrfg9wKkm5609fgFAFWUdrG0Y7fETNDInbdkh8swXxehiS7fu0y3U3f+iyR9jLs
        DYq1r2GU/G4yte1LXHrCsk94zmVahIY6/mPjxxpqAoEQ2eXtnMpi+Ul8D+nplupm
        8QJJvLyl/eCFrngogdC10CgR0PR68+4l0Fw==
X-ME-Sender: <xms:2st7YntfUfsykWZJU-yOZQX89AY5HuFZgWr39c4qVB_R7i9wTFyBRQ>
    <xme:2st7YodFyBSER90N_WZsU2Vye5eH6sPZkEHiFbNdoAKrdg7NHmvft0HngUPM-o7Xi
    WY21_CCda_kWhop54k>
X-ME-Received: <xmr:2st7Yqw8kelZvil0paGeYpD9SIN2ZKbs9utZ3jZpyA5Z1W2VFhUhrPOp1MtrG03wEpfYPu4qRfevsAjavTMFERjrcMwR-m0A5dmDSYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2st7YmPJzEqMn913Lf-ZQB0U50fE6L4M-b-qIBvyzp_C4oZxuH6Mbg>
    <xmx:2st7Yn91qJOB9YfAAtldXrhg4nEmZdcF8B6VBC3f_VxGOumzWWcBww>
    <xmx:2st7YmW9RCzDJqB0BKoOOe4Huhgu-tgsTD_V4nYSZt7r7awXMJV5hg>
    <xmx:2st7Yo1lozzx5gUnhPs26LrS5AOPyF1T3DZPl_dv6ZnrsWB9Rdqaag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:42 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 28/28] clk: tests: Add missing test case for ranges
Date:   Wed, 11 May 2022 16:42:49 +0200
Message-Id: <20220511144249.354775-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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

