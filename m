Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1020BC77B7F
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbjEEL2i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjEEL2h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:37 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E34C7A88
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:36 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 434B9320097D;
        Fri,  5 May 2023 07:28:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 05 May 2023 07:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286114; x=1683372514; bh=SgYllVLFwBX0dVr/+JkHzubTOFThg/UZfl0
        61+/e9qs=; b=tD2X6mElC0iLQzR0TbafixGRZBu0Pjted4GhumkUAnVNEJuYiUV
        v63KQXtG58WCm/B3ojFsu1wEAITnt8Vq8fvUqKgPJXt/A/GqXldKf+LyKDL1lvAU
        1uYyBiIIsOwTGNFHTsWYn1JRG7KtsmxrE66zbmAXFRXs2IiA6JNkqz5KmCUVit3K
        uf6dsC8GVUDkxGn8i2hkhTPsZFgwQeBq2jdjUCzha3aCMPtVHhqC8uHB2sd6qy1i
        vIj1vuB22/4xm3E33F5tf7cO54HLxT3e48JXiodnlgayUVdIGa5/SF+dvOZl0irS
        eHEBYvJ+ES+xPSRiw4tg40aBLUvuQAgT1SQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286114; x=1683372514; bh=SgYllVLFwBX0dVr/+JkHzubTOFThg/UZfl0
        61+/e9qs=; b=c6dVQs9fkDh1f3+4RiofWd7Ko5YsgMVrLKSqnCLzyrmGZ6kXJay
        A6O3MJ7ANPkoLdKfHVlThXnB9l96UjrKlp8xaAdF4eHsWJr5tRkPqkxvGrmysx+0
        Xno0eRs4ZitZHLelKilnfObj2zeWj9099jkFvl3hZUe5pKBUKxQHaKmk+t5i5rTb
        py4N7oqPv6CmBgg1SJiPJWkh5pGUqFhkDlbdt7RHqf5aLiQ+N54avPg25P94OQWB
        f+avf5bQgZUeKkCobNwu1RsM5bjc7Vs53ZjJOZoJGFu9v2TkcvK+ERR9AA5AVDsk
        FUoDT9WHxa3bqHXHSM+ioMiOgR48LlYWgXg==
X-ME-Sender: <xms:YuhUZGTGknvQU5BajGD04vC62eT7eOPiuyGF2EyeN8vQi8OhkfLkBA>
    <xme:YuhUZLxs4l_N5FEgMmlTEdsUqbOZM-lvTJKZS-Z5p1UvopQ3pVWxLTWANbpjQVLih
    D4HNf-kFhtaMhLQPxA>
X-ME-Received: <xmr:YuhUZD2MyX0KZXo08pYcAApAOtQvOYH_ILF5MurFOVe-LijTjbSDc-0-w0blN_No2DUnUtdKJXtnVf85QEk4qZ2ImX6bKV4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YuhUZCDw7hU227KUa-Q5ENFq8QX22vCAqko4DHO10LWXNR9ctyv4VQ>
    <xmx:YuhUZPjBPFxyQ9l8Ng_HEXwfmd_m5GnWD5pqIfio7V2m6ZVRDgxRwQ>
    <xmx:YuhUZOoCqj2hfBO9CFfqwJIeLp72L-T9mFDi-jy1hs-gzThEMrzowA>
    <xmx:YuhUZPfW37K2IQtmB1wIk9HfYcQJ8QuI9UF0pIoU-AGsh3Yf8CD5gQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:34 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:59 +0200
Subject: [PATCH v4 57/68] clk: da8xx: clk48: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-57-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2685; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=fR5eVkEkiiCwzMEJBs1+zVpH2JioeLjlPGObU2oWNSM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5dWrb04scuuOf8z6z2hNtbvaheneJ1MucKr+OfUkyVX
 H6m97yhlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBENu5gZFjPn2fq9ZAnaua++/ME/y
 ZPn828sU2ien7YtuZ5RnuLJS8w/E+VZGN3M6iUVsp9ti7Tnktia0jjccF93IV/L3e/4TOcwwgA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
hook, but doesn't provide a determine_rate implementation.

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

Cc: David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>
Acked-by: David Lechner <david@lechnology.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/davinci/da8xx-cfgchip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
index 1bbcc8e43bc5..e5b2cdfe88ce 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -462,10 +462,12 @@ static unsigned long da8xx_usb0_clk48_recalc_rate(struct clk_hw *hw,
 	return 48000000;
 }
 
-static long da8xx_usb0_clk48_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int da8xx_usb0_clk48_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
-	return 48000000;
+	req->rate = 48000000;
+
+	return 0;
 }
 
 static int da8xx_usb0_clk48_set_parent(struct clk_hw *hw, u8 index)
@@ -494,7 +496,7 @@ static const struct clk_ops da8xx_usb0_clk48_ops = {
 	.disable	= da8xx_usb0_clk48_disable,
 	.is_enabled	= da8xx_usb0_clk48_is_enabled,
 	.recalc_rate	= da8xx_usb0_clk48_recalc_rate,
-	.round_rate	= da8xx_usb0_clk48_round_rate,
+	.determine_rate	= da8xx_usb0_clk48_determine_rate,
 	.set_parent	= da8xx_usb0_clk48_set_parent,
 	.get_parent	= da8xx_usb0_clk48_get_parent,
 };

-- 
2.40.0

