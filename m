Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2E7C4167D
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356216AbiELQFG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356236AbiELQFE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:04 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F7A250E8C
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:05:03 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A70F35C01E5;
        Thu, 12 May 2022 12:05:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 12 May 2022 12:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371502; x=1652457902; bh=W8
        pP1ZXYjOLKvninWc4sDYRPmNtMT/zT/zaJoukUFsc=; b=zNNTEFpmnmY6bDLd9n
        HkOGLLCIWEDmTub0q62KFh1ZwsjiVm+bXH45SSYKoRgXjjO38FIoC71qg4pX8Azg
        OQVuEi0cXQZme9GGOk27Cxz+EBhurr27yiTMfwzT6OLAyWxF19bWoPoe22rbQPEm
        XYytccr8vqWdXBN1GIEUp7N5Wf+0hW88PVx8LtuSvL9kclxhSaFLKOIrv91/OE9I
        FN1YWrOKfjlQcWt6cAxqFp9TZ0vczmThx6UCqbB8of+G1KaKpN1i9JOAwVRTcvzB
        a2BAQW/JrYr9/Dm9RxC/n/ZjDqGxJHlKX6OfBw2u7ZnZeQoV7tSk+siPiClJcFJ3
        JhzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371502; x=1652457902; bh=W8pP1ZXYjOLKvninWc4sDYRPmNtMT/zT/za
        JoukUFsc=; b=IUm0A2dX+GFGJecxWh7211BmWaU0/UnL1OiApUT692Bq+AkoFzr
        HMHSMTzaSI3YMopuyuOC+w0NVtcpmrt4zRrMOozmMDXBLuk+zR98zgshl4X9oYqI
        DgQtXfgWNbPIKlddbLiZQi6ARlWozYGpbiDLBRU9YHMuO9TAK2NIer3Z614k2MEg
        17uCiz/piB/j27fdwER7vMnTLRIOcanH9uE9tk8gmNoxQha1wxTc91ORuf6GtznL
        OY/6p1q5ecWV6I2Rl+W2vwxec0hS8fC/+Hd5kL3EOsaxz3jSq1W4ElpB57ZOwIzj
        CU54r9ddgNhUUgWfoUTDUfezl27wAqokeIw==
X-ME-Sender: <xms:LjB9Ysl0WXMnsKhFXj51JiZafFahqswYjXflYmrpYpfmRdA0lDsSpA>
    <xme:LjB9Yr1rRbsxuMzYsolYAgjP8LVKN4Uzajc0CYCcX7NOxIkn71NggWuP1Zma_kwOj
    6PjGMyAlVYKn_7MlyQ>
X-ME-Received: <xmr:LjB9YqoF90qli4qsWOMxKNqKO_w-8jGdGTrCSQTNKP5ZSlXuKPda3gOhsFC9VV2azDLtsn9NoH42t56oRnBLJI7t0UZ6kLrIwDWKEHk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LjB9YomR38MQ7eC9F3MXw7lYtOhY8lK1ULM3dfQav0tqGl1AFrEqHw>
    <xmx:LjB9Yq3RgXdFU8m4U1bQKofGNJ24H3XuZ-psW0WjJLmoRILVTI5YxA>
    <xmx:LjB9YvtQCld4yUMG7-jxxD7hCgZVePP6VmOcT9qbfycjPFf3jAb_rw>
    <xmx:LjB9YjspZM6aA-YG1WTqXULpvQxfEfQ8wH7WXXBJ8xdS9gHAy6gTzA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:05:02 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 21/28] clk: Introduce clk_core_has_parent()
Date:   Thu, 12 May 2022 18:04:05 +0200
Message-Id: <20220512160412.1317123-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

