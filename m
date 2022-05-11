Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7679CC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241347AbiEKOob (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244976AbiEKOoP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:44:15 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5009E7330
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:44:13 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 0FEE432009D6;
        Wed, 11 May 2022 10:44:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 11 May 2022 10:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280251; x=1652366651; bh=ol
        /21gC41IBHmFEPHuBusKIt/4fGmF0WWmjLNmMAuWY=; b=UMi0mJ9AtUQes83E/h
        0Eo+MIAKfbgsDTHaK7S1LQShyBbocXXJvJ3ryx7Ha+poRIVQ4X5pxRfMUKGliUFt
        A22jYRNyXD7vTBOVik763KMG78/WlT0PGQ5L6TdtNgl9EDc+Db+nyjbWmm/VLvYm
        1ymd0u0WZzenGKtRJZRAI5bMsiSmTRKQLx29DYcBjLtYrSphjMzuyJPAH/Ia/XEv
        QY46gP20JyLDfDZlurA6MR4j+QtUm+cfAXHk/wYS+t29rOm5PyjlAAT1fZIx0aBj
        0P5rIzElc6HJUyPFXEv1NdquDIOTXMbg+DyJh0eFMWo1E+boBm2yLx7W8JGCbXFA
        DNZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280251; x=1652366651; bh=ol/21gC41IBHmFEPHuBusKIt/4fGmF0WWmj
        LNmMAuWY=; b=iZS4hdAF6Kx07vYn9kjQ80Qhyw/+TEJNoZ6BCPaic2+oL99Q+gM
        pB76aWAr3Sl8UdB2Yo6XkCrbuc3zaQS6T/RqkdiaiZv9XLM4FDDRfLoqpb/3/GjK
        uU8BsOM73qny4IP/bMYep94kHPkLCt9GN4cSKJLCVO5TBvscFhiSXrGEE/T1kVrD
        z3z0b+2q25WFWBe+ddUpvz+uLigGA9AsMgjbRbDGHbWi8EYgp9N5xE5YDo6nIA4E
        e1206yFgrwTK2NBcrEInYS3hkkj0i2QyafJq6ovV1zX59j1jAg0n2xGq0PR4jqHA
        Mh6xIfJL4ZaeIVs8Iy7+CIP6UltM/EbY5vA==
X-ME-Sender: <xms:u8t7YiZaQZsf_ce3qJLidK4VpfzQDQyZBeaENVNZ6G1DbZzLJdE9zg>
    <xme:u8t7YlaizygUwq_9gMin--qF8cSngwZyBVGXl7ajLnHSUux7-o89HK1ZKiE-tgtrf
    eMZbmzk9V0O9EzTfZ4>
X-ME-Received: <xmr:u8t7Ys-66R6pv6QACwkxvfMYJ0FFzlvtaiv-MWtRcCyopsPpDouLCcb61vfZl2PlMiH2RYoCvg4aWUIps23PKTpkKAiqa5ErCHf7mvc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:u8t7YkrwESX3omsi2mJUqfWQnZ0bzMexMn1zPEBS8Aek7WQWuOLNUw>
    <xmx:u8t7YtqPAdOd_E0akaFTXUoZqA13ADnvOXN_CYPkp2wUhrfw7quNww>
    <xmx:u8t7YiS4xmhZxmZXxQbhFLL3zPduL2bgY-MuSxj5PZ9EFBqPUvPkKQ>
    <xmx:u8t7YqjMsxUZMm494vUDQa8_nhcXut65LRlSuYuDG_2WeALmrKc-yw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:44:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 20/28] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Wed, 11 May 2022 16:42:41 +0200
Message-Id: <20220511144249.354775-21-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_mux_determine_rate_flags() will call into __clk_determine_rate()
with a clk_hw pointer, while it has access to the clk_core pointer
already.

This leads to back and forth between clk_hw and clk_core, while
__clk_determine_rate will only call clk_core_round_rate_nolock() with
the clk_core pointer it retrieved from the clk_hw.

Let's simplify things a bit by calling into clk_core_round_rate_nolock
directly.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 3a94d3e76f59..1a217c21be48 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -536,6 +536,9 @@ static bool mux_is_better_rate(unsigned long rate, unsigned long now,
 	return now <= rate && now > best;
 }
 
+static int clk_core_round_rate_nolock(struct clk_core *core,
+				      struct clk_rate_request *req);
+
 int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags)
@@ -549,8 +552,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent = core->parent;
 		if (core->flags & CLK_SET_RATE_PARENT) {
-			ret = __clk_determine_rate(parent ? parent->hw : NULL,
-						   &parent_req);
+			if (!parent) {
+				req->rate = 0;
+				return 0;
+			}
+
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				return ret;
 
@@ -573,7 +580,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 
 		if (core->flags & CLK_SET_RATE_PARENT) {
 			parent_req = *req;
-			ret = __clk_determine_rate(parent->hw, &parent_req);
+			ret = clk_core_round_rate_nolock(parent, &parent_req);
 			if (ret)
 				continue;
 		} else {
-- 
2.36.1

