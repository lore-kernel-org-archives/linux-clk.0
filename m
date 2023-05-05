Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FF0C7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjEEL1r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjEEL1q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:46 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8571AEC9
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:27 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 867123200392;
        Fri,  5 May 2023 07:26:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285978; x=1683372378; bh=ifT1/vtfIpSTa1WUN2HZqTOmFvGdCGAnXsb
        TAu0/nQY=; b=Fay3zBVgZbSB3ve+4UJhF89LOuEPEbx+YahO5z+9Q1/10mrJ/KI
        0TfezYFDzAW1JqxrgpcE9RgGmYnseMP+J9owq6S6KvpGu9NyXGTJSVTFZ8fdEIMY
        k2fvuSlu7SHtS8ZWZx7z8yaMXAVA9H+i0K5fPy34v1jJf5NYihszNbdStbzpFGlx
        aGCuydw4OaprSTAqbnIHJGhhq/bItLP44fS6DLGxzSQGmx66CcLyba1XCqj2Jxlw
        oPO6bfEJuVv75HfnjtPf6Q4drKaP7AfZBGxIbOLfMtiaFD4e+7J1tiDqyDGmSzrM
        W7CZAavqJZ34Adixo8jk4CtyfhTrFKG2p1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285978; x=1683372378; bh=ifT1/vtfIpSTa1WUN2HZqTOmFvGdCGAnXsb
        TAu0/nQY=; b=MmMdKrAY89AjCF9aAdKkxG4duvcSrcX6V0+7hx3OYsc8qeOaO2I
        59f97QG8UVXSck064azb/l6K72YXeZLHD8EH1nX88a3UJ/K/QQl5waUvoenv6sZA
        nPGr8cw7LIPh2IrWgEeTvoHdlDycC2HQJWEWVaBeJ1/u0zW7S7tLcMx4BEnR8M1Y
        ktFkszXsyDTS4T78enIHoTMrhsgYmVUy3NjEUFV4y3HkZS88b/dSLF+DIoPC7W+V
        nJNt96m1L2CMon+jpgcGXp7X0cspmRtuDigy3BCVXFvGcPMOqpuaxc4xo6okyE33
        JJjF8Em8QtCAwHWFC8VDyXeR1tO5/9GloEw==
X-ME-Sender: <xms:2udUZHoFCk1BTHUOwnvgwip695GqLF9rUtb2t_tm1en8pNO9oOH_zw>
    <xme:2udUZBoNnu5RxlKizALgC1nJv6h_PBJ96hn6S2ouYl2r95czqVrFqYdWIBbjx2g62
    EpHstdF_DCLbHy_h4A>
X-ME-Received: <xmr:2udUZENIaTBYMDFdCc2STOmdrdBoaemjUHdt83i9rb3TZtV7KmitUHYpFd16RM2MLGRYJWsotTH7Vg1RnAfAQZ4z9g0W_ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2udUZK5iZzD0zOnu5HVzCzzAZZg94lWH5f1CLDGdTE4fQusPeiFW1w>
    <xmx:2udUZG4cWZfCt_6JnoMovgv_157WyU6GD89PmR5_gMRmiQPEd1Cweg>
    <xmx:2udUZCiLypqI3AcR37x18zTvA04OKRQkOD_rwid4Vb3Qz3hcJE9TaA>
    <xmx:2udUZGEJ1gXiAjDNl2sXSWVMTqUehiW4KXlLGYGhJx_z3UKnxBmrJw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:17 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:13 +0200
Subject: [PATCH v4 11/68] clk: berlin: div: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-11-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2069; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=35rdD463368ofujnEXdbwDQAd8RArYswa99lnRTcO1k=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxd/lW2ziTm4e/+D0tl9p0RUfd4IWf4KWVHJybHaLPfp
 08M7O0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARLVaGP9xzeh/NM36ZdC/myyKvA4
 /+VzOckeGt9Z2larq02O79p2JGhjXnMspOdwWybTArTG9uT+4/yBzclj9rHbvP4vQmwyNSLAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Berlin2 divider clock implements a mux with a set_parent hook, but
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
 drivers/clk/berlin/berlin2-div.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/berlin/berlin2-div.c b/drivers/clk/berlin/berlin2-div.c
index eb14a5bc0507..0a248bfe2193 100644
--- a/drivers/clk/berlin/berlin2-div.c
+++ b/drivers/clk/berlin/berlin2-div.c
@@ -210,6 +210,7 @@ static unsigned long berlin2_div_recalc_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops berlin2_div_rate_ops = {
+	.determine_rate	= clk_hw_determine_rate_no_reparent,
 	.recalc_rate	= berlin2_div_recalc_rate,
 };
 

-- 
2.40.0

