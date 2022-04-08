Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB03C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbiDHJQF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB8A120DB1
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:04 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0F3B05C0153;
        Fri,  8 Apr 2022 05:11:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 08 Apr 2022 05:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=nMk9OECgzSRtbVqX4PRJCVlgwJ3IeF
        sPvwVm8kV9xN4=; b=Jh5F85sQuvUlwq8wRdkZDhm5G7QQSWGrfS/elvG115jguE
        +AKDJw7f/+95PZ/mP21+bLHgThFG6qWHr/tA43pbR3tztPYdsuN5V7FbG+6S6/wq
        lSiQ9j/RrA9IQnhrrVYWcYAFvytmDtgKKGBjOp6bvStF3ESzQD6LIV5LhcQdWDH1
        WWLC/ka99DJYi5j9WWsoZpzI4NdOJsGgcn8XOgQT7Iw+UsEGlK1nhcuVm8IuvZY3
        SxqNa38KssYO2pGOV9BD20OLDsm9OzvkZ818yXWn4jTdjE3lzTBiNay1Lx956vdP
        K3lWb7ynXtZlepH5TkfGGRa8FOarLPThc05CMwdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nMk9OE
        CgzSRtbVqX4PRJCVlgwJ3IeFsPvwVm8kV9xN4=; b=bUgSIemVt8nAUkre1LV1to
        iy0AOnM8bLm8Q+nN+a+zLhXHrW3dUGXMFeX79oWIJfoL48xMcqtYwqB7NiIW3RTN
        XdXi/SdnD+FMKHSmTs7RMD2r1jKd7E5X1nWdthOw0eZPBp/QTvGHuMR01+eRinld
        I6cjt2u7L+LEagZ4PnV0cw3KBedU6hjJ2iNIg0HEpI2MUyFc0H3x7wi89sQauEPe
        5nknpFp0YBgoBXPEF6J/s7aCVNp9x+SxgEjn8DHeIVSK4oaSj7vuowxPWzkr61s1
        1qm8L7TrTQw99A4/vVznl0hX/Dd5HnhoCAaeeEkpRxJy+g3ALD8rIsA9ZeQUIYhw
        ==
X-ME-Sender: <xms:J_xPYv00dTQtNcdQ9F1CQuvppNpLLW5ah7V1RHltJDnbvOytkJm-xg>
    <xme:J_xPYuH5tCqQpedbyO6OTo6gcYjqAGeUApeSdbRrbg7FdAEsg-YqW_kQYk7UP0ckB
    ATvOXEc59h4Jd1nW-A>
X-ME-Received: <xmr:J_xPYv7iWjgDZAkphd6frbjdVLsx4hLAEE94FCTESe_EPCywYg1hjCob1lg5MjQ7Rm3FzJFoRQA3rkvs0K-ROwBnn7hAJMN1l8xv8_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KPxPYk1GrnFpreL_khdRIQiqAqj4QHHizC_rG3u6BlgHC1dqRXLH7A>
    <xmx:KPxPYiHhnMsEuYsmKSjHAEosItCAy4CbGhf8TfmigK-SEIRUDPcaPg>
    <xmx:KPxPYl8dYk08wRdvVDbbbWtWCTykgMxwAgNA_9u1CCHyN_2OCp-E3w>
    <xmx:KPxPYlCUxRFBx6btjELXrv8Jo3BvjL8Sr63RAdtSzPOilFMcfs7TuA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:03 -0400 (EDT)
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
Subject: [PATCH 11/22] clk: Skip set_rate_range if our clock is orphan
Date:   Fri,  8 Apr 2022 11:10:26 +0200
Message-Id: <20220408091037.2041955-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_set_rate_range will now force a clk_set_rate() call to
core->req_rate. However, if our clock is orphan, req_rate will be 0 and
we will thus end up calling a set_rate to 0 on potentially all that
clock subtree.

This can be fairly invasive and result in poor decisions. In such a
case, let's just store the new range but bail out and skip the set_rate.

When that clock is no longer orphan though, we should be enforcing the
new range but we don't. Let's add a skipped test to make sure we don't
forget about that corner case.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  6 +++++
 drivers/clk/clk_test.c | 59 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5b6ec11fcfcd..80fbec87309e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2389,6 +2389,12 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	if (clk->core->flags & CLK_GET_RATE_NOCACHE)
 		rate = clk_core_get_rate_recalc(clk->core);
 
+	if (clk->core->orphan && !rate) {
+		pr_warn("%s: clk %s: Clock is orphan and doesn't have a rate!\n",
+			__func__, clk->core->name);
+		goto out;
+	}
+
 	/*
 	 * Since the boundaries have been changed, let's give the
 	 * opportunity to the provider to adjust the clock rate based on
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index fa6e32c460ac..0fffc70f9e2c 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -735,6 +735,26 @@ clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_untouched(s
 	clk_put(parent);
 }
 
+/*
+ * Test that, for a mux whose current parent hasn't been registered yet,
+ * calling clk_set_rate_range() will succeed but won't affect its rate.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_range_get_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+	int ret;
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_EXPECT_EQ(test, rate, 0);
+}
+
 /*
  * Test that, for a mux whose current parent hasn't been registered yet,
  * calling clk_set_rate_range() will succeed, and will be taken into
@@ -758,6 +778,43 @@ clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate(struct kuni
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
 }
 
+/*
+ * Test that, for a mux that started orphan, was assigned and rate and
+ * then got switched to a valid parent, its rate is eventually within
+ * range.
+ *
+ * FIXME: Even though we update the rate as part of clk_set_parent(), we
+ * don't evaluate whether that new rate is within range and needs to be
+ * adjusted.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk, *parent;
+	unsigned long rate;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_parent(clk, parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+
+	clk_put(parent);
+}
+
 static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
@@ -766,7 +823,9 @@ static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[]
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_put),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_untouched),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_get_rate),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate),
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate),
 	{}
 };
 
-- 
2.35.1

