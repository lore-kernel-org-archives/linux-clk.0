Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272DAC7EE2D
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbjEEL20 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbjEEL2Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:16 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAA81A48C
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id A5E623200907;
        Fri,  5 May 2023 07:28:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286089; x=1683372489; bh=sdlpRXLo9d8u/J02F/pSNfCPqLv0NBH2V0R
        YgvZa5mY=; b=JRNlKYx5ZjG7zOJpXUi3/XJSejKbZX1IEatjK+1LzXY09LJGIj7
        b1eMzGYQcDKMI4wVEV2C6OzNSN8N2+Isz5YyvwZoHGaUswBpKHkTIhzO1pYUGnZR
        kqiWNG+p8VNNX5LGxZP1CplMliPHQ81KOLQ+5se8n6UBb6UnnXIq4S49tiUePC0Y
        6qe3iP9fnBoFuAU3YAnSsXzgdMQxNPRmmHFXxS2y6Zyp4qIks/ZnFqTbaPTFKOKN
        vNe7ZlYYjUIvUE+M+ELC70JKlAF7A77ZYYPa3vVGTH4TAuCz7FrwrAtd4TgWTTvZ
        pm2w0Wm8muoP/2goGduAbvztEp6xfry3K5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286089; x=1683372489; bh=sdlpRXLo9d8u/J02F/pSNfCPqLv0NBH2V0R
        YgvZa5mY=; b=NUCmixA9zL8L/xBglG89pLuYW0lZeXXEAbPbUgdjtmkUnJ5s7ko
        L8WugmAFgNNZsF1pZ8TW/H2aE+W9JN9GgTSiOvYwKw9fYhw5LCxAkCDJPnTVWXT8
        c+ZtFj9TUW6Cmb01rdQlvf2uGht73/nvsCqhR7mM2+mftymVjnR2kNh69nM8zyQz
        eIneK4xFDDQIUbUJXsGdDSaW5z4yFphLMxC2nD9qWTWSAOD4SsF8fVpDkenwGajh
        f8Xydgfm966mPT0GJvVDF1Kr5BXYlpX4OCtIH0M47nNCIacC4Mwg2LN76FgOnFZe
        UTl7ZsLIXRJiOflWiOmaBnbaaFZV6BvrudQ==
X-ME-Sender: <xms:SehUZEXCFF8oVupaJOKhdjPKpvPSaD3mLhML9tHeN7ySq3wNjnL79g>
    <xme:SehUZInR8leaDOF87Gx94D0dfaOMKCXs6cBaLZzblEeICJ-3kgajMG55eS2nXMv9g
    oQiMk51s_1ywzKu4bU>
X-ME-Received: <xmr:SehUZIalUIoRbKCVujvGI8oBmdbp6RnHgM0RwbTvjo-4YFVcYfTqbKbhBGVDpeVh3zyb4luvuKQpyJq18g_Z9ovlR8PLIS0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SehUZDVKeGnBn217ezissGpM96hEUKsjxpaoc1ly87bLoE0PgLMrmA>
    <xmx:SehUZOn6ApY_ab9mh16PN0MmvN50xSAg5DxUcZsL4aUhBrjkFQixFw>
    <xmx:SehUZIfHZGrD53jm7m5OSj04mPO08GYM_6ZPIGQfKSUytOMqRQj1lg>
    <xmx:SehUZMZCe-DJJhC02k87iSiR-hMxj4CU7miqYJeaKxKu22W5Ql51Wg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:08 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:50 +0200
Subject: [PATCH v4 48/68] clk: actions: composite: fact: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v4-48-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=uyBaAmdNnpNkmO3cXNcw5v1QgunRrFr2A3EejTTdAcw=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5dk5XiULZ1mt7v/ydqcltQ5arNe2MwO/b0pW76nWb+0
 gv9DRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACai8oSR4eC6gJLpr+pi5yVslVlx8P
 yLFXyvb3j1ZbGf2VhgrN220Yjhr0Cl9lkWabGDHiduBn3Qfa6mcMLHJm2lTr74pwWcqk1NDAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Actions composite factor clocks implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-actions@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/actions/owl-composite.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index 2f1e282134b2..48f177f6ce9c 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -86,14 +86,20 @@ static int owl_comp_div_set_rate(struct clk_hw *hw, unsigned long rate,
 					rate, parent_rate);
 }
 
-static long owl_comp_fact_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *parent_rate)
+static int owl_comp_fact_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
+	long rate;
 
-	return owl_factor_helper_round_rate(&comp->common,
-					&comp->rate.factor_hw,
-					rate, parent_rate);
+	rate = owl_factor_helper_round_rate(&comp->common,
+					    &comp->rate.factor_hw,
+					    req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long owl_comp_fact_recalc_rate(struct clk_hw *hw,
@@ -175,7 +181,7 @@ const struct clk_ops owl_comp_fact_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* fact_ops */
-	.round_rate	= owl_comp_fact_round_rate,
+	.determine_rate	= owl_comp_fact_determine_rate,
 	.recalc_rate	= owl_comp_fact_recalc_rate,
 	.set_rate	= owl_comp_fact_set_rate,
 };

-- 
2.40.0

