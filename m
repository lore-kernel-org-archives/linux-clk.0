Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87D8C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbiELQEl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356230AbiELQEX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:23 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59F925C2AB
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:22 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 57A385C01C2;
        Thu, 12 May 2022 12:04:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 12 May 2022 12:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371462; x=1652457862; bh=g4
        P5DobGsF8A4M+d4ZrXtJWtd8orIRbjRbWtjuqAtRo=; b=meqqctR9Xtzl/huzrr
        UxexYlfTLFNwSZETkdtEstTDlPOa+Y1z1pE0Zw9VbuGXElZ23ywIa61CO2gNQdYF
        mCMG45l5EBr/iQr7f6BNntKhWDa21dK3QAF1hV7SB8C/C6c3aHZP9RootY9KJmzr
        adeuqVBqAqbofYqhMTCtSM2t1n/qVqjzqP9u1jn5COTVFRkR7h6JKwrlPF8yIvpt
        6Ju31842vFWE444lP4EgSplEf1/KeYVRww0AsFpzICstToi7RXcOHBKzcNAssx0F
        VkkAX4Cxro81wrT5OaWXR5MaWARzfUu8pvEPVqYWRJYSEmRWOXYIije2T3x/oRqc
        edwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371462; x=1652457862; bh=g4P5DobGsF8A4M+d4ZrXtJWtd8orIRbjRbW
        tjuqAtRo=; b=gzWvuDz6VVgixWDQw9vuCFNS9vB8bQYKh3lbV0viaCBkgXDN52q
        G/ggRbS7pHN9PVt+7s9ftawxtAGBh967bsVmKiQ+N7BqDnMLNfEIJOm8+IohOmcE
        zj4owRQ27Nzabvvj/yUsszEof72LiLoudCGebcYMudkQA6W5CR7ClLYzG+u3sT5l
        C1SC+1NAQy1E2K4M7oRJqqtc1HLDI0ZbGBXZUXJYwhcTAljnlWW/oh37PVfUKMbR
        bF/mA5VrwHfxEPp40Nz6x38OvEw1of+uEJQI4Pm7rqEmjwTwAZda2f0CRb/ef0ji
        a/YmuZ1u8jCKgTpOkhh14coh6Folnu8hwMg==
X-ME-Sender: <xms:BjB9YkD-pEEhB4obpixe5MUXes1UaEhO468lkikVbqPVU_-9p7G2Bw>
    <xme:BjB9Ymjdo1qNs64s7qSCjD7RCYfU-Sbytbt626FK9tYBnnsr5IHmgChJs_ri_2iXV
    DKky_hzKG-kKL9BtQE>
X-ME-Received: <xmr:BjB9YnkN8RPg88Wo5LvHKeNU5FF7_kdjz5VPcP56kCQNEPpXxUFkcP2dsH_gFO-2vfLLNo4QIs9kv6iuQZGZXISnpgzTtCsQytMbPFs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BjB9YqzeLK7ceuWbCP7CPcVpS38TYTd-M6Qk00Gql5BO6IFhZRGA_w>
    <xmx:BjB9YpQb_SONYnt-b2-rlW589_2ZWP00LxpT9K3IeaUa8geRw5G9Iw>
    <xmx:BjB9YlZS4v5Ae0BTI0CJBLVbf6dgpQC0zV-OjF2jOgTd3h4Fcc-q9A>
    <xmx:BjB9YuK68awaBDaOZ6bNs_1xLB02tv4pvJVN4KUH4dViDEL9uAomTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:21 -0400 (EDT)
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
Subject: [PATCH v4 02/28] clk: Skip clamping when rounding if there's no boundaries
Date:   Thu, 12 May 2022 18:03:46 +0200
Message-Id: <20220512160412.1317123-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 948fb0969eae ("clk: Always clamp the rounded rate") recently
started to clamp the request rate in the clk_rate_request passed as an
argument of clk_core_determine_round_nolock() with the min_rate and
max_rate fields of that same request.

While the clk_rate_requests created by the framework itself always have
those fields set, some drivers will create it themselves and don't
always fill min_rate and max_rate.

In such a case, we end up clamping the rate with a minimum and maximum
of 0, thus always rounding the rate to 0.

Let's skip the clamping if both min_rate and max_rate are set to 0 and
complain so that it gets fixed.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2a32fa9f7618..d46c00bbedea 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1341,7 +1341,19 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 	if (!core)
 		return 0;
 
-	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+	/*
+	 * Some clock providers hand-craft their clk_rate_requests and
+	 * might not fill min_rate and max_rate.
+	 *
+	 * If it's the case, clamping the rate is equivalent to setting
+	 * the rate to 0 which is bad. Skip the clamping but complain so
+	 * that it gets fixed, hopefully.
+	 */
+	if (!req->min_rate && !req->max_rate)
+		pr_warn("%s: %s: clk_rate_request has initialized min or max rate.\n",
+			__func__, core->name);
+	else
+		req->rate = clamp(req->rate, req->min_rate, req->max_rate);
 
 	/*
 	 * At this point, core protection will be disabled
-- 
2.36.1

