Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5AFC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243500AbiEKOon (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243123AbiEKOom (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:42 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E91C9EED
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:41 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 5E55B32009BE;
        Wed, 11 May 2022 10:44:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 11 May 2022 10:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280278; x=1652366678; bh=hf
        MzKPgdvRzACC1MXTmAZaomT5laNSZetqpKpmoDTo4=; b=ccykrxPV0zDoKfRqrb
        PniCnTJDCmKC26yYbOXbBDNIPKoP45ndTXuo9D7mJ1UJTEjG+oF2TlCIvOrkPxSn
        aG+sC7yPuqxVTiomdVGQKGLJZh/jyPr75C3nX9PEh1UoiPJatYqLzkCOuglqfo6D
        r0Re4m0JUtrAuCpGQVKc5Jy5zHLFo2ayihPNYEJooa4s4oso27Fj+1u1Z7P/OUnE
        yL4HibfIwzrrjR91ryZbHoEbaia/rfd/KnmYlgj0dWhybCoGIg+flh7NobG+hrSG
        cZoQNREK2i6kC6Vo8Epo5fSRQFQOnC2obcWcDiQIp/9iIj5BfFw6vDULtHPieZB/
        hXKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280278; x=1652366678; bh=hfMzKPgdvRzACC1MXTmAZaomT5laNSZetqp
        KpmoDTo4=; b=kSBxuefFnrOaX1sZCC3BEW8dfcm3Yz0a2JxnF5I2lQ0WK190KTC
        qE/gMSQltWaVAQzdEg4FzzHVw6ds4gSB2wjPhNP/Qg556z9djQRFylfbXlkVzTE1
        LN58LOzguqMgHrvcCSFCCXKWStJLluGFatrW5kEMMBWDlOjSHECqUKRs8Sq0Iyz9
        M52XxQ1fl/x3dvi+2IIDp5WUKyGYp9NufIHprS6pDVzshS4cmBu4dKaNV1eK8ODP
        omeUHajTuEI7c8ZiVXLvw44YtzNPr7XAJDbAes0xH+N5Y6FaV282M04SfDl+TqhV
        Z07LtNCJL3x52CLpzDnnn+PHz01i9jPm3bA==
X-ME-Sender: <xms:1st7Yuoc8gOxQ_dUBSUEv4sHA1qelwA3JRIYV3YWEE8RN85zE8wSeg>
    <xme:1st7Ysqnvg85Omc2oSgoxChpJZ8r43TWfCDiJybsbFcHVnyzd_DNV5qnQ0kGQMzTb
    QmDwg8DLB6hUNXbvMM>
X-ME-Received: <xmr:1st7YjNFhdDFmil9AW3QoNO4PUcim526Jx7f4_Wl60CoVDNfw8g_DIoURgvK3-j_Gt8xvkjthzbjo_fNoz0Vpl-UV3OKoww6jmEQKwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1st7Yt600c6HX8O-TIjKId5yGmYsylz3UHGvAvLo-7Xy1AMM2Tez4A>
    <xmx:1st7Yt46tfQPpiIu-SX-8zfPADu9XcigAJ5eBvhGUxM4gFxspm449g>
    <xmx:1st7YtggnE1qn-93tUqvlS4QtQqJldgiT8nHThUb-LZKvuH5XbbKUQ>
    <xmx:1st7YqxAeAl9zo_D6puGIVh4T4I2_QMPWwOataFAbbN1YkwPMOfgug>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:37 -0400 (EDT)
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
Subject: [PATCH v3 27/28] clk: tests: Add some tests for clk_get_rate_range()
Date:   Wed, 11 May 2022 16:42:48 +0200
Message-Id: <20220511144249.354775-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let's introduce a bunch of unit tests to make sure the values returned
by clk_get_rate_range() are sane.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 182 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 865457b566d4..b4ae6eec7758 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -900,6 +900,109 @@ clk_test_single_parent_mux_get_parent(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parent_ctx.hw.clk));
 }
 
+/*
+ * Test that for a clock with a single parent and CLK_SET_RATE_PARENT,
+ * if we set a range on both the child clock and its parent, with a
+ * smaller range on the child, the rate range returned by
+ * clk_get_rate_range() is aggregate of both ranges.
+ */
+static void
+clk_test_single_parent_mux_get_range_both_child_smaller(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long min, max;
+	int ret;
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
+/*
+ * Test that for a clock with a single parent and CLK_SET_RATE_PARENT,
+ * if we set a range on both the child clock and its parent, with a
+ * smaller range on the parent, the rate range returned by
+ * clk_get_rate_range() is aggregate of both ranges.
+ *
+ * FIXME: clk_get_rate_range() (and clk_core_get_boundaries() in
+ * particular) doesn't take the parent range into account when the clock
+ * has CLK_SET_RATE_PARENT.
+ */
+static void
+clk_test_single_parent_mux_get_range_both_parent_smaller(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long min, max;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
+/*
+ * Test that for a clock with a single parent and CLK_SET_RATE_PARENT,
+ * if we set a range on the parent clock only, the rate range returned
+ * by clk_get_rate_range() on the children clock matches the parent
+ * range.
+ *
+ * FIXME: clk_get_rate_range() (and clk_core_get_boundaries() in
+ * particular) doesn't take the parent range into account when the clock
+ * has CLK_SET_RATE_PARENT.
+ */
+static void
+clk_test_single_parent_mux_get_range_parent_only(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long min, max;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_2);
+}
+
 /*
  * Test that for a clock with a single parent, clk_has_parent() actually
  * reports it as a parent.
@@ -1077,6 +1180,9 @@ clk_test_single_parent_mux_set_range_round_rate_parent_smaller(struct kunit *tes
 
 static struct kunit_case clk_single_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
+	KUNIT_CASE(clk_test_single_parent_mux_get_range_both_child_smaller),
+	KUNIT_CASE(clk_test_single_parent_mux_get_range_both_parent_smaller),
+	KUNIT_CASE(clk_test_single_parent_mux_get_range_parent_only),
 	KUNIT_CASE(clk_test_single_parent_mux_has_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
@@ -1311,6 +1417,79 @@ clk_orphan_two_level_root_last_test_suite = {
 	.test_cases = clk_orphan_two_level_root_last_test_cases,
 };
 
+/*
+ * Test that clk_set_rate_range() and clk_get_rate_range() are
+ * consistent on a simple clock without any parent.
+ */
+static void clk_range_test_get_range(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long min, max;
+	int ret;
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2);
+}
+
+/*
+ * Test that, on a simple clock without any parent, if a rate range is
+ * set on a clk, it's properly reported by clk_get_rate_range() on all
+ * the clk structure of that clock.
+ */
+static void clk_range_test_get_range_multiple_clk(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *user1, *user2;
+	unsigned long min, max;
+	int ret;
+
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	ret = clk_set_rate_range(user1,
+				 DUMMY_CLOCK_RATE_1,
+				 DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(user2, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2);
+}
+
+/*
+ * Test that, on a simple clock without any parent, if a rate range is
+ * set on struct clk_hw, it's properly reported by clk_get_rate_range().
+ */
+static void clk_range_test_get_range_with_hw(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long min, max;
+	int ret;
+
+	clk_hw_set_rate_range(hw, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 + 1000,
+				 DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_get_rate_range(clk, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_EQ(test, max, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
 /*
  * Test that clk_set_rate_range won't return an error for a valid range
  * and that it will make sure the rate of the clock is within the
@@ -1599,6 +1778,9 @@ static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
 }
 
 static struct kunit_case clk_range_test_cases[] = {
+	KUNIT_CASE(clk_range_test_get_range),
+	KUNIT_CASE(clk_range_test_get_range_with_hw),
+	KUNIT_CASE(clk_range_test_get_range_multiple_clk),
 	KUNIT_CASE(clk_range_test_set_range),
 	KUNIT_CASE(clk_range_test_set_range_invalid),
 	KUNIT_CASE(clk_range_test_multiple_disjoints_range),
-- 
2.36.1

