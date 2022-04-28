Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C671C4321E
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350289AbiD1Qrj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350282AbiD1Qri (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:38 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8087B2467
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:23 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2862F5C015C;
        Thu, 28 Apr 2022 12:44:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 28 Apr 2022 12:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164263; x=1651250663; bh=qW
        gkKmeoIkggLD0hoIq8tWZoAIVy2uBGymihrMrbkic=; b=Iy5JED8oo4TYdgM40y
        9wqhNQB+oA3+dhitPW8LMkCsD37hCQrEPuD+vIxghnYZzkmWE4/DNLRWXoTucRYE
        Hn8NHaF8izIEQ0W+EIekCpsraP+cgRiq79LON8OCYwrTTYS7uRudhRmGQx3Qji5a
        7DDWKrGc00GKJn4ukM0+daofrkSm4av7Q5gYrgon07YlngtD5dSG2BpK+WbLvxAq
        919r+/I9GHrsBJB5BlL88yveVKu8dr5nq3Sl77573ha0rxRfCcbrSXQpwHKzvZ2w
        a/us0JYs6LZx+RaSr4B/WKuRxgcMJx7yNNNYE/oFxuZZd1r8P58MKOmTxNfRXvX6
        P3sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164263; x=1651250663; bh=qWgkKmeoIkggLD0hoIq8tWZoAIVy2uBGymi
        hrMrbkic=; b=ftNFq/i59BnpfOcRXAcDD2/9f+vsmSCqPt1PFvXXV/Yy9qJAjgv
        EWA+XerofdhQweKDIM4ZrzNpLl9qMlAPRG3/6ARXYwrNvwYC5LB4CERxr2U7GF3x
        64qD97HsKG1lf4uZ15z46CqiHARVPmHbBXlQgjxFS/PeYZrI1o3aStx+OCc03UjT
        cGplzc9aGF7xvRu0mYerqamLdHPGrBl8nLgZmX3a8MGRiyyE1zeXlGcGIwuo5UxJ
        q08xObaFNKP3fypvdt/R2BGwLTElkvu/MyWYBOdLlKTJ18DP4Rfb8IQWx0g477oc
        bTftSxL77GZnXoRJhSPlE6ohtOVXBNt7fRA==
X-ME-Sender: <xms:ZsRqYjH8cIBdSGICzuC3-WXGRmSd5aYfXat7jpy7GBjc22T7jAbt0A>
    <xme:ZsRqYgWD0XWh_B05QCggbJ4MMwwlrSvjmGaAUYqLryYiZHAsF0JeR4dL8J5EvvZUa
    LmEFyyLPc3PBGNVBPk>
X-ME-Received: <xmr:ZsRqYlKf53sR7jU3QJHMovF3Ny2SvU10pQuGfqvNPgLJWQT4USw88-N1tYHZxqNu_uuH8--z7vpPjqMWz4aOzSDYkn5iS42S9sGQNWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Z8RqYhHuPRud0dlWgUSalxvvdYf9yDzR-aQCpDp3jdEnAjusJoWmJQ>
    <xmx:Z8RqYpVnMa8Eq0ApqUP9YLCzbwgN6ffAcap8tShlK9nydYeAvu1bQA>
    <xmx:Z8RqYsOUWy8_qSV8gZts6g7cPMtip5QNp1S1R93jqdwzu08-kblX0A>
    <xmx:Z8RqYiMJRT7CTvLWueD4tRxEyjgNNAkLSoah-ARZEZhz3GZ8RSa60A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:22 -0400 (EDT)
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
Subject: [PATCH v2 19/28] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Thu, 28 Apr 2022 18:43:29 +0200
Message-Id: <20220428164338.717443-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index 39fd0a349003..e079f8b263d0 100644
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
2.35.1

