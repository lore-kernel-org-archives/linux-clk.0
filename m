Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71060C28B2B
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiHOPni (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbiHOPnJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:09 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5EFB1DC
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:08 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 3F0DA3200901;
        Mon, 15 Aug 2022 11:43:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578186; x=1660664586; bh=B2
        xqipNE4Rovy0U5GoCUKv49iwyeBkxAZ+3rq+eZwOw=; b=FW7bSoYOmAJE1DU3cb
        yiMIpAMC29ef8/1SNdACUzMDnSgL88pWowjtwYhhdXNFrITXlAaDT3SwNw4m50Dr
        6kO2wPj23wiUJHe+zi/jgGIDHg4rWMos2f54RTSbYTEBaCUh8TEl+AROhJ0HQaiX
        JkRtXyLASEKTd6xIHJpUh5iZ0XwKr4fD1yrJzc1IZMC/cgcaaQJOe/9MBLrEA/Ne
        VhYQadXyFb6V81k576pivuHZwn0b3W5+lbERF56E+6P1WBCQ/GIEzXmU/htn3ysu
        yhqpAsSQbPbF1cdSLHfBTr9UzLVm3HkjjvTZcT9tSQFnsTXEci/KzUXtBCFln3nV
        5fuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578186; x=1660664586; bh=B2xqipNE4Rovy
        0U5GoCUKv49iwyeBkxAZ+3rq+eZwOw=; b=hY3irsaw4S7dqwII9MQJLicBB9chS
        ZDs7y3MvYV9KP9dyIu3JoXMhW7zhVwtx+dKnRYJFykD/61lKAEpFb/bGMfk55I2p
        nqDTwVI+8Vx6Gj+fM2mnMvf1v15smcnPvb1w8kWzHzn+EJGPgqoKbXVuJFf2Kjrb
        GV7ofQR7artJFV15fjBibpLAoBmDGbl3eX35w/Vsxz5ahh1s7ThJpTVb8luqBl8B
        6oS+MXluIvJCo1VteQvpCFI9MmXa0gPjH+iHWYltxzPVE6vbXwlcsFE1REeKAh06
        iAF90YoPt105kP+qjovOIcaRFIBGXGx6wAxPfAr+x4IzTKB8GDUT28zoQ==
X-ME-Sender: <xms:imn6Yr1YI_V2-8gYwPyLdXdcj7ijHNM0Tsm7NRkcUDQZWKBXw41-qg>
    <xme:imn6YqGy-B2rlmwH0uPT4gSM9B3eMJztEU_AdS2XfFBJVNSpiWS-TVrmEfGQekgny
    ctYfDSCBaw9DXc2VUs>
X-ME-Received: <xmr:imn6Yr4MLXXtPCAKZbQDCmk4dhiCXx4_2NJLttV0PtD-mGRIJ8WSLN7ACTT->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:imn6Yg2NrCVh4XwTPD7EfeAQiNjxb_DwB8Rzujo5H5gJ485a-cg1bw>
    <xmx:imn6YuGAcZsPeTKYjW4w5D3L1KyLpqiob6FksBo8YxuBxm8cElaqFA>
    <xmx:imn6Yh-icJfICXZyn7dPQ8h6GQjq6NMqCD4UvV8rw1xNoGWrqc4cWA>
    <xmx:imn6Ym8NLrFjdY1wPcWZqFrSbT5r6u9nGU4ucefS6G_R3D0-nyUa9Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:06 -0400 (EDT)
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
Subject: [PATCH v8 17/25] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Mon, 15 Aug 2022 17:41:39 +0200
Message-Id: <20220815154147.1631441-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
2.37.1

