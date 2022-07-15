Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA4FC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbiGOQCF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiGOQBo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:44 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50C873599
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:43 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 4910C32009C5;
        Fri, 15 Jul 2022 12:01:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 15 Jul 2022 12:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900901; x=1657987301; bh=AR
        N9NKe1bx2uquzIIAFTHapAX3QVFQI/DrzTuX5i0mA=; b=ufYqzfAM3+Lh5AuxXW
        6xBKTZAlvJtMRsBNLBpBh/H8xYZb1O8jUnp93ZfWJSU/yW/7zdNKBDDBJTfvKyy0
        eYFLsQaVQqzg/IB4wUKCWj5J7x88T6OftKBoE2LqYd7YIvrR+3cwKJjbeqzpE1ah
        3vlVkmWxMA2MSPaXhfqrwISTDg4+QOWujWkmPlMpObnv0Y3fVRkzKopBQ5U1aici
        ZzVnXQlOegIVoyo10B/YnSno6VIU/Tsd+K9K0WHtS+pqr/xlJogi1luxV21Rzi3T
        GEl9ya3jAhYhxgI690Z49DFEI9sawYP41zJzewFYWwe7p7GB+8HT66R+7ADpKCUa
        mEng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900901; x=1657987301; bh=ARN9NKe1bx2uq
        uzIIAFTHapAX3QVFQI/DrzTuX5i0mA=; b=0Cx2h3gSXCG8bVoC+bn3hfIx8uRjc
        IiwAjJmQAIj8PxGkATE1b4NjpR9F16c80WiDtJxbabFfietjdAa7uA00HL46VRHM
        FTs59c222gEZMm9hSFqRio6+K6MHNnrdqb+dKA6KIxEwupRRuGD8bTf/oqwzYSFm
        +Sivavo3iPtYVwgBe1Xo/L84EyMHS/UYnSb7O1AbAV/+E0sQJyO0UP4Jw9C9BtqD
        gRLreyuNAPTizl82Vy2qcruzjzHbk50XXQ2T9zjGofq7akc4UB1yJSimFioxSyiC
        roAksW/vSLcPK8do5pH7M2qXQJbwoBV36g3Du3nPsrlCQYKH/J0aaMUiw==
X-ME-Sender: <xms:ZY_RYptlXIHyOhxghblVzYdGsgyrBoZs9fMRhYOE5zqkvT60xn_Z-A>
    <xme:ZY_RYiehenRdPMiZBAh6sFCagwtnpmHZnQTPK0qSFN24jk6NfVv6hexpqgTvgqAnc
    0jSE0mUoysBtKsX-kw>
X-ME-Received: <xmr:ZY_RYsz_Ux6_DvNHbwH1a0LghYRXrNp6tpnjt75X8g99IFUwrRAH0Ax-iULo4lztZs3sM3lF5ciq4-PTG6qiwJt9mduph4tzZ35-Sy0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZY_RYgOeiF68G7wcIj5dgb9SyTkBPRHswhcFOko7v5ZvV9KbtojpIw>
    <xmx:ZY_RYp-9KX8jHJWGhncl49daxTIvAJ3k7JRkmPOsmldt95lO3F3Iqg>
    <xmx:ZY_RYgUzndZAYmfVgotfI20ofCSIGoWRcl1r6DppLE4uLw24maBtXA>
    <xmx:ZY_RYq31hrl5_tr1abx_LAHEBzQK6MvVeO_zEv5mEB-xj61GlzN1Pw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:41 -0400 (EDT)
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
Subject: [PATCH v7 19/28] clk: Introduce clk_hw_init_rate_request()
Date:   Fri, 15 Jul 2022 18:00:05 +0200
Message-Id: <20220715160014.2623107-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk-divider instantiates clk_rate_request internally for its round_rate
implementations to share the code with its determine_rate
implementations.

However, it's missing a few fields (min_rate, max_rate) that would be
initialized properly if it was using clk_core_init_rate_req().

Let's create the clk_hw_init_rate_request() function for clock providers
to be able to share the code to instation clk_rate_requests with the
framework. This will also be useful for some tests introduced in later
patches.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-divider.c    | 20 ++++++++++----------
 drivers/clk/clk.c            | 20 ++++++++++++++++++++
 include/linux/clk-provider.h |  6 ++++++
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f6b2bf558486..a2c2b5203b0a 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -386,13 +386,13 @@ long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 			       const struct clk_div_table *table,
 			       u8 width, unsigned long flags)
 {
-	struct clk_rate_request req = {
-		.rate = rate,
-		.best_parent_rate = *prate,
-		.best_parent_hw = parent,
-	};
+	struct clk_rate_request req;
 	int ret;
 
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
 	ret = divider_determine_rate(hw, &req, table, width, flags);
 	if (ret)
 		return ret;
@@ -408,13 +408,13 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 				  const struct clk_div_table *table, u8 width,
 				  unsigned long flags, unsigned int val)
 {
-	struct clk_rate_request req = {
-		.rate = rate,
-		.best_parent_rate = *prate,
-		.best_parent_hw = parent,
-	};
+	struct clk_rate_request req;
 	int ret;
 
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
 	ret = divider_ro_determine_rate(hw, &req, table, width, flags, val);
 	if (ret)
 		return ret;
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7a071c567800..195f051ee536 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1400,6 +1400,26 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	}
 }
 
+/**
+ * clk_hw_init_rate_request - Initializes a clk_rate_request
+ * @hw: the clk for which we want to submit a rate request
+ * @req: the clk_rate_request structure we want to initialise
+ * @rate: the rate which is to be requested
+ *
+ * Initializes a clk_rate_request structure to submit to
+ * __clk_determine_rate() or similar functions.
+ */
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate)
+{
+	if (WARN_ON(!hw || !req))
+		return;
+
+	clk_core_init_rate_req(hw->core, req, rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
+
 static bool clk_core_can_round(struct clk_core * const core)
 {
 	return core->ops->determine_rate || core->ops->round_rate;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 12e9cbf533b2..2d08000346b1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -42,6 +42,8 @@ struct dentry;
  * struct clk_rate_request - Structure encoding the clk constraints that
  * a clock user might require.
  *
+ * Should be initialized by calling clk_hw_init_rate_request().
+ *
  * @rate:		Requested clock rate. This field will be adjusted by
  *			clock drivers according to hardware capabilities.
  * @min_rate:		Minimum rate imposed by clk users.
@@ -60,6 +62,10 @@ struct clk_rate_request {
 	struct clk_hw *best_parent_hw;
 };
 
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate);
+
 /**
  * struct clk_duty - Struture encoding the duty cycle ratio of a clock
  *
-- 
2.36.1

