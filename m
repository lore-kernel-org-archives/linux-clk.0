Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BCEC282E7
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiHOPnq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbiHOPng (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:36 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0869A6563
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:36 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 815193200933;
        Mon, 15 Aug 2022 11:43:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578214; x=1660664614; bh=xt
        A5xvWWbokDzhmHVntZmWyiCLWl5HUS0/6FxjMgbkg=; b=phHG8ivrOzU+QJr1Xh
        8I36UagX9jGwdHkFbplTtftK1y+MP23h85xh5jA4j6ucq9LAOJrwzApw3CSp3oYM
        gF4u0f+34FOPkrUcnvsczG821S035rOLuiejamSrzb73G8NHs/xWRLeYNeMor39B
        zTgXjMYtvKP6oR5mLjLqVRfrcnRXermC7zwtAw1Uf7NooEO7nqFl6PcQzKlVr1EM
        uywgT1Di6IpiNxIpxuQfW/3tci1QooBqrIYZvgS6PeVFg3GOiPJGTPjFmYKn9b9F
        qre2Vw+EvzsWeEwX0p1wSlMXZoX1b2QBLzdrgeuRwbSI2ReY7L/Bo2P0u9gVqmG4
        slSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578214; x=1660664614; bh=xtA5xvWWbokDz
        hmHVntZmWyiCLWl5HUS0/6FxjMgbkg=; b=k2539mwvDxRQBZaGxLfNHKP+4/vih
        37oSgMRs5C6rzP36/1NYNHPE2WYMS28pqxyZImB/Ofx1MDZ1wdWTQvkZej0yy8Bm
        7u+o3O25/SOXfrvtN46SRFXDY2+JVMIhwLSsYU70NbuWYFViTFATI+H5b8LDgC0R
        FziuW7hskuGitXXxa5TYTkNAvTSceliOQGaW1pWlrfFhbo/0i5lqkvbclzcFx/C2
        YzPQ+4GWfBFhkqDR4FUJWeh4DV7+X7S8zJil52Q7Rh7NqjZB3uP7qUt9dpaVl3h+
        3qlGlvRpZN1kPQ5Rn81DPKkvX4W0bTKYRHAEPxDO8qyw6ZSvl9Fkhnksw==
X-ME-Sender: <xms:pWn6YnUB-GUu7LnJrUMyqBeWC8GzSq99kMEcmImSTLZz1Orcjg9O7Q>
    <xme:pWn6YvnYuVG7WGtjrYrtTo28xnbKfCpKJ0pX0QSqKBw1q5GRoKhn35k6fqiYq4rCY
    VJ30F7uNNG6KINvNA4>
X-ME-Received: <xmr:pWn6YjZw_a_E7EOlYWSEtyPW5EI1pKjpJp8nNqlEuLTVE8TE0eb0lsmJuXPR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pWn6YiW3ZCxCj9GFF47CGTpE4SjSsxpXBweRpfXt_FZ4UCTy1vRQ3g>
    <xmx:pWn6Yhn9zIs1Q6hG1phb2CozH8sYAijhFy7Sn1zhepF5z_UIv6yMxQ>
    <xmx:pWn6YvfVnjN0QPv-hTyTZoBp4obKBIiBbjRZXP8KRRxpLShdeeAm6w>
    <xmx:pmn6YqcHwbje8c1xHCoMDxScvMkFdolPAsr5C7nS2bLxUkSbI8YG_w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:33 -0400 (EDT)
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
Subject: [PATCH v8 23/25] clk: Introduce the clk_hw_get_rate_range function
Date:   Mon, 15 Aug 2022 17:41:45 +0200
Message-Id: <20220815154147.1631441-24-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
index 8bce6c524f29..8724a3547a79 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1267,6 +1267,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 
-- 
2.37.1

