Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D500C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjEEL1s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjEEL1q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:46 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5D51AED0
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:28 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 6FC36320097D;
        Fri,  5 May 2023 07:26:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285975; x=1683372375; bh=O1uJgpJMayji6JMJSLcGXhOP/LAFTEB2pdj
        giPGnU64=; b=xKU+SFOyOwOv5zXf0CfVJzPrB0Fg1bgGd9IuImeKAG1OjITAmlO
        B6slUsSGqqNBrH/sTRzEXlVTm37c+dB/CzMxK9mGirI3fqzrujdCYIRVjIX7CJ6T
        QYE1oAJIxJfOxM6wxCb3zYWO4JKlWckNBEyryH8GHyQRXoLQjGTFoEiSnzYmE4t7
        lbxvrWxpHnWjJ71kR/2IwYF9L+L4o6x/wz+cGlSNvz1KvOAYFp/eZD9EuDY3+ejo
        5rmvl1gZdmTQoDDjHKNoCFNtur2JFgQQoiuLHmBqbDYmjiHQxWMbQivrq3sBFs8K
        GtLGLIvlI0NBw1eN6CnLXSEM/EE/6tid1dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285975; x=1683372375; bh=O1uJgpJMayji6JMJSLcGXhOP/LAFTEB2pdj
        giPGnU64=; b=HED1Wvu026OSR41+pxYEuHt1M0mQL44w6Uqr9+VRRiI1cdDYsxu
        aId3YzcN9jI/B9spRdMwgVVN6yCJLJYU+YeBF6Cb22vgaRc4XEN9tq8Lvsz+LiBO
        5B5yzDldBfZ74wmWl1YiQMGeGwwdch20zidMnabdEXSwNjCTuwytBZPTW5UVLWC9
        6lXZJ36i951P13atDfrNeLIaKiQZ15ndKHRzIvNAlKNMl/xkPFG/E7Z0/NBVW87N
        98tg4hCBL0ZjfK1ld5nKhTsA/FbqzlMAQr8HtVT8O2Mds+Kg2amin/vlkVWDMd55
        XWQzuLIXEMPdIaKM8z4imC8lignzkLP0T2A==
X-ME-Sender: <xms:1udUZEpai1X6TN0Cy2b7PbATdL3JRM0YigWlpLUZmoIsb4r_ftHkOg>
    <xme:1udUZKoJok8yJUWvQmIX0vK7nMyKHAzQIXjwTWdX_siIQ_vY90KGWkekUSWoRedsX
    NM5i8zAoEUzGt_nRXY>
X-ME-Received: <xmr:1udUZJMxxciiJOn-URyRG9cmrwrt-l2RpyTJTysFrImQ1IY52PN-nXH3pnXsMpDm_EDiCdOACx07DZ9tK7FXM1ygY7M9T9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1-dUZL6Z5xjBPgr6ClJ6hErZgT4TAQRx8wb297jaj4ZDdOHLG3QpxQ>
    <xmx:1-dUZD7uKGo4z7mCV4b720hxJTqHNqmXUjIZDkRUcZYOw0tQUCnquw>
    <xmx:1-dUZLjAh99PrM_9XgPdj1JdifKD0EhMv4HLSE7b3vsvHSnDkEd_eg>
    <xmx:1-dUZAvmCyTsVh4wl2SLiQcXPJNYPX-x87cEXvnWatYLhuCIDJZ1fA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:14 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:12 +0200
Subject: [PATCH v4 10/68] clk: at91: sckc: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-10-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8nOL4GYSumNmGHVS7LxATd09NwDbg4eZjT+yvgBhj5o=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxf51+zPufCl3N04K7maQ2v2g+iDxQ9C2Cp05rsIrX6h
 I7+uo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABOZF8bwz/713oeVvyz3BNxaddvoh+
 qyixc9Mlj/qzz1LWU1u9UmsJaRoVX7TCKvyuZ/FbHFPIycp4U+Hp9rOymfxfYzu8w8veRebgA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAM9x5 slow clock implements a mux with a set_parent hook, but
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

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/at91/sckc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index fdc9b669f8a7..a2d86c377827 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -310,6 +310,7 @@ static u8 clk_sam9x5_slow_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops sam9x5_slow_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = clk_sam9x5_slow_set_parent,
 	.get_parent = clk_sam9x5_slow_get_parent,
 };

-- 
2.40.0

