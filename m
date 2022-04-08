Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69D4C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbiDHJQI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233080AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7358D1275A6
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:06 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D9C835C0170;
        Fri,  8 Apr 2022 05:11:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=eQSNRk/MBOnPiWU1qpFkztPhE/nfZ2
        zcbmFAVg9MX5A=; b=Vancy096YEUUlk7ajq5veHkOTUJNeyOPa8Eymy6rSXw5Rx
        no/kxAPYgBeuWGplvF2CK9TuJfunk1Z7mECWsnG+Sz1YxEppleE5YIijHpzOiVnx
        t0iYXLkhVPfWz2MpuXsiXp6To8I/Zum2eUgi9/jvoSeuZTtmQLLGlIbd8TZ2Gd0i
        qZ3Nfsds1Ngqtjv+kYW/VQ1q8lWvWCeImuI6Tpwnxo0yYJsUL3Fj/lu40nQ2nhbc
        qz2k5tXJzFCWLnbdP/UrI7O40TiDzFlsJRwPuVz/Aji3rF1Lo3WO/d4fEdqOjO6Z
        ukVlP1VpuDoZSrZR33kkZZK0idLt8YfxoWItljJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eQSNRk
        /MBOnPiWU1qpFkztPhE/nfZ2zcbmFAVg9MX5A=; b=Tpe6oWmxydcLmkF1jOPtI9
        2V6Ukqo+CvL1JpxKQCXQU6UGkLZknxOnrE8TvcNw/SN6P1hRsjockBNMA02VXA+H
        63vuugZbzJM2a+gYHr7/tPC+d0NxBhrbVDQHvU+3o01jo7LDjhb8LsBVrZqgmGnU
        4vPv387CNXylyNBGilzG5gGoziN8HPMtEpcL5JnHGkrJNf9VXtZbYK4cX+jpGC3h
        BD3FOGjxDxabWNTEiJwGvd5CH6PIkDBmKrFtCvUQMMfUkyngOKMs/gaoWS7iPtsZ
        1kGmImMNmyY6Gko1bbpwXpXfxoy+nONIoOMloNvJGnGt5K6Yl4FKED4RcGlyG2pQ
        ==
X-ME-Sender: <xms:KfxPYnGjeYREi13LANv_gjiJiyFf9yCLvGwsKGkiMGmcNk-DsBCHJQ>
    <xme:KfxPYkU5xKII6g0G9LTnSrl7zA8gKJOhumzhtEYNww2JVBTXhU5kcIe2v5N2PgjRk
    F1P0aCfjLD_R4FkDNs>
X-ME-Received: <xmr:KfxPYpK4_DGhBXXlGVPvdIpT1LLPhrcksC4qb_K3c9Y9Us4wF1iD1ZUmqqUfnahV-mywfx3yKrd1KoFLl8AX_RqCqlTiZFCfwqD0SAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KfxPYlEu6V3ptF8VW4tVbTjfmaSFJMYQTV73TkzIXbpoe4coqWOo3Q>
    <xmx:KfxPYtVC1ag0ItYyq-AAYOB73so1wwHtq2L2gDJ6Sw_wA4cdAFlFTA>
    <xmx:KfxPYgNvG1A6tW3yfmI3108aDJAJa8mNb1CVM0yWmBV4jexC13QzCw>
    <xmx:KfxPYlSFWiRDapzw3-1pvnqnQM7vXcNPeUOcRfFMG2CbFOWJppDWzw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:05 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 12/22] clk: Add our request boundaries in clk_core_init_rate_req
Date:   Fri,  8 Apr 2022 11:10:27 +0200
Message-Id: <20220408091037.2041955-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 80fbec87309e..458c9fcf0349 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1382,6 +1382,8 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	if (WARN_ON(!core || !req))
 		return;
 
+	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
+
 	parent = core->parent;
 	if (parent) {
 		req->best_parent_hw = parent->hw;
@@ -1456,7 +1458,6 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	int ret;
 	struct clk_rate_request req;
 
-	clk_core_get_boundaries(hw->core, &req.min_rate, &req.max_rate);
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(hw->core, &req);
@@ -1489,7 +1490,6 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
-	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
 	req.rate = rate;
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
@@ -1996,8 +1996,6 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		struct clk_rate_request req;
 
 		req.rate = rate;
-		req.min_rate = min_rate;
-		req.max_rate = max_rate;
 
 		clk_core_init_rate_req(core, &req);
 
-- 
2.35.1

