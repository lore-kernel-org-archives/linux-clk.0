Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FFCC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiGOQCB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbiGOQBl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:41 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146BF72EEF
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:40 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 893E5320097F;
        Fri, 15 Jul 2022 12:01:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:01:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900898; x=1657987298; bh=hO
        Vq8WFPjU53wbPtOEpsE7/EC+nRK4lk6f54OaoTrIs=; b=JgA6MHtduANVu6BMzr
        rH6m3UhnlN6BGzKROMlNChagv260mU8chznpuBtSEIN4DDAWLURIuGnV6Erf5bdo
        Qk3j/X9+RUrvOv+NiN51JSmIqcnMzxYGo01pCX+meSIbLtWyK3Cl2V1h1CiGtodW
        fZ0qqj3fTI4sZgQiwqYI/ZCWISuFqQOzm1sf/HeoQR2pk5U+MrhE3Spf14Fn7aUa
        C9FJzaXrHd8kvEQwXBEIPhVK8FD7qvS8PDsydP+hgo+yTaLD0X2VU1PUNiRPWZzM
        kRWzW6/4BSu+NMNSO21mkYklcysAGsdc9ELz9R9i43HqjZs5t/4I7GG3NU5vXqHd
        QETw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900898; x=1657987298; bh=hOVq8WFPjU53w
        bPtOEpsE7/EC+nRK4lk6f54OaoTrIs=; b=u1oa1TJHYal8nfyXI/PTepxPqeym0
        VY0utRn0udW2bDjJRfVPGYxl9J8skmz0sphLS9gNVhrdAL0a7M3yk4g8o/O8jAmK
        SNuLMulOgz3UN8sCTxtBAem2Ldb7DEEl3/mKlLrT647iP0aVUxgZY8zEDCSwiVOT
        mdnE/BkU4zkshCU9CZvVJsDkgzpBZgFTrHU/Hk+/YZUGJsX8iliOu7Fas73OAkXl
        KKGehZBvSlqh5rfdP4W3IzXMJjoJ0jF8GbA8sMelupeBFsUMAwZ2VTgc/kN22xEk
        wZ5EnYRUabjwLRkQdQTNmseGzVd0oDWH18STVQgayhMGMqSavK/vNL+wA==
X-ME-Sender: <xms:W4_RYi3AcreEApr3HzEnYWFgEc8k3as2ooEfRsB_n2OTXsl0_DDMOA>
    <xme:W4_RYlFd9queWoTRfoqRKdYwxe7uoe4h2JaC3wfbOz-Rxu2EHgV8MtgXa3mS74D3q
    YsLArFyYltPewa2fBg>
X-ME-Received: <xmr:W4_RYq7ZyMtJti0WA3z8TTApYma3im9OlEf8I5WAYEhZhzllXQKVbd-YEI1dDkC6Q3LJzkg7t2DRlKjiLWKZkjNk2SPDKZzngcjiwZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XI_RYj1vYg1l6Hn0O-1-BWKu6frO7dpr-SkqYrNv6hF0Lke3QsLirw>
    <xmx:XI_RYlHvWdFEWOiVKvK4sjvmRFRlIrjM04kxmF5NnnnwO9KOwRzShQ>
    <xmx:XI_RYs9H4E1u-uJFSfyu_2cVS-2rzW9CSBMFTSZQkjPkbpkKVm5ojg>
    <xmx:Yo_RYt_3zjzNxZEPR6pUc3vQahHWDfzs_8RW1zE9cAHImtcoCfIZ0A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:31 -0400 (EDT)
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
Subject: [PATCH v7 18/28] clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock() to its caller
Date:   Fri, 15 Jul 2022 18:00:04 +0200
Message-Id: <20220715160014.2623107-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_rate_request structure is used internally as an argument for
the clk_core_determine_round_nolock() and clk_core_round_rate_nolock().

In both cases, the clk_core_init_rate_req() function is used to
initialize the clk_rate_request structure.

However, the expectation on who gets to call that function is
inconsistent between those two functions. Indeed,
clk_core_determine_round_nolock() will assume the structure is properly
initialized and will just use it.

On the other hand, clk_core_round_rate_nolock() will call
clk_core_init_rate_req() itself, expecting the caller to have filled
only a minimal set of parameters (rate, min_rate and max_rate).

If we ignore the calling convention inconsistency, this leads to a
second inconsistency for drivers:

   * If they get called by the framework through
     clk_core_round_rate_nolock(), the rate, min_rate and max_rate
     fields will be filled by the caller, and the best_parent_rate and
     best_parent_hw fields will get filled by clk_core_init_rate_req().

   * If they get called by a driver through __clk_determine_rate (and
     thus clk_core_round_rate_nolock), only best_parent_rate and
     best_parent_hw are being explicitly set by the framework. Even
     though we can reasonably expect rate to be set, only one of the 6
     in-tree users explicitly set min_rate and max_rate.

   * If they get called by the framework through
     clk_core_determine_round_nolock(), then we have two callpaths.
     Either it will be called by clk_core_round_rate_nolock() itself, or
     it will be called by clk_calc_new_rates(), which will properly
     initialize rate, min_rate, max_rate itself, and best_parent_rate
     and best_parent_hw through clk_core_init_rate_req().

Even though the first and third case seems equivalent, they aren't when
the clock has CLK_SET_RATE_PARENT. Indeed, in such a case
clk_core_round_rate_nolock() will call itself on the current parent
clock with the same clk_rate_request structure.

The clk_core_init_rate_req() function will then be called on the parent
clock, with the child clk_rate_request pointer and will fill the
best_parent_rate and best_parent_hw fields with the parent context.

When the whole recursion stops and the call returns, the initial caller
will end up with a clk_rate_request structure with some informations of
the child clock (rate, min_rate, max_rate) and some others of the last
clock up the tree whose child had CLK_SET_RATE_PARENT (best_parent_hw,
best_parent_rate).

In the most common case, best_parent_rate is going to be equal on all
the parent clocks so it's not a big deal. However, best_parent_hw is
going to point to a clock that never has been a valid parent for that
clock which is definitely confusing.

In order to fix the calling inconsistency, let's move the
clk_core_init_rate_req() calls to the callers, which will also help a
bit with the clk_core_round_rate_nolock() recursion.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 6670e61edb31..7a071c567800 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1415,8 +1415,6 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		return 0;
 	}
 
-	clk_core_init_rate_req(core, req, req->rate);
-
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
 	else if (core->flags & CLK_SET_RATE_PARENT)
@@ -1464,8 +1462,8 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	int ret;
 	struct clk_rate_request req;
 
+	clk_core_init_rate_req(hw->core, &req, rate);
 	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
-	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(hw->core, &req);
 	if (ret)
@@ -1497,8 +1495,8 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
+	clk_core_init_rate_req(clk->core, &req, rate);
 	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
-	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
 
@@ -2206,8 +2204,8 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 	if (cnt < 0)
 		return cnt;
 
+	clk_core_init_rate_req(core, &req, req_rate);
 	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
-	req.rate = req_rate;
 
 	ret = clk_core_round_rate_nolock(core, &req);
 
-- 
2.36.1

