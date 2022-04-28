Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A6DC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350261AbiD1Qrg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350251AbiD1Qrf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:35 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD50B1AB0
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:19 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id F08145C0064;
        Thu, 28 Apr 2022 12:44:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 28 Apr 2022 12:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164258; x=1651250658; bh=y4
        L85Tlko3vStYD/2cTGUHffmAvEtEi0JgJNhHpnl4w=; b=rCIKeaVrzCQiXHBp5d
        RUbu9AzDpv2qlVdqldxOTT9vs5GlRKSXI/jq6QiJPs+nKmtIUadMvqhFOOIYeN1h
        rnW8uECDOPnGNlXJnMr1t3BYai+0/sLJ5/Uts5jH5pj3gaHOznlYShZTHAkvTbiy
        J0Kg1VZAvShsPH0DPFjUWTnM6bbZUc/dxjsBaiWg142hnQWFXg6btAv6dcYJfBGH
        bAUFfjiFW8JJ7k2KhRawew/g6BWuF3EiZmEnoW2AvccD4nFlddRKY2TmKX7Bp2BL
        C5aqRH09aQ+B5bykamsE33Q60nr8gq4SkGNYDNV9d2Sqr/0fERlRYvoB61Mw16eH
        Qz/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164258; x=1651250658; bh=y4L85Tlko3vStYD/2cTGUHffmAvEtEi0JgJ
        NhHpnl4w=; b=ebCWdiiDE7fHhCU+8f9SScIJwe0j/7VHgTvgPC3NlJKzjLGlhyx
        5Rv64xUGlZFEctIWsofN7xq4lVt0oSvk0VCv+Or6PMXmVib+ulj+JnViUNanqXFz
        qJbpK51tgYmkNdU4PwiGCSKwCKGnNBjGddWJ6uYB72UcfuHLtSuYhFYbueu+aIYl
        uq5AJhNu0srmxmDNnBnu+bUg7YD3Nk2mX8FXN4DqPR+9dlBCH64e+F/fYOGx+Ehi
        uJd0XuHz+N9YtzK0pfRCu/z9O4Uxrfk3UkbWRPTBNXSBrC0+JoFUv1h61WZA0ZmV
        3az2Km95L89BZ+r7Ko3yshH3T1m82i+ZNIw==
X-ME-Sender: <xms:YsRqYgLs39z4mVJd1On-7SDHZuJc4YqYpMIkk0Mbd56H7gpcxnnEjg>
    <xme:YsRqYgJlL8-wgbywOEoD4Hc_-aOHmcAEo_0RRNFX5GOs3mYmoOn8fIUtIZwogJB57
    vZGJ-wfnCpQiJmqYgk>
X-ME-Received: <xmr:YsRqYgsmJp2sFFHuAXT3bt156lkv6PTDb_Nt4k-fPmEAOpqUd34haUJITWnWP1CstO0sPx-muI-zMIoqTvPFcfjTN1by-w85LkSJBLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YsRqYtaAcxCPTexcRDZwA_jE3i7oQ6zRXZuGzlwBieBAMCSJOtwgXw>
    <xmx:YsRqYnbjeVx6WY92Y3BKmQLB5JqfUKbyVyG2r0-mSPdJrvSX-vuFmw>
    <xmx:YsRqYpB58GemEMhXCcAfS1-V8r3u-vUB7i8bjC9NSRzhhTK9Lm3KNg>
    <xmx:YsRqYkQ_mFCbnxD8_EIFTgi8E78sAOBae8pJVoPli-rC10PlqbJRMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:17 -0400 (EDT)
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
Subject: [PATCH v2 17/28] clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock() to its caller
Date:   Thu, 28 Apr 2022 18:43:27 +0200
Message-Id: <20220428164338.717443-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index f7c130061b22..9aef87520abf 100644
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
2.35.1

