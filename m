Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB026C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjEEL23 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjEEL22 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:28 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46BB7A88
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:27 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id ED63F3200907;
        Fri,  5 May 2023 07:28:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286106; x=1683372506; bh=Dbev5i9d4u/UZKz8BMMs+E2FVGMFYyNaxWo
        Vb8Ymqq8=; b=mPeEcLhI8poAK9QAlqs/pRRkPCXxx90KXB9wMvPTmSuNyGLx+Hh
        1tQSMGqSy+bR7oOP0L5fXguUthElgAzvfmd7HlDWbMlAD/JiP2jfN6oJ9oFOpxRR
        7u56TT7olQL033oFn2omnQ0GpfIAI+O/QqXSJUnDrq5GLXxRxzukHrl5pUbda2Vy
        fSBd8ia6c6dGfj2r98+6tXleI/jATNchISTb4AWgTTAS24Fe9KWeovwrDGFnSCJE
        doeBF3Bc4UhxeI18A8xNZW1kNap/AIDGEtP8zTh2KzFVNCHpOK8uLoqFk1LSUA6R
        06/g9E5fsjAd3nOn/jNq8LbBXMUECwMSUlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286106; x=1683372506; bh=Dbev5i9d4u/UZKz8BMMs+E2FVGMFYyNaxWo
        Vb8Ymqq8=; b=CX9PqgVhRwHOv1i3kEVKTR0apdGSXjcPHTKlCXIIS9jTvN0xSeT
        UUWelaqcbHpB9ksXipRDkgHKe6epEz3l0u46GXkyMNzWgXqnhtp//8v3BZD6S4UU
        GCknOUWXAMBQbgW2D8peCtVMP1qBdOVWIWDjLlNZXm7x9nCYlNYgv19HyLQSb8/7
        +fKlmvRB4Miqq42CClED6aOWCqqIFL6ndiHjAAaZbeUKA/l2QQII/Z+xaheQRo+L
        oJP5IWg2yfEhvIXsZQNidM8IRr4NKm5YCiw9QhUpJ5OsBQeVeEtFTZwrxVDDwjp8
        4by0Lz01t/biHvdLt41vKo63K3Lm3VasUkg==
X-ME-Sender: <xms:WuhUZG7z2cPvmmoKTWtipcI-vyyPpcNLy_tqTzvzOCItpPx_hhZFsw>
    <xme:WuhUZP6V30nErGZ2Sn-ojMtfFrSTnTvAJTaxdcsTLfoc8yVeB-RgcxDG3HpdcJGf-
    KvosexMP5ZVGxhEtKQ>
X-ME-Received: <xmr:WuhUZFdpfdZCdOT4kvB6X2CKVVeaDyweAqKKOVLLkbM7GrDuWdSmyECeXpZIMijvEfJRNf0KIXdyq2fpfQHd801kPz-5qIs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WuhUZDJwIdP0IkR3rJiBc9xTLjv81hlfjYO7_SXCvCokmF6fzFwVJw>
    <xmx:WuhUZKJ1ZfbXlD1mSNXi0HiQuUMCCSJKzLm2bX4xZbHPu1BJGbCodw>
    <xmx:WuhUZEw-IX8ABvUXaw0uC7t56QpfAbiJag204pNbOOYO4JlJVtX9yw>
    <xmx:WuhUZBXVWCIlOlSg3zuk6AwkwiSrIogOPq58x9eUC4wjYBKByr7zww>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:25 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:56 +0200
Subject: [PATCH v4 54/68] clk: si5351: pll: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-54-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=A3FQFb4jsBRIbivs/ouERH18mX3jqKqYPSP6gISoxV4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fa/pwqci3ys/7tm4Z/ddkmXyz9aBYXuuPoFZbnllUf
 Ps7d1FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJfO1k+B+5U+fR04cd5/+KndWbJ+
 oRV7OcP8ghd+Y0we1cUVszD2cwMrxlcBWSkde4I3Dl1BuLY/HtUveCtgS3zejav+7sm7aqEmYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SI5351 PLL clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5351.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 4fcf7056717e..5992832774ad 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -442,11 +442,12 @@ static unsigned long si5351_pll_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)rate;
 }
 
-static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int si5351_pll_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct si5351_hw_data *hwdata =
 		container_of(hw, struct si5351_hw_data, hw);
+	unsigned long rate = req->rate;
 	unsigned long rfrac, denom, a, b, c;
 	unsigned long long lltmp;
 
@@ -456,18 +457,18 @@ static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		rate = SI5351_PLL_VCO_MAX;
 
 	/* determine integer part of feedback equation */
-	a = rate / *parent_rate;
+	a = rate / req->best_parent_rate;
 
 	if (a < SI5351_PLL_A_MIN)
-		rate = *parent_rate * SI5351_PLL_A_MIN;
+		rate = req->best_parent_rate * SI5351_PLL_A_MIN;
 	if (a > SI5351_PLL_A_MAX)
-		rate = *parent_rate * SI5351_PLL_A_MAX;
+		rate = req->best_parent_rate * SI5351_PLL_A_MAX;
 
 	/* find best approximation for b/c = fVCO mod fIN */
 	denom = 1000 * 1000;
-	lltmp = rate % (*parent_rate);
+	lltmp = rate % (req->best_parent_rate);
 	lltmp *= denom;
-	do_div(lltmp, *parent_rate);
+	do_div(lltmp, req->best_parent_rate);
 	rfrac = (unsigned long)lltmp;
 
 	b = 0;
@@ -484,19 +485,20 @@ static long si5351_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	hwdata->params.p1 -= 512;
 
 	/* recalculate rate by fIN * (a + b/c) */
-	lltmp  = *parent_rate;
+	lltmp  = req->best_parent_rate;
 	lltmp *= b;
 	do_div(lltmp, c);
 
 	rate  = (unsigned long)lltmp;
-	rate += *parent_rate * a;
+	rate += req->best_parent_rate * a;
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: a = %lu, b = %lu, c = %lu, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), a, b, c,
-		*parent_rate, rate);
+		req->best_parent_rate, rate);
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5351_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -533,7 +535,7 @@ static const struct clk_ops si5351_pll_ops = {
 	.set_parent = si5351_pll_set_parent,
 	.get_parent = si5351_pll_get_parent,
 	.recalc_rate = si5351_pll_recalc_rate,
-	.round_rate = si5351_pll_round_rate,
+	.determine_rate = si5351_pll_determine_rate,
 	.set_rate = si5351_pll_set_rate,
 };
 

-- 
2.40.0

