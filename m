Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD71C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbiHPLws (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbiHPLw2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:28 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0D0D9D55
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:27:05 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 4A79332001E9;
        Tue, 16 Aug 2022 07:27:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649222; x=1660735622; bh=Rw
        D+gyZ8at0aP7+KB38i/bHZHkaSQaGBrZxIKDGfhdU=; b=qGEzx9K7jkJjsT5LMG
        Pw0gLI+kw8EGD/2seSFiRaCjTCcbBgWk9ABMf4TO1tF0kvUe1z4jGmfkaQh1+lrf
        357EEjGsM26sScJoXdLz5r086ksDjqMENynzq7vivY6CquhaGG2Z1P7peiPTGBjJ
        asTLqwB+aMBOGifwUJqqJIZ54bGVdaO09gPdo5NdQ0stE62mPTztrua/FymhVOEd
        8tcFX4Y0BP2vIeubFk0/xSpCpb9jjwnJafCwlMv7KdeY40tKGdpCR5MaqPkh0RM5
        5vyoxzz84IiOzruhb+//DJOz08szFNLYpW5mGezyJ/UJsRWyUmeQxetHaugo+wJF
        HnHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649222; x=1660735622; bh=RwD+gyZ8at0aP
        7+KB38i/bHZHkaSQaGBrZxIKDGfhdU=; b=mkaa5TFlgptzfioz4ql84cuiuchyE
        tWDuTzOR4j+Hf16fKBGVq7iud8TlP3TPuuDWp6QOQ2KqsWuqPfmy01upPFvez7Vi
        dqVp3lA5ig4OUj8PbkbgwBAd8sruAlz9UgIpEm9PKSiQ/JF1Xn5181q1y9XQNz2B
        yqJhTnv/agvHR+oXII/ttItBincK1lEElys5ii2RldQwZiGoMaMZUIrGYtJ8gcLn
        /FGV3S2rQm3FVdAaQS9oebOqwRjfxawYb+NMvrsvqnthFlfxQmIEv0Nqi5TzL5ua
        NJ5teSUqKuv+9PWEZJbXof3zgxeOS5xDwmuy9CjZWsyQw/7CORyobjSdw==
X-ME-Sender: <xms:Bn_7YruRxXyL6qFSRWY80NArMIKRUHVzF74Vq5HnK_4YeHC-e9BpIg>
    <xme:Bn_7YscqZ2s16d5lIGp3JaDUT2O8LJZYoA9Ij62y_5U68YrPx5iU4n6Km6Np0oPLQ
    8-ns5Ee9ZtlXhnWy2o>
X-ME-Received: <xmr:Bn_7YuxYMGTP8IZfmMdyUanu_ghHjnDsAYmNPEJnWx3szT3k7nvRidRaQDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Bn_7YqNQ7f74NER42I6Dn8r94HTBG40JDnp_Kl7pIPFxOegZoerKMA>
    <xmx:Bn_7Yr-LBa4i0Si6QH8vg6kWUkAYyjI7PwW2FUjupNa4zXNSxqRtEw>
    <xmx:Bn_7YqW25AoXpnn2z8M1U12uFMr1ssQ2Xotl_Swh7wL5q95XkvqqUQ>
    <xmx:Bn_7Ys2Lcr3maPpMEMK4SFo38avCLvcPniFSqbUV9dGl3xe0K4xejg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:27:02 -0400 (EDT)
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
Subject: [PATCH v9 19/25] clk: Introduce clk_core_has_parent()
Date:   Tue, 16 Aug 2022 13:25:24 +0200
Message-Id: <20220816112530.1837489-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
 drivers/clk/clk.c      | 36 ++++++++++++++++++++---------------
 drivers/clk/clk_test.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f8a8bdd552d6..c1bb64827060 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -539,6 +539,26 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req);
 
+static bool clk_core_has_parent(struct clk_core *core, const struct clk_core *parent)
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
@@ -2574,25 +2594,11 @@ void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent)
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
index d1b1372f7aaa..7068517428e2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -491,8 +491,32 @@ clk_test_multiple_parents_mux_get_parent(struct kunit *test)
 	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent;
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[0].hw, NULL);
+	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, parent));
+	clk_put(parent);
+
+	parent = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, parent));
+	clk_put(parent);
+
+	clk_put(clk);
+}
+
 static struct kunit_case clk_multiple_parents_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_multiple_parents_mux_get_parent),
+	KUNIT_CASE(clk_test_multiple_parents_mux_has_parent),
 	{}
 };
 
@@ -918,6 +942,24 @@ clk_test_single_parent_mux_get_parent(struct kunit *test)
 	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	struct clk *parent = clk_hw_get_clk(&ctx->parent_ctx.hw, NULL);
+
+	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, parent));
+
+	clk_put(parent);
+	clk_put(clk);
+}
+
 /*
  * Test that for a clock that can't modify its rate and with a single
  * parent, if we set disjoints range on the parent and then the child,
@@ -1022,6 +1064,7 @@ clk_test_single_parent_mux_set_range_round_rate_child_smaller(struct kunit *test
 
 static struct kunit_case clk_single_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
+	KUNIT_CASE(clk_test_single_parent_mux_has_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_child_smaller),
-- 
2.37.1

