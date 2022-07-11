Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8A0C43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbiGKPZK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiGKPZJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:09 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B697252A3
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:09 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 838CF5C01A4;
        Mon, 11 Jul 2022 11:25:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 11:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553108; x=1657639508; bh=NK
        TqC4zSWDlSd1cVUKzT1tg3u78z2Ps8rkv03cfDo6M=; b=Fp6QUNSR4ETMsbG2D3
        8PXImGQK7rejYF3erLMa6QHg0vqjH92uAaXARAudHzHqCOC/l7BK5l5Z6/IbwdW1
        xS9UnN9MlA5MXXUtyuYY+qAmEkj9zhh/glfWI2rleOqKaOPD/OIcKGG4OjUaAuDE
        rI12Ijz9ARgzvZ4YYnwkr6lwBbesxaMF2TkodZwy+wVFwVpU8BWUFtN6Yx7tJNsN
        TdSO4KqiQJsMj55qvCefO7m7mwZOuGTt0RlgYQ7R5GM9dyxUKow+sQs2lCTLCs3V
        oaktxXpuPtAfVN03Zw6OVbOQ+1IC5ZCdIHIe3no1fu3Yw6Wc/WEEMdRI+jDd2g+r
        sC7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553108; x=1657639508; bh=NKTqC4zSWDlSd
        1cVUKzT1tg3u78z2Ps8rkv03cfDo6M=; b=1n8gEIEGdXm/214Q2IPb9IuueWQyk
        GGFo0K2kXQ3k7XVLZWB/Wzuajr/1UxvPQrynThtG9didDPuJsX/ssJ+oZ6+nkyNl
        mCFq5cfvit6RRfZWrQxRJGPKIYo3n2z0WN4R939PQRoi1mX5+nzq75JFaN0eeuu4
        SxlH/XjFjoinP1QR1chzuG6QQJmWbH8+WCVOyiztG2BMeKZ2zPp1Ov4+BUFZeQ9y
        xgGGUILc1lxFBXWu5LJ1gvgch5WUn4c0tw3x8MjvoE6bOW0No/WXBxTiImE5PILi
        hsTB3TtYqQMOVsyojSszQXu7rVsjOqFSTb8qfcz/EMUC1tFY/8s2dDiPA==
X-ME-Sender: <xms:1EDMYlUDGQRldeHLyrj1aNYsvvEVgWmGhJ9YPoU2y9LpEcOKHBNGWw>
    <xme:1EDMYlnl9kffDVZ0AMojKtICiaoWdaj6ZrJHfZ3LrC48i-JAJdKrXBc1AkoTAPqPw
    lKGF3jGHM47upxhFms>
X-ME-Received: <xmr:1EDMYhb1mQnco4F1Gr0XJjqMiCvSuo5mh4dDDX7Ia4JXpLuKeg9ad9LGMLvRZSh-C9x56gwwQzsZ1D3YkoCiKNj2D18uMTzOttJVBO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1EDMYoWK6rGBJol-4BMsdX1sqP7i3GQR6_DDMxaqq8nbTF4RiPQ_RQ>
    <xmx:1EDMYvk8ML6Ej0PdDU6AkKKa0Ldb6ze0v6pifDX-969cVdrdvIgDyw>
    <xmx:1EDMYldIxPXRWAUzlvIe2_kvxFnweW8ccpZ21HEFbb8OQdDT198vgQ>
    <xmx:1EDMYof_8ztLhJwI4OqECD17zGi8TBumZCgqT7-YwEjEZVENIJypIw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:07 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 22/28] clk: Introduce clk_core_has_parent()
Date:   Mon, 11 Jul 2022 17:24:18 +0200
Message-Id: <20220711152424.701311-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
index ad851afcfdd2..7fc6347e66c6 100644
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
2.36.1

