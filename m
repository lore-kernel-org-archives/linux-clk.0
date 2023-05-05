Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DA7C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjEEL23 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbjEEL20 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:26 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D70ACA5E6
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:24 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 2AF973200907;
        Fri,  5 May 2023 07:28:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 05 May 2023 07:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286103; x=1683372503; bh=qUUqWKLiD3gUWXbfDNLWoo4i00xAGxpMOV7
        UYAhyHN8=; b=ilRRm+cORoc85RQJYmHx56NDfYiy4MeRpoCbwOKmkLTswvZ1YEx
        ym7La/Leib/uzA7dt4YiRX4nYBhH7RT7ckwKJvm4Xcpk5ASyjazd9oxt/by6mkS9
        f9jAV1K4HENKiYyy7ItGf5v79RgJ+sk6B0JZCSFDGk8BzVYqT7ATgqrnkz+jqwWC
        wQU9l/rXvzorm8cIOY+A0cPag3VdUNvp3D/jFBo7vz32QqVZxi7vbzeHz93bg/rW
        kSrGZ3QDXj4UGSrqJS+s15+DYU87mcXbyEKIAua6IsklkUxmiRw91iHG5CsS7dSm
        8C4NRtfVIY8mnZKK7t+H/z1L4PxW1OMY1aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286103; x=1683372503; bh=qUUqWKLiD3gUWXbfDNLWoo4i00xAGxpMOV7
        UYAhyHN8=; b=cELlfarIeQDnO6TIrmUIaJyQZyFH9pygfddvxILebwCEiYmfMOo
        zHSnZi1NkBMoKkvWbBEiQg73btUXl4yVVUbP+aAMd25XG03AGEfybTo4egGT+psg
        1h9g8SnjiO1GxdnX+XaU5/GptebCdMrPOw8AyUv5APGsw/DsIcwi2mMPO5ah7Pbt
        BtoZwwrxUZSjTZ9PbG5kRY+exp94hcU6NYRELn39JxwdZesrPEFBB/aWJ2KXcKSc
        hlP4+1VMCRuPpn7ml0lPXfhTnH/4YkkVHLrosHtWxUJIA8O0Nj2PszMmNWPBoapT
        8NQSBsSknHUY4fl8BQpRmGbQj40xMZyxwXg==
X-ME-Sender: <xms:V-hUZJE4SKkk2evFhUwslTfqTtlnDd4ZItdoWR8Bfx-Qq8evtZGxKQ>
    <xme:V-hUZOV3NCJ4ENv-Kx1Tt0DrJnEqD5NyJbUINMor6QgZFNGj3PQt5ZqQ1SFPoauHp
    C_J_BEod9C4QCAHFsM>
X-ME-Received: <xmr:V-hUZLIii8hCspdAW0Cskl8unYxk1A35t1v8nX1-UTZa9lpNW6wieoMiTDFs6YhMsNoGG3RD6pU4txX9UchpTrIZozvyK2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V-hUZPEdZQFRp5CtPxcUQbJ4DLgGrsy-qCnA8DP6wJTskRv0jUXqmQ>
    <xmx:V-hUZPUJZEX79bwChVFrYNjIdsg7DMzU0MJIY9gsfSV6BVFCPgRXYg>
    <xmx:V-hUZKP3TJH0GuDg4kIRJEuTdRE1T6cYXa3r-fioZ0RsGkXaiZVDRQ>
    <xmx:V-hUZMiASGxL3vKQi_IJ_DdDba1OMUWwz_lcj2OkyIfG2rlqbqe-oA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:23 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:55 +0200
Subject: [PATCH v4 53/68] clk: si5341: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-53-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3368; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=lJLqnW/FXABBvVFOF96gMjanHTYTQIuvl+7bHKom53U=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5cmqFt3PTZxNRd88ChYUiaSZ4FcoUmKZzlj5+uJls35
 5250lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCIvqxn+u0pq/FiYHWtoxs2/I5ynQt
 jsSEb0L/ky2Yf1It/eJRYtZPhnu231Ra1k5rePFrzTE3efafVxfyT/DMXlcyQkexavEvdgAAA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SI5341 output clocks implements a mux with a set_parent hook, but
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
 drivers/clk/clk-si5341.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 4b65def64109..68160510f448 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -828,19 +828,20 @@ static unsigned long si5341_output_clk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / r_divider;
 }
 
-static long si5341_output_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int si5341_output_clk_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
+	unsigned long rate = req->rate;
 	unsigned long r;
 
 	if (!rate)
 		return 0;
 
-	r = *parent_rate >> 1;
+	r = req->best_parent_rate >> 1;
 
 	/* If rate is an even divisor, no changes to parent required */
 	if (r && !(r % rate))
-		return (long)rate;
+		return 0;
 
 	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
 		if (rate > 200000000) {
@@ -850,14 +851,15 @@ static long si5341_output_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 			/* Take a parent frequency near 400 MHz */
 			r = (400000000u / rate) & ~1;
 		}
-		*parent_rate = r * rate;
+		req->best_parent_rate = r * rate;
 	} else {
 		/* We cannot change our parent's rate, report what we can do */
 		r /= rate;
-		rate = *parent_rate / (r << 1);
+		rate = req->best_parent_rate / (r << 1);
 	}
 
-	return rate;
+	req->rate = rate;
+	return 0;
 }
 
 static int si5341_output_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -930,7 +932,7 @@ static const struct clk_ops si5341_output_clk_ops = {
 	.prepare = si5341_output_clk_prepare,
 	.unprepare = si5341_output_clk_unprepare,
 	.recalc_rate = si5341_output_clk_recalc_rate,
-	.round_rate = si5341_output_clk_round_rate,
+	.determine_rate = si5341_output_clk_determine_rate,
 	.set_rate = si5341_output_clk_set_rate,
 	.set_parent = si5341_output_set_parent,
 	.get_parent = si5341_output_get_parent,

-- 
2.40.0

