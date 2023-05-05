Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980EAC77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbjEEL2l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjEEL2k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:40 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6707A88
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:39 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 2766B320030E;
        Fri,  5 May 2023 07:28:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286117; x=1683372517; bh=ER+fet4v2MEKBKvQO/8aEld1CvPdQ/gKISS
        pKV1SD6E=; b=E2zEof6/fOECfswzd8eAZOlgT/GrQS0Hg54u1s1kq4GWUhuwDlL
        P2ZOQ+VuS74TmmRjEwYCwfAjWPV6TAW3gJU+Xs5HmnOyH6pJRpNI5+O72uMc8JJt
        BNYRIU9VLJWC+6QYTzJ0CrNJdweiEb4UnxayCsHNn9XLOtdmoFgka3s/StRNiNdU
        yi9he8TtLJ5uR+osv7BLE5da6niE54fBw+j/WDOa9Xqy5fNSqL/mjtsIYhqpWOgp
        LseQiZP0WtALnvUTOj2fIVRIn2vBH6YrWPYDEdl6L5F2OQ+MGm8h3hqHsU3NxGQ0
        XFVmpu56+ov8FMsZWDCIv4xmIEo0tHmDJKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286117; x=1683372517; bh=ER+fet4v2MEKBKvQO/8aEld1CvPdQ/gKISS
        pKV1SD6E=; b=WzCtN4+mojNDs8ZeOFPzsr7Sz03IogA/IkKyslKPfI9+MJFkVHw
        FC/QU4lsFP/NscmrlYCRuFQh1f9Pwipa5zGlQdFPHkpeqVeb34siq6T4YumBUqqQ
        p90e4mCkBxKvO8yr/5Gk46Ha8WhC+HnID6G9lwDOhN62CjxD6cLWZQNpYtTMiAa5
        m2XoqZzz/yBmeQ+49eV3kDp8TCx6qDIP5q4N0VKGVh2zfOJep53dhcCEOE1ufl8W
        09Gvd+FwuoNhgUqnKsoRtDI6Dnyz3W5SLlGBtFRdMIOR/xuuudQfKsJQbL77QClP
        a7QfpRfEuhG9k1BR9nL7ukgd87a3VMaLSvQ==
X-ME-Sender: <xms:ZehUZEmPhsF71F9q8j-9rBQT0izLq0eQ4ThAMgcwvHVvwAet-RNbpg>
    <xme:ZehUZD20SPhZcnkWHQ5YaZ8y6_mlS054niC5aAc4yCof-4ij_bfbtvzgSF0tHKiAS
    CEMshXXvTCY2pA9eGI>
X-ME-Received: <xmr:ZehUZCrkfw4scFLcICk48OgVHyS_OwmuNSc-gwiSqZMFf6ojdjufXapDDcVKCsT6fAMG-H8PsOXDKgaVh5uErXeiIA8VopI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudegnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ZehUZAlODRvZZz04U7nwLjBH49IWZ9XgO7fS8uY6ndnDHqxL51MTRg>
    <xmx:ZehUZC0UVnMs6BGbugBbnMMsVlR-o97sgAfKnxTQWkoOzX0dJTV6Wg>
    <xmx:ZehUZHuhKZJB7SRCdfT_RpNBOGXqKtAX-eZGK1LwD1nJzsxaJcOamQ>
    <xmx:ZehUZLsLzonU3vZrHYbgvi0ozSgHYD9vZzNCY9gm0u90J89hHaq-Rg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:37 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:26:00 +0200
Subject: [PATCH v4 58/68] clk: imx: scu: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-58-971d5077e7d2@cerno.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=hvDwbs5hvcxU7mAGefyGmd/4UuO2+LMXGrKQwF6RW1w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fKMFps/SV26inbkQtv3nIz/HjQ8tfcVuHFmSrHLrFc
 ji3zOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRDfwM/8P5Kw7tYT1SMW2Tdveyk9
 JbPeptTq87x6u477texonG/JuMDCeM1AUcRB/u07WPiN3QcS5uyUvV6Tv0/ux4/2vLvL/+NcwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The iMX SCU clocks implements a mux with a set_parent hook, but doesn't
provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. The round_rate()
implementation being shared with other clocks, it's not removed.

And if it was an oversight, the clock behaviour can be adjusted later
on.

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
 drivers/clk/imx/clk-scu.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 417f893f8895..725b7b3edb63 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -250,6 +250,23 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
+/*
+ * clk_scu_determine_rate - Returns the closest rate for a SCU clock
+ * @hw: clock to round rate for
+ * @req: clock rate request
+ *
+ * Returns 0 on success, a negative error on failure
+ */
+static int clk_scu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
+{
+	/*
+	 * Assume we support all the requested rate and let the SCU firmware
+	 * to handle the left work
+	 */
+	return 0;
+}
+
 /*
  * clk_scu_round_rate - Round clock rate for a SCU clock
  * @hw: clock to round rate for
@@ -425,7 +442,7 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.round_rate = clk_scu_round_rate,
+	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,

-- 
2.40.0

