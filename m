Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95225C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiEPN1X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241214AbiEPN1H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:27:07 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC34B2871A
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:48 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id B478932009C8;
        Mon, 16 May 2022 09:26:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 16 May 2022 09:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707606; x=1652794006; bh=W8
        pP1ZXYjOLKvninWc4sDYRPmNtMT/zT/zaJoukUFsc=; b=KkMyHfZbPloIdWJx+m
        vvc8Su7BKi+uVmhapRn9TsbV4ZNRjSDSwJ5D2OL1PMH3KPThU89bkLuXqrrymk0F
        hgEohevlexmEnt4jGV5tHc+4gRaot/ZmInQhe/rM/2NETZzm97CFf6VbABQM0er0
        IrpKGRHZ2Wu+narsE8VNRF+FDvOdV8Xhrs7rFLCAQFizR2zWAEuCUpec+AXyf4KW
        IjWhqLcEMeChOpEcqj+tbB1UoCoHqTcgLl52ugdpPOvrtN0RmxWWKjGNDrsfRF2/
        PiHU5IBle6j70lGBl/imlbPJBuUre7UxiBsmRpfz1oHNbY0cw/pIdj0Ffjjq/Xi+
        1A8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707606; x=1652794006; bh=W8pP1ZXYjOLKvninWc4sDYRPmNtMT/zT/za
        JoukUFsc=; b=tRH535mEhQ/kn9v4ePZh/fMQphCdgRcp4Xwiv5f2Y/o7LxCf2B3
        Flnvz8V2VVe8HaY7D+p/+I3dCVK201aaDiuWf9f2v7sm7zeTSsqIUhfAuMTeaeRV
        O6CTfNGyWAqLxl6xuB5s1Tu1KJ353ZhB4/5EZamsIT0MS9WFzqHvDxEQ52/UvCmj
        3rhbTHoclxVp1q/eONeSEhHrAwDmeeNy0wIqJUmAwQuYILp7auxXDteozdsh5tVr
        L9ZK5BBIUGdW5Mnx4riCzPRNHo/ocXhN1x9lizfro3CNq2t8/R20dc95rAkG20T9
        qJ9PpohgJuLBYFu/L/XnduXvNdsfIEg46VQ==
X-ME-Sender: <xms:FVGCYq2OIp63uWQ_z0-2UqhJGHrlz4X6T0-b75QyG-uivR3igC7mBQ>
    <xme:FVGCYtFJWDa8Fmu2KIJWUkxucYq8KTjaaqQ96lY2WjYVouLRbQhEXi4CShHPILWEx
    QuZBNPaId__1Dfv3hI>
X-ME-Received: <xmr:FVGCYi6M9bciKAjoKX19jYE8W7Zl4NtRCi35z4vGIBXlLQNeb0tdn0ak68YbxvgOri5jLAtFuBMLI9kfWHPwwWpor_xSxup10vjXnSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FVGCYr1vyVL2bYiuH27zF1bq6QWuWGVUeLq7nX8yiGtxlV2NJTqPmw>
    <xmx:FVGCYtElqF6M53rPX7ZhwQJBVJu0Hu4ZFfpOm28hUvVY1AAiYpVazQ>
    <xmx:FVGCYk98JPtGWj9JfpeRWfoC-InJtdCzqJkOcPzYCRZA4bimh_iE2A>
    <xmx:FlGCYl_OF2yjRSSyNEy7gWKWyCK2PA4LtJA-3C3_0swl1APRSGwnCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:45 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 21/28] clk: Introduce clk_core_has_parent()
Date:   Mon, 16 May 2022 15:25:20 +0200
Message-Id: <20220516132527.328190-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
index 1a217c21be48..7754a5140a6b 100644
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
@@ -2590,25 +2610,11 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
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
2.36.1

