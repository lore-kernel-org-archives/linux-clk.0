Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8FAC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbiGKPZH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiGKPZG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:06 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714FD252A3
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:05 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D4DB85C01AC;
        Mon, 11 Jul 2022 11:25:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 11:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553104; x=1657639504; bh=zi
        xae9qZE0POMYPh5ZFz2mxVF6Ie2sWSV7M/KuXxUCk=; b=gM6WdiCeM99vdmXqlQ
        guncgLoSUymxlgClMZ9NztHvElxAO6sh9bS57xP9SDGoSoHNsKA4KOHxfrAouvke
        86PMke9todgrXtlcF2hs8q9/z9Vib/mxoxTLIbsT2OdXdUO8Oov0JdfROtjWmjnH
        gpnusSTQzUum/5coq0w0TVPupaE466kfO1zl1fWCWMsE7tPOAaEiByIkv6mX9E1W
        fqrVSTviBmaXASCEdSnEoazIyTl55bnjs/1JjeYjJz0XH4C5jeceayEBnLohQ4Qa
        VpKc+TmQALyPnG4CGFrbUsGvY3oWXx/nDCtIw0JDJ+YG1nnwhSzNUOnxH7od3+0u
        D40A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553104; x=1657639504; bh=zixae9qZE0POM
        YPh5ZFz2mxVF6Ie2sWSV7M/KuXxUCk=; b=G6rxy4wL8vQqdDHT3VkmyvS/ibyuQ
        KbVGuyHlxf6ku9nSkcfTHICPoYURe+E8spEcUfv5/THfxUvRNlEquK30MEAsPoGY
        fMoVoOYMbR3WwDLc96TiIDOsOX0nKBAGjr3cxs4lw4JjI1hl9IvwSqDTmgXonUEb
        vls7ozAIlj5v8jwS39mOzXqA3vPT4DCHamklSvRWDzJfwAVG05nNqX9usAI9cAjK
        UKy11S+nwhaAX2t589/lOtzJdSyXw5oU+gCPuNXDtZwjwo4Vc3GzXV65qeGfwyAt
        fwJiXmKu9QZfGT63FuW/+RNj08co94LWMbXA9Ys2f24axNnNsqDnSCtmQ==
X-ME-Sender: <xms:0EDMYtsoE4cXVXMJtPWacoOTVjKQ_h4MN2Jx-jgsGGrTZxypPtTnzQ>
    <xme:0EDMYmdDt5WeIEj3_cJWjW3r5RQ4r7jVprfGjH6QudcmQjADNO9B8M8pGYUrqelno
    YX-SsE1YlqnBYeXHVk>
X-ME-Received: <xmr:0EDMYgyV6tFZwQzo-Zp9qt2v5Wun9oX0guA5veN6RKwRi3m8DDGJ2XuzNe0HzNCsG45ku4jX1oZ4iO7la8KG28SarcK4Szb_vfv_Eyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0EDMYkOqvTbJSAm-QxewBNwx2bdyRh7nhBemuLop726yCIsAmFKZQg>
    <xmx:0EDMYt90wQHCX8XjtnIZHfZaAwRJ9UUKqvCbqVBmb5WU4BHZu2vxRQ>
    <xmx:0EDMYkW52S71uu-SO8iExNmhiO8asGSAj9SrW6e5LKPdnGplEeTxYw>
    <xmx:0EDMYu38ehq4SLOsDXpP6Tcdm7pfV9Gk45qjfsAxRGOcAgKxLMfpjw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:04 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 20/28] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Mon, 11 Jul 2022 17:24:16 +0200
Message-Id: <20220711152424.701311-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

