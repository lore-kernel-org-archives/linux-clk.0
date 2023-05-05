Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C254C7EE23
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjEEL1t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjEEL1s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:48 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FCD1AEDA
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:31 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 16C0032002E8;
        Fri,  5 May 2023 07:26:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285983; x=1683372383; bh=DYF33dGvIGnjnbO/zAM/gjrJd0meHumIQ7F
        5H2KZIzM=; b=ny1RnSOZhRvcV/u1vNuk8oIAVwPn79WPogmCZrhKvs0dopUqB7K
        mymTHXkLrnHqJ+1XtYFZWJsq8YXT7+ajG2aXPMav/39LPFJpkoJ6XHfu8nC1Pry4
        2h7c/F/iK/cEQHNJuUSzPDGbQb3b/qwhm/v6+LYYNOk7EH6vO6CWzZtVvVIAmB62
        XVzOyH1+MKjMmhb9583HDm5tTyJNlkRO3aIUkfNdJg/TGuRj8IRwU/KwYZWHcKny
        yrwMMMjmK7DcPKXkKBwtcS4iwvVuV2bOaPKS1nHHug/AHciLjYWdR0C8QGuF0SoH
        yJQ47ji3oCogMe79gS40LTxK+CHvELvXW1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285983; x=1683372383; bh=DYF33dGvIGnjnbO/zAM/gjrJd0meHumIQ7F
        5H2KZIzM=; b=ATfio49kZfmW2k2zkQQXvRt8L2p9b8BUYcoL8N12A7y+SCVhek2
        ik4j2gf9Mr+2Q3eMISXSuJES9YK9dcN5a9ZjoR2H9vJCGx1w0arOTFMiVvlM5ZHR
        ro5HjceKu5yxnTSJm06sgBa7fAlQlvSXqchg3hueyugE+I5Bceb1tC8VxH18WRrg
        T0mRYgVqx1c2BCd4fzmvd4kUoPVXa7Xym2177KRSxSHJGCES7Z8jXqeDsyTrVrH8
        Sra/NfYLwFiKUALUb4k3jC3BOK6G8JTtRIelHJWxrJFFCvKSGmByvqJLK/MXGIz3
        +fne7XWmBYVNHgaxUGEzzoTihW0ARnnmcDg==
X-ME-Sender: <xms:3-dUZIbf3JTAcl5BW6X63an8l-GE-pfavnNxyTCE0Ib78HIW7kHDJg>
    <xme:3-dUZDasW15ynAmdNaa0amwlkr3BGXFNcO0m-e_nyj3eFIzvcLD3mJPAlPWquOdGD
    95annkZ63iqApCCPxo>
X-ME-Received: <xmr:3-dUZC8v6RaGKFYs1LNBRlJoJfI4LRqcnHdd_P-yCi3aGOfUA0J_IJPEDu_qmr3-yr41TKhwmppiwnoldsyvuttIOuouiHY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3-dUZCq95Me-mvLSEjzfT2B5930jvRcHc4vMCPbCiax9w1oZvJ-08g>
    <xmx:3-dUZDoLVKlwhPv0IaLFthKSTw3s1-VAaXQ3YM1T4IgAwQIbh5Ak8Q>
    <xmx:3-dUZASAPcEVDYqLEV4sCLuJJRjzgin73y2zHbLO5QLVxA9yOsPFLg>
    <xmx:3-dUZK2F-2gxcq2aKnV_QYKZWmQDkY--4u53g-3_Zqv5BnT1vyW2_A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:23 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:15 +0200
Subject: [PATCH v4 13/68] clk: k210: pll: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-13-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=tx2779gvFmRg6n11yEWbc0Wyatc/EXeJLObE8AQx3VM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxc79PFH1Cf7fVixa16D/YoZAf2V+sfPC3mdTXqbZhJk
 wF/fUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlcc2NkaN3BOU3CaUO9T26l93LL1A
 ouDe9ZfsezZtQVbwj7YvC7l+F/lUqvyoIU3kuTl7xdHOYs8bxdZvGefYcdXknOZnzx86E+LwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The K210 PLL clock implements a mux with a set_parent hook, but
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
index 4eed667eddaf..21d942065a3e 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -537,6 +537,7 @@ static const struct clk_ops k210_pll2_ops = {
 	.disable	= k210_pll_disable,
 	.is_enabled	= k210_pll_is_enabled,
 	.recalc_rate	= k210_pll_get_rate,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.set_parent	= k210_pll2_set_parent,
 	.get_parent	= k210_pll2_get_parent,
 };

-- 
2.40.0

