Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C9FC7EE23
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbjEEL22 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjEEL2X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:23 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B8B7AB7
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:22 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5B83932008FB;
        Fri,  5 May 2023 07:28:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286100; x=1683372500; bh=CLyAsCng83/0yj6iLVpb6jdYBA2oGbjko27
        S0hO0VNA=; b=wi/79NhFbgTlKMkYlk9xGh4d75PkvK0BONr3WBbvYOWcBA88SfY
        jk8NBgvXhWpo2HxTSC4w0oGvnHwYNrnjpWCPj7JJI1TzUskAgIgr/D4iyFWRJG8Y
        FZ8sWEFNhXx9hUMb2OXRcf4UwUKM5Il2DL7yfOu4sO4IliI37B3z+EWCL3ivEsSc
        SjQZb7bWEC8M+XHeEBt3ND4dbuZjOl3n03KGDHQX4MRu8flHUwtFTZAM2xWI4+nb
        9R4kLUVnqQOVqAr4vLq2yBuyf/9hhUQwtNyFbvBMUbxm8g475bmmNNi47JrDV6y/
        nXgMTXjVPjg3JnPA7+ZEHpgWF0J0A2kPmNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286100; x=1683372500; bh=CLyAsCng83/0yj6iLVpb6jdYBA2oGbjko27
        S0hO0VNA=; b=jEoTctKsW8eLa49CI8LlAlTs5oXzxKSm9nwMfPhebO0jhAgDMtt
        nKZHrySM+gALrEDk4OMv3hC/d2pQL6lry0PnquqI1qn1BRv9YP5xMd4LtutjE5sC
        1d5ZS9IANhC2LokYJUixX/j5VbfXsViryYt1N4MAN/6HtzqvLSrQDQEm+xE2ASXq
        tVzmAnolyPJHjme5KSWYyd4XngCGYXsZm9xAkNb8DCDNJOTA81KFTa5TETNTcNpz
        +8dx7Mp7Tx1Y7M08s5XmfBRwK8TZ8AhkVmOS6ZUH18uOrMyOX0Q6mXSCOQG/TX44
        FJoeYS/bwdlVnPu45kGegLJx4w9CMzwJTvQ==
X-ME-Sender: <xms:VOhUZInU4FJWdHCcfdE3I0W0m_MoZ2oCRuI2PfwmMUhBM-3xWqNcpg>
    <xme:VOhUZH2w70yXVOCqLTTjTYLUlR_guMyB_9sGf5FrJ9JbCrvtrVhtM008iyYb1OEkO
    H3BVwzFl6tVgmHHm8g>
X-ME-Received: <xmr:VOhUZGrLOis7Oe5NMXkaXfxvadPu6gnYk7b37CI-nX_HqZlJRTufen8_XzVrO2Xd3yB25EvIo20GLRaFw22GMHhrjdkU9CY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VOhUZElEZfFjTTK2pCjyM6Kbwe86lDjdOBHMKKofd_DOW_KM1C-olw>
    <xmx:VOhUZG1tB0FvORqCobin00TBvOkCP-NWz8F0Ar-fugyJWfdTBLWfNA>
    <xmx:VOhUZLsh3EMnmV9kmM-vFO_3lqUrQ2gohmc3BhOl6-2n0DyJuQmK3g>
    <xmx:VOhUZLzjAmNqvwXAefk6oJU10A1TqO-UCCrV8AN-TBHcGsjwuytuNw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:20 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:54 +0200
Subject: [PATCH v4 52/68] clk: cdce706: clkout: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-52-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Max Filippov <jcmvbkbc@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2530; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=IXO8rIZXxXgRu3n8EJj/FnmcFLFod6ZGzyF0UdmrNlY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5duKOuc+k7zr2n+5q0nfW8qWBlnKvRN+eE8Y/niH6d2
 ycyr7ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEDmQyMmzyn7rztVVe0e0I11v7GE
 3W/lu4ckXj+4kH7/JvEZBiT5NnZPh+uqGTR+GPsEvxdfXoab/3MwYXfuoLuez2YHHE4f2s9iwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cdce706 clkout clocks implements a mux with a set_parent hook, but
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

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-cdce706.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 1c112bb51be6..34f57d36b7ff 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -423,11 +423,12 @@ static unsigned long cdce706_clkout_recalc_rate(struct clk_hw *hw,
 	return parent_rate;
 }
 
-static long cdce706_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int cdce706_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
-	*parent_rate = rate;
-	return rate;
+	req->best_parent_rate = req->rate;
+
+	return 0;
 }
 
 static int cdce706_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -442,7 +443,7 @@ static const struct clk_ops cdce706_clkout_ops = {
 	.set_parent = cdce706_clkout_set_parent,
 	.get_parent = cdce706_clkout_get_parent,
 	.recalc_rate = cdce706_clkout_recalc_rate,
-	.round_rate = cdce706_clkout_round_rate,
+	.determine_rate = cdce706_clkout_determine_rate,
 	.set_rate = cdce706_clkout_set_rate,
 };
 

-- 
2.40.0

