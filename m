Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5CFC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244988AbiEKOoZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244959AbiEKOoN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:13 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD861E15E1
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:09 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 1AF4332009CF;
        Wed, 11 May 2022 10:44:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 11 May 2022 10:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280247; x=1652366647; bh=EE
        1OM8mFf6szxlFaLiA0eUp/0epjQT6xgcPJbgOLty4=; b=rJVllgMb4iquf2Xqg7
        jfWER3cU38TkQAE52sPvL3U1weS1tW1MWdC7AgTXyzRn9SKqH8Dq+HAn3kj4mKpg
        TNYW5kY/SypNk2h8OSaL52MtzpG+3/L3TAXS0COKClvCNEL4jKAqBS1q5BQzF8ss
        dHznTGdKNtYoXqfCK7lQpgDPdUSTfZHXUb/28r2ozDOVH/dnv6WjndNaPlXc/3bQ
        3NCZdfN1oYExEaPFnpAcZvFsD25NPpCFV6nBJNQ/xqkeBfHcCcuYimjMKdLvbWXX
        l7XEz1YNsuS2graUKe9k1sQLdw4LrVLnMgRM6A3JxbrVAnMfYSMK6DKuSMJ8sbNl
        DqCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280247; x=1652366647; bh=EE1OM8mFf6szxlFaLiA0eUp/0epjQT6xgcP
        JbgOLty4=; b=dgtHPp5bP/f2AtAkv0hPYEpiG/aMfdFHLm1Mq8Q6gaimGF6TlU8
        5kHU2SnNhlgUh/X96KHEP7QE7WrPPQWI68MJevn/IqUG0OerEBFOcv6f/djB6qls
        KBBSdcedoVEOxKGNpQQBrG3npwHr5TtCnribqegCs0U/MGsutDk9s0v2yp/cl+zB
        wnu5KSWvHuRQlM86KNAFDzXpfIuI9m8RMR3XaGRB6qnnoo1dQcXDkdNZkxeOAcQT
        PJ9Dj1NfhvoeC0aHnPLquPA0WgUSqC4186wSQQMU5BPeMHoQDjlWwm4fV0OjM8+t
        ZSpoUA7v/LuslQEBkKdfgbTCs3fQMkVWScw==
X-ME-Sender: <xms:t8t7Yl5CysLzFTGZLS3-uznOGWbmiWZeQEVuGm2LnEhxNecnelFekQ>
    <xme:t8t7Yi7SXKKiKgFIS3wZlkgYe8v0b4KNPWQEiwIst8PJjTfZnQGKArBPE0gWVjcKr
    8PJe6iZ4Wh0a9jRRsI>
X-ME-Received: <xmr:t8t7YscpIyQHztj6OAmYYtBfO2WSZyBFgkopMyGzZObkCa5rlUjhgNXVGjJ2tiNtK0wdIxuuJZL2MlKPXC0_ymCh9V7DZCLYDhHSVlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:t8t7YuL_2FS9f2v7tmu0LfqZZHxKa0BzYyKuI_LcEFfju5A_g9HD9Q>
    <xmx:t8t7YpLD5TIAmwcOS05CvRzx-noV3DZ9YTUyBH6jciyF-NKTrMqzNQ>
    <xmx:t8t7YnwNCIHzXIFQtL0ca7NIZnkNObfJSKU-eOnUk1yXg80At1Vn5A>
    <xmx:t8t7YmBebKZd1JY99gSDmsuLYMc58rFovoWxzMJePG3vbBIMXIK-Sw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:06 -0400 (EDT)
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
Subject: [PATCH v3 19/28] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Wed, 11 May 2022 16:42:40 +0200
Message-Id: <20220511144249.354775-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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
index 8952c5c71af2..3a94d3e76f59 100644
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

