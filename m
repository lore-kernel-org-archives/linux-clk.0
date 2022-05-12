Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14124C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356238AbiELQFF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356223AbiELQFB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:05:01 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A65E62CC9
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:59 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C6BE45C016D;
        Thu, 12 May 2022 12:04:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 12 May 2022 12:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371498; x=1652457898; bh=EE
        1OM8mFf6szxlFaLiA0eUp/0epjQT6xgcPJbgOLty4=; b=OJie6YaLe5RXKrIFkh
        DRQhEAzJoGZtcsUJQmCyoqQrf5TcrDZqkFc/VkJ678yb5yyTQ70fhVhl4kuTpypV
        Igf/mKJKDwmwJa9rUbgzywbiQPF9ZYyr3X3u88c9dK1Ge+0BTjAyB2PcLsbgIGfN
        BJKir7jR7xBxRcceNNdcz98dK8nUq2f3/GqvzXGeHEiZY7n81u6E5ogtSUp1ZvMx
        d5S0DrUL03DuqoG8dRezmYTnpoEra2bn7jzqA0EDR86R49LyZqcm60xVSSs3RdfO
        TqibTAwW8MSmhuk3bjkXZNqKwn/Y8ePQSfIFA7cZgxCPa2vV6VbVmBaU5rNjx+tC
        rANg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371498; x=1652457898; bh=EE1OM8mFf6szxlFaLiA0eUp/0epjQT6xgcP
        JbgOLty4=; b=JUkAZPEHRH7tgLO3t4lxGdqZngFbreHJOL4b7CPWpM4MyFA8cSd
        51YEN/RrGahILI6SxZPYz3qxCpVy3oQ67fHQjj3FosF6tCWZs9H2Lg8JXL1I5Cfl
        Mk9n3RnuSm5tWS5lHPz1l0JVnHK1HQEHARzIoie9rAMicnTGnRv5x8jGCE4lN1qm
        ocftTqdqFmR4hG59NadwLrBzpESqoKbuaPjzKV29aCEaEsbJ5fTaiYX9liAh5mUL
        bgtZmFn9iqhM97nl8FOmBqxAGmhu980R0tRRU+45adLWsVAr75rwDUrHRlS83CcT
        cGK2O2i17y5VUBqnePzoy9Ba9T60VOG/7AA==
X-ME-Sender: <xms:KjB9YiA0C_qKM6QSNYFxx4-sWuBAxF5wj4Bje2plNiNrjMOK9M9C6Q>
    <xme:KjB9YsgNEJ3trqiSM2H0D5Tme_Tppdhj7cOxVMt4WzEUTxCB0UW-_Ookw2EnyY_PT
    jmcqyOA-fSC7ircuMY>
X-ME-Received: <xmr:KjB9Ylnm92e2nIQQSEws-tyk8SSNdLZNBRkrFJ2RFrOcq9_wBYjDFgiGUWfQAQJCkEEijWIA_-7iJ9StazBslbr9_VXTBM-SD5sX2X0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KjB9Ygx2cMpBn33l4cQhD4llYsSCCt3awpFipgyy3gUENmoY_D9bSQ>
    <xmx:KjB9YnTPRLNm_f1SG1EM0KscuC_tqf69EhQHUbJvk_Zioao4NiLyFA>
    <xmx:KjB9YrYohX786VD7fP5-eE96-bQBkQ9H7mE6zHy2Etacs-Pcsp4m6Q>
    <xmx:KjB9YsImDh-6UuRPWq60IAzWvO2EQ5XUO0dBhyN2sij20d0MX0O-Cg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:58 -0400 (EDT)
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
Subject: [PATCH v4 19/28] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Thu, 12 May 2022 18:04:03 +0200
Message-Id: <20220512160412.1317123-20-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

