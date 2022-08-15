Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AF9C282E7
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbiHOPnI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbiHOPm4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:56 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D42B1DC
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:55 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 2751F3200933;
        Mon, 15 Aug 2022 11:42:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 11:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578173; x=1660664573; bh=7X
        IS6xHOazQ7ebe+FfOPBHvxrptcLHa5qCfqiURFCK8=; b=MZHmgDXpwP8omnWtjK
        zfqx/56CFqydne5nQ9ejk6KKdudmTp3erqL88fFMSBwv9zvDJnqjtUDYJzcfU5VG
        0rDF9dUIYTjk4zcGwTf74VGQ+FogkS+FuIKQiUg2BhEZEQglg6T/1KMyxkbZOVmB
        uLhMnSi5h8GcFaQi6XjAdRWKrWTWxrrlPcLVIJdZ6S1MkCkh9EGTLKbJ98U+IJat
        Tryb9YvI+pqaUlxq2lSf0ZTe/rEdEAyz8syO05csYS5rYD6LOHF8ZoF21xixashv
        jH+6DFIkDRFKC3/WezGIpldmwa+u3XWw57tQ+323gjdfO198GOzAqO4zxxQQ+EsG
        Po4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578173; x=1660664573; bh=7XIS6xHOazQ7e
        be+FfOPBHvxrptcLHa5qCfqiURFCK8=; b=V5PJrWv7FBxO3iBv0+NVPNNHjRmh7
        PnaiGL3UhVLmCbuqcoRxn7uGmwDDWPh4qFjp5x2TvTb+/6gI4hjjRLMd8zM5Mv8W
        w/cNTp8hzLXwlbVlh5ICTgTLrhrtImg658tbe8msux14upjNGBLQ9U35UV1b6gER
        VIuCi6kLixVURVNENBuEEYPMKUE0AW4ogi5xEEq3GlQOUA31VFeGSfRFaij9fdqD
        bkzWeVDdeezcw9lnAqwKzLZJaPt9vFJ583yg2vFUvQ02UwDuIRH9mfbgbP6rgxS0
        xxaQ4ERkm3KLEkhydzDQhYZTnvRVwitwQOyb5V/DVdBIXNH3G1EjiqOrQ==
X-ME-Sender: <xms:fWn6YqRvyhgavtNQjMcY3JTAlGecUIh8WY5wz-7Bb01xSsAOHqmJKQ>
    <xme:fWn6Yvz8pNkt_IPc2zkkts4iIA9qZY9rs7Qpzg5ynTP4lh2TD2qdZULIsZYNxwWbk
    w0jqgLoKtkW2FL6Trg>
X-ME-Received: <xmr:fWn6Yn13Op6Zbm6-bwkJYylXXlyB47d_fW_bCR0vbJYVsMpe8IRZCsIlks4G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fWn6YmCaXrgVRvoNf5_q4USWBXhT8ZmyC8VBiMMc9ba8RbePmzQJGQ>
    <xmx:fWn6Yji_vUtjVIqkGe7-nkN1-Sd86NnTDMoht3Ci10sOgn2AIhmdvQ>
    <xmx:fWn6YipXHRIOYZhOgIFI-70vfBBeTLMx7gjmWzrid9-_ckDyQBF9Vg>
    <xmx:fWn6YoaPcuyyrd7-IcH7ZA3s-ewDvFi1sgcSoWBl8rp_yl7BIKXSMw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:52 -0400 (EDT)
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
Subject: [PATCH v8 14/25] clk: Change clk_core_init_rate_req prototype
Date:   Mon, 15 Aug 2022 17:41:36 +0200
Message-Id: <20220815154147.1631441-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
index 6f5284f6cab5..6670e61edb31 100644
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
2.37.1

