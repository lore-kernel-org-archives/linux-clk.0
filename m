Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B964C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjEEL2B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjEEL17 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:59 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8161D124AD
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:43 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id C935B3200A5B;
        Fri,  5 May 2023 07:26:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286000; x=1683372400; bh=MksZx16L/8JYqPLolIdTCXUKpUNhTZP1cQu
        0fFeLG00=; b=vjH5PZ875nEFtuPQcUPpkqL9QUkzmh8opyHFLHgv0M1kNTZ+zX8
        Z+4+E7H1h73sHij48Ts2uwZowTj4clf6ZIBYUabJQ8lT0sYP4dEddiT5JCheD240
        J4zrOrgpt0TkwwqXDnXKHKqpE4WnpB7/uluxOGd2aKK7QokFkd75R7OMGeAJ/nu5
        4wq5ZaeeHgHgc1V4KkqAr38WC9m+3/JZn/vWowRE2heyg7xvbFD83msCuUzLWVdU
        8g1lmho1Ebi9UHGjmrW/GTUnWk/un44LpaYe7lpEvaSUzps/3u5SdvGsYydKiZE0
        Uj39VZgB9j3ztYF3atFLZpg8BtfffRjzZnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286000; x=1683372400; bh=MksZx16L/8JYqPLolIdTCXUKpUNhTZP1cQu
        0fFeLG00=; b=NBLo8R1IcL2qMBNWRqraZBBubUFZeRRCR+wNBeubpE988kI0YEP
        chkBKu4/yUhzP/m1+mvATtzGrnH6qbCOS1Vqe4zuN54ylhiKizOj3wylQqg3zDQV
        q9WCCJcF51Db99VUKwQa78Jj3ETc30a6YEwH0FH3bygJG5CBhXodei9GIdp61fQG
        fMMREar7HqOZ8fJx3By8gL6X0w4f8pWI0/XVJSeA3hqegjqfS/nlG1FMIM2cCsmi
        CGHsQVmM4myMgk9PRyGCh9R7FcyXN1IhGqry0b3DEKVzs0DuGC+IbwZrMCFMHRkI
        +abvA9rq/4Nd3t8reBVbNfsF9ubemD1n8Og==
X-ME-Sender: <xms:8OdUZKSNaz_ye7vJODU8veiaBYPtxHrIJaopOSAQ0lYWp9U7SzGmAA>
    <xme:8OdUZPzCMrUCQ-zArqiIejmNY6_xBtsSk3YX5ggATlI0sTMULPRrozy3O03-odMB7
    xCi6SwyyK2wuhGMa4A>
X-ME-Received: <xmr:8OdUZH3FewFPWP41Km_voyiuToe_kZhm5FtHKCU24rgqkLFAzkA4V83xXKDTPUjuqf71mgQcaiAONYJZM0FvqDgQ6PqQxvk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8OdUZGDQQI8BUanulwBwGtfZlvL1oqtYMojxwwYp1mLg8OSms6Ul4w>
    <xmx:8OdUZDi9ks6hAtXYzv4IdE87IpS19Thv9qQpwXwVFSyWM6FvaRINPQ>
    <xmx:8OdUZCp9AUuHcds3Nndk6stdTHJ8Zkp6XgyZflBBUJ3gKswV47nw1g>
    <xmx:8OdUZGs5U6Kq2RdimtSY_CvH5OFAJ-wuD5TYaZTyLaCJhkFqHpbKRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:39 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:21 +0200
Subject: [PATCH v4 19/68] clk: si5341: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-19-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=8M2rq/frXwJrgSgEIiAT0JuzTH8kFo00GD+lD/XYRbQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxcft/f7bLLN/nFPWLza3U/Ks+9aGTpfqMyJaLly8ZGH
 136WjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExk50ZGhju/2Gt3VMb2h2rztYoZMk
 ss2x1svE7Z7tx8iX0x0fufnWFkOB10LTm86H5588GEL0clrlhtrA9SCz4/51Gr+5bvvBuWswMA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SI5341 clock implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5341.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 0e528d7ba656..4b65def64109 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -551,6 +551,7 @@ static int si5341_clk_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops si5341_clk_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent = si5341_clk_set_parent,
 	.get_parent = si5341_clk_get_parent,
 	.recalc_rate = si5341_clk_recalc_rate,

-- 
2.40.0

