Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF38C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243185AbiEKOod (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244983AbiEKOoY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:24 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B87F68B4
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:22 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 57B2232009D2;
        Wed, 11 May 2022 10:44:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280259; x=1652366659; bh=tE
        U17YogLxKtMN0aMEK+Uw2kBj/fVkKM+d9KCmJCGKE=; b=QFKAV5sIQvMLIiIXhu
        O/1KWjVu0MU30UQiaCSHT+tMjmyv0x6IM7YjbOg4lMS123AkpnF2zdjbphFUGk8Z
        1l0GFboFnisSOR2Qz/EjDDiJgU4+O+CYPXhjOwr6NqaI7G4OeaLuysNwsuigQDFC
        79jfQtqI8ms/rUroi8eFeYwN6PGX7DBjSZLNr686Y4IgG7tAqwNls5QZjpqJMN4w
        tEtgfYNdhysam/o+/IEEx4CPGeS0Z6/zRZsybXa7qo3HbPVuQb6tMmtp28PsZzxr
        XP2Ixx8o2Wb1OTJjGy/F9rwwI789y6wPzIWOdHYJUEJYjck+Yts6KepldbahXMgw
        dKow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280259; x=1652366659; bh=tEU17YogLxKtMN0aMEK+Uw2kBj/fVkKM+d9
        KCmJCGKE=; b=xcD/J6k4Yjo2f5avQ0CnBDUvhKW0kgYLGAoCKQR4uLVARQq/CSm
        itn2AGiKXDeD11Q1GFWpzH8sIm6Lfsmu64LXZqnEmo+AksTqTernv8zVbw7DjPVH
        FO0jUS1NmqUTgZK9gaJI0V/9AdSZuOR9qZDb/LzLMvVhZs5w1UVaxyD5z0D0wyNX
        zpCLClK9MYxSGICM+wO3DIwdPvIQJiB8eB2j45oWhJmsIX8f7dbZ4GPShXcYUPXw
        ZoUFi1wcM136SdWR6Ej8IyJYqpZR5RfjFPMgBCtOXYFCjTA2P6y+EP6BQt/1vmgz
        oDTQqBDnuzdssfRISt88eNqtfzICPAffbxw==
X-ME-Sender: <xms:w8t7YnNfEWpZ1WiIdMzFuOfvEvydsFN85PXI7tkWIDSotzlHJjL5hQ>
    <xme:w8t7Yh8SIcUX1DzwPdeMzATz8u-ewVA_UNPpkY7bExVRoFH11-rpWftHGHZoPspmk
    vfGSD-pCevFr399qsk>
X-ME-Received: <xmr:w8t7YmTpUDMSzLvkflUFzvokRQUo_PC8eBjNq6eKbrLwge7yGOSNJaB4A-YUkT2tbLWrU4R8mLZYeLbIkSTDmNudEKwcc1JDHHb2CdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:w8t7YrujNrDzX7iWOWDXgronqBuFkrGNJn5uE1Bni6d3yBv0R35XRQ>
    <xmx:w8t7Yvd8BXXE6-qqKizV1NysBvLDKv4tZXPF-5Z5NFSyDlPHb0pLbg>
    <xmx:w8t7Yn27NqgJxYY4w1UtPNUrdrVh11ZsnwwaqNP8u40VPr6qoCD2sQ>
    <xmx:w8t7YgU7sZGaQw9ZPXNc66mgmSY8dT0Ut4TGxazzMl1iYiNLJEaAdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:19 -0400 (EDT)
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
Subject: [PATCH v3 22/28] clk: Stop forwarding clk_rate_requests to the parent
Date:   Wed, 11 May 2022 16:42:43 +0200
Message-Id: <20220511144249.354775-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If the clock cannot modify its rate and has CLK_SET_RATE_PARENT,
clk_mux_determine_rate_flags(), clk_core_round_rate_nolock() and a
number of drivers will forward the clk_rate_request to the parent clock.

clk_core_round_rate_nolock() will pass the pointer directly, which means
that we pass a clk_rate_request to the parent that has the rate,
min_rate and max_rate of the child, and the best_parent_rate and
best_parent_hw fields will be relative to the child as well, so will
point to our current clock and its rate. The most common case for
CLK_SET_RATE_PARENT is that the child and parent clock rates will be
equal, so the rate field isn't a worry, but the other fields are.

Similarly, if the parent clock driver ever modifies the best_parent_rate
or best_parent_hw, this will be applied to the child once the call to
clk_core_round_rate_nolock() is done. best_parent_hw is probably not
going to be a valid parent, and best_parent_rate might lead to a parent
rate change different to the one that was initially computed.

clk_mux_determine_rate_flags() and the affected drivers will copy the
request before forwarding it to the parents, so they won't be affected
by the latter issue, but the former is still going to be there and will
lead to erroneous data and context being passed to the various clock
drivers in the same sub-tree.

Let's create two new functions, clk_core_forward_rate_req() and
clk_hw_forward_rate_request() for the framework and the clock providers
that will copy a request from a child clock and update the context to
match the parent's. We also update the relevant call sites in the
framework and drivers to use that new function.

Let's also add a test to make sure we avoid regressions there.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/at91/clk-generated.c  |   4 +-
 drivers/clk/at91/clk-master.c     |   9 +-
 drivers/clk/at91/clk-peripheral.c |   4 +-
 drivers/clk/clk-composite.c       |   6 +-
 drivers/clk/clk.c                 |  84 ++++++++++++--
 drivers/clk/clk_test.c            | 176 ++++++++++++++++++++++++++++++
 include/linux/clk-provider.h      |   5 +
 7 files changed, 273 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
index 23cc8297ec4c..178df87e429d 100644
--- a/drivers/clk/at91/clk-generated.c
+++ b/drivers/clk/at91/clk-generated.c
@@ -132,7 +132,6 @@ static int clk_generated_determine_rate(struct clk_hw *hw,
 {
 	struct clk_generated *gck = to_clk_generated(hw);
 	struct clk_hw *parent = NULL;
-	struct clk_rate_request req_parent = *req;
 	long best_rate = -EINVAL;
 	unsigned long min_rate, parent_rate;
 	int best_diff = -1;
@@ -188,6 +187,9 @@ static int clk_generated_determine_rate(struct clk_hw *hw,
 		goto end;
 
 	for (div = 1; div < GENERATED_MAX_DIV + 2; div++) {
+		struct clk_rate_request req_parent;
+
+		clk_hw_forward_rate_request(hw, parent, req, &req_parent);
 		req_parent.rate = req->rate * div;
 		if (__clk_determine_rate(parent, &req_parent))
 			continue;
diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 164e2959c7cf..b7cd1924de52 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -581,7 +581,6 @@ static int clk_sama7g5_master_determine_rate(struct clk_hw *hw,
 					     struct clk_rate_request *req)
 {
 	struct clk_master *master = to_clk_master(hw);
-	struct clk_rate_request req_parent = *req;
 	struct clk_hw *parent;
 	long best_rate = LONG_MIN, best_diff = LONG_MIN;
 	unsigned long parent_rate;
@@ -618,11 +617,15 @@ static int clk_sama7g5_master_determine_rate(struct clk_hw *hw,
 		goto end;
 
 	for (div = 0; div < MASTER_PRES_MAX + 1; div++) {
+		struct clk_rate_request req_parent;
+		unsigned long req_rate;
+
 		if (div == MASTER_PRES_MAX)
-			req_parent.rate = req->rate * 3;
+			req_rate = req->rate * 3;
 		else
-			req_parent.rate = req->rate << div;
+			req_rate = req->rate << div;
 
+		clk_hw_forward_rate_request(hw, req, parent, &req_parent, req_rate);
 		if (__clk_determine_rate(parent, &req_parent))
 			continue;
 
diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-peripheral.c
index e14fa5ac734c..5104d4025484 100644
--- a/drivers/clk/at91/clk-peripheral.c
+++ b/drivers/clk/at91/clk-peripheral.c
@@ -269,7 +269,6 @@ static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
 {
 	struct clk_sam9x5_peripheral *periph = to_clk_sam9x5_peripheral(hw);
 	struct clk_hw *parent = clk_hw_get_parent(hw);
-	struct clk_rate_request req_parent = *req;
 	unsigned long parent_rate = clk_hw_get_rate(parent);
 	unsigned long tmp_rate;
 	long best_rate = LONG_MIN;
@@ -302,8 +301,9 @@ static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
 		goto end;
 
 	for (shift = 0; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
-		req_parent.rate = req->rate << shift;
+		struct clk_rate_request req_parent;
 
+		clk_hw_forward_rate_request(hw, req, parent, &req_parent, req->rate << shift);
 		if (__clk_determine_rate(parent, &req_parent))
 			continue;
 
diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index b9c5f904f535..edfa94641bbf 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -85,10 +85,11 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = NULL;
 
 		if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
-			struct clk_rate_request tmp_req = *req;
+			struct clk_rate_request tmp_req;
 
 			parent = clk_hw_get_parent(mux_hw);
 
+			clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
 			ret = clk_composite_determine_rate_for_parent(rate_hw,
 								      &tmp_req,
 								      parent,
@@ -104,12 +105,13 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 		}
 
 		for (i = 0; i < clk_hw_get_num_parents(mux_hw); i++) {
-			struct clk_rate_request tmp_req = *req;
+			struct clk_rate_request tmp_req;
 
 			parent = clk_hw_get_parent_by_index(mux_hw, i);
 			if (!parent)
 				continue;
 
+			clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
 			ret = clk_composite_determine_rate_for_parent(rate_hw,
 								      &tmp_req,
 								      parent,
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7754a5140a6b..75927377a2c2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -536,6 +536,10 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
+static void clk_core_init_rate_req(struct clk_core * const core,
+				   struct clk_rate_request *req,
+				   unsigned long rate);
+
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req);
 
@@ -559,6 +563,25 @@ static bool clk_core_has_parent(struct clk_core *core, struct clk_core *parent)
 	return false;
 }
 
+static void
+clk_core_forward_rate_req(struct clk_core * const core,
+			  struct clk_rate_request * const old_req,
+			  struct clk_core * const parent,
+			  struct clk_rate_request *req,
+			  unsigned long parent_rate)
+{
+	if (WARN_ON(!clk_core_has_parent(core, parent)))
+		return;
+
+	clk_core_init_rate_req(parent, req, parent_rate);
+
+	if (req->min_rate < old_req->min_rate)
+		req->min_rate = old_req->min_rate;
+
+	if (req->max_rate > old_req->max_rate)
+		req->max_rate = old_req->max_rate;
+}
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -566,17 +589,19 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	struct clk_core *core = hw->core, *parent, *best_parent = NULL;
 	int i, num_parents, ret;
 	unsigned long best = 0;
-	struct clk_rate_request parent_req = *req;
 
 	/* if NO_REPARENT flag set, pass through to current parent */
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT) {
+			struct clk_rate_request parent_req;
+
 			if (!parent) {
 				req->rate = 0;
 				return 0;
 			}
 
+			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
 			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				return ret;
@@ -594,23 +619,29 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	/* find the parent that can provide the fastest rate <= rate */
 	num_parents = core->num_parents;
 	for (i = 0; i < num_parents; i++) {
+		unsigned long parent_rate;
+
 		parent = clk_core_get_parent_by_index(core, i);
 		if (!parent)
 			continue;
 
 		if (core->flags & CLK_SET_RATE_PARENT) {
-			parent_req = *req;
+			struct clk_rate_request parent_req;
+
+			clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
 			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
+
+			parent_rate = parent_req.rate;
 		} else {
-			parent_req.rate = clk_core_get_rate_nolock(parent);
+			parent_rate = clk_core_get_rate_nolock(parent);
 		}
 
-		if (mux_is_better_rate(req->rate, parent_req.rate,
+		if (mux_is_better_rate(req->rate, parent_rate,
 				       best, flags)) {
 			best_parent = parent;
-			best = parent_req.rate;
+			best = parent_rate;
 		}
 	}
 
@@ -1448,6 +1479,31 @@ void clk_hw_init_rate_request(const struct clk_hw *hw,
 }
 EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
 
+/**
+ * clk_hw_forward_rate_request - Forwards a clk_rate_request to a clock's parent
+ * @hw: the original clock that got the rate request
+ * @old_req: the original clk_rate_request structure we want to forward
+ * @parent: the clk we want to forward @old_req to
+ * @req: the clk_rate_request structure we want to initialise
+ * @parent_rate: The rate which is to be requested to @parent
+ *
+ * Initializes a clk_rate_request structure to submit to a clock parent
+ * in __clk_determine_rate() or similar functions.
+ */
+void clk_hw_forward_rate_request(const struct clk_hw *hw,
+				 const struct clk_rate_request *old_req,
+				 const struct clk_hw *parent,
+				 struct clk_rate_request *req,
+				 unsigned long parent_rate)
+{
+	if (WARN_ON(!hw || !old_req || !parent || !req))
+		return;
+
+	clk_core_forward_rate_req(hw->core, old_req,
+				  parent->core, req,
+				  parent_rate);
+}
+
 static bool clk_core_can_round(struct clk_core * const core)
 {
 	return core->ops->determine_rate || core->ops->round_rate;
@@ -1456,6 +1512,8 @@ static bool clk_core_can_round(struct clk_core * const core)
 static int clk_core_round_rate_nolock(struct clk_core *core,
 				      struct clk_rate_request *req)
 {
+	int ret;
+
 	lockdep_assert_held(&prepare_lock);
 
 	if (!core) {
@@ -1465,8 +1523,20 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
-	else if (core->flags & CLK_SET_RATE_PARENT)
-		return clk_core_round_rate_nolock(core->parent, req);
+
+	if (core->flags & CLK_SET_RATE_PARENT) {
+		struct clk_rate_request parent_req;
+
+		clk_core_forward_rate_req(core, req, core->parent, &parent_req, req->rate);
+		ret = clk_core_round_rate_nolock(core->parent, &parent_req);
+		if (ret)
+			return ret;
+
+		req->best_parent_rate = parent_req.rate;
+		req->rate = parent_req.rate;
+
+		return 0;
+	}
 
 	req->rate = core->rate;
 	return 0;
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 7e1a231a5a6b..865457b566d4 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -975,6 +975,34 @@ clk_test_single_parent_mux_set_range_disjoint_parent_last(struct kunit *test)
 	KUNIT_EXPECT_LT(test, ret, 0);
 }
 
+/*
+ * Test that for a clock that can't modify its rate and with a single
+ * parent, if we set a range on the parent and then call
+ * clk_round_rate(), the boundaries of the parent are taken into
+ * account.
+ */
+static void
+clk_test_single_parent_mux_set_range_round_rate_parent_only(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long rate;
+	int ret;
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
+}
+
 /*
  * Test that for a clock that can't modify its rate and with a single
  * parent, if we set a range on the parent and a more restrictive one on
@@ -1011,12 +1039,50 @@ clk_test_single_parent_mux_set_range_round_rate_child_smaller(struct kunit *test
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
 }
 
+/*
+ * Test that for a clock that can't modify its rate and with a single
+ * parent, if we set a range on the child and a more restrictive one on
+ * the parent, and then call clk_round_rate(), the boundaries of the
+ * two clocks are taken into account.
+ */
+static void
+clk_test_single_parent_mux_set_range_round_rate_parent_smaller(struct kunit *test)
+{
+	struct clk_single_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+	unsigned long rate;
+	int ret;
+
+	parent = clk_get_parent(clk);
+	KUNIT_ASSERT_PTR_NE(test, parent, NULL);
+
+	ret = clk_set_rate_range(parent, DUMMY_CLOCK_RATE_1 + 1000, DUMMY_CLOCK_RATE_2 - 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk, DUMMY_CLOCK_RATE_1, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
+
+	rate = clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2 - 1000);
+}
+
 static struct kunit_case clk_single_parent_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_single_parent_mux_get_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_has_parent),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_child_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_disjoint_parent_last),
 	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_child_smaller),
+	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_parent_only),
+	KUNIT_CASE(clk_test_single_parent_mux_set_range_round_rate_parent_smaller),
 	{}
 };
 
@@ -1920,7 +1986,117 @@ static struct kunit_suite clk_range_minimize_test_suite = {
 	.test_cases = clk_range_minimize_test_cases,
 };
 
+struct clk_leaf_mux_ctx {
+	struct clk_multiple_parent_ctx mux_ctx;
+	struct clk_hw hw;
+};
+
+static int
+clk_leaf_mux_set_rate_parent_test_init(struct kunit *test)
+{
+	struct clk_leaf_mux_ctx *ctx;
+	const char *top_parents[2] = { "parent-0", "parent-1" };
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->mux_ctx.parents_ctx[0].hw.init = CLK_HW_INIT_NO_PARENT("parent-0",
+								    &clk_dummy_rate_ops,
+								    0);
+	ctx->mux_ctx.parents_ctx[0].rate = DUMMY_CLOCK_RATE_1;
+	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[0].hw);
+	if (ret)
+		return ret;
+
+	ctx->mux_ctx.parents_ctx[1].hw.init = CLK_HW_INIT_NO_PARENT("parent-1",
+								    &clk_dummy_rate_ops,
+								    0);
+	ctx->mux_ctx.parents_ctx[1].rate = DUMMY_CLOCK_RATE_2;
+	ret = clk_hw_register(NULL, &ctx->mux_ctx.parents_ctx[1].hw);
+	if (ret)
+		return ret;
+
+	ctx->mux_ctx.current_parent = 0;
+	ctx->mux_ctx.hw.init = CLK_HW_INIT_PARENTS("test-mux", top_parents,
+						   &clk_multiple_parents_mux_ops,
+						   0);
+	ret = clk_hw_register(NULL, &ctx->mux_ctx.hw);
+	if (ret)
+		return ret;
+
+	ctx->hw.init = CLK_HW_INIT_HW("test-clock", &ctx->mux_ctx.hw,
+				      &clk_dummy_single_parent_ops,
+				      CLK_SET_RATE_PARENT);
+	ret = clk_hw_register(NULL, &ctx->hw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void clk_leaf_mux_set_rate_parent_test_exit(struct kunit *test)
+{
+	struct clk_leaf_mux_ctx *ctx = test->priv;
+
+	clk_hw_unregister(&ctx->hw);
+	clk_hw_unregister(&ctx->mux_ctx.hw);
+	clk_hw_unregister(&ctx->mux_ctx.parents_ctx[0].hw);
+	clk_hw_unregister(&ctx->mux_ctx.parents_ctx[1].hw);
+}
+
+/*
+ * Test that, for a clock that will forward any rate request to its
+ * parent, the rate request structure returned by __clk_determine_rate
+ * is sane and will be what we expect.
+ */
+static void clk_leaf_mux_set_rate_parent_determine_rate(struct kunit *test)
+{
+	struct clk_leaf_mux_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk_rate_request req;
+	unsigned long rate;
+	int ret;
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
+
+	clk_hw_init_rate_request(hw, &req, DUMMY_CLOCK_RATE_2);
+
+	ret = __clk_determine_rate(hw, &req);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, req.rate, DUMMY_CLOCK_RATE_2);
+	KUNIT_EXPECT_EQ(test, req.best_parent_rate, DUMMY_CLOCK_RATE_2);
+	KUNIT_EXPECT_PTR_EQ(test, req.best_parent_hw, &ctx->mux_ctx.hw);
+}
+
+static struct kunit_case clk_leaf_mux_set_rate_parent_test_cases[] = {
+	KUNIT_CASE(clk_leaf_mux_set_rate_parent_determine_rate),
+	{}
+};
+
+/*
+ * Test suite for a clock whose parent is a mux with multiple parents.
+ * The leaf clock has CLK_SET_RATE_PARENT, and will forward rate
+ * requests to the mux, which will then select which parent is the best
+ * fit for a given rate.
+ *
+ * These tests exercise the behaviour of muxes, and the proper selection
+ * of parents.
+  */
+static struct kunit_suite clk_leaf_mux_set_rate_parent_test_suite = {
+	.name = "clk-leaf-mux-set-rate-parent",
+	.init = clk_leaf_mux_set_rate_parent_test_init,
+	.exit = clk_leaf_mux_set_rate_parent_test_exit,
+	.test_cases = clk_leaf_mux_set_rate_parent_test_cases,
+};
+
 kunit_test_suites(
+	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c8f25924fa05..7f4f34ff2b83 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -65,6 +65,11 @@ struct clk_rate_request {
 void clk_hw_init_rate_request(const struct clk_hw *hw,
 			      struct clk_rate_request *req,
 			      unsigned long rate);
+void clk_hw_forward_rate_request(const struct clk_hw *core,
+				 const struct clk_rate_request *old_req,
+				 const struct clk_hw *parent,
+				 struct clk_rate_request *req,
+				 unsigned long parent_rate);
 
 /**
  * struct clk_duty - Struture encoding the duty cycle ratio of a clock
-- 
2.36.1

