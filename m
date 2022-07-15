Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F46C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234307AbiGOQDM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiGOQCU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:02:20 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9665D76956
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:02:19 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0FF253200902;
        Fri, 15 Jul 2022 12:02:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 15 Jul 2022 12:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900937; x=1657987337; bh=3E
        H5v5McC3jEi65SSBa5R6U9TYEoq9N0vbsDoTx8KvQ=; b=AMM/vk1vODiyyP+MdG
        N1mKIbw+iy9I5zdVhSUGhdxf3N0j5JFP4/m/Ru5BTvjgiUDDzhsQAw3lKlEuvqaW
        LvVvl8quvDl7kXKwB1w6k1+Ychhkx6YorGge46mswaXfECBnH63frXG0VwzXs5Kf
        w2r1i0Mf8GxC9ZZn09iYLRaFNWNoBWiuXpN2dj4rGVkziPXJHEPbuMRCMTj25MlS
        JbtFahv4ECHUVkP3/33Ikq69VY1XsNAbMPAZc1Jfyed13Pn2dRN07V77Yxs7JhKm
        fIt4POazpv03vgNjormLa8fT56M83olePE4MbkaZcW5c3wUBBDQK2iLFSISWbmvt
        anBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900937; x=1657987337; bh=3EH5v5McC3jEi
        65SSBa5R6U9TYEoq9N0vbsDoTx8KvQ=; b=wXsqfKs9t1giirfNiTWZZeSmtB9OX
        tmbYe7OS+LB+Su0sGXRKRGaxKJcp3/jTE7vlGdfQpMJwb07o1eGxspAL1B+vyHcb
        uz3s2d7JlZpV0jWgOSq9pwTKEoAMO6kMroCc+IOCc0Tp43RaTJHDdbkbX9E5pGUx
        QyYBNev0FF5esqnM5eekbqE942Psv3k72yoVTpOgQp2J59emg5aoQ7luEgYNUPmZ
        3MRs7gGBNGry4MDilD4iYQhq825U030fiorypP4BXQsgPySGnmhgUFfzvvE1KmCI
        +1M6KMhJbBdlTwm/mVMtzoqFTuJsfK70JHUr5wYtXLdzEz5ARk4o9OgGA==
X-ME-Sender: <xms:iI_RYqjvcND73ex-HO6Dns6XsidXCclRwaMz3LQu_q74bj8N4qGjew>
    <xme:iI_RYrAWPR79qG9VsK6NHDnaJ9NyNQAmeg3CWvDgO9oI9asWLhGmgFB-qzsEsw56p
    6KMGBY_zItXusg6Whw>
X-ME-Received: <xmr:iI_RYiEhBURvWOtTFfpfoQ9NcSxYxRLEVZlSgxQhQczX1FUjaRt_J6xEvC-ixd5gc596yXMHl78Y3gzuXG5aP5korb-QbP0mjHhEeEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iI_RYjQtQv8ELQsUog_G6aUBEWoE9a8zGgh9Cb0_PpD27zrz9UxJHg>
    <xmx:iI_RYny7_SMiu7c5wFz2c3E2NenQC3bhSTN2_DaLTFMzjWNTB6BqhA>
    <xmx:iI_RYh7YsChWwf9D-eRUvq4gvoKBtBHKjINBNRwhlKZrenIWYFTT5Q>
    <xmx:iY_RYsokeiP3x9BcbHD2Ko_j0ihhz0rlbYRC_5aYJ_tMeWYjxYRfPQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:02:16 -0400 (EDT)
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
Subject: [PATCH v7 26/28] clk: Introduce the clk_hw_get_rate_range function
Date:   Fri, 15 Jul 2022 18:00:12 +0200
Message-Id: <20220715160014.2623107-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clock providers are hand-crafting their clk_rate_request, and need
to figure out the current boundaries of their clk_hw to fill it
properly.

Let's create such a function for clock providers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c            | 16 ++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 77601f435f12..5bdfd645f1dc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -683,6 +683,22 @@ static void clk_core_get_boundaries(struct clk_core *core,
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
+/*
+ * clk_hw_get_rate_range() - returns the clock rate range for a hw clk
+ * @hw: the hw clk we want to get the range from
+ * @min_rate: pointer to the variable that will hold the minimum
+ * @max_rate: pointer to the variable that will hold the maximum
+ *
+ * Fills the @min_rate and @max_rate variables with the minimum and
+ * maximum that clock can reach.
+ */
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate)
+{
+	clk_core_get_boundaries(hw->core, min_rate, max_rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
+
 static bool clk_core_check_boundaries(struct clk_core *core,
 				      unsigned long min_rate,
 				      unsigned long max_rate)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0bfebea2a50a..1e38886a2916 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1233,6 +1233,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 
-- 
2.36.1

