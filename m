Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4393C7EE26
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjEEL20 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjEEL2N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:13 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFBDA251
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:07 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 901A032008FB;
        Fri,  5 May 2023 07:28:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286086; x=1683372486; bh=PfWTmImKxKIpJoAkzALAsFwdadzDzzsF9hz
        gcNjJ/uM=; b=MoCmgjhsDTvl3uJotlR7ENT73i/kptayfrfL9bhtdT5Dwidwidx
        HsLeomfFqiX2GVWLsUSiLw+UNkh2BxnfJsg2enhvUyb2ehM5ol7Z2pXRFCzbdwYc
        fDlViFdBb1nOnK7F0aCrRzSmLnZOxQYb8A+/1vFXva2B/WbuCfBj33QvlZLtexCq
        nG//lRj5Lj0sGjJiOhUN8BiMBm6AhY7qhsU8DS4WnDGb9W/3nd7pMyoU4ITJAgDd
        phuQe9kLDLPOpqsMjQE0jEuANUZW18Oufm/AbuEZ3L0tvV1q9mNJxbHuf9UlOcMQ
        2eJD8JVikfetlmTY9Nmt72jXs22eiCMAylg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286086; x=1683372486; bh=PfWTmImKxKIpJoAkzALAsFwdadzDzzsF9hz
        gcNjJ/uM=; b=TItGzxbivLbfvsh0+JM3Y5n/og4h8AnbJUlcW7j+EjoLxyakirm
        vmJLYy+AvOr9/YhHd69mAuUemjqV0i0REJLL4z9PjaRAL8lTb1X8z/jI2AA87L+E
        ojl5Ki/YaeoU1nskSez0rlV6rBHBwcdEO/lm79UncRMKEdmRYNex0rjOuij/51ro
        UPc0AiJJGyqh7AQcKUqkzoOtRhOMoUlf9TNBe4kJBcSj6SVDaKoVgezOrGLIsDgH
        mYe11kdPdKhgp7NkqWkO+d1v6RtufshDLA52zpV1TRJvX971DlHyzk+22AmKTe4t
        /RA4JEB34v8C82LvYR3EHA10F1cQ87dDTCA==
X-ME-Sender: <xms:RuhUZOwFr6PG61iUwTxf3xOZoDvZS12bIkbLPdwXhHsz9anm8pSR9A>
    <xme:RuhUZKSpXVazQnucNk1mU0uXz0QmzyCD9VLoEbkg8R5es0aON-YgfUpI-TZAiii68
    FcTXSYc11y_0uxT4Gg>
X-ME-Received: <xmr:RuhUZAXr2n5LNSNSE_KLZVSeVsqw_dikcUcO-v0e3mcwEKRn5NZjQ4U9l2HhEsDF3LeDkKC_UTn4aVRuoWS2xQmci2ks1sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RuhUZEj72_VMxtkvMlekvf62j7qIhkxEiIPUkVcMaTSfoCJ1Xa3wEg>
    <xmx:RuhUZAByEKV0xql4VhojLSBOTcEO7pDnE9e67qRTOFtrP9Y6ck0V9A>
    <xmx:RuhUZFImU6cvZNJXrDGHw0ylqJJmf9SH0heIbxQaNhksfF6wB6imig>
    <xmx:RuhUZC2-2cdlKqgrki7kaL4I-MQ6OiwJfMb5ZjBXbyxaECo1RyBTBw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:05 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:49 +0200
Subject: [PATCH v4 47/68] clk: actions: composite: div: Switch to
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v4-47-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2950; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=UZMNzkOWFIjD+gDO2VaoM7lgoJwIkakPOuo1/dGFvM0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5es+PMwXjlnkXZ9M8PES2UHJ1/+VRUrVnTwtlDOheUC
 PsoWHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIhB+MDAemSDZ0v3hb1v1PxrBs05
 sDHeG5qTfdlSN/m5/4vPuSbQrDf6cZ7FWGLDWiB3RmGSQ9E7h/dfbfHaxuR9qkJcuqs2czMwMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Actions composite divider clocks implements a mux with a set_parent
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
 drivers/clk/actions/owl-composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/actions/owl-composite.c b/drivers/clk/actions/owl-composite.c
index e7784f9e5bf6..2f1e282134b2 100644
--- a/drivers/clk/actions/owl-composite.c
+++ b/drivers/clk/actions/owl-composite.c
@@ -53,13 +53,19 @@ static int owl_comp_is_enabled(struct clk_hw *hw)
 	return owl_gate_clk_is_enabled(common, &comp->gate_hw);
 }
 
-static long owl_comp_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int owl_comp_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct owl_composite *comp = hw_to_owl_comp(hw);
+	long rate;
 
-	return owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
-					rate, parent_rate);
+	rate = owl_divider_helper_round_rate(&comp->common, &comp->rate.div_hw,
+					     req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long owl_comp_div_recalc_rate(struct clk_hw *hw,
@@ -152,7 +158,7 @@ const struct clk_ops owl_comp_div_ops = {
 	.is_enabled	= owl_comp_is_enabled,
 
 	/* div_ops */
-	.round_rate	= owl_comp_div_round_rate,
+	.determine_rate	= owl_comp_div_determine_rate,
 	.recalc_rate	= owl_comp_div_recalc_rate,
 	.set_rate	= owl_comp_div_set_rate,
 };

-- 
2.40.0

