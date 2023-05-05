Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B65C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbjEEL2N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjEEL2H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:07 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075C7160B7
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:56 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 4CE353200A5E;
        Fri,  5 May 2023 07:27:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 05 May 2023 07:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286039; x=1683372439; bh=/8vS7746EavNLkfSDGgU0Z+sinJyCAw7umJ
        X4PnugEg=; b=dSYVgJq8bneabGuoo7m8W556rzHkXfOyvvcSr+Clf+P3Z8ilIn0
        6tPZ4K5aPjd+7eQfk0qgNkpS/j4AtJ97/d55prVB/yTsN/TXW4H8jdGjdMVFBAXT
        /Sf5emS0huuXFyZFjmE8KmC+fijpzd60s6cApIX7mCnPGgMUrqtWybF0aFDwAuiB
        Lgxmuk+sZd8abvfsp78x7mJNhUHNxM6/KY18B4ZkIUfLGlW1Q4KarfNo7GDJ7GWX
        uaBaOK5iNuyJFaxFbJdH+DvduodROoofL16bLnbXTfUB6TpmP4taYbyMmxWCy2np
        ESYArXfu+sx7r5rF5eD45f7/z9vSNIxenvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286039; x=1683372439; bh=/8vS7746EavNLkfSDGgU0Z+sinJyCAw7umJ
        X4PnugEg=; b=LMEr3KQqsiYtTyIUyUnXCfOdmJMue2xT5/EmeOcjVc7zOPZt1QQ
        ojFrUFB5iGD7L22y3i5xL01uEZ6YzXRq/vXYHLgxP1DOdx/EYQwbujPL3YYGaXk0
        55aWx4h8F2GY8y/2vsPyUdQ+tfjERZAAW2LdC4iEumAdHTvZhpE+2PV5kQY80aSP
        zrZ1hgg9h6WPS00hy5IA4XBY21TM+LFJ2tS8wPOpiUShNfnODv2Etg988koa2H05
        46BGbIdwhx0v4nljLMnS6rK2y2WjdDsO45GxHndxssa1TqEgaB/yqXxLeovRGtzz
        2RXXZeoKWwb5n04JkRc0sGpcCZ5II4ItFZA==
X-ME-Sender: <xms:F-hUZPmAWpaKprMGAuTDU2HhdLPC-r2ghsPtYPKHePqEuYwNFRkAMg>
    <xme:F-hUZC286m8tJvYko2gsRRFvVurmBUcY1P2usapt2Y2PBBBOH5SL6aCghK_VwjFqh
    8LogbQEz6WXYMM8brI>
X-ME-Received: <xmr:F-hUZFrl3gIUo4CCLMHp9hyPaZHwNrbICKfk2EJagW0Z8qEu3jxI_QHumu_ONMIiwjw3N6RSJo4iwjghuhRli2rHNWjDue8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:F-hUZHnv0Tp_1ZI4BgJfiS3z7YVqMlaflopbu4TzWNcxdNVvVYvjbw>
    <xmx:F-hUZN1wWZYQc4SHb2fWMYUQsMAJ1INbNbPirGXK6bkp6dtHDv31tw>
    <xmx:F-hUZGs4HpKUw17xGGO0Y8rWrT3L8h2jkqz6wE7GPWa15EOQ2pATBg>
    <xmx:F-hUZGwgDx25XFvaOkS10HKLy0o-ciL7cYEMBnMN2J8FruQilmjPWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:27:19 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:34 +0200
Subject: [PATCH v4 32/68] clk: socfpga: gate: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-32-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Dinh Nguyen <dinguyen@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=qKw2AmPh6svBdIvNTxW4zd2arysTAEpIRXq0Xe6UZzc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5fkFn05kSGhqzHN9tyiw10+gnkCQp+/9ScuMPL638y5
 oJ6to5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPZGszI8EK2rMHC1Pewu0HZY07nxX
 kzxOUSz/j9WSd2946RbTCnC8P/clfFO8zvL7AL2Va+YixRtlujGtqWznvvJNu/jGP9z86wAwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SoCFGPA gate clock implements a mux with a set_parent hook, but
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

Cc: Dinh Nguyen <dinguyen@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/socfpga/clk-gate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 32ccda960f28..8dd601bd8538 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -110,6 +110,7 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
 
 static struct clk_ops gateclk_ops = {
 	.recalc_rate = socfpga_clk_recalc_rate,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = socfpga_clk_get_parent,
 	.set_parent = socfpga_clk_set_parent,
 };

-- 
2.40.0

