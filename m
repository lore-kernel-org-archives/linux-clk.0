Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA177C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjEEL2u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjEEL2t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:49 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4AA7A88
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:48 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5BEB1320030E;
        Fri,  5 May 2023 07:28:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286126; x=1683372526; bh=hBWyYZZ7rkElX9hsOnHkFvGMYqyPL5Ucdro
        L69i02iY=; b=LxHAEIgKg4/TFJIAyU5QJK/uUZ1BdZNc9alZRWGwM9op4+BH+Jd
        OHE6JUExqL/SDIA8lF3v5nARzzI4OXM33xBmjPC5HSWYP34H8OWhcpBdk5d5HL+R
        lWCNhw7yqrSyGrUtcfHVmCJ4OtwF2GKsfWIzqtr5FVZ79YgNYPQQxe8mgdYC+Jxx
        AvC8Sso0X9yl3PPoAcTPw76ZaUvzhPeTRhptQIK8cafcLOAVD0ZkKDaPdw6X+twO
        +40JCYTfOlhtcaAh7asVlIw3xRBhumvTqL2j7qz16BEBLih+XP9JddTF4LP7wilI
        WvkoD2Uts8fFYefWPAeaUlI2Cwt6doFMEmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286126; x=1683372526; bh=hBWyYZZ7rkElX9hsOnHkFvGMYqyPL5Ucdro
        L69i02iY=; b=jSmlWQJoR1euNZq0U1TyyxImHEacNoJNqESlN0lNV00kYxFMhau
        BK8AEk8aMZt9W8G5ByRAO1A6pIb8VZcxf/a8Eu9rbhHfv1dqA2Zpvfdw6zg/ckpT
        mWvjJBtfzEw5WDje6TrYHxOACwrC8R3tEtkFCHBuYegbRkGyNA9Ht7UL/ENStzEC
        0btAnGs2SOE6qUsdJRYUrQXdIXmzC/Rz9VvF0LDcdMQo46YAZJFRUQjqHH8b2v00
        fJS/5XdkR8YRy0AisHNaPr3a8sdpVmzJNxZQ7mj3oq3ZDiWF1DPXkKTx0qkta9IT
        KtCFBHx0u0Giu9ORL834efXAGu1+51/ejEA==
X-ME-Sender: <xms:buhUZIbtNmUlXkVMQ2tifSr7t8etwRNeaHTT3fdG8L4h-Nttwf0OIQ>
    <xme:buhUZDaiR-XbRhMtqzSMo1JNMfHS73wuo7msaDBL8-swsvwfjsTLm25yuAvhEtHAg
    jklYkDvjyE-Dhh9WU8>
X-ME-Received: <xmr:buhUZC_tZFD6n5SVF9VJfUIziG2QUHqPr9Kf2qpt-LBzebcebutdieQv5DbgkE1AiP6wTDGcBAlAlWFm7b_H-DBfrWM4fKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudehnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:buhUZCqjSJYkWGd0gPggXDGNy56WJotZemVxqqOInc9gZiOcwImkag>
    <xmx:buhUZDr5gFJFEPGopYYhS4c174HZfI5W4mnqwcQna8Gpwdo-U3mEXg>
    <xmx:buhUZATWMo9xtggMEu00AUraRcJpM-ktfkxgzsN_XPI4yJCQF46GPw>
    <xmx:buhUZEDMQKPqJp1wOcyQxfDieE6I3gy7680Rx7Y2c7GWGXSSQ8knBw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:46 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:03 +0200
Subject: [PATCH v4 61/68] clk: sprd: composite: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-61-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=ytKNiqkURQEzbzVnMdvv3cEfASXp4c6fieUw5DiYu7Y=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5e+ziq4JvZOf+kWodOTGzgv//p5RG7qhytved+IiP6T
 k9rI2VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJ3N/PyHDlxm8/kTnz3+Q1z58kaj
 KHPbdpjeAB/VPGzoemWaVl/fzN8L/4Zd+8kjDBn7Jrs/ae+fu55t0Dm1+/C0NMWZviDh4z3ssLAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Spreadtrum composite clocks implements a mux with a set_parent
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

Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Orson Zhai <orsonzhai@gmail.com>
Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/sprd/composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
index ebb644820b1e..d3a852720c07 100644
--- a/drivers/clk/sprd/composite.c
+++ b/drivers/clk/sprd/composite.c
@@ -9,13 +9,19 @@
 
 #include "composite.h"
 
-static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int sprd_comp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sprd_comp *cc = hw_to_sprd_comp(hw);
+	unsigned long rate;
 
-	return sprd_div_helper_round_rate(&cc->common, &cc->div,
-					 rate, parent_rate);
+	rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
+					  req->rate, &req->best_parent_rate);
+	if (rate < 0)
+		return rate;
+
+	req->rate = rate;
+	return 0;
 }
 
 static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
@@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
 	.get_parent	= sprd_comp_get_parent,
 	.set_parent	= sprd_comp_set_parent,
 
-	.round_rate	= sprd_comp_round_rate,
+	.determine_rate	= sprd_comp_determine_rate,
 	.recalc_rate	= sprd_comp_recalc_rate,
 	.set_rate	= sprd_comp_set_rate,
 };

-- 
2.40.0

