Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819F4C7EE26
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbjEEL2M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjEEL2G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:06 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EFA7A88
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:54 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 3EE353200A6A;
        Fri,  5 May 2023 07:27:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286030; x=1683372430; bh=4qwIMtgamexsfx/NRydXMQ2IFWJca+VyOdS
        WVhefn6w=; b=EtrTh+QLiZ5wFLP8AC+mxlCvqlezDyO7rKK2sFL8YKemQcxJ4ep
        DjO30IJ3uU6e6piRDvhUqTY/5oyLw85meySYRtqkdCJMeo0m/wGBqmGY0wvrWeR8
        6NV87FMFG4t5O/4bmhrS7IOHZAcYt5r4ErjgcQesgTjkKuGTII6fdiTPiOrWSPnl
        QeIC7P1avkW1COTWSC/Xu7Akiews25XZRjkAiFiw26PHvtzUSER4eEil1TQkPMtL
        LpWKR9Nv9B5bNli82GhbpOEW9nLK5yy4C4i5Twzz6ilBS+B5N2lQvp4eQHespYZu
        ZwkL20alBSjlFOlFUtcgjpNHq2LEQp1Xjsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286030; x=1683372430; bh=4qwIMtgamexsfx/NRydXMQ2IFWJca+VyOdS
        WVhefn6w=; b=KIwJZPFtA6wi8YTS26i2gaXDGshYuknJ3gDRrSl1Xi8OkKKIs9V
        VfJgyCldltWjv5pfMtKC8lPDH4f46Uh84byUGIJiEvvU6uCZxdxswElrjweS6sxq
        THLWXGz3vNb2xsEN1uXeaDC/OxW8ciQhu5Uj6cnhrZsauzKzmtF/QeRDqiMeiADV
        /+8ef2C20IfLinCL88jbyeyeZd5BMk311m9g4keOzwZdFtW7bREoiW/ofWwY78BB
        /mF90NGUj5rSboH7FLFL82MxYSjZEOF+ZnrrgpuhoSdy9rRM3SJOO04/Yh4oZRUy
        nAi+5iCG0vFgkIQoHSgevDVTyPvUDjteQRQ==
X-ME-Sender: <xms:DuhUZGSNgPnK_2b8Xe5qYa4_JHf8JVwOD1vT54ojk81LdIBsJnq3Gw>
    <xme:DuhUZLwn6hIpTMKFEe5dahmpxIkAEIsDWHSi-PxjCFLJEEXkhDa070JwYgyDfvhkk
    xRRo5owk7CznE5kSNg>
X-ME-Received: <xmr:DuhUZD0rFg4aut8bk2o3_3Jaz_M0ZcbmHt0CZDB1DDIKFrb3gBSlfYZ_s5d11UIl4zKf6oiEXnB5gYTx4CYF9sO0c1Q0CEc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DuhUZCCjaPFNYskWJ-FqPR5H2sOOPAU98CDd05rJc80E0m16xiksGg>
    <xmx:DuhUZPj43ynk9oUzdikdhMqwNiaJNja2YemQsz_Da8fkVd9QWaaxKA>
    <xmx:DuhUZOptkiOSEb-o8_uEXM8ohjcSpIPVk__emkWIQKXnY4E53rStyg>
    <xmx:DuhUZKUTfJc1pNcxWS7UK4u-hWvgefRblC1Wcouz0e4nN0QRF0mnJQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:31 +0200
Subject: [PATCH v4 29/68] clk: mediatek: cpumux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-29-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=7Gisy3436NyUV/3JhbE86qKa2YC1f2BvDT4KEfeGF9g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxf/25KafbAnySb//eRG+33zucx2XdP79jCocXOfv4C/
 lfmVjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzk8S5Ghj2TezqcVY2efd/yu6Zl/s
 spEldi3ro6rGX9FvMg4k/x+k0M/2w8vxk1PF3M/qLM1SOm91P1Zc4JG+O2bZi9av3fTY8LirkB
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Mediatek cpumux clock implements a mux with a set_parent hook, but
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

Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/mediatek/clk-cpumux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index da05f06192c0..a03826db4dcb 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -53,6 +53,7 @@ static int clk_cpumux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_cpumux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_cpumux_get_parent,
 	.set_parent = clk_cpumux_set_parent,
 };

-- 
2.40.0

