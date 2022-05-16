Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1832C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236208AbiEPN17 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243993AbiEPN0c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:32 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BB32650
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:31 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 512E432009CD;
        Mon, 16 May 2022 09:26:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 16 May 2022 09:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707588; x=1652793988; bh=sX
        U409CDry+ZQ8Bb2+csHB3PifKzZPG73QrFFW8wL8k=; b=NWOfH72wusxKEySPwB
        Z/LYpzusHsTZqqx2vWA5wRaJLnlLrQXZCqnyJuATQ5wopHhPfF9wcfLLEQzZVfTD
        zmUvE9eW7qB8HA/vGVJiBZvXBAokpCS/xrFOKZMzOyjyHLRjqP4RGcYdf0vdAnLG
        Oj3AlE4hNKTFgesjSnuo1Bx+EiPFxCepIqG3AUnGr7DMt7jKOkjf3cgyfHzsoax2
        8lwYdnX8AviiIbdXQqjT6/kTmZ3m2EXP7rZ1mBOT40/NeSMTLrFNzxwMGrCtmzMj
        +mysKcrRkOUuHAk9BppJ6RMUNX7BE+Xue+/MgS0ZNuPc4FjpE3n5pISxXlXMUw8Q
        sGzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707588; x=1652793988; bh=sXU409CDry+ZQ8Bb2+csHB3PifKzZPG73Qr
        FFW8wL8k=; b=stqNPp2XT3hzA+l/aqpCJ5N5/+9QbDc60pGBqNaoXiSMkDbchkZ
        wttqW58wazcHwbKu/U7zw+5n+n2Hdv319mx1V99DdoNl/RrCpk1fWUrY8fayLoYh
        G3adYGyxU2/RMvJoAICK7vdlaOOOYBo8fS0tbPTs1wzRHyTwgt6rumER8jU6uyGG
        s9ZZub9eLuCnQdj2A83Nl6hNZUJDZOqpU57jmTk5wg1AhpGVikk+TkofPQvdbEkc
        yjtkSV54LWWjLuP8y6kYEo5gco6ajiRJ4kZVgabHwdJVxG1z4zWcz3eWS/AS/S0O
        gAU5rc1UtlRzpenaNUvO977qTFhD63gv+CQ==
X-ME-Sender: <xms:BFGCYkJ_jBpy9hdmkjm6h1Zx5VqNixfUTed3e5yYbzeXTM00CNhf0Q>
    <xme:BFGCYkKX9VwxNffv4rx-YMfcOyOczD4Vbrqf6wG1x9uHYi6WdskOjVuEplfzRiBUZ
    9GK_Leb5mDRrBOL5t0>
X-ME-Received: <xmr:BFGCYksLr97VyXcdtG3l60GqTcLuWP6_h26k-vJuinQnbRFx3jcqiTXSwt1_OTMwX4vXB8F0bb17XnLZsTypJgdPBXogkDpvITtFY9s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BFGCYhadtMwB3EyJHAl_oy8t0ocVsQLGYN8T3ziD5QpyJXB7OTllOg>
    <xmx:BFGCYrZqlI4ekJ05Do7wPYdhxv3zc4WkcLqvVZx80d0dQBBklJo9rA>
    <xmx:BFGCYtCPv8Fk_GNMiG3rseVgXK5twVE86F0m2yakV28SWFTC_rWR-w>
    <xmx:BFGCYoQWY4e5EApdhuOZHJYupO8TLkpPBTnVtvR7Dt38V9PlLOdX3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:28 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 16/28] clk: Change clk_core_init_rate_req prototype
Date:   Mon, 16 May 2022 15:25:15 +0200
Message-Id: <20220516132527.328190-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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

