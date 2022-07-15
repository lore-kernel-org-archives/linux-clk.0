Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F2EC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbiGOQCY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbiGOQBy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:54 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB6272EE8
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:53 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id E7C1532009CD;
        Fri, 15 Jul 2022 12:01:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900911; x=1657987311; bh=zi
        xae9qZE0POMYPh5ZFz2mxVF6Ie2sWSV7M/KuXxUCk=; b=X6NDmfgVXnAXoCdSlS
        YhA0/5zxN71d6nhAiq8Yh8mFPbmCEoo0740gT7GWP6gHnVTEfzDcrSiU0j696Uzy
        QjbRqlxxF74UD3e3QmOCJJRuR7NDbmtCRuhyEgWFob2LjrxHrdJhALdfptMEkl3S
        gbZH/SYBHcsnFO77YjKGgOVfdDdnYCkaOlW1XlcizBFLo17aeCGXQ1w/2KV4KE5r
        bZah+SsCgpicZyAFRwfnqav8psY2wxW/DoMaY+AqfNAaoudD52TXv8mJrX9iIE2Y
        PgrTc0n7PuSWGjfQxwKsfJp5g1hfvvVH8N4MIc+xs6qyRO+hVQ+IAgAh0CPFbNOw
        LDCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900911; x=1657987311; bh=zixae9qZE0POM
        YPh5ZFz2mxVF6Ie2sWSV7M/KuXxUCk=; b=EgYNnhhWWmHyS5oj7Xoc0x2+FwNg2
        tc4Z8tVpCER78miRMgC6YTDODBYNON2JtaAcAMc/IqlcMI+jKNdqNuWocGA4lVXe
        VLI4Pm8WHrpjVlVZz29e//6KWqYgqAL3irEGlb++cLtP2ISGvYHIaKP0L5omw5l9
        ag3cxca3rQx8QKgPvvsSxKB8owy1W2lEdofKwAd3/tFr4ZBCpR/BpvoedpAMAPzE
        a5b8pakFF1vnrueYLNoZIu8HCU0DoqOyuk49u5id85ZaPVuSlQs4HBGGJXwzzVHG
        bHXDgAkf0Iz0SVb4e8Zo2FaAW/f0/OsFMIjVPCGmD0LdfP8Xq1xYuNIug==
X-ME-Sender: <xms:aY_RYjetm65YtO-3hQAEFFZOMETbKnA0f6WZHUwZTgx2iATuia3ymg>
    <xme:aY_RYpNGkt79kmrREB3GTybAY5Fyfl4A7GsydVR_coRPihwOWK-7ILYBmW8yvrzSZ
    vjdXxAmO9Q9xJjKvJY>
X-ME-Received: <xmr:aY_RYsh2lLATYR1md1PWlVq79-0T6cOQBM0ifedlV8tw8gYtVmNqylA5xjPPoA_zA51EUrSeSQiQfivY5J2ik0gHyEqVli7YdpCchKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aY_RYk-vMccO0fHpj1-2VyLOqrvlgr1mLVhUC_LZhGtl9qz5oa2aFQ>
    <xmx:aY_RYvtiwM7Xkvd3vBX4qmDwNrGNf4EXaIBStUpjh2MDNXVwlvHZug>
    <xmx:aY_RYjFDIkvhfPKoPG60brYHviL6CoNs1wo-YAoP_muNgL4yNkKXZw>
    <xmx:b4_RYgmqwYnZT8T0AXEl8VpK5K5pTg5AJVgAf5Z5LA2xakn87JFqww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:44 -0400 (EDT)
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
Subject: [PATCH v7 20/28] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Fri, 15 Jul 2022 18:00:06 +0200
Message-Id: <20220715160014.2623107-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The expectation is that a new clk_rate_request is initialized through a
call to clk_core_init_rate_req().

However, at the moment it only fills the parent rate and clk_hw pointer,
but omits the other fields such as the clock rate boundaries.

Some users of that function will update them after calling it, but most
don't.

As we are passed the clk_core pointer, we have access to those
boundaries in clk_core_init_rate_req() however, so let's just fill it
there and remove it from the few callers that do it right.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 195f051ee536..cd5b298f445e 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1389,6 +1389,7 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 		return;
 
 	req->rate = rate;
+	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
 
 	parent = core->parent;
 	if (parent) {
@@ -1483,7 +1484,6 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	struct clk_rate_request req;
 
 	clk_core_init_rate_req(hw->core, &req, rate);
-	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
 
 	ret = clk_core_round_rate_nolock(hw->core, &req);
 	if (ret)
@@ -1516,7 +1516,6 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 		clk_core_rate_unprotect(clk->core);
 
 	clk_core_init_rate_req(clk->core, &req, rate);
-	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
 
@@ -2022,9 +2021,6 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	if (clk_core_can_round(core)) {
 		struct clk_rate_request req;
 
-		req.min_rate = min_rate;
-		req.max_rate = max_rate;
-
 		clk_core_init_rate_req(core, &req, rate);
 
 		ret = clk_core_determine_round_nolock(core, &req);
@@ -2225,7 +2221,6 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 		return cnt;
 
 	clk_core_init_rate_req(core, &req, req_rate);
-	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
 
 	ret = clk_core_round_rate_nolock(core, &req);
 
-- 
2.36.1

