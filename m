Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291E6C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235159AbiHPLw1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbiHPLwD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:03 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2EFD83F1
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:56 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 7E1A33200914;
        Tue, 16 Aug 2022 07:26:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 16 Aug 2022 07:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649214; x=1660735614; bh=gH
        zHwznvJCZ02aHcmIsCEIV9Rv9AgCMJHY1E0fh5+zs=; b=hUuFxiFghobUPTSAgc
        hwNjlZ82l9+rrCq2YyWm4ho9kBLBW8fgjn7UZhigY6CEgPLQ0OH9tFTpjAV2xHEB
        1vXDTixUt/VdzVMFtOzK7gQWIjQ+VBI0BtYveOcsxLZwJ89ZUpBdCnf/LiDgvrO/
        NBlYpsddmFPStBSoXNRwRmwnF6fhZB15TRpVAePPuELn6lyZi/GiCimpM+tdnjdl
        HXJk8Q075DwBI+veITxklojawASQMGPVLwzIrXVoOmTI9Mpb0o/hRwLT8hD6+ik6
        AlYOi9VjicAveruiUzUiRtGqKTd+DIEsCVf8rKDD6qXInvSV6t0DRj3YvgDWVMjX
        HHyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649214; x=1660735614; bh=gHzHwznvJCZ02
        aHcmIsCEIV9Rv9AgCMJHY1E0fh5+zs=; b=Lo4SGS8kXmlTd/qHnyFj4PYL6HhKk
        75XWqTr4EsmpqH/YFEWZf7Xk+5bxPXKYrBzZp8OZScBLsfBtdhSsRJvbMYuhkGjJ
        Gc1mFsuak/KypQ+UN39h7haQDF2HmjIXd4NaejqGW40t4ZUk1gHN/0fhD4SveWQy
        iNxjWYVF2VO8WjUPpuNyOSnUX7XbrRO35Xm4O8iDcJfU+xsbIwLFq5hgg3v49kS9
        n9i0PGZ9z2+vExv+aoQADm1Aoq2HuphAoONVyGOfika+Y0n05jUWu7y7H1hrQEJ1
        kAsLZiQGJvtKpdsgwohNqyiHQbk5PKb3U/ivwpzQSzpPs0LhTKsDCTe5Q==
X-ME-Sender: <xms:_X77YgIAUj4Zo_R9SNB50gKFLzSsmXgvWbPN_i5wIBtcZENyAjEtnA>
    <xme:_X77YgLpuTpwPjacqU6vxPLAwBjf8EcNYilF7rLftror8wwqMKXOsriTHuygwHlbp
    Ip6amTj6Ln7XeNXcuU>
X-ME-Received: <xmr:_X77YgtauIkL_xHMBkg4naFtYV0vLxNvcGPj_AguFrQ6tbCUDYoHSzbvRsU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_X77YtakaxU4s827Iadv91LPdbmuV1xSthdmGAYdvId0xle8ufWDFg>
    <xmx:_X77YnY3eZqJzUvy5TF80oGpntUJOJHvsZyy9qqgED6SAbOGqXlWEw>
    <xmx:_X77YpA9H6N3tr3tf-3SaY_-IoK7OCxexcXjaSI99WuUlzQ3WBczDg>
    <xmx:_n77YkSTFB0R-410vSWTuOzKuSSBV3Gyft9bK8QZ5tW_spoirs1ZCg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:53 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 17/25] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Tue, 16 Aug 2022 13:25:22 +0200
Message-Id: <20220816112530.1837489-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
index 96b372ff23c2..2794bd3bef4b 100644
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
 
@@ -2025,9 +2024,6 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	if (clk_core_can_round(core)) {
 		struct clk_rate_request req;
 
-		req.min_rate = min_rate;
-		req.max_rate = max_rate;
-
 		clk_core_init_rate_req(core, &req, rate);
 
 		ret = clk_core_determine_round_nolock(core, &req);
@@ -2228,7 +2224,6 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 		return cnt;
 
 	clk_core_init_rate_req(core, &req, req_rate);
-	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
 
 	ret = clk_core_round_rate_nolock(core, &req);
 
-- 
2.37.1

