Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE8BC43217
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350311AbiD1Qrr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350299AbiD1Qro (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:44 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DE8B3682
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:27 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 354015C016A;
        Thu, 28 Apr 2022 12:44:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 28 Apr 2022 12:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164267; x=1651250667; bh=AX
        6x3mB67HJIrxEYQCyN7jOK9WscMzC+zSMVhBkBI+E=; b=w7ROGFRhYkjeTyelkc
        Y5tIXSTTati7POYoQgESvgK24oVM/fLzZsdiv75myrB61/31qH/I1Pmc8IYSFf7W
        9ST3zZELWNlfWr9dANnMXCPME10GLtE6HQN1HCD/SGzl0sIIAO9/DOLTZDg82knQ
        O9QMx0gqDIrBi5fpFfF9r/8jh9l1hb8vQcy7Xpb0oyMuNhPusyxenHK8yB5o6Oov
        Lm7HfEyBonq28p6IgwWbpJrsFzA4tzb1JMZGhph0bpaMQzDDXPlYVsGdSpDErjDS
        Wx7xq80K7SqMjElLvWApixwXoXCKeSoKoirChm+R+MNxcIperRFsETP3bjtzGO0n
        3hCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164267; x=1651250667; bh=AX6x3mB67HJIrxEYQCyN7jOK9WscMzC+zSM
        VhBkBI+E=; b=o2WC0fhj6bc6PkUDBP9pNPi3HpGNeeKMOKTMmOkH5Lz+Ta6+vGM
        kiGjC9Ao+G3Sp8pPJezndoK9r0+4AkAcxpx2zmoy3trWVZweSm19MkNy1+D6RzoT
        q87whBiFGNZQSmNVQlyZ2gO8ZN4qVxMwOFanmFiGZL3MnIXvqOkapRAlbR8aFxX8
        Vjl7gLWOBMbicoXVfUDy7f+zWHHTYHwPdj8ER4tUIbJ9xs35UAZKqHjd06+0Ox+b
        rkfZng3eSPI9GojjuI9X5XmfilqTDJdHIf0TKb0DpEmSBBknQta8VG8rpqpwWPri
        5LT+sBkv8eAU62B6o3xZZgihr1LZtbWS0NA==
X-ME-Sender: <xms:a8RqYtrZ8CxqU0VkotaV1FFslqx_e2mdyeW6JEYjTA5jCO0-GqRsIQ>
    <xme:a8RqYvq5NK85ppQHJ1w6mpemC1bVAz_ZDYymI3QcdyBHIqHthEaIg1t7oyxFP3mpl
    bNtLwFX1LuSxpRxhyI>
X-ME-Received: <xmr:a8RqYqMjYi6DOBpgkfvPoXg7Z3GcNcAlci43NihZmwi2cLqkF7yCftv9VKUnqaa0MAD1KvpMJDcEXtEEMxYkME1EHfzwgys55VT9vBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a8RqYo4K9WQVvzk-dnOZsYEqckcfJ1OgSjVRjjPB0IX0NLJCr5dvIQ>
    <xmx:a8RqYs7W_D6qEFIPEagfDPYHKPpPKyD0TZ6KLq40e-j2o4lY9eJZxg>
    <xmx:a8RqYggmcyWKyZ96SGY71YIr1NOHTriemuwAgIp3b-65yAeJx2Ncow>
    <xmx:a8RqYpy4nh2V66sj6ydakkxX7L3iXetDx_AgcF95UnZad22EpzBkyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:26 -0400 (EDT)
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
Subject: [PATCH v2 21/28] clk: Introduce clk_core_has_parent()
Date:   Thu, 28 Apr 2022 18:43:31 +0200
Message-Id: <20220428164338.717443-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We will need to know if a clk_core pointer has a given parent in other
functions, so let's create a clk_core_has_parent() function that
clk_has_parent() will call into.

For good measure, let's add some unit tests as well to make sure it
works properly.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      | 36 +++++++++++++++++++++---------------
 drivers/clk/clk_test.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index add5d576fbd5..9af592cb3618 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -539,6 +539,26 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req);
 
+static bool clk_core_has_parent(struct clk_core *core, struct clk_core *parent)
+{
+	unsigned int i;
+
+	/* Optimize for the case where the parent is already the parent. */
+	if (core == parent)
+		return true;
+
+	for (i = 0; i < core->num_parents; i++) {
+		struct clk_core *tmp = clk_core_get_parent_by_index(core, i);
+		if (!tmp)
+			continue;
+
+		if (tmp == parent)
+			return true;
+	}
+
+	return false;
+}
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -2588,25 +2608,11 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
  */
 bool clk_has_parent(struct clk *clk, struct clk *parent)
 {
-	struct clk_core *core, *parent_core;
-	int i;
-
 	/* NULL clocks should be nops, so return success if either is NULL. */
 	if (!clk || !parent)
 		return true;
 
-	core = clk->core;
-	parent_core = parent->core;
-
-	/* Optimize for the case where the parent is already the parent. */
-	if (core->parent == parent_core)
-		return true;
-
-	for (i = 0; i < core->num_parents; i++)
-		if (!strcmp(core->parents[i].name, parent_core->name))
-			return true;
-
-	return false;
+	return clk_core_has_parent(clk->core, parent->core);
 }
 EXPORT_SYMBOL_GPL(clk_has_parent);
 
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 4c71c6570021..7e1a231a5a6b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -473,8 +473,24 @@ clk_test_multiple_parents_mux_get_parent(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parents_ctx[0].hw.clk));
 }
 
+/*
+ * Test that for a clock with a multiple parents, clk_has_parent()
+ * actually reports all of them as parents.
+ */
+static void
+clk_test_multiple_parents_mux_has_parent(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+
+	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, ctx->parents_ctx[0].hw.clk));
+	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, ctx->parents_ctx[1].hw.clk));
+}
+
 static struct kunit_case clk_multiple_parents_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_multiple_parents_mux_get_parent),
+	KUNIT_CASE(clk_test_multiple_parents_mux_has_parent),
 	{}
 };
 
@@ -884,6 +900,21 @@ clk_test_single_parent_mux_get_parent(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, clk_is_match(parent, ctx->parent_ctx.hw.clk));
 }
 
+/*
+ * Test that for a clock with a single parent, clk_has_parent() actually
+ * reports it as a parent.
+ */
+static void
+clk_test_single_parent_mux_has_parent(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent = ctx->parent_ctx.hw.clk;
+
+	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, parent));
+}
+
 /*
  * Test that for a clock that can't modify its rate and with a single
  * parent, if we set disjoints range on the parent and then the child,
@@ -982,6 +1013,7 @@ clk_test_single_parent_mux_set_range_round_rate_child_smaller(struct kunit *test
 
 static struct kunit_case clk_single_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
+	KUNIT_CASE(clk_test_single_parent_mux_has_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_child_smaller),
-- 
2.35.1

