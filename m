Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF43C2BB41
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbiHPLwL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234865AbiHPLve (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:51:34 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90040D7CC4
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:33 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id BDB62320091F;
        Tue, 16 Aug 2022 07:26:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649190; x=1660735590; bh=M1
        Km//lWkEL1RRhUgrFdjc2Rs6psHO4Hu+nQGIxUr+M=; b=BzzmhVCgNjRNGszebM
        iYMtGDn0OzLrdiQfyfFNQ6SyuYOhok8xma52AejapCSI6/JXsk3KXkpulHNYnMAQ
        tGiq4/yMIVmZ7H9snbcTUIB1NXRLr2tZ6zgP9JvHDBp9/4F79HxJsO7BtqKOu3cJ
        1WdOydgy4n2woEgcmZaf91JXlNNFoug4NBjHPCygZfAjhNNla/gYbCE6RZfis/8X
        0hSrasZpdEdRmFiXOCCJUZGq5u1I1YWhnf6feP66KdA3WGrBlJxxPqZd+SmhpSSh
        5bTO/BlWZIyB1OBZiDkWXJ4wfZO/SjOkDAU0t8DN5Rq/QF9xucA8C7miXcMhi2yS
        5zqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649190; x=1660735590; bh=M1Km//lWkEL1R
        RhUgrFdjc2Rs6psHO4Hu+nQGIxUr+M=; b=Rc1UW2hT/fYPRHRhmSIWvUZa513lt
        BymGiPhgzntWbP1YaHfy4NfTP04wvwtT40jZMQXiNMp21h6pSCG/s92ughVWTaT9
        L1BEnWfhNlgE9AZ2eJcX2SXlB/x8LEov/KBSGEi+QWaHBNgHgkwgoxoDzxku9VUz
        uGLbH7BxKSh/VpYM5j4RGhabZwHnDPDJyPeDxrdxjwjPOdKq7WA2HR6TK4xgpAiw
        KUr6cdtVt9IBrfUCBHZl/Y24z53+l42gvRhtELS6GM1fcZPGjHLduL1Ju/s0M0TN
        Xg+XIB+Oj3EdFn/2/r2s2kkU2YN/Aq/VEU0zyL7NChHSsfo6BKL5DtJCA==
X-ME-Sender: <xms:5n77Ym_hjPdhYcCwSV54cuGzln9IIWWAYc1N0Ffg28tUE23H2ExO2A>
    <xme:5n77YmvSz1XTK4mlE2fQgUY_Tiz98Lxj3gzKVUOQKC9ISXF4tF7UFS5tfTg1vR6eD
    z4PlAmSUfoq4yKicfg>
X-ME-Received: <xmr:5n77YsARjfxEpz1f-AMlccgVfzlevn9GDRA7-8a4c5BJGeNKcq3Sigrv6Bk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5n77Yud65mekkcte6bgZOTfFDDHSkc5mifU3K7O5pYl3DM62BvpUzw>
    <xmx:5n77YrOixSpWj-smpO7I26gvgeSlQo6GrjmVTu_5tm9J3WSD-O0dvA>
    <xmx:5n77Yom0PX5yZMtbA89yiOhROHaCKrYzVpz5RRolFP0XIbKxBQceqQ>
    <xmx:5n77YsFH9tCm3rqPRUImtlNAlfnobk5DUS9Y7xvOyJzk1ovwCMNAcA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:29 -0400 (EDT)
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
Subject: [PATCH v9 12/25] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Tue, 16 Aug 2022 13:25:17 +0200
Message-Id: <20220816112530.1837489-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_set_rate_range() will use the last requested rate for the clock when
it calls into the driver set_rate hook.

However, if CLK_GET_RATE_NOCACHE is set on that clock, the last
requested rate might not be matching the current rate of the clock. In
such a case, let's read out the rate from the hardware and use that in
our set_rate instead.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  6 +++++-
 drivers/clk/clk_test.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index caa2eb640441..53b28e63deae 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2373,6 +2373,10 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 		goto out;
 	}
 
+	rate = clk->core->req_rate;
+	if (clk->core->flags & CLK_GET_RATE_NOCACHE)
+		rate = clk_core_get_rate_recalc(clk->core);
+
 	/*
 	 * Since the boundaries have been changed, let's give the
 	 * opportunity to the provider to adjust the clock rate based on
@@ -2390,7 +2394,7 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	 * - the determine_rate() callback does not really check for
 	 *   this corner case when determining the rate
 	 */
-	rate = clamp(clk->core->req_rate, min, max);
+	rate = clamp(rate, min, max);
 	ret = clk_core_set_rate_nolock(clk->core, rate);
 	if (ret) {
 		/* rollback the changes */
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index ceed49c5a88b..d3e121f21ae2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -375,9 +375,40 @@ static void clk_test_uncached_set_range(struct kunit *test)
 	clk_put(clk);
 }
 
+/*
+ * Test that for an uncached clock, clk_set_rate_range() will work
+ * properly if the rate has changed in hardware.
+ *
+ * In this case, it means that if the rate wasn't initially in the range
+ * we're trying to set, but got changed at some point into the range
+ * without the kernel knowing about it, its rate shouldn't be affected.
+ */
+static void clk_test_uncached_updated_rate_set_range(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	unsigned long rate;
+
+	/* We change the rate behind the clock framework's back */
+	ctx->rate = DUMMY_CLOCK_RATE_1 + 1000;
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+
+	clk_put(clk);
+}
+
 static struct kunit_case clk_uncached_test_cases[] = {
 	KUNIT_CASE(clk_test_uncached_get_rate),
 	KUNIT_CASE(clk_test_uncached_set_range),
+	KUNIT_CASE(clk_test_uncached_updated_rate_set_range),
 	{}
 };
 
-- 
2.37.1

