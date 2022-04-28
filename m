Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B152C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350259AbiD1Qrc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350251AbiD1Qrc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:32 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14802B1AB0
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:17 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 7ACE15C013B;
        Thu, 28 Apr 2022 12:44:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 28 Apr 2022 12:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164256; x=1651250656; bh=BZ
        r5tCA3ZGjgyMWFIRHsgRHdnHOLAYqel4bdN04qOtk=; b=oC8vidC0XiR1r4JTq/
        qQ1Ee7SQpHS9KNHDfOPxKvzTKF62Jyi8dDY4acXwVDQRbgFWFkSe8HcKGTM6PdCi
        lHprOVxNV7axVMSfYUfgljEqNRq2cb0drz7dWdb8BhtcOAhRZJjMjiG2stJx1iwU
        m70BE5gN9xGtQlvUDmUJkwt1cD1QBAQAH1PGGjvNSAuwsRojHYAMzezdZbvt63vV
        aeZt3/20YeYhS+KpayestA+hZM1+u9lctG91yh0O00WLNtOYGyYz0Ii3JwEpgcnZ
        5idjUmTUHkJNnVVerGvDtVudLrQxivLTXMhhF0tFrUcW46F3gRbTprlN5gDWTqUD
        wf/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164256; x=1651250656; bh=BZr5tCA3ZGjgyMWFIRHsgRHdnHOLAYqel4b
        dN04qOtk=; b=DB5yfNHWl9NMuuutKf/6Lvri/FCvuhG8kiU+9GaDd8rrztRKvBo
        V5zv3KD3aig+9SfeU1kMdu9Gq5KfJ4txl/NHw8zdVSGUoxbR5n1AMxJUFyxP0RCS
        vP1BGtJLQknuFgS9dyzX+IM8XB/emK9OHh0XpuWYBz0z/MydZgZx2sIqEwEDWlN3
        R4R3ZwpaPLgsObZ0t5JlDGxcy6aVnaMjOwJDHqXtuW4mk2GwTYN9ZItevAM9m+4k
        3JbBvwET7PKIFSjYu3bDVbb23Ztg9xz7FQNFW0//VEH4U101SSbsOU8IcilmHtCx
        kF9snPlHJvUrG8cJVd6w7CQgbZj7K4BKZKQ==
X-ME-Sender: <xms:YMRqYlwRx5IpvTCd1W9Zg3NpJdpBys3q2e9Bv-NmL2ta7-wiyPotxg>
    <xme:YMRqYlQoIWkRxFHLaaf4VQdiZEwmDJLrA2RMB-AYkuamdG85LMMN6PwVTLLoop5rA
    fatrbuMe74v_54vQlw>
X-ME-Received: <xmr:YMRqYvX7KYpnjySew13CFPeJeJ45P2AK1eg93KzV12dKog18rf_q_G-pVHXf1xV2hKOVFJgXrsrWKk4fpFfEAlbAp7UV0tL85iC-q1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YMRqYnjR_Yz0Takn4Oh5I3DlPQgqMwOVmyw_OgeQZ2C7iByfoftLuw>
    <xmx:YMRqYnDEJ3npvmrz_c92Q4XRkmROmFZlFE10q8NoueBnMpEPKmiTVQ>
    <xmx:YMRqYgLgkQjlcdpdSZNMwr2oQWLRFwwmr_OT-ooq5HPwZzqljCcAOQ>
    <xmx:YMRqYr5SyKVW04tzhNV0MyMblcHHja8QCJUFoBjV_isygGDZ6cgSsA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:15 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 16/28] clk: Change clk_core_init_rate_req prototype
Date:   Thu, 28 Apr 2022 18:43:26 +0200
Message-Id: <20220428164338.717443-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The expectation is that a clk_rate_request structure is supposed to be
initialized using clk_core_init_rate_req(), yet the rate we want to
request still needs to be set by hand.

Let's just pass the rate as a function argument so that callers don't
have any extra work to do.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4c4082a8fbb3..f7c130061b22 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1380,13 +1380,16 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 }
 
 static void clk_core_init_rate_req(struct clk_core * const core,
-				   struct clk_rate_request *req)
+				   struct clk_rate_request *req,
+				   unsigned long rate)
 {
 	struct clk_core *parent;
 
 	if (WARN_ON(!core || !req))
 		return;
 
+	req->rate = rate;
+
 	parent = core->parent;
 	if (parent) {
 		req->best_parent_hw = parent->hw;
@@ -1412,7 +1415,7 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		return 0;
 	}
 
-	clk_core_init_rate_req(core, req);
+	clk_core_init_rate_req(core, req, req->rate);
 
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
@@ -2001,11 +2004,10 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	if (clk_core_can_round(core)) {
 		struct clk_rate_request req;
 
-		req.rate = rate;
 		req.min_rate = min_rate;
 		req.max_rate = max_rate;
 
-		clk_core_init_rate_req(core, &req);
+		clk_core_init_rate_req(core, &req, rate);
 
 		ret = clk_core_determine_round_nolock(core, &req);
 		if (ret < 0)
-- 
2.35.1

