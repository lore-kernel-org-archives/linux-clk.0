Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E47C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244956AbiEKOoB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243185AbiEKOn7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:59 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF6FEAB83
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:58 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id B61DF32009D6;
        Wed, 11 May 2022 10:43:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280236; x=1652366636; bh=sX
        U409CDry+ZQ8Bb2+csHB3PifKzZPG73QrFFW8wL8k=; b=TBr0PWxoHQhlbcJXpp
        cA/KaKPXBdVfcB/CBMPE8Q73759HQOvYXlPv5tYKgMNV8goRB6aMhEolUWZi7R4t
        k97lbCmRjyWwlLtzla4ulp2J54Y336ujhWtnx1jqnKW/3EWyg4VWYCsZfNSxDuHd
        iJbmgUf3IFbCmKvYG1ezDkTrDeKN2byQ7Xrl8iCxACoJAJmpX05TsIJt/oDLjvDI
        ZrJpPheoIuEWvTxVTEnM4+BapTyaMmeoqXx5bzE8pSznpEdH8ZbIrtifMPcbNhf0
        2WACHDLQMxKOIC/qe78WKa0+I5VhaFKoFv+2njpMmhDx6/G0U7mDV8bjkaXadUHa
        nQZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280236; x=1652366636; bh=sXU409CDry+ZQ8Bb2+csHB3PifKzZPG73Qr
        FFW8wL8k=; b=zOB5QwwtoD4BSeEhYBxqXPOX0620aoy0ompK87FWcU8/woeB4MR
        6ZPErvNmYMDrgrr9MYaLb1+gA3uUbO5e5saFgcIC46dWe0YM4gvN0/0Z3c+ueufr
        3tXkT3qs88uYhSn0K0Z0AUdSVRnDfNqkcKh5qweU2pVO71T+ZlyrCWNSjo8NCIz8
        KHoOnvhjWYdxUN6xFlXrDwPeOMWsH1k6JG6i05sUz7BWzxRteUBMnhyHt6VAXLOH
        XuFBwyG4xH9cHxWstgw6LLGMcSlHBKdZpSNWL0tMub3GQ79RwjMhBcQK21QBqj/f
        2GeWgIjEI3l1TWA/JzhHIxg3+0i5EiIHEVA==
X-ME-Sender: <xms:q8t7YlgSESa5z580jpDRb4kZKJVDpj3tkU4FREp4bcSQXzrCBSnK-Q>
    <xme:q8t7YqD71QzY4e9SXFqSYmYJTNw0X9pWnmw3USbnqq0MzDCu2jL4DchLBKPB8nhan
    l4bccA7XQ3J3ozMsvM>
X-ME-Received: <xmr:q8t7YlE7DmYKw2aN4pAf7Al1yU4ctR1-TF91IJvOxKU5jdmcFKPSJTN2wG2u76xy8CeMANIi8OMjUU2d3TWY-aA6N0s8Kc_lgDBqSxo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:q8t7YqRz6W7er8_nGltx_cPZkE7CzMWdMxi6aZ-163krrcoa_y36dw>
    <xmx:q8t7YixZvwYjrWmxPNsb4dogXXWBflN93NVOVyIdnpK4G5NF-tKPNg>
    <xmx:q8t7Yg4cDaeTZ8eLyQ8gL_XjVfqhYDikBhWHAhzVza7rMenLiwOLPA>
    <xmx:rMt7YnqOnq33mCOD6yDslNQdZnXEU28UbyzfISANWK4rHmEzGKJIaw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:55 -0400 (EDT)
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
Subject: [PATCH v3 16/28] clk: Change clk_core_init_rate_req prototype
Date:   Wed, 11 May 2022 16:42:37 +0200
Message-Id: <20220511144249.354775-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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
index 263c893d3b09..ad8fca2bdf27 100644
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
2.36.1

