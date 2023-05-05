Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300A7C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjEEL2D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjEEL2C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:02 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9CDC9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:46 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 91BBC3200A68;
        Fri,  5 May 2023 07:26:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286006; x=1683372406; bh=d4sxSkVXBsnfYLGZlmp70nIVcSOwUYDB3KN
        sv4pHIkw=; b=IJONgT2ZI383MXQDqyOE/8Jwhh1kMKBUe10Gykl32nAFksNPQcs
        A7msGgnEWfErLmox0So29mp5jRIAjK3JByIp1ngUgJVGKNq2tJPDXqxmilBGcZMm
        BaZuZ1XaDrG4LEEZbQbCKjvA6gQ3sD5w50Ho78H4iytT2dX9qdoHZP+m2PB5wNvy
        utYrnnVJ3hJUsPC4jTCVXO4An7I56SpPPkifUAKQUY9VWUqDjYo0/rbyxoyWsZym
        sB7WQsEjcx2cBu60gMSgLXV8l/Mupo52BE6qxLiAAepwctrj8yqBBA2Mqg/iJnIS
        LcucbqnGlYXPK0hHo4R4+9tJzyh+krRdDaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286006; x=1683372406; bh=d4sxSkVXBsnfYLGZlmp70nIVcSOwUYDB3KN
        sv4pHIkw=; b=WLfLPSWnzf7yQZcAfm92qKvAyvQl8JXG6mK4weN5zaq87li7mJx
        q5AvV7PsfRF55vn0ayzmSV60MPhHXN+2542dqGVyZ3nEw3LnL79VvAcsqX4wj3wG
        5ULXn1KspgUwrew0LX8/leKQAB6DWXMEoJTQqJlY0mH4buN+sOiXF/6nvajtdfNY
        FpnuNlsEyXDiZRDLMFqdWkyl7jQlr9NkJb0/v/I0rVKirfmUAbVlul83yJqmu6tk
        lH3VScKmHxeq3KjlF1YanJGqJ25Xf35ACMLjWd4k/dpN4qIGR6QhKNAwculJKgSp
        BKLF9QO/3E00t3AsqUfql7+C9O1i9oiXSEA==
X-ME-Sender: <xms:9udUZKBt9bsaRsR0bR8Lg4a3ujvMjUni6O0dVEEgj68RKTtSvMYg7w>
    <xme:9udUZEiJc5-EmyzNHrDiwcAGnQ1AK_H9Zcczl2UDuBK67fbQaShGagDCv1lIGIN72
    hEgDQ0Ba6CmeudXkNM>
X-ME-Received: <xmr:9udUZNl7SKfZrZG1Zgz5Za5rYmfA--pKVvIdJ87x9p_Cm4hYYsM8lOU5jlRxhES9G3G0-vZalc2pVfvRoCPVWrMJA6xPo9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9udUZIwdEfjHIHmnLpDYTezGnhPzeJvyeX9abSDExO79K5JVCQHfww>
    <xmx:9udUZPQgKeHzfTxwxGP4l0q78Mq98P5P_UCqKqpKHfdXUKXDBeZobA>
    <xmx:9udUZDbc9Evz4QJca7sWi7o-n6X6KtV29uroPdid_F1qcr3Vh11_IA>
    <xmx:9udUZJdSzCK87DzVr2BOOnc9EalMEieK4vIXikenWBADkQ9dKACSxQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:45 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:23 +0200
Subject: [PATCH v4 21/68] clk: vc5: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-21-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+M217ExyudxYDTcsnHSy+wjNmpcc3Hy4s0mqI5VvgJI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxc3K8mtKjPvm5eZW7F83WeRZoY/zcvLeDpevemceyHg
 a6NaRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACaic5Lhn1H4dq55BRuM1+jftijKuG
 /0bBkvx1HVXt6/gqHXDNU6/zIyfP0RNlPC7vfpz3IcvQ9fLNrndnq6wTaZoo4/qhavJXmduAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Versaclock5 mux clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

Similarly, it doesn't look like the device tree using that clock driver
uses any of the assigned-clock properties on that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-versaclock5.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index fa71a57875ce..97ffd4ef0e5f 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -281,6 +281,7 @@ static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops vc5_mux_ops = {
+	.determine_rate	= clk_hw_determine_rate_no_reparent,
 	.set_parent	= vc5_mux_set_parent,
 	.get_parent	= vc5_mux_get_parent,
 };

-- 
2.40.0

