Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5822CC00140
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbiHOPnj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbiHOPnN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:13 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6053F6563
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:13 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 92EEF320096C;
        Mon, 15 Aug 2022 11:43:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 15 Aug 2022 11:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578191; x=1660664591; bh=u5
        snEjFVA6OGZ7Vz63WbYzTzRolx06gNaQEWnoVdHU0=; b=niREp1DO+aWxa2950p
        exolDst4OvzdBIRI0hgSieob1iK1KizrBjo917jjonhAmN6zyd6BBUR+A6SCOpsb
        tJ3w2A97C2uDn+5gw01vAdcusDjFWcWqkh7cMekMOM/JePiu4cMaveT4W/4Gssz8
        /Ikbzx/HO9hC7mq/4ymc3DzHlAJ/cndF6W6WjTriKKdr8Z0iCavblDO0SBkogXS7
        xzZnC+WgRNPYdZ4JdM3W7x8JLLn3vSpQndorjdpQzSVMp9dyg9Zsd3ccFqUL2g03
        CSLmiCjuxj7qeIaxsxKeSJtt0lHTj9OZ5LZn1oroax0P3l56F8jW5zSNdq1fg31d
        kGDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578191; x=1660664591; bh=u5snEjFVA6OGZ
        7Vz63WbYzTzRolx06gNaQEWnoVdHU0=; b=bIL/npJR6Adtzbr2997w866uI6EQ0
        pJxkaXTXibsDOl4LcnBJR+WYbFjl89niCvrAoj9l2KlN581Dn77CARLv5LWlPJP0
        MLIWEuCrH40geUnIuPnQ1xUSiE6WCcF0Amv+DdOD44h17XmQqAInc8Yol524EVvk
        Rtppmf+DKaNG5os49jfZL1pnXuxUaW9VOSu6fYcQ2IJKwZpozMw0WzyKyBw4DyhV
        CKjqipb0q3Xmid7Xb3ctKw02l78KryF+7/X2dE/eQBygvpHMvm9feYeEyRoLK22R
        kcaYNfEKYmG/0X/joIj4A6ywk2Mct28qebCQOSwZ08OozLN23sf68NkDA==
X-ME-Sender: <xms:jmn6Ym45w-lEWVNmBa_lrQMhJvAAyrSTpoFQbSLEI3r09jFl_9W-Gw>
    <xme:jmn6Yv5jFothDVpCO9myPn0g3_JSaec5SkJZxgbX-KxxFUPIrjlePV6KESvIBNtsX
    UsGCKGxTiZ01lA9KyM>
X-ME-Received: <xmr:jmn6Ylcf578ADAclCVH8m9ocz5T1nou3nC9YCNsEHCwJK5pj4-R8P4LckLsa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jmn6YjLup_aBo0t6YCNCwI1LukRjMyoaeZx8IvsYlRO0x3eox4rTNA>
    <xmx:jmn6YqIb3RNwySe74L5YS4GqD1QJx3JwjH5rriGIrPaubRQ7nyKz4w>
    <xmx:jmn6YkzsNpKn9ZxiiWF9I0-Sz5jl8BzYnfOGIkicFuPHY27dIw8bAA>
    <xmx:j2n6YnDaKZueSAn2MyS-3NuDAN_Ge38z9GpOWeizMD3Ry8C_iDLllg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:10 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 18/25] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Mon, 15 Aug 2022 17:41:40 +0200
Message-Id: <20220815154147.1631441-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
index cd5b298f445e..ad851afcfdd2 100644
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
2.37.1

