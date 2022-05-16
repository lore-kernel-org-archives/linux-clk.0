Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCE3C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238419AbiEPN1B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243999AbiEPN0g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:36 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A330026CB
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:34 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id CF7F632009A1;
        Mon, 16 May 2022 09:26:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 16 May 2022 09:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707592; x=1652793992; bh=sQ
        DdDbefm8Z8IazO8z/76rjWi8XqJqf+XMA4a0w0yyU=; b=yfNi0R4aNAvqaJ2h9j
        ExM+Z+hmQvg1/Qve/Fy3A5bYxLpH97k6mKRoAfWVeNMlGMCDRX3s2OWRmmjRvkmw
        XALmAH/5ESIGuaK1EACqdH7j3+X84w7fmdNqv0mz353g+xjKea5CtMg/JnWUnX/x
        trXUjWlWDbMMgNn2tl66LnlS9YoQod7eMpnjTwLHklgFSlqMXuwIMS+DqB6J/uoj
        MWEUKzUvL46/APjdbLqzWkwTiRD5h/Y9LbWDSdZSw785MA+ucw/7cJsVDOCE8Cn1
        1nOiTuKWAjwIBkMEfC9aJz7vCC6DNhqt8dQ3/CG5WgZ2eTPuaP7fC5cVOFrcV1T7
        yT1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707592; x=1652793992; bh=sQDdDbefm8Z8IazO8z/76rjWi8XqJqf+XMA
        4a0w0yyU=; b=hbijITd2NICyMlXqPLw98Sas6v8i3UyGH/f25hkEwUu0nZ4Ewec
        NghtlAJrO2V1j0uRxIatu36I/JmhF02+3oGOxXzpyJmARQeh1sCgd1dwOtzCyuG2
        BjKoEIBzr/hwBzdCYOFegMQeCyFoH3xAd3SFHd23qu0JKOiIkTyPXKqhbV+DkGBi
        4nd2c4BDOMQ3Ez3YKmiR8u2LLUCGGIRHjYmDjmbO+tad4Xn5RRKedhXRQ0Muwyaz
        V+YTJjh2xtA2b2u2FS8Jd/lqvwePsmoGHLZVMR1avGlh3PxPuI4aLLkzEzmcdvnH
        n5lh8VZ8kBzDUaQbgnayrVCuooxdx0WUZ0g==
X-ME-Sender: <xms:CFGCYvzyp6iO5BGNX1PzClVhhXY9RQhCB725LyRfD_Uj2ZBRuYfj7A>
    <xme:CFGCYnT5FoTqC4ynDhzrMyxw7KwyewesZhZBdspwEQv3ksN_fhJ9-hCW_7WeXVpnk
    ZOObdmSpfqfnmxDEm0>
X-ME-Received: <xmr:CFGCYpXGNmh4itIM7g_i6eclP25E-RuqHoSB0TbTDWDtYgGlJL9bYQbWjzr-6YWGRcVcu_E5zr7mRdviWiPyRxJ2oCWqk6_hrcKIws4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CFGCYpjX-yHrgPhDoVR8ztb_8cza__bEzS1NlLWMt7cvzYVOtp1kXw>
    <xmx:CFGCYhAgUYiCpBSyTmgfSmQcrXg2GKDxidXAJplb8u0WO_LTh8vGTg>
    <xmx:CFGCYiKj_9yXRRhfT_DZlOUvApv_YAsD_c-Wovh1WEhFLwTwgPSZTQ>
    <xmx:CFGCYl7Wf1YMd2fxHhym7VdYB3z04ZMN7uEEjO84O87ZD_D2BDsivw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 17/28] clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock() to its caller
Date:   Mon, 16 May 2022 15:25:16 +0200
Message-Id: <20220516132527.328190-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
index ad8fca2bdf27..e5ebcfcfe4eb 100644
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

