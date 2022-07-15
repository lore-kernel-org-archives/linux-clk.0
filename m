Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47EDC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiGOQCq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbiGOQCD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:02:03 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769AF747A7
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:02:02 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id EEDA93200902;
        Fri, 15 Jul 2022 12:02:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900920; x=1657987320; bh=NK
        TqC4zSWDlSd1cVUKzT1tg3u78z2Ps8rkv03cfDo6M=; b=O4Vrorw/c4tE80xgwW
        2CE5WQ2JkhMyib3dEiSujDnvlao8hVcFTE0N476vAWXNQMz3Db3puY8tLGRWvpWE
        KehJsgnTSABGwW47DgwUqkE+IHWwrua1UivgAvrMjaCNB8SlWI5QFJxrzu4Sqgxg
        CpL6Us7qzRdwU9yRw3ytvR5yAibTE5JWnPi2IYEXyguivFLsF4/kI+pV5V1PQ/eE
        Z2lOdx2AOSXEbRnAyU/mDWb8G0H9g7dm2ZFzrevjV2G0DJ5IeKHgXU7CNBqr1YZg
        KYI3Fiirtf+NSOz3tHLyzfcsYchhQvE1Tw4CYYGvMMnCev8pujNMReJq8ZqxV9y/
        rX+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900920; x=1657987320; bh=NKTqC4zSWDlSd
        1cVUKzT1tg3u78z2Ps8rkv03cfDo6M=; b=qgQaGFAW3+p+JjfMR+bQz6lBbCKzl
        kLpncJ/Cv/kjyiHbwl/AFh42m5UG35jN/5sI1FappXpKHPkvwKnxyPl8W2/LZGUY
        hWrXFgOrN/RNct6psKVPcFrlAFsvsn039ReKIF6NNRC5kLw5P7UTPqcJd3+cBaRP
        T1WWoSGCBKgRXm0CzRlvlX1nTGdjFVNJimzHNWqy09BYIVS735YVIzeDsnm2RSEJ
        BrZzaMZdiAyif0dhaCG4uMPXUs9WmtnkGg8V3PFY8LzgTiY8qmDK9QXJEYYJsbmu
        T9aEuF8BAqqxfglUEMngLTh8IqqQSz6PoF8gnSdotou6unTOSBqfMSd4Q==
X-ME-Sender: <xms:d4_RYmy84SzbCp2k9pnhrPuekbV-722le-rIoE5ZCg1Da0Ug7kPFRQ>
    <xme:d4_RYiRe7I6yZi3lsem6pPCLshjSxbDSst7KCWL9R5OVCurZ17wGyCvkYK-cebKZ2
    xmKrvro3jpIJ3_8qFE>
X-ME-Received: <xmr:d4_RYoXFyC9nL5AVUi0lhPwwbbh5_OS4xCbOdVV_AsbxsB-VPpi5CAoihW_L_5yXAqTKmPdGy4v7n5zx5oexoyxMDeDomZPS77lMEzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:d4_RYsgDcWv34wH6b4EUPjYWfDCX53IZ70LNHAeiEMsEK2zVeyCNjw>
    <xmx:d4_RYoAQKHEZ_ChtVrOluaboT0EAQMYv4yok6WXppw6vxYtbmMrkBw>
    <xmx:d4_RYtKiyONsfyUZkS7DtumzKCdBnND4gRYkuI6qcxmXLeUVrG9JbQ>
    <xmx:eI_RYs7CsxUd8mAFCpovrAhRKYwY-7ed55Syj0T4qEbu-5S_-HnC0Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:58 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 22/28] clk: Introduce clk_core_has_parent()
Date:   Fri, 15 Jul 2022 18:00:08 +0200
Message-Id: <20220715160014.2623107-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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

