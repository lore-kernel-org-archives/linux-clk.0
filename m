Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9072C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356201AbiELQE5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348811AbiELQE4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:56 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB6D62205
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:55 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 2C1E85C01D2;
        Thu, 12 May 2022 12:04:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 12 May 2022 12:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371495; x=1652457895; bh=sQ
        DdDbefm8Z8IazO8z/76rjWi8XqJqf+XMA4a0w0yyU=; b=VxWTGmXAeOS6QOKbjY
        2zrCr9NgGVL9TzeJt3t0aKh23G0ILonP0FteTqj/XgVnGV/fmujWtUAqMTmtFeig
        LqeMTx3StjIXq0gAw4l4IhE4iV7w9cIEEpI4HdkVNgvmZGpkRtV2NCf5Evu8xL9m
        QAIQc5JorraQQ+/FFBsX4SiYlBw4UkJXgxMWMwP3IaNnae7YJPxIu47kvDF1mkve
        44qwhS5Cfsto+zdkqAmnIcmYNLE6FaNJeM6ER0il4vyQ5iVp9NAtkLYtGt7qbetQ
        bfD94Iost+QDis3vTVRB8Pw89RVKkENFFghuUaEg/18THstWXb8zDPJgf3VAdNGY
        ujqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371495; x=1652457895; bh=sQDdDbefm8Z8IazO8z/76rjWi8XqJqf+XMA
        4a0w0yyU=; b=YVov8OH79+ik21kmmoDZEbpRH8WyS4mNWcGnYQ2chpPMCTtSXkN
        9KGNeSy424XnXFeB9aBdx1nG8oTU/qA5Y/VXlML/HHbtGfFednUB9HAqDNJE5+by
        SUNy0bMoqw6RjpWej0XFLH1HK5DEtk8K2LIMm+xSmQfNOBWumeKavuTk3KESIrDi
        SdvVhvCFCSHTRq0jJX4zp8bfd/CR23s7ieOL+xf4rHr4tLxSxCtrApV6hqDn8gX3
        Ti3gZrfKU6JxnxgmmczRDkv5ylOSALVoNbwj7qkWRT5dWoZ3O24PuPBTmA2HKgfG
        Bvl19+oxFj6SyPynemWSkyYitdhA3s/HuNw==
X-ME-Sender: <xms:JjB9YmnZldTP62VzNLjAiDzGBBDaYUNznM--mCE1idLKHbc34P43vg>
    <xme:JjB9Yt0D5Oc0kXhQ00rvoBGClUAbNQ9IAQuX4vbSmA6EBc469KqVyRGxEPR9hb0mz
    lNJ25Te3R-ZMU-XeOo>
X-ME-Received: <xmr:JjB9YkqLqsRO6qB9jDRDjKEJ43lZzqprIuQOI336UJ1d2zKDuKPSxbULdgR5WXMjpaxX7LCl46rh_0GYV7uhAcUTuCRqHbZA7NHsaeo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JjB9Yqk23c53BOyVq5fsyn1bdxWzOQ1Fbn478GD08cTXjEMO58-XHw>
    <xmx:JjB9Yk3gWwGCAfoTUFri_kRWTpEKVu-jp33GikyxzEKwu62Pekl5qw>
    <xmx:JjB9YhtLhi0xjpHeszxrCVzg2y0WbGBHJrd4ZT0UlXFLcbsqbQ2NeQ>
    <xmx:JzB9YtsfXyMF8V5jDZifNRhFq5zTtMNJvLjSFcusRKmNftEv8DCVZg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:54 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 17/28] clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock() to its caller
Date:   Thu, 12 May 2022 18:04:01 +0200
Message-Id: <20220512160412.1317123-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

