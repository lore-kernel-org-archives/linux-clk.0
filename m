Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B98C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238226AbiEPN2A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240349AbiEPN0m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:42 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6617227CFD
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:41 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 9590232009B0;
        Mon, 16 May 2022 09:26:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 16 May 2022 09:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707599; x=1652793999; bh=EE
        1OM8mFf6szxlFaLiA0eUp/0epjQT6xgcPJbgOLty4=; b=xGDV3H5v47GXPMlwtE
        bnnGhPaJ/Qk8cIz5WF+QOYKkKsVo56rZfDRxRkhZD2OQaB7dEprn3QzYA52/z55a
        d1SY++BllZSgBBIfpvEz1h0pYCDHfpEg4eIEmAkygzGdYx9InsRSprrrgBlF9mSC
        MBWuDMI3t5S8vxEZP+F/ADRQbmlPWPt9UxE8j/VkGjGmCQNIFVMFBovbAWMs2X0g
        5QU3e/W00pLsltkJ+8sT+GES20DTXAalS9bsicgf7XqqkPWfYGIskY1cbvSIoRRP
        SA0T1i+hfJZZR4i6pJDeS8cVHuKdZLqKtOY+YSDAhMvf6+M9KHM23Axe8wx7Pk1T
        h6DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707599; x=1652793999; bh=EE1OM8mFf6szxlFaLiA0eUp/0epjQT6xgcP
        JbgOLty4=; b=eQpPGj2JFyCEeuFTqkLMnBe72fy7R9JCa4tp/Q59au2M4RRG7ZG
        /sFSDLX4Hp/KcAf+omf7SLQVv0EiNXwo0GRPysXKASIV8rHcQVmwES5zGxiZdJ7d
        jSxFw/C7dWYfWOzEUy6XjqzIFm/J5N5odT75GJ3XrVZ4S9hFeS3XJwEndVRdDaDo
        yU/0x9hg2Z9kfrWL+PrUWv9UsqbqTpfF18o+alCJkvl9UdoJcPSyF+JRQDOBUlrq
        i8tKhqrstit5f+8wBPPeTfIND7wljKJpdCT6+ZhN8gmoxTusLS9pNL5v3Dav4d9o
        n/Hm8nDEN0UkN+Eo+RYdKdBtD6PONVjzjKQ==
X-ME-Sender: <xms:DlGCYmNyTXPIMejadtN3jvrPuhSYEtwxDZpukzP5VfDXevTpDyhJvQ>
    <xme:DlGCYk_C-EE64UHEnL-LkDd65N5D0geqiY51Lg_vhxDUIbJ2DLT2NMz_G9SmwNXD3
    pyi6Hq9_RY1M2MkE88>
X-ME-Received: <xmr:DlGCYtQNsi8g6pEE-U9hn-MXVA2k99YyA7Mqpzt0vcIDX5Fc8mNjvgFrhdESYf-NaQG0VY1VE7XPBBOZMyioItBx5rsWPH1l78J9D10>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DlGCYmvHjyPLIhVQ6ABncxVnO1IRrxmoHf_ECddcK3YeQlrk-k6rUQ>
    <xmx:DlGCYufOSS7v_nFGihMKkDE3-pDBWiGsA2ao5EacoPEuHBOMFQE5Uw>
    <xmx:DlGCYq0-K5WREcUwrt6QFT9Wm_IhftOv_s_Lef6RMURwrt8muh-COQ>
    <xmx:D1GCYvXobUWwbMzqCauXcZWk3o8tAH1Dyr5IAfOqq3vWoYLZvSL-bw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:38 -0400 (EDT)
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
Subject: [PATCH v5 19/28] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Mon, 16 May 2022 15:25:18 +0200
Message-Id: <20220516132527.328190-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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

