Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD4DC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbjEEL2S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjEEL2I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:08 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2030A9EC4
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:00 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id BD94C32004ED;
        Fri,  5 May 2023 07:27:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286055; x=1683372455; bh=zPaFx80r/zjx6/jqsTeFDCf+vLEYQDG5Sqk
        4QVDkgmo=; b=F2Ta3kYxJ9VrpMPxhjlq0Q02NZlabpxqJzGIToLWoG97alPMSX6
        g5GpwR/o6EF/+MpmXZg/AyH/NZwBiRMwmPuNgT3Pi6J8EejITZrIUnrFwbzJtKlf
        xtlevs5TGS/RTrxw8mVir8nBz/fs8IXuzYe3cJ9Ld7E50PjpSYBkXzuH1usq5rYu
        k2GHgnWuocyTqgvHqBXAJPEejcxCX9s1CmlFRI/hZOUmv6FwsX4RfMZkV87/sTDP
        tEnQ42Om4Q6uI4wXTISuIi3frqe7BG8sE4DhL1vKtaeEq2tueYAZG3GWGq7LRj8D
        GtgNLjltDsylbOZp8z14yE73IeXMBSFLkiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286055; x=1683372455; bh=zPaFx80r/zjx6/jqsTeFDCf+vLEYQDG5Sqk
        4QVDkgmo=; b=AyCbfZPDk9BQX8UPVwJig+LE2VfQTJ7iVVeWBkQPkyTfrXf++vM
        jKtwlA3AGqAbJfh1rx+VbcnFjkiLo5Phky1BCesn9L/2ct5L1sXgPk/oHTPZpClE
        CRjhCma/hHCgParl47/MyLrj25Bck/abVGpIALN5zlTH7XdgMspbwKcf+2bnhIi6
        qDttUp6oA7fpGiaVmAF/SAS8d8sWwTB/TXpYAPoFrlg/DaYok2Yq6EFufj07STIk
        eGEheo05J8hruGtvpJgJOqXY301abGAG++0n9Yxm8L2OjCM4f2q16THTHKz8KRBe
        LEfspMax8CFbdp8NFjpO5tzhPdb58JgECiQ==
X-ME-Sender: <xms:J-hUZDs27J7rHFWH9DITtrRfjDh2oWqLBFrBDccsvd-D0QB4wQykTw>
    <xme:J-hUZEc1plPmisq0jYyajDrYRJT836hm-Vg-oOnp6i5xQ_aqZePEUMg9n1hia3Ea5
    nAVp0b5RtSLbn0vtIw>
X-ME-Received: <xmr:J-hUZGzRdpgdSI0mx99pLCFGwmc0438NZVjKHbV-ED0Dw2smesHjHYQjSmA9m0unlBnA2jMdRnxufcDDgVI9yw7V-x6Y9Ok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:J-hUZCOfMaf0FAyHT6AE-MyyfIi3hhrvIT9Xr_Rdmm92AOZvTuvjcg>
    <xmx:J-hUZD_4oQ_9aKnJruPoF-zZwD56KXcVQjl48BK9aYqDKkuo9r1Neg>
    <xmx:J-hUZCXp-SnMmj7vVgekrtEwpboYdKH-9DK3Uz5xiJDEBz81xygBgQ>
    <xmx:J-hUZOlWC8Oa5BlJEnUtCABgUE9Y1ANvVeQseK-Tn2khvC7dty7-jQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:39 +0200
Subject: [PATCH v4 37/68] clk: ux500: prcmu: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-37-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=5jUOzNr8PQIXZ87KetW9sv83ouSz4FWuJF/pholzMmE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5eciJq1eqab77P9e3NOy89I3fRfTaGZab3xavUvunn8
 C02PdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiWrKMDBOMumrkgwUPFKU4KUvMOh
 U6vXDt07dLBD4yJYTeSje6OIORoe8F42Vb96e9UW4lj8/+suE0N17Lz542/7b6gZw7xo5buQE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The UX500 PRCMU "clkout" clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The PRCMU binding also allows to specify the default clock parent
through a device tree cell. This will be enforced at prepare time by the
driver.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

The result is that the driver relies on prepare to set the default
parent, and thus the set_parent hook is effectively unused by design.

We can make that decision explicit by setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent() that will keep the
same behaviour. Indeed, if no determine_rate implementation is provided,
clk_round_rate() (through clk_core_round_rate_nolock()) will call itself
on the parent if CLK_SET_RATE_PARENT is set, and will not change the
clock rate otherwise.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/ux500/clk-prcmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 4deb37f19a7c..5cbf24c94606 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -344,6 +344,7 @@ static const struct clk_ops clk_prcmu_clkout_ops = {
 	.prepare = clk_prcmu_clkout_prepare,
 	.unprepare = clk_prcmu_clkout_unprepare,
 	.recalc_rate = clk_prcmu_clkout_recalc_rate,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_prcmu_clkout_get_parent,
 	.set_parent = clk_prcmu_clkout_set_parent,
 };

-- 
2.40.0

