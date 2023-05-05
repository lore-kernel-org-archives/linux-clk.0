Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57366C77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjEEL21 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjEEL2S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:18 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FAC16343
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:16 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id BFD9732008FB;
        Fri,  5 May 2023 07:28:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:28:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286095; x=1683372495; bh=6038Wb1yIMQSTNcxHtVFOjM4nNjjX1PUdrn
        bzJSqaak=; b=WVgrdSIEQ+KInEgXWglZI64uqyeZYJa9e1+aUcBUX3vsM6R8yhO
        94wuR5c6JItclGIAJVV2zDQ4fpO0YvSZwXSztKuh32OxNRLS46g8EDg60se0SX7I
        YAxjGDaZKhD8v7Dr4OoqJcBiiXTO2CiC0vQ/zhOrv4d1Ehk3nD/N6iLSfAskoGMx
        T/0cJyQ7evY6jpStEKReh1Z8JN+L0R9Ag4xriS6Gl/ZqwkQU63T2C2YQjH3uK50G
        cu8pHFN+h6Xfn20b1VLHYSQ2oMhbQJv2qnSbleUVz+hFTGTYXR0lBbG8gK7AkA1N
        +AIq7Yd5yHkRzSOaEqRuHZS41zAaYjpOmRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286095; x=1683372495; bh=6038Wb1yIMQSTNcxHtVFOjM4nNjjX1PUdrn
        bzJSqaak=; b=BxV9hKYaaxC0z5HaQoBGvG2uQ7dBsnA8byRREnMve6IVicbcOXJ
        9SRhTAXjuqxNQhoLsKMPgJLMK2+9/ZQTV2+6le4vn59rBZCvPjNgtWia3LTGODOv
        EWWv3aTADReuk92Nz5DRXi3qhtsc+mMosHvghiZydIo3qmC93jbCZZvLEQRWqPnU
        zBi/yPTFMRG4xZ/Fc+5BGjDlpXVWmCLgtTHckiq9S0ts7dtk8LoRmlKFHvEtqaNG
        RWHv3A6jXhqjmKLxhR16ujMGGeZQAnlxF+06r9wn971ORYrSdJ5SaH8x2VzqPFzv
        GRVeIDGug6/4nyxhI70h41iqsT4PonzIelQ==
X-ME-Sender: <xms:T-hUZPgN67XzX_mObzeOAItWqqBpMMZ6xDBUQTeEPqdWRMvBkbtSJw>
    <xme:T-hUZMDeN9zvrm5gy3OCHclvA4SDbro7yrFxpK6wauheHgloAnHBn3mP_omX50GsJ
    fgUn2lounjEayfKhe8>
X-ME-Received: <xmr:T-hUZPGvSsZMf1x20RRJji6VgFa6jEKeodyJSLpPfzinNQAFhy9Qc1MFFaOC1Bd90cj3sPaAQqY3NxFmuh6VIVVFx5wBzx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:T-hUZMTb7vz8y3QDDPOiIo9JPcluQEReMZIXX9s6QLcizZMjl7rhOw>
    <xmx:T-hUZMxuGRi0f_nPOIyojtwxsSzpDG75I85NH2YUfa0GMEo6ftsTGw>
    <xmx:T-hUZC4RVqlmbn6SV3edsyT289FfwdHHTa3k2KAbmpTRrGfUPhYGCg>
    <xmx:T-hUZH8JX1tqCtn-JtBxe2tvcBQjKdzr-YxL_VUUGJ7dwVgtYF6KBQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:14 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:52 +0200
Subject: [PATCH v4 50/68] clk: axi-clkgen: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-50-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+trBbQOXrS0+UKHh9hoh760H9Vj/FoeLh3zyKaozfcU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5ceLAo9eMjIZMUdx4jnP85lfNv1/c68pQ89H/+zexq2
 7F6xZUcpC4MYF4OsmCJLjLD5krhTs153svHNg5nDygQyhIGLUwAm8mAyw/8K7ctfZrLOqT2979rPjW
 /NYkMeWXnOj8hyefvXhSta0XwWw1/BtlxhiXD5b0EicdvLHv233cP52nPymoSbR1Q7nPTM+ZkB
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The AXI clkgen clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

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
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-axi-clkgen.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index a04a3d38c76e..bf4d8ddc93ae 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -384,23 +384,25 @@ static int axi_clkgen_set_rate(struct clk_hw *clk_hw,
 	return 0;
 }
 
-static long axi_clkgen_round_rate(struct clk_hw *hw, unsigned long rate,
-	unsigned long *parent_rate)
+static int axi_clkgen_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct axi_clkgen *axi_clkgen = clk_hw_to_axi_clkgen(hw);
 	const struct axi_clkgen_limits *limits = &axi_clkgen->limits;
 	unsigned int d, m, dout;
 	unsigned long long tmp;
 
-	axi_clkgen_calc_params(limits, *parent_rate, rate, &d, &m, &dout);
+	axi_clkgen_calc_params(limits, req->best_parent_rate, req->rate,
+			       &d, &m, &dout);
 
 	if (d == 0 || dout == 0 || m == 0)
 		return -EINVAL;
 
-	tmp = (unsigned long long)*parent_rate * m;
+	tmp = (unsigned long long)req->best_parent_rate * m;
 	tmp = DIV_ROUND_CLOSEST_ULL(tmp, dout * d);
 
-	return min_t(unsigned long long, tmp, LONG_MAX);
+	req->rate = min_t(unsigned long long, tmp, LONG_MAX);
+	return 0;
 }
 
 static unsigned int axi_clkgen_get_div(struct axi_clkgen *axi_clkgen,
@@ -495,7 +497,7 @@ static u8 axi_clkgen_get_parent(struct clk_hw *clk_hw)
 
 static const struct clk_ops axi_clkgen_ops = {
 	.recalc_rate = axi_clkgen_recalc_rate,
-	.round_rate = axi_clkgen_round_rate,
+	.determine_rate = axi_clkgen_determine_rate,
 	.set_rate = axi_clkgen_set_rate,
 	.enable = axi_clkgen_enable,
 	.disable = axi_clkgen_disable,

-- 
2.40.0

