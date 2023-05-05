Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE4DC77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjEEL24 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjEEL2z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:55 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4206C19D
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:54 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8ABAD3200907;
        Fri,  5 May 2023 07:28:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286133; x=1683372533; bh=cN+mWuZzx55gqibRDIyWFTzCWaWEcZ3wMFC
        pT142hlA=; b=U0KDpakfqyGF5ke+lHp/YeHp8pJlWQzn5eLLlfWx82X8/oulsMO
        QY/q/gg9VDDriebc9sE3v9uGShQO1ygPJINQMRXK2Ta5bv9D7jF+jAt/gjKAvYCX
        fEzLnMUC/DxV36CtUTrdEuAkZuRTAzdQXrI9rtwVHcCuotXFrr4uT4oEyv9ux6z8
        SXFbFQpAW3YVJ6ZVVsQwTMojxSvSwVePx7+Hr0P7MX46Xe+MboPeDFYPYSQ2Eeed
        2ATjONovtNDiY1Y1veDkmH34W+WLg18UCzzd/fd+ytyU9UXliFz3xWyFBMg0rb7l
        fVcjmZGoWaGZ3B+hnhydV/vzDi/MC9rYb5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286133; x=1683372533; bh=cN+mWuZzx55gqibRDIyWFTzCWaWEcZ3wMFC
        pT142hlA=; b=Hbd2keM4KKpvMmBVB2RGziz7tHQ86qL46YaKdr4rZ25lAs4Q/rj
        AnUwls5ITICFy0Ch7HzIyE77myNiPPQCkYH0Q4Xow/JI3nimG6gbdISy8Za1lh6g
        RBv9PcpKFqyBjfoByMtfWMt7ENaL5zkSmCIBZm5oQShXJq/73XibCQRhkBFQ/Ly9
        +RsbTRXS9EX/V1ymGyL+07lT+KhJB94ab5mK6IcsquoOCIHJr5cHWzo1FShZHRnz
        FmunITOA3IYkox7ACbXP7v65YK6si5OvlmuFaB7fbet89JmC0xPzNLp8xPcfag10
        3jxFXBXgmz0Sq/NzZFMJpgboL7AJryVRD8g==
X-ME-Sender: <xms:dehUZE71yb2fX0EkxXczNdhEuPWfEu1smRUW7vebNpkewQF5RpNOIQ>
    <xme:dehUZF6iP1EzWZ7CkFJftznxHhOS4Kq3nJvOFKqLQbYT8bDR4pq9lPobmwKGIAVoD
    rrkh4Awg-Nmv19mFuc>
X-ME-Received: <xmr:dehUZDfuAO74gkQ9SPort5LbCkRNDjXj-mvVDdcW5wVy2YoDS17FXAswu7eCaVABmSusULQHGQGXAZur7pMttCUy3Yy_rV4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudeinecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dehUZJJDAr4UnjWnc8Dx3UBadJeHWce7Jqi-ouZXtJlXhKOuPBRV2Q>
    <xmx:dehUZIK1hxLEsvzWozXiJ2RZfjkXJpPc40Scvk-LEXirgA3gxVI9Ig>
    <xmx:dehUZKywmWFyIWsUfttJ8_5ibLW1xt7fg4SxMWhFMsPTbSjV6Miz8w>
    <xmx:dehUZPUwz2NOMsRZUns5kwWC2QRT8PSrw_jPLJ60CHqlmF6CldoMcg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:52 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:04 +0200
Subject: [PATCH v4 62/68] clk: st: flexgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-62-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2831; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pfoOHbniFY4Bi9Qzbzr7r7LUa/8Kiy7Rh6mXMBg/2IM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fmSi3vd3wsfvyNmv79z3s+rns6ZV+qZ9C1ICeLfI51
 B/wzO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRJycZGbpWS+vPrFW9H/ytJeB1Qf
 7ZuDedGvKtVhVnhc4vPzKv9gMjw8qghtWML48uKrDcWz/fptrK4n5TXOeuy0+Fw+bJ6Ivs4wQA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The ST Flexgen clocks implements a mux with a set_parent hook, but
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
 drivers/clk/st/clk-flexgen.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 7ae4f656191e..5292208c4dd8 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -119,20 +119,21 @@ clk_best_div(unsigned long parent_rate, unsigned long rate)
 	return parent_rate / rate + ((rate > (2*(parent_rate % rate))) ? 0 : 1);
 }
 
-static long flexgen_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int flexgen_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	unsigned long div;
 
 	/* Round div according to exact prate and wished rate */
-	div = clk_best_div(*prate, rate);
+	div = clk_best_div(req->best_parent_rate, req->rate);
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
-		*prate = rate * div;
-		return rate;
+		req->best_parent_rate = req->rate * div;
+		return 0;
 	}
 
-	return *prate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static unsigned long flexgen_recalc_rate(struct clk_hw *hw,
@@ -197,7 +198,7 @@ static const struct clk_ops flexgen_ops = {
 	.is_enabled = flexgen_is_enabled,
 	.get_parent = flexgen_get_parent,
 	.set_parent = flexgen_set_parent,
-	.round_rate = flexgen_round_rate,
+	.determine_rate = flexgen_determine_rate,
 	.recalc_rate = flexgen_recalc_rate,
 	.set_rate = flexgen_set_rate,
 };

-- 
2.40.0

