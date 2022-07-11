Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39F7C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiGKPZJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbiGKPZH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:07 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E431252A3
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:07 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id A15C55C01AE;
        Mon, 11 Jul 2022 11:25:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 11 Jul 2022 11:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553106; x=1657639506; bh=fF
        UXVm9M308nhX11ASStcY/C/PLK3rCToIyKqt+LUnU=; b=vJG+NYvk+uDEALCntr
        VRDeIbRjrodyuOWm8ke4Juj4X6D49JmVomkRWV+8I/LBy+iMDNbkWTLMqg8eWwZR
        kEfr3Z2OZqvqFTpNVtFmZYrl6CwYZPjRup2xrXEBZEOEaO0ua3+7roOAWfpboxEl
        YI5onQg/nv0Eq+gVXouYJnYAMz22QjcstkmhyFrmewxxsRBVzPh5W3ft1sSCkuhs
        PoEhikTQ0V8Ixw8qiBOkNt6akGZptC65zM+8oqp3HU/i5iUab8rC9eKwRfJUBepy
        94mFC18VrFUoFfyVUlVWjL/KHK8wGtzGvwwSPoqOozrkqCGxQdpV7r+8x2eI3+VU
        TzGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553106; x=1657639506; bh=fFUXVm9M308nh
        X11ASStcY/C/PLK3rCToIyKqt+LUnU=; b=24J54vIFFvdHXLsVYAQbqXNkwaxij
        b8N0usEgAorwQoxsMuohb0KUjIACf9ARUW2Rj1CMdsOsRYEr2/r2/VXmR89mEf6a
        aqgDBasQHb+OO8IdlQrzU3YszMwtsheMRrfn4mOmBAq/aVZ7iCwUYk4F/6tXwq9P
        saA00y74BHF4P/KAsucCDFumxbl2cyiv20fps7RdZX5JbqYfRwH5ZBFd4ihLn2Fb
        AYLvbBXxeMQbpi92RCdgPbzsgG0cnc8Zx0/zovKYZRkJ8EPLb7qeoeW3SZgS6gBq
        7MLVBAC1uuS3DRdD1htW+pywMimqLNUVyfUf7YK2ld8/7bYS/1WWYSPmA==
X-ME-Sender: <xms:0kDMYqkYhMpvnvDq6g5q1cqSiuhYzWDozVdErZ3V-_8a3oAy18LiVg>
    <xme:0kDMYh1yKHpfTbH6yfurVO2tYNQpGrqdy2XOzrX6-Ryj9sf6UctxPXTtQgZCVBt16
    XutWKNP9VyaSojWxMM>
X-ME-Received: <xmr:0kDMYor82ql-fdiYXHZfWoeG8YwvVuNnw55ZyKdcOymnPXddEclWSoZntRItmqIUG55YBt5vEBCNAEv9upa7PRPVLbOOhNXMFvajTJo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0kDMYunuPNEobi4crvRXhcypOSFyrQc83bKNC4fmTYPQHr1W0nPCdA>
    <xmx:0kDMYo3Tpl40BPPN2mIoIEhYd5euPuEtKrV5uFIv2CLcMmyR5GoFog>
    <xmx:0kDMYltd-_srUfWc1jv4CujZFRmS72WDtAY6LTlTDdVObv8EpkNOmA>
    <xmx:0kDMYhtjTaLLb1o9tPSSIyEvGbAwuF1w4ogvUqDRMbw4iT8tpq6TfA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:06 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 21/28] clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
Date:   Mon, 11 Jul 2022 17:24:17 +0200
Message-Id: <20220711152424.701311-22-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

