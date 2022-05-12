Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDC7C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238856AbiELQEz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356180AbiELQEy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:54 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F74961615
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:53 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E4F975C016D;
        Thu, 12 May 2022 12:04:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 12 May 2022 12:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371492; x=1652457892; bh=sX
        U409CDry+ZQ8Bb2+csHB3PifKzZPG73QrFFW8wL8k=; b=of9BhWESzbb0f/UVCn
        okCoj6Xl2AdFo20LFCepI/6oiN8rGiUASMEODPknojG3cMmFSPvtCtBHGn4nsFGi
        7cbqKQtzzQOHOLhr90olXRhBDCujyOh4JtnSAWug3+xEEL0IIOzRGXyZOxkYLgIT
        xG7LAO1vsTboTML1O1/g7bqee2eTBECZA6R4C+dJtqpBF7HkPMFFM6UrYw2KSVeT
        buRNPIYjznQb/uZzrEKGJeKn5eTco9VEMTXQpsNQFveoEufizx2Um6DuPqc+dEck
        41ckjOLn8AcFAaWxOjfaE1ZV92zrr8ViPck1LIl7t3KhoWzh8Iq9jYh1ui2Mw6DZ
        0UyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371492; x=1652457892; bh=sXU409CDry+ZQ8Bb2+csHB3PifKzZPG73Qr
        FFW8wL8k=; b=wmMfdivq/h9ChfHdpFPC0fmaNdiXgJ1uQ4UNRPJwh6xzjhOEwXu
        VDGtF+3GNG1csC7l3hTml/0mgNa/+Oi/oDU1202HQEAomrGxHbsSdHXMs95g5BFE
        ZIwdFu4VOgIe9A3VSdwpvhwTRhYVbPpSC7JQ+BRE6cRed7qFc+MZchu8jm44jIu2
        R7tOftihEuxKbydKPo5hrSTKM8jOA5yCqRLGQrK8pGS2w7jJIf7RUR3XGWVhBeT7
        6uxfg6SR4+qrTvkQpcCj57vS5TlNL9kx4byAlcDEVfnDb3NZmy3/tN5xA4Y0NYO/
        oTxzOJ789pgaS3A6IMoFgfiipCtKKnOZC+Q==
X-ME-Sender: <xms:JDB9Yo6y6RgoEY29OKijmcaPidydMzJXbXUzVI-i1UC2zilXqzty4A>
    <xme:JDB9Yp62ypg1VifY0W6MKK_RFTzbYND7c9Jzwb0pVm1ZkUwhqX5MmOpnZcc-MuwU4
    TCL4799rQbCncP7Za4>
X-ME-Received: <xmr:JDB9YncNaoOWpP8FIBQ7BPwN5nJrEsyGyoB9QSNFkwG7f8D3b3VEWcWKn7WpsuGGQLQwelbfyh_unnlEhpSqqWPigdfBCSDOGoo8FfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JDB9YtIR2Byky6FJpPjj684DvBuiOe1vAPoq8gJexurSrnT8KYlNIg>
    <xmx:JDB9YsIG3i2noGrQn6eDdic_aR4YvWz4W1HWnQoiicRmZSu5hH0MXQ>
    <xmx:JDB9YuzIWfnkqnZ-4UT5h-exoyrAOAwH0gTtssrwvXGiyiU-dy2b_g>
    <xmx:JDB9YpDNu8GvxQZbCF6h8A-ax3ZKa7BD2NGu9YTES68dyfC3UdSZIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:52 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 16/28] clk: Change clk_core_init_rate_req prototype
Date:   Thu, 12 May 2022 18:04:00 +0200
Message-Id: <20220512160412.1317123-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

