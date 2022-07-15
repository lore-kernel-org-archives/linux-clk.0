Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6E2C43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiGOQCf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbiGOQB6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:58 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41CD7478E
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:57 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 5CEE832009DF;
        Fri, 15 Jul 2022 12:01:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 15 Jul 2022 12:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900915; x=1657987315; bh=fF
        UXVm9M308nhX11ASStcY/C/PLK3rCToIyKqt+LUnU=; b=BXYdpJ1iJlXz15QYEk
        B5J+OrI0pifkyWsk+6uXMpkfNLUX16VQOemEa4zXnmbj9REA7yif9NtO3sMeqlAc
        VL+4jtzOeAuDzyKc0JuLzXkD1uf2xhJrx/qfgxeJJ60osEgLlK013abj+oTmcdsA
        xU2FBnCxiU/pp9iIyJyBrsy/if0R/HH+rllXYA4uztuQVvtRyVp2GIqSuZG+XcAV
        glTUcLl3vCApY70men9gXYWEyfhTZRFR1Cfu7ToeTs3yfmxHQOurQATtddmhWf+Y
        Pqj9o+dWtl5yw0gBXkILPy68qZk0HIFd6Alke3bIH0cshwo6UTzDxQ8/B3jfrpJb
        /fmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900915; x=1657987315; bh=fFUXVm9M308nh
        X11ASStcY/C/PLK3rCToIyKqt+LUnU=; b=XfgSxhnAp8V8udx8uUBxYjdZ9fvlI
        dN4MObOS2MLUp0LKXAZD23a10O+9XGHwewnNoW3pm2KxXZshA9KeBpfzuMSqzl2e
        7MqaWk6yNqy/dxn583txIWoTe4F2U/6uhVe6nLKTTYkaLp3VS44fdFtLd7zNSFBf
        +i9xVcP+O3Nca0Cfmc/hGCtAf0LW3au5wpJGYjgUJ54LE+fpeAlYdWeSzXm+hYlL
        izlWXEAYvzh4M6WEB01zX4v90UHz+suLHAVortn/F8AL0B2n2in9Jt6LdDiSoxMW
        6eqJcHljuz0bbsb95BLAJfx1g0/KgaDYY8QoxCLjVXkLcVIwVXtVuOvcQ==
X-ME-Sender: <xms:co_RYsClZFqbWRkb0B-EBgfnvs0QFzWgUciXK7n0SZzXpTg-SXp0CQ>
    <xme:co_RYuguu36D8LrlETvmxgVdMESKlcobpL5JbADQ46UtOH2ZOS0nAqgRphWEIYHxJ
    bHd7REPCxE5er1Fivs>
X-ME-Received: <xmr:co_RYvnAF4c7wQvCXUbqwqpcuroDiQV_PyY5TQOuaN_8ZRbgAdzVJF57JSBj_rN6jNap0OKQTz3vNCQvAye2aLJavdfkCJmXw5vkvyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:co_RYixM7PQJeByFsVBkZh_6tsvrFHWNksXWeems9U0bG6J21cX_6A>
    <xmx:co_RYhS73zEwFR_xOrpMW2CIt-VVOatxdrsThNaNqC09WRiGfl8qxQ>
    <xmx:co_RYtY7rY1Zgsa49PypVgu20Zv8548xVHM6AEgNVe3rLRQ2Q68tFQ>
    <xmx:c4_RYmI6uz4KpbDj4lI2OzRvyK-yCy7SJGrFiS06usXKRFaNJ16oRA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:54 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 21/28] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Fri, 15 Jul 2022 18:00:07 +0200
Message-Id: <20220715160014.2623107-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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
2.36.1

