Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF14C7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjEEL2V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjEEL2J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:09 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A0E18DC2
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:03 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0B5D83200A6D;
        Fri,  5 May 2023 07:27:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:27:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286067; x=1683372467; bh=5ITAFuRIgliRb6OtSLym5ZbZ5a0N7dtjOQb
        eU7+laLQ=; b=UGUb73ynxCPGrAgsxTvaBTjhOv4H1p04Q117iBoY0+dTs4OP17D
        +8JJfvW7rj4MQbRaQ22/0YT6/mdsULIgi9LVKAb+WSJGl+TFAdcsL7jeX0AMOeQJ
        /zVPSMRUS3d3r72UpCbgNpO1L5X6hdzwa3itAuXIMMLkHUTmDdYbhM/T/h8v2jVV
        0rWKY7FSlVYt1G3r98Zlq4pJUdpG2S6SqYfnA46fgpM6PFPkQkg7w1eT+RrQddgk
        TtopqoFprgwLKAVgbtVT/G6yBr1Yf9c5pXDmq9NSMSQRxtKM/1uwKX8eG/mXbYHB
        f775JmOVw6GJ46S5uMAv/ek4b7Lu+rXYt6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286067; x=1683372467; bh=5ITAFuRIgliRb6OtSLym5ZbZ5a0N7dtjOQb
        eU7+laLQ=; b=BKcYhBif2mH0IUOAWbPbwyJJUlLCFVKLg13KgQEE9I7fk2YWatJ
        uIQd+ZFBzvtgKTb6knScsFYcGcTcrbif03aQcV1bwKkwfRWOkW+kLL2bF7yG2u+V
        xCUz1Oj60sGa4LbOOZ1gyATCq12NzZnjWSYXGe5181YiU8t0XJ03IHf900IHGzPD
        MbKTUnItva4tXjspFphe8kVbMwXDED17d/PL5ngjrhma96QekxApRqRHgTkEqOFT
        koQjTjKCQ0Pz743T35PTytkzk7PA7BD6AJatvN6wrlo0PAdcDc2FoQUX2PalPPc5
        If7eIdtxY6xXKA7nQo05RkhCi2SQYv4xuKw==
X-ME-Sender: <xms:M-hUZNfnO5p6QPNP35irKtPcTDR3p_o3M66Dfx6VwZzo-JASudMUiA>
    <xme:M-hUZLP89vEhHFWXtsw3lOhCfUaDkR3GGSZGH3l194PJIgKTbySKUP2gXS76Bf17w
    YUyA_WFhfKwcKBgYRA>
X-ME-Received: <xmr:M-hUZGjClhPqYIl3x2i5RTYxZheydFeXGKcgIr0taFwEodqE2ikIu_dh5p-2s9rerNBZC8udFUuUesQl4HlIJKi06_br7QQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:M-hUZG-inXZ0rI346ksvDETD1YBiS9hf0U3hVxw0-wp47beCD5oGeA>
    <xmx:M-hUZJunpV0X-qERxZWGq8mM7101uZxz_5oPqXDEqpznVtTcZZCCyA>
    <xmx:M-hUZFE76CGtGyD-zk7ZViA_2_veK1rGzVNfvb9mifqRED9Y0H4Q2w>
    <xmx:M-hUZHW4BZInRCWrKKFYjBcYxJN3T-2sDfDjqccQjsUEUYFS2d1mfQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:47 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:43 +0200
Subject: [PATCH v4 41/68] phy: cadence: sierra: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-41-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=1L+EyOSq1c6qf7fYoSWfWytVr/66VQf6PFcGzNIY8wQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5d0G17pE7AIiAn53C6rrat/zK/k0rtVBuwnPracf3I3
 Je1uRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACYSKsDwV6hmQVGGdSKP/vq40002l9
 f5Pf67gftLjGW2WWbFbw/tPYwMb3ZmOIYldJ3sZdeKWGK260It80Kzla95FSr9ZgRXrf3AAgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Cadence Sierra PLL clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: linux-phy@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/phy/cadence/phy-cadence-sierra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 13fcd3a65fe9..7df9c79a772a 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -720,6 +720,7 @@ static int cdns_sierra_pll_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops cdns_sierra_pll_mux_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = cdns_sierra_pll_mux_set_parent,
 	.get_parent = cdns_sierra_pll_mux_get_parent,
 };

-- 
2.40.0

