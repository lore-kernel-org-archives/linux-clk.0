Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1C4C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjEEL2d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjEEL2b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:31 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646E2C9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:30 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id ADD17320097D;
        Fri,  5 May 2023 07:28:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286109; x=1683372509; bh=5KjqGKHLBBVw8sYw7XRc/AKJ5NBhr77vStv
        XUU7EEm8=; b=w0rEmx6mIjIZu8nxx9Bap8qdH/RUT65LiuPNRFNxCNC2TRyprzt
        HLgGHfb9WRLEQggw+iEQF22c/4k/vtJlJ9tQT6DWYoOvuG23pl7sYbTWTJ1Iqxw5
        CFgLMJUT+LOA40rM/zMdHHuqkF0M3G1pLQb448lLU/TIzXnvAS+FmMuOwXTeQy9o
        sFgH93ahdhyiKWfUJB9IYpATUT/eLmXDQcTfcyNyX9hJ7PRPTyM+X34L7SRcmYg5
        bQ9dsi/M8gTwROt9fMHx1Kn9j5ZDrOYKYviYZU4xzqaMdHVaGCCAIY/hxgnCNxSf
        ChpaTz3Sz0zgn1nXL6ZEgK1ObJtkoxZTQJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286109; x=1683372509; bh=5KjqGKHLBBVw8sYw7XRc/AKJ5NBhr77vStv
        XUU7EEm8=; b=Hf3ed70FaAXC9gfUGYhqD0Gl3YAxbo784/lYeZI/dsTXFyvOKVd
        lVEojHklch4Vw7VpE2k0gRCaNuzHsUtxullytETDxvKv/fDRpNsBPP8LgQ3EX0qL
        jWEeODso+TpnBTzSFbBbe+VV17ecxh/8AUUZ7nQUwxXjYInimIT7XFs5mAeTq3Bd
        hpj8VO9xr6cYD0WWT/lkdh0/EytWDkOiOZZ2oeTTCjG0gB06W9c+tkrjSYy+1oJn
        P4SC7IES/wS4SSECmvm5Ye96UaRlslmZ4dkabLRqjHqsbcOu3FiyPKA1Ptwch/vx
        uPkz0RZovvi1Y3BtvXmra42Wd77d1B45erA==
X-ME-Sender: <xms:XehUZCCibyDYxbx0b5Wbfm8cVlKT1Fjk7gPNx-jOwoCeGJWXr7ruww>
    <xme:XehUZMjjppjEKUKJUEYM5dyx9QbmdzvrTJXFhw8RyTKpyjF41sZH-SqNwvPbSZqlp
    tqIIvNgc0OzJn0Dy0Y>
X-ME-Received: <xmr:XehUZFkEdVNOuBPsgUUwQbVwZFSsZQMYvnkahbYKnHe_G938tho0_rahSSkG3ib7brTJrOCDJ-IeOIm42C__mTAoQ4i80YI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XehUZAw8qh8q4mbB4Lzc2FC_gbfLjyzJv_xdwY7sMn97IvB4DIuC4g>
    <xmx:XehUZHQdwmza7MYefXuSLyM3mj3JQDCuTVIo7S8qkG1BXebBViDaQA>
    <xmx:XehUZLZe8_Q7Aq3UsL4TepdeioUVKRWVz5c_wTSp3DvbAlFzDb4UXw>
    <xmx:XehUZCfl35_yVksyzau-EWbkG-08ZbiCcAoJKQlt6RJUK8GnXeNC4A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:28 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:57 +0200
Subject: [PATCH v4 55/68] clk: si5351: msynth: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-55-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4438; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=YW8Nu64hbBy40hNelkCWnjhRSVsF/WrsddzImT1gtZ0=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5cm7InpmPRaY/KrzUJstxWsZz+7tHKXwpLSPcIbeBS5
 A6sCO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRzY8YGW5KxC8MnDU9te9HjcMv/h
 frxIT4pPeK9d1hnZvxeE5B5yxGhpUTtjDM+t0oe8xikagg37eA/ZYaO5bKiIfdP9nYxegfwAkA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SI5351 msynth clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-si5351.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 5992832774ad..07bd67d681f9 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -642,11 +642,12 @@ static unsigned long si5351_msynth_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)rate;
 }
 
-static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int si5351_msynth_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned long long lltmp;
 	unsigned long a, b, c;
 	int divby4;
@@ -681,10 +682,10 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		b = 0;
 		c = 1;
 
-		*parent_rate = a * rate;
+		req->best_parent_rate = a * rate;
 	} else if (hwdata->num >= 6) {
 		/* determine the closest integer divider */
-		a = DIV_ROUND_CLOSEST(*parent_rate, rate);
+		a = DIV_ROUND_CLOSEST(req->best_parent_rate, rate);
 		if (a < SI5351_MULTISYNTH_A_MIN)
 			a = SI5351_MULTISYNTH_A_MIN;
 		if (a > SI5351_MULTISYNTH67_A_MAX)
@@ -702,7 +703,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 		}
 
 		/* determine integer part of divider equation */
-		a = *parent_rate / rate;
+		a = req->best_parent_rate / rate;
 		if (a < SI5351_MULTISYNTH_A_MIN)
 			a = SI5351_MULTISYNTH_A_MIN;
 		if (a > SI5351_MULTISYNTH_A_MAX)
@@ -710,7 +711,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		/* find best approximation for b/c = fVCO mod fOUT */
 		denom = 1000 * 1000;
-		lltmp = (*parent_rate) % rate;
+		lltmp = req->best_parent_rate % rate;
 		lltmp *= denom;
 		do_div(lltmp, rate);
 		rfrac = (unsigned long)lltmp;
@@ -724,7 +725,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	/* recalculate rate by fOUT = fIN / (a + b/c) */
-	lltmp  = *parent_rate;
+	lltmp  = req->best_parent_rate;
 	lltmp *= c;
 	do_div(lltmp, a * c + b);
 	rate  = (unsigned long)lltmp;
@@ -749,9 +750,11 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: a = %lu, b = %lu, c = %lu, divby4 = %d, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), a, b, c, divby4,
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+
+	return 0;
 }
 
 static int si5351_msynth_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -791,7 +794,7 @@ static const struct clk_ops si5351_msynth_ops = {
 	.set_parent = si5351_msynth_set_parent,
 	.get_parent = si5351_msynth_get_parent,
 	.recalc_rate = si5351_msynth_recalc_rate,
-	.round_rate = si5351_msynth_round_rate,
+	.determine_rate = si5351_msynth_determine_rate,
 	.set_rate = si5351_msynth_set_rate,
 };
 

-- 
2.40.0

