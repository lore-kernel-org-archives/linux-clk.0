Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29313C7EE2E
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbjEEL2K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbjEEL2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:06 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A406519D
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:54 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id EE4063200A63;
        Fri,  5 May 2023 07:27:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286027; x=1683372427; bh=is8YG82gb0D0VuL2IA9RpmyvIfa8b6hEhpy
        C9GysmF8=; b=SfNI3/vy1My/OzqGwRothJ3LUKkilezvrHRbiHJUW3Nw9BEiWF5
        c5/rqQPpdK838eRHxB7o9z1G/W57VjYy/aN8bR9QfRDilHzqZfhh4cq0F/Lchc8p
        Hhl/N+dgghLmHkI4cQO02iWz2wx0yc2NCnt1C3M/fOrlXDld9rtEJiJ1Yuh3rTcO
        bxzrIt7JhyeYO4WRXfrRRLCJvfG5zPnKjWJAwgqdXjCJu6RjUgiA7O5QEBpyMZDy
        QETLha+caEtABWzFuD9I3C1tu/3iv2y8XpSkewucuRnhZ+0btbXy5nD58PNZc3OH
        ra3RGhAxh4bM8f4LM0qoLULPlJE8vlWqsew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286027; x=1683372427; bh=is8YG82gb0D0VuL2IA9RpmyvIfa8b6hEhpy
        C9GysmF8=; b=gd1EWpe27Kg1G4WZtuHCg23Qdco7F6PxiYeZV5FeasndR7oMmyL
        DZ8n/9PS96HSrPS8+ktcpdDdSCx8eiE77nEOFLzGrzqd/w+ueaLNykF5DrYOqUDv
        ReTV8ykwBBEl7eIXaupPbmfeJTpsxV7xxWvZ/Yl8TIt1jLEHjwmDa98YInHA/ohz
        OfeI+vs73QB+JgCGBJMBerbN++owIgNRnzQr7lgSCDDBxHVedYA0ZlGyDSVHJxbZ
        R0tDfFH9o471w4j7Ghtcgf1xsMsCNVUNo3BPGmOvKYxAl8d7pRsWQW8w+0z2DtXX
        Wo0AaEWgOIuGnYRjyNYUQDPsbBVDCuJf0Xg==
X-ME-Sender: <xms:C-hUZBumhW_6RfpHaTfrDKZlxsrse_ywfuzjw1vN_x3bA3jFjVNx1w>
    <xme:C-hUZKcX_mF_zjg3dCQqOa7suKnoe3RwZ7rA11wGcp8f0F5dLI8i7XAFfzc39ZGfF
    xJylspO0uqs0WmY0gg>
X-ME-Received: <xmr:C-hUZEx0xJln1lsTqlzj8MVIM3btvbIlxo-G5jkXb7kRPoGqbuy8zpRtaz5FqESSmtTMx8veEuZCKgxKVziKoQCRROROqYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:C-hUZIM4FVxnD7j4o3uC8MFkKNd1NMzHGmQ-TMLVQDw4_zBeESjCdg>
    <xmx:C-hUZB-G1jRJhGJnb--9CrKUNLp7HlDQCOT9eF25GzG43V4lFdCmfA>
    <xmx:C-hUZIWRUUNIPEx8wf6u_kUEWytUEbPTeRLoKTe1ypgqxmlFW77JnQ>
    <xmx:C-hUZC3e9g3mZH4WKxl1iVydr1-Ci_lC00dGdSJpPKN2nuhYMb777w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:06 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:30 +0200
Subject: [PATCH v4 28/68] clk: imx: scu: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-28-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Peng Fan <peng.fan@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2401; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=qa3Xj7t7TWFPG+dMVFbDhq/Z9XaHdUp96ZtkDRi/NwA=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxcbs7R3GjCcF2RY+cx2jk1Nj8cEq4tS67jDA59cX31+
 yvvOjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEvY7hf+L1FZm/O2zDjj6PlO9/nP
 Ln0i82R0Pdk6teK1s7ZSwQSWRk2FaqxizNczqWv9ZuzdE11+8tU1zZezpNs/XSub2Za37IMQAA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The iMX SCU mux clock implements a mux with a set_parent hook, but
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

Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/imx/clk-scu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 1e6870f3671f..417f893f8895 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -785,6 +785,7 @@ static int clk_gpr_mux_scu_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_gpr_mux_scu_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_gpr_mux_scu_get_parent,
 	.set_parent = clk_gpr_mux_scu_set_parent,
 };

-- 
2.40.0

