Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9458CC7EE26
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjEEL2F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjEEL2D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:03 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC4D1A61B
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:46 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 823463200A69;
        Fri,  5 May 2023 07:26:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 05 May 2023 07:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286003; x=1683372403; bh=LVfz7LD5avQVdWRjATmJJMIFpWciQ3yMgiu
        6oJ3/+m4=; b=kevcOMA2cmUTFrxAm3zFFeXPgMIJuhhU4/26H9W+NuHOe3WQICv
        FboMKloZoVC9Ht8qX77U4t8JTD45LmG0Rvpm/xLaGxE5tRtZeTqvD5JarQv7LO7T
        xnPIBMREXgxok9Ushp+6xeBAxglo/UsVcnAvOJzqmnY3PDghi7VRpdBIhcX8ldfg
        C1eE+4INIdFDlX/F8K1znRQEMer8W/gAIhogaAwIZfJkbdMc2nDawrA/c4ShHNuA
        zF858fYB3Y4QFEOsvpastGAHnGma/qRs34W1P3xfYI05TnXsXkBNMoIQ4tl2pcgW
        cUR/Q+V8xKWYCNvpGOywMR/Mj3UoAbp79hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286003; x=1683372403; bh=LVfz7LD5avQVdWRjATmJJMIFpWciQ3yMgiu
        6oJ3/+m4=; b=CYTOFlrpJPssqlSa5rep07WHqNnOxgVJLQOs654XB3W4kY6sKpa
        1L2Oku81eE9x769e5Q0oy9Q/JZHQ7C22KBFYXZK30FL39qJma+w1hgoii2vqY9zn
        4eZFsxPWD8BymQZiYDrlzz3oWIKjX5/k5osjTC04GVRkAnte8JdCNChC+WGbVsHc
        rkJAaqMOk4nPrV9LHBe5SUoODGgVRfT7sPsMbFA6Xbok6igWv9ZwHsvL3MIRF+5f
        WVIsX1XGDMmnJ4ZvQuEtND8m/k7+12rQxvxHZO+cSaXNCo9JfxqxGCs+9sKMgLj0
        YurveA0pA++wU/UqxZIoBntBqSShYalcIIA==
X-ME-Sender: <xms:8udUZFH6yQXPo_Oy7DNCEdlQR0_QOogQRHDY26cwMDkfajMul2-c7g>
    <xme:8udUZKV2hjbeMwqXIDyAAxej-DU0eyq0ODo25Gt4B2fTgpFXwjly0DO3WA34mg_fh
    OG9-19JgLFqs3TxN3g>
X-ME-Received: <xmr:8udUZHIaVXOlhTCV5T5YjAArFGpKgrEaDmDrTB3_xgkaTvxra3S8zcTMFNOoyFGTYcMSGZhoX51KwrhPbKvvSYYXxpqqiPE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8-dUZLEa-hLWZ2BC6IsqtKd7E6SGW2TjxqTgiFqGUdU2SEAWDvjlGw>
    <xmx:8-dUZLUn6B1_gEZ77WBxN6p9D0mwtGpjJcrhRPeCMwnYij8DNUeKjA>
    <xmx:8-dUZGMiSGFiXfbmq8jRvDVEYpthYWDeD7iaIVI_yIBVyuWxPLtYrw>
    <xmx:8-dUZNKVXoTi_UKT9O4CicH4EJTzyHAVC6JDdxU9WPPIei7N1mLjtQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:42 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:22 +0200
Subject: [PATCH v4 20/68] clk: stm32f4: mux: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-20-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=EiQTKXTxWl310eP7gvoXbVwd4WahDHb5ImRJPMpg1x8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxf/OyKwslul+tjbacI6e77szq8Ml903Ofj82sL9a3Z1
 5nH5dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi/zcz/LN6+mjn3uNb+3/y2swVFg
 y9FezIINh36HHo8Rs9KitMzSQZ/lmWnGl5L3u8paby+/KLX1n/Z69PXvC/rfZfEOuMqFlcX9kA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The STM32F4 mux clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidates to
trigger that parent change are either the assigned-clock-parents device
tree property or a call to clk_set_rate(), with determine_rate()
figuring out which parent is the best suited for a given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

However, the upstream device trees seem to use assigned-clock-parents on
that clock to force the parent at boot time, so it's likely that the
author intent was to force the parent through the device tree and
prevent any reparenting but through an explicit call to
clk_set_parent().

This case would be equivalent to setting the determine_rate
implementation to clk_hw_determine_rate_no_reparent(). Indeed, if no
determine_rate implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-stm32f4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 473dfe632cc5..07c13ebe327d 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -1045,6 +1045,7 @@ static int cclk_mux_set_parent(struct clk_hw *hw, u8 index)
 }
 
 static const struct clk_ops cclk_mux_ops = {
+	.determine_rate = clk_hw_determine_rate_no_reparent,
 	.get_parent = cclk_mux_get_parent,
 	.set_parent = cclk_mux_set_parent,
 };

-- 
2.40.0

