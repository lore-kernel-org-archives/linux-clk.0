Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027DEC25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbiHPLwz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbiHPLwd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:33 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21796D8B1D
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:27:01 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id E6A4A3200657;
        Tue, 16 Aug 2022 07:26:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649218; x=1660735618; bh=fu
        49Gbb/AwR5Ds6BZJ7rBDMV+/ZyKUsZBZwPkPGknzg=; b=djlbCf4Qw86hN+mfUT
        MxEgm84rz6byZaoHso4DFZeHTLKLGbcwZJMHB/Z2tB3NyDOny7ESnkNHOdr5QlLp
        EqR3esjJ8za2hwgxCnUjcAKNebd8fLc9wYdhthj1l0ypMb27VgAjEM0ijNOtgHQW
        dYdOfib7xD7O09VYnd89Mfyet5VNg5i5eL5ysk4n6EBCQIBAiS4Q7eEZ3aRYE/ZS
        45uYqUlY+gAYII2G6sjFB8v3ORUHRzbI1SW++Iz5FT9vQxa7+l6zhs+3Nyc7yP/H
        567u1vnj5d3uxxvfy0RJevyjMD2Q/adowu+AQuzg13n4p+Ylm++Qhxm9bKy6lTxn
        UFoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649218; x=1660735618; bh=fu49Gbb/AwR5D
        s6BZJ7rBDMV+/ZyKUsZBZwPkPGknzg=; b=45S/SXo2N3Vni7bwo/5JZz0P7C9C2
        qR+nJ2IzZqT3fsuoqG6HSHDnXbGfL67kXMnZmhX51ZxxUpKu8qoXzTXp+fRQxGG1
        8ac+ZOAhURokMU26KJndVW2fn3Rsgx1yPU/m5m8beCf5/aWqw8nRhLZnS3a5tH4m
        sDeZ3rCcl6ZcsgPzc0OsXoBZoZgHPGY7dEurKHLg8bZj6XPdBo7OiYtHpbFApYeJ
        hU0YqZHHW9LTcEOA81Hu8/Gl2aTOA45zBBapIC/R1mjkBRhMyg9VRRX8bssxUO9N
        MHgaGJ2IrFu0hXC3KWPGroKL4fDYq6kqnwSs4A1Pv2ZCEqdHdBlHh53xg==
X-ME-Sender: <xms:An_7YsfZycG-Hn65qJKS_hrtPGquBoPcvnAtU2ZakOz1G1eFdvnT4g>
    <xme:An_7YuOfBHrHJbihJo0tuNnAHWwiS8xRlyy6EvVjCwscEQ0efOKlbz1Q1u-JuzPvo
    087ie_UPUZueb3mg4k>
X-ME-Received: <xmr:An_7YthdQlLt0fsskttldopcLMzjXZorg93e0F14IdraLRbBfEEWErWF3nI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:An_7Yh9xlb4uUl7EE_ijY7j_OjBkl-K-6X8tPTzvPA_O1CUEzaUc5A>
    <xmx:An_7YovIGtC91o_RQYFcqJEdRUeLedGEbRVbj14y7j1g7PLnu31g0Q>
    <xmx:An_7YoHhnpZRYAohMvDOCA2Rzhck3Z-hoRI-t0rPQvSgBPhaerwIqQ>
    <xmx:An_7YpmTwJvNQz4DQs_Sv0JKygEF_XCo-7SqC5O0SvckVHbMgecFNg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:57 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 18/25] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Tue, 16 Aug 2022 13:25:23 +0200
Message-Id: <20220816112530.1837489-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
index 2794bd3bef4b..f8a8bdd552d6 100644
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

