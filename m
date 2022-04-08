Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB0FC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbiDHJQ0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233175AbiDHJOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:37 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52096CF4A0
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:17 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id B82D25C013A;
        Fri,  8 Apr 2022 05:11:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 08 Apr 2022 05:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=Ryd09ofPkeKPAVTybaaWtYD6z9mCEJ
        i8WDMAgiDgJbc=; b=zP/iNNqCYImiPij2BZmbL3sLEOqu0Ba+8i3EuBY6Ct6vpw
        W/KpNFb2EHkoa/PWYn1G2+Xf3QB0tR2XK5MkTSEMfSlda/YK5oN9vNNomrMSK+Wh
        eMrrVsXilEg5WRBMO9ZhkqdHMtP1QrzOi2Gq772r9I78T6HkTlidNyOa3GkVajxV
        ZY6Ztir0mTgZ/kr8wYrwbMMGQR50O/JL7bBj6WYl4/w70INvxWwRhhVbXYio6xj6
        zK/44mfJ5JpCLoQmgsz0aY/QsVSPCYlJPeqJVQlweLON/HPrVAG19lMuJHfmI1bx
        acfUdIZQW5UYJH+J2XGKhT7PAfGhVOuHNZtGYn9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ryd09o
        fPkeKPAVTybaaWtYD6z9mCEJi8WDMAgiDgJbc=; b=aG4FKN4bhhjj6uZdvrQr0l
        lmwR4ThdwhXGYQc84Ra6u6yilse8AxgPaUr3XA+7Q8yKmn6Ah8T6PU/a7hBswVZd
        VvNfzOWXKTdzgVi3P3/tM9BWY8oT8U4OsryjN46uNFX7XW+Ad003UZb+R3jqdvfg
        aWR0QMuOJMX9i50EgQL2CVUer8jZpvFzwCtk9zQ4jHJeO55ndsdBQKsd+DrAauJz
        IdvylZe0kYHDyex/zMqzlDTlzwR/5NYT03T3OFMfOwnP8r0gRxKLrwk4I6KWP4N5
        pNBUonKYNsroBBF0Rj0yiMTpnWN76QKmDXPvR27+PquCeISgZl4o/kPXVPAGA9jw
        ==
X-ME-Sender: <xms:NPxPYh4ZbmsvDJuKpPVZg7119m6OnGvdn7hQjQKf1qDUvWyYxC53wA>
    <xme:NPxPYu7BDxw-iYVah3Jv_rh91EgRm6uf6zeyncM0LLlP5KvkvY_uc1Mp9Lqnd-1ZL
    bs5iKaq5dDH6nT5duo>
X-ME-Received: <xmr:NPxPYoe-uT3l1Hp227Nilk2Ph3s_wSBynFlMX36pmG3rrJRb41Tnqiyah0VtKrR2a4GvoK9MpPllRq3IMe8AMHi6OoJwk5CUE2g9YEI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NPxPYqLVmiRP34Y7JFeOYSAW44P83gf_x6g77YdO6uc6ePha_nFKng>
    <xmx:NPxPYlJGeFu7phF2dM9tfQeZYl8CZM4f10ziLuKL2ixCrH6JLgsOgg>
    <xmx:NPxPYjw54nG9Be8QUmxUR6NxNgOmUpXtx6xTjMWbrrYCpb5Rkfk9fw>
    <xmx:NPxPYuWieCu1pQETWVVGXK1cN6DlT2ChqR4YPI_gu0FgI73pbcAmEw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:16 -0400 (EDT)
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
Subject: [PATCH 18/22] clk: Introduce clk_core_has_parent()
Date:   Fri,  8 Apr 2022 11:10:33 +0200
Message-Id: <20220408091037.2041955-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      | 36 +++++++++++++++++++++---------------
 drivers/clk/clk_test.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 448ead0da1a5..2bbeeb2f729e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -546,6 +546,26 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
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
@@ -2570,25 +2590,11 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
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
index 0fffc70f9e2c..0b9088cdb8fe 100644
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
 
@@ -906,6 +922,21 @@ clk_test_single_parent_mux_get_parent(struct kunit *test)
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
@@ -1004,6 +1035,7 @@ clk_test_single_parent_mux_set_range_round_rate_child_smaller(struct kunit *test
 
 static struct kunit_case clk_single_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
+	KUNIT_CASE(clk_test_single_parent_mux_has_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_child_smaller),
-- 
2.35.1

