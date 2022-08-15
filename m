Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C262C25B0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbiHOPnj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbiHOPnS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:18 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96121634E
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:17 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 1B9DF3200805;
        Mon, 15 Aug 2022 11:43:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 11:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578195; x=1660664595; bh=QU
        ldjpTiMfHzq6Wb1MxSZi0iVyIDK7tOeSimFDBEdOY=; b=MEmzoe2Pja1njq7aw7
        Aw+ZZ7xE/ZOtNukZdomMA2CD/vN1s9gPLA7n600xAOpbdTGXLtkxy1fvVT4ONtzV
        rGaOIAVj2bY03Ddrdzgrhhz1yOzl0cmyPPYx8nYVAhbyvf4Z1jSAw+uPcYxFW71C
        3XtTfcPmtb3Zmys6ZKU5L/ehxRn2mu9EBQw1dbr6F2U77IZrW+g01yWQyBco1Ig2
        cPInQDuGUqrM7pf7o7le6hurxD8P0RxiSou7xwyfNHXdfJ8fSRYPNZc20qGpf5Vp
        g9UkbTRLvwYvqdVL6k/oP6v8E/ZcNXATk4rfZIskqo2HHmf82PZmDW/+QRuKbf+W
        0dIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578195; x=1660664595; bh=QUldjpTiMfHzq
        6Wb1MxSZi0iVyIDK7tOeSimFDBEdOY=; b=FafV4+yQ+fq0ZNvj+cgf1kzQOckaJ
        R0a3gjvhcVGe2DZXFkvNpUq/w7JgmkNJ6XkU4FdnBBR1d+VOhXZU1RaGis3HssPo
        IPVAzeyJ3Ev/hLEU/uBGhzAkalbNtm/CbC8jyjLfK6fhc0fFEH6Dn5RT+BsupFra
        0SfEkDsKyFtVLCpEUwcD/0IoaVweDEvBm9bxc6AJTh+JagdC3K0Tyn9EzyacVxpL
        PJF0B1q66Q0y7ZafqjVljHfYZc7411ozoEO6a7JXjLdlFe1JxBgB0S14P7hkW83V
        1nRN68oUj93G7mBRoQvZhJkCApRVYwVl9R6dBMGkl1IIJ5YE58Q7bNGHQ==
X-ME-Sender: <xms:k2n6Yqx8TljSPxdG6YEuFuDz-5_c4KffHSpkpadfrTFnYcOREwUCvw>
    <xme:k2n6YmS583sTObkvx3gngTfRhp4YA1-mW2kUtUz322GABqOxLf-eFhelBKylEL-fY
    Y4mGeju1pQ10C5C_1M>
X-ME-Received: <xmr:k2n6YsUf5lYW0nUeOCC6T8sKaicmeMyQskHK1OCVIHjZE9Cd4ERDYxWY9_Cn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k2n6YgjxBSXhO9Ij35vftv4QJH_VdqodtPSDPoF6X3Me6Be0EHUctQ>
    <xmx:k2n6YsCUuHkVELWP3CK0gh4mnorwvHStAX4NijGgfxjBTwFGH83oyA>
    <xmx:k2n6YhJyIstQtV4h98zaKu_mWPaixbabsdqQsYwlRQBgKI0P7BirHA>
    <xmx:k2n6Yg7XbVCxfIxXNzT9bPc0Gavl8G8fOQljRZOujZFxU5q2fVQDIQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:14 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 19/25] clk: Introduce clk_core_has_parent()
Date:   Mon, 15 Aug 2022 17:41:41 +0200
Message-Id: <20220815154147.1631441-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
2.37.1

