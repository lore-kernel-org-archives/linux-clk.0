Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2043C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjEEL14 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjEEL14 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:56 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0841A621
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:37 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 2716D3200A60;
        Fri,  5 May 2023 07:26:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285994; x=1683372394; bh=2Oo+jCKvbqp6/E+g9z0fNbR9VOvb9+AQiBg
        2+qx58Ys=; b=SMz0zFIw8F2Dqa5qggdgBYqLbCdF1BtOu3T4Q7w2MD5vYQudjna
        GrN8XFqTMwGq0RzeJdpBIzCa/QjP7nu0jU50jM/JDcgxu/bJkaF3NH0pvuPfJ7yz
        wCLWMMFi9e2DIj5jsHWhij/xq+sKBDGQg+8mDZ3iYcXJUinC007hzdPE2h1Iu+Kp
        6k+O+7XvuDmH4H7ZKU/Z3KPd4abxGXDBwT3fSgnIBdSY/BLkA/VB1kQsRp/dL+rh
        N00cT85TQ0Eew5Vj6jgN+zB7/fCA17UC41Cg88RFJeMlxX195EEiLd8ykx/4+lPU
        q1BtB70ZOb5/8RpvvjFFBK5A42BQ2vhPPNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285994; x=1683372394; bh=2Oo+jCKvbqp6/E+g9z0fNbR9VOvb9+AQiBg
        2+qx58Ys=; b=ITHaGw5JV71PsXfc9gf2473rw9hXvsHdRSSIFGiM2mNVH7SkzOE
        kWV3Tok3mhFXCJQauUyAUjRFcr1CAgZS3kJ5ZSTJaPTLUBm+Y+UXGLcsQka7sRbz
        nO82hqIESuymOFuED/1UVWTHPqqQKw+dJnZ9R3aeM+mr1by5dsjpsi+c/2hURtp6
        udGRfOgUO++OZ0wCUC91JDKmVPjWuYGHuQxtQf2LjJ9l1bN2R5FQqaNA2u8viPrV
        ozkIJ5iiHCUfOI8OUlY0XNFiopXcd04hqYZym1hdyBJwwmim6zokseP1iuzhSnJL
        L0Xr67yDX3tjB1YiQtLRmiAwko2up/Zi+6A==
X-ME-Sender: <xms:6udUZHWmEuBf3oeVn2XP6_DFQC8Cx9hLk9Oj_B7NZ_d5B4QlL0mjcQ>
    <xme:6udUZPkZUFtwo2CBiNNkcJ_dFReZTMlezXKfocjaO1nV_HgRtFS8HkWXpbbdb-8G_
    8rEUpU-69o31Ord_KI>
X-ME-Received: <xmr:6udUZDYdXa8sdiYKjPTbZqZna-KGQR1oVQ3touZyAoX1bUhIcTLhGqECcEex8IaerYfkF_I66zjZmSqYh5lyQ5EjdnAYjsc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6udUZCVgj1kPCAZWcKg7yBrJmj4h2Kc8-eYTH7cD6WQmYIwC92qu_w>
    <xmx:6udUZBnyzOZCFqD7FxWNLp4ZYF8NVrqkqDcbUQ2X3Pwm2N9AcMwy_Q>
    <xmx:6udUZPcmuMSG8Kk683rIPgZGOF_9vWpACkOLyLPlTrGk0LHXfVGQJA>
    <xmx:6udUZEvoPrz9hEq1FHbj8y5ML9iujIa6tFniW-nOfsMxrVBaW49IlQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:19 +0200
Subject: [PATCH v4 17/68] clk: lochnagar: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-17-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=hHULGSQyWrgaQs8F7vHiJZihgLBsgfa1Ly8Ey3/OdJA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxeveKzAX5DUd//AyW+r/R6rp/sHt3przuUTqL5wTKfu
 3LQPHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIVm9Ghg3yFYsWBR0/1BGm9Snngi
 n/1/Kc4N1rG7Kn2u33P7TLJJaRYcE8DZuK307sDK8yLR/Nit+4yttnwTzHu3sjDnU7sW79zQUA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The lochnagar clocks implement a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Since there's no upstream device tree using that driver, it's a bit hard
to tell if it uses the assigned-clock properties. The binding and its
example uses them though, so it's likely that the author intent was to
force the parent through the device tree and prevent any reparenting but
through an explicit call to clk_set_parent().

This case is equivalent to setting the determine_rate implementation to
clk_hw_determine_rate_no_reparent(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lochnagar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-lochnagar.c b/drivers/clk/clk-lochnagar.c
index 80944bf482e9..db468a62c8d7 100644
--- a/drivers/clk/clk-lochnagar.c
+++ b/drivers/clk/clk-lochnagar.c
@@ -209,6 +209,7 @@ static u8 lochnagar_clk_get_parent(struct clk_hw *hw)
 static const struct clk_ops lochnagar_clk_ops = {
 	.prepare = lochnagar_clk_prepare,
 	.unprepare = lochnagar_clk_unprepare,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = lochnagar_clk_set_parent,
 	.get_parent = lochnagar_clk_get_parent,
 };

-- 
2.40.0

