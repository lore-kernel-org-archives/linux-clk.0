Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E55C7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjEEL14 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbjEEL1y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:54 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 089FC1AEE9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:37 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 7FE023200A46;
        Fri,  5 May 2023 07:26:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285989; x=1683372389; bh=+OESRdlAfraVEYHcBm22WJ9Hf/Gn2fNUihN
        eqCZTBBw=; b=0FNEhrmGOG3L7BSmz8imkYEeo1Sa4NgzHNAA1HyvBIm37od3Lts
        NyhtN5TsjdjY5Tkt2f2fdHs7935eSvJ7UmdR1luWBvky5kAInA6hTETVgkyt6kFN
        bJWGUZjRbrF4baLnwXBHss3b/Et0GuQ2J0zuH7Nng9Vfu3kCFAfpLNLM5q4D3ByS
        89LXqTgh7UsONvxliaoMGBsgkDWXXByGfB2sgWBVTBCbupEqmS93Ig0NyZ/6Y/C7
        UfYwAuh289HL897Ya86wjakKFqyiZ2wmRXl9nRz7Sn6MqK2exCy4QZOi0njPPGQk
        8mlx3Ydwv+9Mn4y2Nx/ZRyfckBEcB4G66YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285989; x=1683372389; bh=+OESRdlAfraVEYHcBm22WJ9Hf/Gn2fNUihN
        eqCZTBBw=; b=VYe0gwnW6W572WKwEZjGspJnrPq3t4fejjenU5mGmQMKmk6g4fC
        mLBlLwHICTY3LQhqYkbuwlU+60wvxGxqswKeOkvMnlsTL1WgmiF9XegnRyor2jzB
        b0JSoJfj5yBXCFJWaefoOfHoGgukETpc1s52UruvZrU0RLVuJ2hZca8UmB6h0rk7
        7mDB/zdsEXWdRbD2nblSYc1LDpgkz/hk08rjksg7xn9TxUMjuWq3UAjWeFb343OV
        mcpbVBgxnRG8myTS0QnIUCuoZhD1f6hWAjfiy2xGiz3TdHXra6Wt9/qaxKjAgOoe
        Vk8YRcx1UPDDmye6mHVKGNrH0ezsYi4cU0A==
X-ME-Sender: <xms:5edUZAv5yrzQ5uz2maSO6RO2oFZ8Iwv6cgz2vKjBahODD4bK7e8mDQ>
    <xme:5edUZNcHRiZp9suJWuiNjUOC4yaWayoxlOB3Oe-ooLYJCh1QDRlYbKBIRwrQ6uSaW
    7EmWjhAQCN3ztWokqc>
X-ME-Received: <xmr:5edUZLzYcNqlHC5SBevLvIFHlNOROtSWH598fGALC3DAMSEJt3HfcV_1vAzzcwSnEvdI8kXp66BJBM-z4BTgyuVRnbWwLHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5edUZDOc-H5-Vtlt_GUb3_rUinlem22QKxfDzBEo5EzsXa8eifwGuA>
    <xmx:5edUZA8YeOE44Nrt4kn5UnBUIKbnakQVhCcIw7jN12pBt6XhmXlR8A>
    <xmx:5edUZLVUepaUtlI0M8VoiQr__8NVkt8DCizdL9k9fmmO4RD0c0iQDA>
    <xmx:5edUZCJ4Yi_phBviiLCZp7zsycj-mxyAiYompfv19olmvZGPJzvnDA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:28 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:17 +0200
Subject: [PATCH v4 15/68] clk: k210: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-15-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=P2WWJt4DQNfqvSPUA0MDIVdXPHKUUGl8jwfoiAxPqmo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxfXebE/dbGyUt/08t11Vtc9Kwq+tWmVv67Tan+wo+yF
 7B73jlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExkSjDDfwfjrNLJNrnpp78FHQ62Vu
 jUfP7NU1/AU4t5rULaoWIXG0aGT/9mnzwT+o7z7qW2WgmtvoDE2gMLJ0sqxakWcDSpTXJmAAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The K210 mux clock implements a mux with a set_parent hook, but
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-k210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index b5b8fb29a347..870adac5cdee 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -776,6 +776,7 @@ static unsigned long k210_clk_get_rate(struct clk_hw *hw,
 static const struct clk_ops k210_clk_mux_ops = {
 	.enable		= k210_clk_enable,
 	.disable	= k210_clk_disable,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent	= k210_clk_set_parent,
 	.get_parent	= k210_clk_get_parent,
 	.recalc_rate	= k210_clk_get_rate,

-- 
2.40.0

