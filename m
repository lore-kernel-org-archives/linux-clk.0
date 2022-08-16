Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0217C2BB41
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234575AbiHPLwS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235111AbiHPLvz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:51:55 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D058CD7D12
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:41 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 51CE1320091F;
        Tue, 16 Aug 2022 07:26:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Aug 2022 07:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649199; x=1660735599; bh=ER
        Lcjh1m1e6c9p6TZoLZPIWsUvZS+D5s8nF4lT6MG+c=; b=rn4C0f7V+nnzfmJP6P
        bQV8QqpRYWyEeEnsedvF/QIO/o407l2V3UgU18GRIX6wQdqDFQd4Do+JC2LKGghd
        Dq/ym5y0TjUAmQlLrlzEMbF9OdfiEl6J/dJJlpFMIQ8O3pH0d4mfkyvR4CWdJjoE
        KGTs8G/Tlfibs5trc7fMK+9lu2i+VXe1aXGvsZWyqdU3EfMe85Zxg//eWeGdfTnv
        adwAhQjIbE+V8iinWW7Ukxfo7HkxaJInJJCd9bjsIbcZ5bWoIZFJAtdDbpNllTkS
        G2PVTXnzfc6LL3cChEHFnfhBYtcAOXeumYNnUDL8Vz1oV2ZXyb5c4aXCuQ5WBZGy
        clkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649199; x=1660735599; bh=ERLcjh1m1e6c9
        p6TZoLZPIWsUvZS+D5s8nF4lT6MG+c=; b=cG1UgQ7kUTWnCLosKjsBGHvvuozW/
        CiHd4Vd9zmIwp4kc+kCG5cgByZV4nVs85OYkZYBCc48XUVGvYC99UauTv09Gw0rv
        Zw6H6qC5YjvjrV4ou8nLzzQs8XfMgSFju3xaTyr/RKgrAvcN3moW5NOlVDwZ0l9O
        a9NM/mjS/UsPcZ5Q3Euc0EptyfIujsCbPz2s+YND/4MCbyKOVVePZtMCsW2osGTN
        tLcRS4heLfVzDg5OXEDy0wu5bF4gX+Z1tio2po+ASb4jf9GXRRihEGMY1DCVuBJ6
        Qu4FfAdvBx65qklKtL+Aojduwt4Uhf0pL53jngL0XZrnUIg6gxZNmGqrA==
X-ME-Sender: <xms:7377YjXS-AopAscjIwMjsaKmn-CFoDME8bCa-Xggc1YiowQHd07fSA>
    <xme:7377Yrk6nz8buQsZzKBdoFnEH4Yz-ueIjkp09USX4lVYW4QoF8QKBmeqlRgnXFLJt
    2U3LQBT9Oib816iQt0>
X-ME-Received: <xmr:7377YvaOeq006eq7P4QppP5MUaFFOqr1G1K1kQ7haOhTVa6x9pmh2ETg8jU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7377YuVOS11dBMYoRvlvikBRsAhxi6PkPAGVRmLyHcC42BXpxmtRLw>
    <xmx:7377YtkZUu_yoYigMinT1zTupDFBXNmEZEr_tGhQ0LuKWWLDle1BbA>
    <xmx:7377YreTICze8vnUphCEEmer0brx0mO9aC8oBGuXSIqSCL6pxsGAwA>
    <xmx:7377YmfUxg5sW31D3_QEr488JS-xxPYJpAJjYB6bW7bsaXNJC1iD2g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:38 -0400 (EDT)
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
Subject: [PATCH v9 14/25] clk: Change clk_core_init_rate_req prototype
Date:   Tue, 16 Aug 2022 13:25:19 +0200
Message-Id: <20220816112530.1837489-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
index 91bb1ea0e147..75cfde9f917f 100644
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
@@ -2004,11 +2007,10 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
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

