Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D639C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbjEEL2J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbjEEL2E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:04 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B680F1A1C9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:48 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 848DE32008FB;
        Fri,  5 May 2023 07:27:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286024; x=1683372424; bh=9GaGoMGjEvM3nBtYXQHVW2cO1D65NmKSgYW
        AE7A71G0=; b=iuzOh4epA/+cZ/jT4D1/ya4lHkR9D4ldeGEEV+g9SofjsWkK1MQ
        0xDlRdBddjvfIjHbrYa6v0Wn8jdxw6CRlxZUg5XlgRt6yJu6CpJtP+l6TkiPeD9E
        msuVypBB7yweyQC4TjlQRQUcXxUP+XiTaR23UMaERI3QPD/xY1aSoKn3t7uX/K+c
        jD2hPI0MryRi04STZKANsxy48v33aU5q1VTqHE0XQ82oTOi5ZfTYeygnYYJGhlLR
        YTHMpDV6RSBklioB23M7zqYDHaMqUJ0bfn9XUinGteN5+BiG7zOo+lxWrLdKTqQg
        Nw4rtdZ/lhpyOJrGAgbUkjbj6csi6TaW8QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286024; x=1683372424; bh=9GaGoMGjEvM3nBtYXQHVW2cO1D65NmKSgYW
        AE7A71G0=; b=NoVfxEM3t3n5K9hegXzp46B91Aa0cKg6to74dgiULO+vckbvLap
        FgDGOqeK8TWWmGfbSZfq2+f05g8OZAVx+qAx2Yn4yuB1aMrZZl7s1A7ZdScMGuOJ
        QknUn6uXVFu8caiQEjOdRFnIrNu4h8K2N7D8ka/sTvKy72faTIyEXRgFTFiTk7lL
        y1b0eNzUd+zD1WPJgDhUmS18caILVU8F+Is/WFnGTyaL5/WPtDaA6NpmvAhulO/w
        K2SQUQPfMnLI5+TsjOrXlMnUtGCYwLN4M/11a8saghTe4aF0qLbfcZVypYYzECEB
        XBKmLn8ajKxtcKj8ZffhPdrKiKJ/P/4DPwQ==
X-ME-Sender: <xms:B-hUZC9tOGsgRyCGi1-dCoGMwgbWvbl-uEFcutw7FnMRkWY0LyCq8A>
    <xme:B-hUZCvTaArtKfeikcuLDWkuYftYTiREkRnnGiRTLwqrEhFKi9QGYTu_gDdTQJEBd
    lXhnE9TzeUbXZr62Ys>
X-ME-Received: <xmr:B-hUZIDjXoki54zra6bkLuITT3kEBV7jUFyE0c6a-ll7A22NPIlx7Tocxz3zqWZG_hQhdWIJxw5yRf7U7UrglL5Gk5DmCgk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:B-hUZKdJr7ymRGtDxODCyte2N_r8PL_4tfw8Nq42fFgWZ4dIjnqCUw>
    <xmx:B-hUZHMqBseIYYknhl8NUwt4gyxf9Q5jnhFbg-bNtB7cD2rrzPF3Lw>
    <xmx:B-hUZEkBrqReqb3cKhK6BXH5pFBgw0-HJTPfXDKH-1SjhadUtjU5AQ>
    <xmx:COhUZIE_aIG0T8xIB1fhIEo4v34oi8sC56w9lKqv8CZuaO3ur-UYEg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:03 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:29 +0200
Subject: [PATCH v4 27/68] clk: imx: fixup-mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-27-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=fVDmwUo+ONYakLHIku1FGCJ/Cp1OnwLFtksw10VZRy8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxdX1nH/5i4VvBVRx6GwIye/VFO78nKMHefJplmXFpZy
 rgvuKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwERO5DEyXGwV0ZimHperz759Rv9uv4
 VF/k65z57kbWrt/dw7oe33Xob/Gc6e6875RojWRyUUzl5fL8Hyfufud60LY+9+LJ3RtrWECwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The iMX fixup mux clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

However, the upstream device trees seem to use assigned-clock-parents on
that clock to force the parent at boot time, so it's likely that the
author intent was to force the parent through the device tree and
prevent any reparenting but through an explicit call to
clk_set_parent().

This case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

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
 drivers/clk/imx/clk-fixup-mux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fixup-mux.c b/drivers/clk/imx/clk-fixup-mux.c
index c82401570c84..b48701864ef0 100644
--- a/drivers/clk/imx/clk-fixup-mux.c
+++ b/drivers/clk/imx/clk-fixup-mux.c
@@ -60,6 +60,7 @@ static int clk_fixup_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops clk_fixup_mux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = clk_fixup_mux_get_parent,
 	.set_parent = clk_fixup_mux_set_parent,
 };

-- 
2.40.0

