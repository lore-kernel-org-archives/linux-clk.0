Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E992C43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiGKPZB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiGKPZA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:00 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22011252A3
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:00 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 858F35C01A5;
        Mon, 11 Jul 2022 11:24:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 11:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553099; x=1657639499; bh=0v
        bMlPACmQkqdMU+ZTBxKq/E0O3U4fCSA6J1jaa8YtI=; b=AtTKlIuoo5R2n2KV/K
        bhZZucxnn6R6A980/sZhlNXGzsaleawLSwuHZLcFhFYJK4L5gaa7Nfosn+jvuk3n
        v9aoMFA6ogJDVDwm6CfIeYdaJNAOjvdTzX8EGw4CrGpovbxyKfqYbHlnEMMikU+I
        psXa5UdP3+wgCxfOxerJxRpqj/Moq/FE8p3xrTc3n8i/uN3jq/BlUJJ5m0PjXX0/
        jw1Q1u1j9WZM1LREj1uhu5ujia3GDaX83HQcV/O7wxliCSfLLQEVai+o0470LFg/
        HSGdRifKolXoTqOkq8tMslnJnaBx1RLD3atXyM8oKBYjuJqq3SKQl9fF94mrrE9E
        Q9YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553099; x=1657639499; bh=0vbMlPACmQkqd
        MU+ZTBxKq/E0O3U4fCSA6J1jaa8YtI=; b=Hp5AgCTG6Vp1w8Jy8Dka/rSq3tXYX
        ik+PgBeueKdvNbmAStXzJOWMPHzHSHb4nlRotdWtvIC2aCjtU188Rs6INkusQrW6
        6fnnWK/NKgnxUOH68E6HZsAaGfDSudyNcmLWaiJBtfsBc/tNv7wrlMiUp0IieUuV
        Iba2rIjltebtL5Dz3py4YE+yWArPDGjrFgXnspvmNMpSj7jyDDKdeoZroLCnnFKK
        q6rFH9KCi48sQyBnhz97cq7KV7HodzKjk977aDJsI0kmTA3XdSQOvVqJBBj1UFWy
        aZz8q8eTFdtEFmnKXTHM4ODV6p6xvNif9xEqzamiYaT9/nFzA/w3z0k5A==
X-ME-Sender: <xms:y0DMYp4MChzjO0hODywSJMfmFcLv_ytYDfC1yoI55xjAwGgA4HlT1w>
    <xme:y0DMYm5vO-UXSxiBjOMWqSXMpOfuyp7RWwmyGHm1jmac7XRWYOHjIVL5yHogkj303
    E3jxmBhAu7FD0s7FQU>
X-ME-Received: <xmr:y0DMYgeeMxXeG5cdrUXybsj7R3Dh9bs-fOqc99mcC8LM2haim1gguXDPQtPsXQ6RmL4lBPig0C8RsVw4H1jasQgDyzXK1OK105vqsho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:y0DMYiL_S2ySMBnXsZNPHg48i-bLNyepyQ7bjsNIQYBsryYfc3DR7g>
    <xmx:y0DMYtLxL0-MqZmK9MJ_e2SwokjFM1t-MJ9XVBrx6pevx1mXXavj-Q>
    <xmx:y0DMYrw-K1Uas-2OiwlQdKDajhnBLak5BQ_8xORvkFOITNj9q2BmKQ>
    <xmx:y0DMYqCcnl6MC-CsVTsJ-4ljYE9VmwP3JBLSsLF9OiSnOEWJ5rf1pg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:58 -0400 (EDT)
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
Subject: [PATCH v6 17/28] clk: Change clk_core_init_rate_req prototype
Date:   Mon, 11 Jul 2022 17:24:13 +0200
Message-Id: <20220711152424.701311-18-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
2.36.1

