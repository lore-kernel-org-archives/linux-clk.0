Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D53C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbjEEL2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjEEL2D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:03 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA9E1A625
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:47 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 28C9D3200A5A;
        Fri,  5 May 2023 07:26:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286011; x=1683372411; bh=Ea2CBZa2Jyl5hxNnBeNLn00BEi5+g/SOcPT
        PAX7bSqs=; b=qnJ/3HaYYbzXM3gfhg25UPMgInD1rgbqJxMKmCaHORCNdXZeMb9
        BQP0Ep4QjZ0y1Z+Rm2BrMLy1qjtglnOiKxc7PnzW4QDuTnPEa5Lm7HW/OaplvNZo
        /HQUEa0IlRc7ViMj3PbcDKS/dSkY7+RLghMtOvkFeEJ0CQeZadBoELC7SeOPqItB
        tpmXsj3iN1JDvLcvRTGgg5VYxYciwHqWqzAhvSQ2FXfkTURsYfW/d9y62sJsjvBc
        mymLUN/zFLcBrpRsycb/o9i6ddoL+UaQvlU7JuOX6R9MiKWVH8mRIv7FvKYUGGH3
        ONUXMykxd3aTudtenZc3BpBjPFRBVbGyGzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286011; x=1683372411; bh=Ea2CBZa2Jyl5hxNnBeNLn00BEi5+g/SOcPT
        PAX7bSqs=; b=NwgOWa/A2/sOJJ8WclG6w1m+m70Pv8rmUGI3G14sUK9SiITSl2k
        dlNFl8vmL3C7q1bnNoTYlyqlwLz6ymKnM2Z5k9osGZRg8tpg5hw1mXrwkePdWOSQ
        UZXDrdgC5O/xWmLHaZWvjTe8M4KoFRrkhrzXI7HKhyECj714AVdJ4wnqZpG2NLPA
        90FArhc1b/hrOJYn3VwAM+M6dfvq+BxVn540+lzer4SjgAX7xKHoyJcEPJy49RMF
        DqVliTdxDLXP9bFPtpdDp5finkYA2rYm9w283PiBTxqygRyKdnYiFVurRYWHqnQO
        tay4QTNX15f+egE0c7QbQzO/KYBCj0sXTOQ==
X-ME-Sender: <xms:--dUZAxEq7q6maoqec6qEH7qDC59KOcqAu3hE4GuKdzkBt6Mt9BmSg>
    <xme:--dUZETdFMW-Mq22xK6H6DzghNe4XyamTkTpOkt1Kl4WBq6Up4m7cx-jik_i3dqwc
    MRFLe6c8nPgtZKstjM>
X-ME-Received: <xmr:--dUZCWmvZIqniyV8yKGxaYntOb5XrHw39qQ1djO5tBtnEHUb_nM0MjC57Xp3vzaZoA39tGxcN2JKQllOKwunTu5tl3eDUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:--dUZOhnBGNqKDImB-WiuHvwzpu0kz293IeJm6sH80p1OWWna43KJg>
    <xmx:--dUZCByXlS87YNlbRTjwCKcWDlAejPdLo9LrhT_c8xfOJFewOh6wQ>
    <xmx:--dUZPLzJT3-G3JNdXie2qD4IaC4y2sxp1EtUwM7bMa_CCloq9JMow>
    <xmx:--dUZF9MZXWwujZRX2xTtJTji6VKb6UKsjeEIngNalvxoWuhzjdaOA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:51 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:25 +0200
Subject: [PATCH v4 23/68] clk: wm831x: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-23-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        patches@opensource.cirrus.com,
        Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=OU4W2Pef26xOilBeZ2HlVUPrtt7cW0E5heyCm/7prjo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxdP0Mr6Zrs/6XzblE1r79jOiFKz+L28on5X8EZ2iXp9
 88OfO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRDWsZGabIyZ0OOyj9XUgm0ePuvo
 l5XM/tQ/sv3wlr9zl/V/bGzjcM//T2yCfk3sgWq9WadpkjzI2talPxXJm6armMt6fNUmamcwIA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The WM381x "clkout" clock implements a mux with a set_parent hook,
but doesn't provide a determine_rate implementation.

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

Cc: patches@opensource.cirrus.com
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-wm831x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-wm831x.c b/drivers/clk/clk-wm831x.c
index ae6dd38ec053..34e9d4d541e2 100644
--- a/drivers/clk/clk-wm831x.c
+++ b/drivers/clk/clk-wm831x.c
@@ -329,6 +329,7 @@ static const struct clk_ops wm831x_clkout_ops = {
 	.is_prepared = wm831x_clkout_is_prepared,
 	.prepare = wm831x_clkout_prepare,
 	.unprepare = wm831x_clkout_unprepare,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = wm831x_clkout_get_parent,
 	.set_parent = wm831x_clkout_set_parent,
 };

-- 
2.40.0

