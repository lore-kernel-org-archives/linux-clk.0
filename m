Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0542FC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiDHJQO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiDHJOg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:36 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D4F12C6DC
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:08 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id ACAA85C0153;
        Fri,  8 Apr 2022 05:11:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 08 Apr 2022 05:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=GQpXjItLL21T+VIez0axIjc4s+j0S5
        zipZgX2IBmkKU=; b=aJ2zFNCUT8tZcbAj9+b6dvP4L8k5SitaN5InISAV37yFCw
        HIWsrtBr7f7HaS+Iv04EIIuxn4CH8MjtHrc/XcdX8/PaOuzO9bqyIdeckPoYz5qB
        NZGcdhFqde8AlCqfX4nXveC0bbGjNPMjIA4D/2G8DAB0f87+f67B3o7eUAP/DcEx
        do8ZWje/48LQKYuYDRrdVnSAx0BPtz4IYAmTb2+mtgjksaX0Bxspc/3ywtsW1IOv
        ETj3AREJnpP//4BgeOGNnIsGtRg+XHFKsDxzdVaAwSiBtwbb2jiaNr5EZ5mIl8eT
        KejtymCVNLtxRIOcAoPbUSqvjs19Lwyd64ilx3KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GQpXjI
        tLL21T+VIez0axIjc4s+j0S5zipZgX2IBmkKU=; b=n8oCEHkQv/uRmzO1LJyHZa
        dwiH770hPBPMuY1tEDQG54eefjhIvXBcgVRvV2clq1P3Dp/UakjqmRThQe557fA3
        DTUaYY2lrCR8p9jzjFtPdY72XA0QCf1oxgf8soiMTRyYdKkIyDH82HfWMSOMd8z5
        OQkrfLx932Pi2evtPPKoTYYZkuUpvW/xdUYpD0vViwQO0GSpXxbQmCeCbSAdoGpO
        RQhTBexIebHTCNxXB0PRNsk/Mbl4Ay5cp3jgJtHRlJjM4TeZintd/A412JKBCWya
        wBqvJ9sj3hIcl997+VjsBoAYTtONyUR34V5jKyr8xba9vRiYFnwwSSJMu8iR5d1w
        ==
X-ME-Sender: <xms:K_xPYjJhoeO27YwNPGm45LH7Vsbut3l49tIRER6ESUgjUbhpMxp9AQ>
    <xme:K_xPYnJqFyd5iVjcCUAk8EZwHk571X2apsWFVC22ps3vp2zbKvDdEKGqtFSV89Jat
    mPEAtsHBp7z97QVZWo>
X-ME-Received: <xmr:K_xPYrsWE6PzWDTD9cobV5_bS99FV4eoIFghXzCH77Td54sGl6HC_9EoTZ6QRSz4xJykEQSInxyxJO8vKdG991W_SqzjywafmBTHshQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:K_xPYsYb1PgsXBUGzwmk1QnX6bu7bdxGsanijHuG4hmeM2-cqUwMNQ>
    <xmx:K_xPYqZ7Dw5Kgcj0HwndNwK4bOqlIWp6sWyAQ_NTQ02wI5P5EuwyYg>
    <xmx:K_xPYgBmnVdLDHmeZ_1YbriBxIXvv4qP_VJ4US1F7RF269FyJbHTiA>
    <xmx:K_xPYgm638jZHPd2t-b_0Cpud713dCQ6UqB9RqrRfXRSjVUbyYFluw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:07 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 13/22] clk: Change clk_core_init_rate_req prototype
Date:   Fri,  8 Apr 2022 11:10:28 +0200
Message-Id: <20220408091037.2041955-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 458c9fcf0349..399080456e45 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1375,13 +1375,15 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
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
 	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
 
 	parent = core->parent;
@@ -1409,7 +1411,7 @@ static int clk_core_round_rate_nolock(struct clk_core *core,
 		return 0;
 	}
 
-	clk_core_init_rate_req(core, req);
+	clk_core_init_rate_req(core, req, req->rate);
 
 	if (clk_core_can_round(core))
 		return clk_core_determine_round_nolock(core, req);
@@ -1995,9 +1997,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 	if (clk_core_can_round(core)) {
 		struct clk_rate_request req;
 
-		req.rate = rate;
-
-		clk_core_init_rate_req(core, &req);
+		clk_core_init_rate_req(core, &req, rate);
 
 		ret = clk_core_determine_round_nolock(core, &req);
 		if (ret < 0)
-- 
2.35.1

