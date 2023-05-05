Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970F3C7EE23
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbjEEL2B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjEEL2A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:00 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E3C1A48C
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:43 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0ABE63200A57;
        Fri,  5 May 2023 07:26:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285997; x=1683372397; bh=3uQFrPBYouxVUYqp5BxbM9XO2zf2Lv/zn5G
        mW8qshEQ=; b=u/EM5PyaQkkiMNAFxfJt+iSZILlP5ngQGoxNdpjEM3jEaFRqH88
        Qm1TLzIiGUXWyig9dnSO/uu0wQzWNL/tYDyxgkmYwvAgGJPtJk2C+CcMz2lA3TAs
        2zcvC5r5YJSGCFZKm+1sP0PPmXskVyXsYg9ZqKBDolbVd3KYLXGJqKdAoJF7gJbw
        PNAXKvSkx0R9krZAGPdsQZsT5brC11V3QuP1XDRGg9lVeqDTKRsjTD8YqmvDS8as
        UBC+qkeA7cZrB25tl865L2TxVZn6zoh56gdlkZlsh06KOv5jr6vVbKCFIdBqhh68
        bFoUlVFcyHjVCoVNkbDep0xag9yu9sz+85g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285997; x=1683372397; bh=3uQFrPBYouxVUYqp5BxbM9XO2zf2Lv/zn5G
        mW8qshEQ=; b=aFJzoKf1OiOX3lgGh/z9ls0OmaeOZ6GCQs526kMXjJ62EhYfQ2j
        lfMM5MeEieBKj6lwfhy5FJBj16/xl1+7Daot3IEN0GLci7JF4Xcp2nw1e3bV984M
        BsTgQ5wfDE+yoggE/00O12gDzEsGL1K2yDAXxIS6yuyz8zSAqeZHYalXgH2gBUcF
        qa/bg9zvrHpDKEotX2QYjddPkqu4I3YASBr5n5Yo6uvtv+k1KbVfMeYrY0d+sQNZ
        CMbIcqeB8lDnCc7mVZrudevalKrFMgfmx0Fj5CFmF3YpIMEkkj6n5K9LgfnbnDdT
        c8fnsEqIea+XzHXntv/yzgAfq/YS5MzRhow==
X-ME-Sender: <xms:7edUZHhRKcDtkPiJwv-xrV-18abB4-pRnM1V93nDqXqAXcZOMqHpDQ>
    <xme:7edUZECcX2MqNy3vrJOjBAyZJtXKZY-wJPrBoVZQF2UAXFYFR9Pc4yXwC5Y_Zod2_
    LEee28HKQpv3jMxRF4>
X-ME-Received: <xmr:7edUZHFfd7jptA18pp0LF4xWPAe4oqRoEjTrwakrCdOFA2YN3NTD4vhUSxYKVmkME1-xN5uKLM0LRosahqrUhG-d83zrO_s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7edUZESVogl4m0p_O8ctlPEHcx8QhZ6IBG3BmFiASgnbpXRX1_Jlyw>
    <xmx:7edUZExqSPtPH_wd-x6hqYohG0nKGEqo4tVyOFHfUWA1Z6VyYkg10g>
    <xmx:7edUZK4mTHRiDotqeLmGcbW1SWqOp9LxyK6BjHRn1PGCspIuLHaNRA>
    <xmx:7edUZP_0Iawa-en7wYYmiLX4cWenNLue-T6xLaS5uIAK_afc0NWoGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:37 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:20 +0200
Subject: [PATCH v4 18/68] clk: qoriq: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-18-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=IEVspLIBynuD8d0bw0q7G8CwcozeVNaDJAIwti0nMto=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxcvzQp4Pz1ZU3inXm/DlXUyG4+ennqlWlJiv4Jo+LZJ
 Fn5SHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhIPj8jw7Fp21/8f68ipZRw67Tfuv
 aZ5uHX+C2WP7c0ZJ7Ve9u66RfD/9rpT6rs33GZpfnsUriQdyXn7c9vmxsErPbbcQjd27ZAixsA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Qoriq mux clocks implement a mux with a set_parent hook, but
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
 drivers/clk/clk-qoriq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 5eddb9f0d6bd..e3386fd98c5e 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -878,6 +878,7 @@ static u8 mux_get_parent(struct clk_hw *hw)
 }
 
 static const struct clk_ops cmux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = mux_get_parent,
 	.set_parent = mux_set_parent,
 };

-- 
2.40.0

