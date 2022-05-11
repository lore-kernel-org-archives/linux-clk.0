Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A491C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244958AbiEKOoh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243335AbiEKOoe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:34 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A52C9EED
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:33 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 8FA6332009BE;
        Wed, 11 May 2022 10:44:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280271; x=1652366671; bh=q0
        D9Wsi4pdUMw+NcbErEB00cueCJ4ezwWL1loLnAU1k=; b=gSeYtX7x1jQ9iyTTtq
        muZI8PcjuKWJxk8lIV4tCuOT3SpeD6NeepBCqdlz46U0H19NfqcNQG5ZVkdkyvPP
        I64ERnvxOusE7GTS5TJNfMsrK2jbdMRWgcAQ9xJPqthfKuG6MEyduxDBi3oJajDl
        CXo/WSxQe2mMhEOooq+8w870gkPlQL7il2Ktn+RcvLMFI8v1PwuBetonzsAsD3UL
        J4N0iLmMO9+p5Ypovt6PEbVGP7igcyUP5KIMw8iKghhwORGs/W5dvvDF2wblAbjs
        hUy6LSVQAhM6eAUQQm/PsM6q69Uqwn0liFuKW2K/K26n7UFhvxPZdGFBntcWI/an
        oqmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280271; x=1652366671; bh=q0D9Wsi4pdUMw+NcbErEB00cueCJ4ezwWL1
        loLnAU1k=; b=lZBmVBEi/n0J+YiXVYVyOuCgwCeJIv0nsUyB1WK+ai6pdf51x4n
        4PUh9hVz0NyD43ulT9O8D6iGP6VkYhi1Qmm6SomJmxg6733zvr3f8LbNq5Htc5Pr
        50sHKRmVkLkzSSSb3CUKiyev9DZaxZvzk3jl117iQSb4XYP40ukRsTD+71HPg/f6
        RCInJM3yTp96vnEsoDZz+4x966EVhPS/vPs1sssEKSvDOGJzBE0H55pBlNNXDU83
        Lu3ebDoc692nbZbEFrScX5oGyOCr1ty7KFKCNOaK+RL0rcaABsmpd8ivgW++MTMG
        RkPItIrVeXeIn0Ut4Iij4YMVPknYdF6iqyA==
X-ME-Sender: <xms:zst7YmLK4Lf9c-gEd6V5CXPuHJS3SQModw_Rdf-Tg2fAV5RW8PTKbA>
    <xme:zst7YuJT2BaZllkwb5rWm6xN__Zf4WGBfMeptBYHknLeCIn9VX3fJQwssaz7X8ggo
    6qOu-NC8QmMTx_ql5U>
X-ME-Received: <xmr:zst7YmsbMV0mJOaYW3dTG30Jv4cNAvHBkk5vrtwygNpoMltSzkZyA-o0EfM6BjWJ16nfUw8MC5O53NgpgID3TW8w0t5PtgGHAIvebqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:zst7YrY6EiJc5Yx2VHGDEgxTIcG_bByhEG7AkNmBWTpbk1O_HpG5Lg>
    <xmx:zst7YtZHjhLctNo86KcG_tovYzWKbLpC7i7xX04DTCL9CxLV-pEP6g>
    <xmx:zst7YnB2TQnXJIQIlSRHmPvW7wEwuLC9KwGv-FWAGWi2QHkDZphzCA>
    <xmx:z8t7YqR7DjB8pIdx66BcnrjrmU3_UEddpUSXMFQWEqjKDsZ2EkhKwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:30 -0400 (EDT)
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
Subject: [PATCH v3 25/28] clk: Introduce the clk_hw_get_rate_range function
Date:   Wed, 11 May 2022 16:42:46 +0200
Message-Id: <20220511144249.354775-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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
index 597977c883ef..312ee08b00ca 100644
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
2.36.1

