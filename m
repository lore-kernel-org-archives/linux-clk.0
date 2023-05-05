Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426F0C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjEEL2f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjEEL2e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:34 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299643A88
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 71FCC3200A46;
        Fri,  5 May 2023 07:28:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286112; x=1683372512; bh=bJT4/Gyh5KgdhvChbtlwnJpCdECFUmjs1AS
        xv9kxGRw=; b=ppXs8fY+25U4A+erhK8YGsAxGe6uNzZ+l3kw3ScuZ0tfYVxlBFC
        ZTJC44qpFkt9iqOLedrAI8d03fJdxd4knZABErc8ijVstH6EKYjJEumIYBRXPIaT
        8JfaBLe/oteYn7algEVtUYpj02PtdhQrPGe9gzIUE+7Sg/LlnoSOpW0zHNbzpt9g
        eaqFCtSItU+P69zpWuvw15n16ymHeHYRjmAzBGAZ+zenheGuZiOYiwJLNpoXU7K3
        iC+WyXKv/VgYBe8Lf6AdCPngPA6XtzjRd2zOwm4Ig9kC/aLN1IdsFYBNJX/5gEuo
        z6AgmG0TnC4cdxdlS4wyMPe5718lMRcNeUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286112; x=1683372512; bh=bJT4/Gyh5KgdhvChbtlwnJpCdECFUmjs1AS
        xv9kxGRw=; b=AupK/Axht0HGkBNsBcgTtcjkak/as3W6kEZ56C2kpD5fBTvmF2/
        8ViM/1XaoS/bDLYE7cbvr8RSdF6TlfkKBG4c9Rrkb711GXWYdFrYj7wxh7t2FUpK
        J217aY1Drk+7FcLpF4t5LZ84Hka70+2UgoGUC+8GLFqu1mwTtWM0h07B3Ni0x7yw
        HCPg3EjL/8HBlfLD7WxtEOrX8QLORWOlQb0V+j+QSq8VpZwacsSNwF6PaPpojmoy
        c+xpxkWc5AVuW8eHxQ1+cUokp3J+D2oIOeE456DLqFf7cPGed9XOFQQ8waVcPvVW
        A+caSVp058/UdXSg5hGNW1pqXFaV492mG8Q==
X-ME-Sender: <xms:X-hUZCXDhvPBNhTuAxBfMC4T0ZZ_-iz_UoQi2cSDQYuU3bDuGi6VKQ>
    <xme:X-hUZOlwxgfwlMOFcPNeX-OERPddPhx0Um9TFQOK8KfF_En9Cw2GZ7RoCYUXWEguU
    CNXL6eLsEFloHaH2JI>
X-ME-Received: <xmr:X-hUZGbBG7VG0febqejhEWCUXfSg5fqDFLyZ6n6ssl6fTNOTwIgFiY_YJwZgjBVdKxn_zXc1zIMwUc1abjrl1820XYrRnxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddvnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:X-hUZJVofg-zZ4MdhZkwsbPA3VXkKXwruJ61CuXk_TyV35Z-V4KihA>
    <xmx:X-hUZMkpaAY3mjUKd9NM9mm1WaiXH7KBH_wyewQwI_-0CIsf5vRyCQ>
    <xmx:X-hUZOf8FqRtc6RM-4AstS4AI1LFTyBFiUQpLeydzxb3APVCJYmjGA>
    <xmx:YOhUZBxHOSOUKjKdNsfBUvJR67KIHbaT_tufPsXGYQFEsPka-5FPQw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:58 +0200
Subject: [PATCH v4 56/68] clk: si5351: clkout: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-56-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3536; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=s3A6WyD6JSWct6Sr6CPLFniigDyDhrtMqn8GoJ82HSA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fuDWZJy53Ce3ne0rALW1+Z2rQedXux8E+tbPDlGr3i
 5P1CHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIsv8M/yPKPTdmmhuIzj00TXSfgs
 e0bZGFGVsXpmzQ9eL4MFGjNIDhnzpfyI+jWxcrOX1taDL5IDepUC3exK7hfljfZac3arcbuAE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SI5351 clkout clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5351.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 07bd67d681f9..76487f568a6e 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1037,11 +1037,12 @@ static unsigned long si5351_clkout_recalc_rate(struct clk_hw *hw,
 	return parent_rate >> rdiv;
 }
 
-static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *parent_rate)
+static int si5351_clkout_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned char rdiv;
 
 	/* clkout6/7 can only handle output freqencies < 150MHz */
@@ -1063,13 +1064,13 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 			rdiv += 1;
 			rate *= 2;
 		}
-		*parent_rate = rate;
+		req->best_parent_rate = rate;
 	} else {
 		unsigned long new_rate, new_err, err;
 
 		/* round to closed rdiv */
 		rdiv = SI5351_OUTPUT_CLK_DIV_1;
-		new_rate = *parent_rate;
+		new_rate = req->best_parent_rate;
 		err = abs(new_rate - rate);
 		do {
 			new_rate >>= 1;
@@ -1080,14 +1081,15 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 			err = new_err;
 		} while (1);
 	}
-	rate = *parent_rate >> rdiv;
+	rate = req->best_parent_rate >> rdiv;
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), (1 << rdiv),
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1147,7 +1149,7 @@ static const struct clk_ops si5351_clkout_ops = {
 	.set_parent = si5351_clkout_set_parent,
 	.get_parent = si5351_clkout_get_parent,
 	.recalc_rate = si5351_clkout_recalc_rate,
-	.round_rate = si5351_clkout_round_rate,
+	.determine_rate = si5351_clkout_determine_rate,
 	.set_rate = si5351_clkout_set_rate,
 };
 

-- 
2.40.0

