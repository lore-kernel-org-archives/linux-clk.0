Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA2BC7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbjEEL21 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjEEL2R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:17 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37C8C9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:13 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B542B320030E;
        Fri,  5 May 2023 07:28:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286092; x=1683372492; bh=ZL1o1TNKbYDVKyE4kDrtDmEhXk1RcDLRMHB
        Arg+j7Qo=; b=jGXFwXmY8pg3srh5sSfuY5pN701WOIIRXwtqX6x57G5dvAlIgmq
        uJ3sWCBxKtbemVvKkW41YwAotGCqt8/2jaDafEuon34fbq+IVgnarOO7huvhz3ky
        mf3kX7ibziT1XAp1ji639NKMJObsAw6uP/sADI0rZKvMlaD8pPULqESvnLjkcwnm
        yHRZGx4koETCfZ+pnYYSmTIPL/YcVpjI27iq99aiG+05saSqANPs0tRc8wZs2BuT
        ue416hgSrZf5JVo/u1RlWm3Si2Sc62Nrzm68BQuIjkoXVRZbUJnkYhZQRnxdB59c
        adlglNQ8o+B+w1ui0tNJHIcAGD72NoDNsgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286092; x=1683372492; bh=ZL1o1TNKbYDVKyE4kDrtDmEhXk1RcDLRMHB
        Arg+j7Qo=; b=UgEckuuZnfwhXGnSKXdKg4iRbs6y34PTnDh/Rm0VGslX3SngVpY
        Up3PFqWIN7bzJWRCkp9tggCIvUXunR7pc6hPIUwq2YXTpCQ0fg86PAsjM+9u39Vg
        1OLbTnz5Xq84/ymL/Pij2Wtv7CVH+O98SwdO6YH6lzt/31Af0Ff/vLf3ERxD+hjb
        HkzSsZIGuNDWpGGfqjeVoaTTNRw+9RWSCPJHKjeAOudcDugbpYQ21Sw3sCj7OhmB
        ngG04ABOWWOFEP5Ib9GYVgja9jWcg/qgGtWhXESNsFd098T69uV3s7H8wdXvLnqf
        l6nJwU1s+o7i+wthFbA5gVcSZK8VYGfFwbg==
X-ME-Sender: <xms:TOhUZP9o0OLF0QpmvVSseygk9k8zJm9lmTTXcoINTNC-woI_p4bXSQ>
    <xme:TOhUZLvqGwZWhHlM0tE5y2xPCd4DHZsKj_xlFXs8jXEBky7N3mYzGktLYS4q3nk3T
    Tp8ymXcPqVb_aunfm8>
X-ME-Received: <xmr:TOhUZNBLizSnzcCKP-wapkaKCWFwWgf0fUzelgTC7uwiB1nDDly8Z_tA-pqFaZsFcF6s4Hj65QeHFCUGqjyxY87Vyq0Q2EE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TOhUZLeTDw7znnb7HhnBY-rBGbCP6aeSuva3Glj27lCFTJHSQcuPaw>
    <xmx:TOhUZEMTUBaGii6eMSnnV44HPgGQh0wgqHkzgwTRpdQt3zGq8EDX4w>
    <xmx:TOhUZNkBEc59Wrcs-rFXugCPnkSvBUThihaDDqtn1_3jQ-NYzcslTA>
    <xmx:TOhUZAAMtha_YNsxu2DpJx8wRjferp7hE186AwOuj0aaXo0zkoY-Xg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:11 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:51 +0200
Subject: [PATCH v4 49/68] clk: at91: smd: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-49-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3550; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=grvfNEMJDxKC39E6gpEk+/fzaJf3lwNJrJ82SYiqrIg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5e4Z+dNUNeaxeK//vuWGuH/VqlC9WZb2bZYiR1IU999
 1Seio5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPZKcHwT5HjVA5nqrosw8el75cdaJ
 wolLfFpnev6iYeJTYvXp7OdkaGS7stK1+timTd92Nf9wYtz9dqISp22W8MVVRv6mza3irPAAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Atmel SAM9x5 SMD clocks implements a mux with a set_parent
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

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/at91/clk-smd.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/clk-smd.c b/drivers/clk/at91/clk-smd.c
index 160378438f1b..09c649c8598e 100644
--- a/drivers/clk/at91/clk-smd.c
+++ b/drivers/clk/at91/clk-smd.c
@@ -36,26 +36,31 @@ static unsigned long at91sam9x5_clk_smd_recalc_rate(struct clk_hw *hw,
 	return parent_rate / (smddiv + 1);
 }
 
-static long at91sam9x5_clk_smd_round_rate(struct clk_hw *hw, unsigned long rate,
-					  unsigned long *parent_rate)
+static int at91sam9x5_clk_smd_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
 {
 	unsigned long div;
 	unsigned long bestrate;
 	unsigned long tmp;
 
-	if (rate >= *parent_rate)
-		return *parent_rate;
+	if (req->rate >= req->best_parent_rate) {
+		req->rate = req->best_parent_rate;
+		return 0;
+	}
 
-	div = *parent_rate / rate;
-	if (div > SMD_MAX_DIV)
-		return *parent_rate / (SMD_MAX_DIV + 1);
+	div = req->best_parent_rate / req->rate;
+	if (div > SMD_MAX_DIV) {
+		req->rate = req->best_parent_rate / (SMD_MAX_DIV + 1);
+		return 0;
+	}
 
-	bestrate = *parent_rate / div;
-	tmp = *parent_rate / (div + 1);
-	if (bestrate - rate > rate - tmp)
+	bestrate = req->best_parent_rate / div;
+	tmp = req->best_parent_rate / (div + 1);
+	if (bestrate - req->rate > req->rate - tmp)
 		bestrate = tmp;
 
-	return bestrate;
+	req->rate = bestrate;
+	return 0;
 }
 
 static int at91sam9x5_clk_smd_set_parent(struct clk_hw *hw, u8 index)
@@ -98,7 +103,7 @@ static int at91sam9x5_clk_smd_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops at91sam9x5_smd_ops = {
 	.recalc_rate = at91sam9x5_clk_smd_recalc_rate,
-	.round_rate = at91sam9x5_clk_smd_round_rate,
+	.determine_rate = at91sam9x5_clk_smd_determine_rate,
 	.get_parent = at91sam9x5_clk_smd_get_parent,
 	.set_parent = at91sam9x5_clk_smd_set_parent,
 	.set_rate = at91sam9x5_clk_smd_set_rate,

-- 
2.40.0

