Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B1FC43219
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350324AbiD1Qrv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350323AbiD1Qru (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:50 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29B0B2471
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:35 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 44B1B5C0058;
        Thu, 28 Apr 2022 12:44:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164275; x=1651250675; bh=m3
        4AFXbsUOjHXv4NpJ/nNZ0LXK72de4f/tP9myQ3WtA=; b=t9ZopRgO6lrkLYSnny
        6T8wQ7167FmfmfreCbbbse6u2hA+sDBLEb9QLZoQIiVo148ejFeOI9hnYf5I4uCB
        GAJf+GN3Fd0+tj8oW4ZHQRZ/fAz1r7QzlTrq1kMy++JwA8ZY3trlwFAikLN2Bf26
        IivLJsdJtwsS0PNOb3+WwvVxWm3JO1oKIr8+rh15/F0LOFCOoNhKGuppsmcoervb
        7WOojTuUSg5GtKXQWX4iloC9QJPIROvAp9eREmK96GgZraT7QUiVaYPYqw6qGHs3
        Ne84p1frvXEKRxU+MYhUcSU6fPvBaUVnq4cESkIW3FjQuodt5q98c/l0EIqcIvAn
        LoaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164275; x=1651250675; bh=m34AFXbsUOjHXv4NpJ/nNZ0LXK72de4f/tP
        9myQ3WtA=; b=kk4dCWnWJnFHeqAA9Gig8QOVj+GV2o2RC6Ke633uiBQKGEulrRL
        SrcqSe/7Woe+W+4lY8roW0T8Bz4e40QVJ9y5glcWlt+coePAis/4iPTfg498somV
        QG5ehreWE1QZKjadZGVNn7jEPbSQTDy7nBSQ9UnVxIefZ7FOTPtu7JnD0pepHiAo
        iB6KUiT327F+lwFvkrnaHScgBo9uSxfa8396Q/yJEZdO9oeHeQW4aYTsl5VPsoyw
        aUKS1sJjC91vdilQD08eMPPHjyhoPvLTdl/VRIU0UGmZJ4azPjkOnISkyn5kHJhL
        WEgtzerqMRfGriLCdVBwwKyU48OujOAC/Tw==
X-ME-Sender: <xms:c8RqYuSL0e_chAy4mIGGQxitN8LuZt4w23E8swA68uy_46VH45AEiw>
    <xme:c8RqYjyEDVY2hx2cXKCpqkOCiFlyDzIc6uPfBsqxqtfRTFbyVTCGA9-bGUnpd6-Ai
    6RKaqVKzwTvXNDE2a8>
X-ME-Received: <xmr:c8RqYr2NP692-C_Qb8Q8pxqwdfCCVeefMp3kNkjwuNZt-6oDVKfGC9eqZNr4ATF8VBaPZItfqTQZ30OVWwB-6PbKLwxjWRaxNEKFseA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c8RqYqCThozJkwgysHOhrmNzXHuuOoCXU2jGjQ5orhXVkCMWp1vfOQ>
    <xmx:c8RqYnhfstFDEyCKdrZRKVTD9WaMFnL9Ev6x_Y2Atk6TwbBAn6Ub6w>
    <xmx:c8RqYmoSPx7zvaMluLCiczkCkI4HBO3WNLjcsuIdGyJtHve6EC7e0w>
    <xmx:c8RqYsa_z3VaR6wEZUSleRqptHv2SjBotfd49vi-jY0c9lZk73ff5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 25/28] clk: Introduce the clk_hw_get_rate_range function
Date:   Thu, 28 Apr 2022 18:43:35 +0200
Message-Id: <20220428164338.717443-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index de2674e350b2..1773e715c4f1 100644
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
index 7f4f34ff2b83..c0bcf72d5ecd 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1235,6 +1235,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 
-- 
2.35.1

