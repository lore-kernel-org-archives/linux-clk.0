Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D97C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbiDHJQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbiDHJOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:37 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7946133151
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:11 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 483A35C0153;
        Fri,  8 Apr 2022 05:11:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 08 Apr 2022 05:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=Ej86ciq65cXpNuSjyUh0oYvn8tMQzm
        ofSVOP/shYt3I=; b=WmTSNoklsMn4ssUSJ5ZKfSpGR+NDkxG0V1I9hd/toPdYkU
        R/VaZ0AamI6PZYPVGSQvFpEbWJDcRBN2iHLYKHV/faS2E7tu24H+6uet3u8DFGmK
        UqZgAaUrCaKe0UY+1FAKf0UyAAPLdSZwAhC5YVFwortl6Ic20Xk8X6VtXWuOn4tL
        DMM4DM2gR/2kxnJNB2MwDU0M6UO4aUD9R3gy7G9D1pLff5VZ+IFoq/Ni96Qz1uWR
        Tl52dfshAJ+MZsZ9xNpO8gw2/+kMjwp2tQmHx9HnhPfk+b+L06GpbiU1MQNFSmtM
        3x7/I2khZUGmblA0uK2MA4wyhr0aLZ7nsLvxRTqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ej86ci
        q65cXpNuSjyUh0oYvn8tMQzmofSVOP/shYt3I=; b=X3iBupSGndqbBwLZtpV3hq
        7GZjHGJ5f8fYxW2lqrVwigmAxNf5lF9kHFrZJtb90bcNdsd6S6oEQxWRoawuAe2H
        uNcX5i0w7Fp2D8lbtZiSSSTuX43lIzqOOaaUhDfwDgYKlfg4eiaFJ5Y6Fc2trinD
        mc9SXuPAaeBGRPkysUBeY+X+N0n725A6Hu/ksNz4ExMN2vB8CT2oMWBPmLr2kRCr
        8cDiMCqv3STC064/d456OqWQrkj/9UT/vBDM0n2LP5yaMQrHEau0jAm6evK48CMG
        TpxhQmKPHKU9qATGs+qzrFzwt7PRGTKPakWPW7fPgJ1or9a5DKqVTPtAxPrhPpjA
        ==
X-ME-Sender: <xms:L_xPYoqOKxSmt9JRw3B4q0ziLbs2qrb5z1IbbmtDfKq91g8l_HuEBw>
    <xme:L_xPYurIyRMXpwCMwD0K0HFyw_maWfFaTzv9AiIXIbPttvAaIzzlK1h_XIKvar-a2
    fxfRaKdCOD0wKEp6Hs>
X-ME-Received: <xmr:L_xPYtMfhdKOEXKHKfr4dtLshqwecvIQEACfNEZODpvJ-kicaFEQSTdX1A_bMHLcSCR4MP1CM6whffbH7CJ9mJUeyLMhJbnw0kwGJ9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L_xPYv6KrdLFUFgAmwyipq_XXbdU39u1L8izdDsdvKUIraoDKeLygg>
    <xmx:L_xPYn4mMEGlPmCdZCTQWR9KCLbqdyIDpGqo9Dj8dXnxzXnd0p7OAQ>
    <xmx:L_xPYvgzJEU1Ew0n6kfcQ7uQ67t8x_ck0JLg1cKgzZ_kR2LGr0Jt9w>
    <xmx:L_xPYkFnUzF2Z4wqdxTq5Y8woMek9pdu-ZNJulAI26OO4UbWioQQtA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:11:10 -0400 (EDT)
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
Subject: [PATCH 15/22] clk: Add missing clk_core_init_rate_req calls
Date:   Fri,  8 Apr 2022 11:10:30 +0200
Message-Id: <20220408091037.2041955-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some callers of clk_core_round_rate_nolock() will initialize the
clk_rate_request structure by hand, missing a few parameters that leads
to inconsistencies in what drivers can expect from that structure.

Let's use clk_core_init_rate_req() everywhere to make sure it's built in
a consistent manner.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 83dd5f1df0b9..3a59152b06b8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1480,7 +1480,7 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw, unsigned long rate)
 	int ret;
 	struct clk_rate_request req;
 
-	req.rate = rate;
+	clk_core_init_rate_req(hw->core, &req, rate);
 
 	ret = clk_core_round_rate_nolock(hw->core, &req);
 	if (ret)
@@ -1512,7 +1512,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
 	if (clk->exclusive_count)
 		clk_core_rate_unprotect(clk->core);
 
-	req.rate = rate;
+	clk_core_init_rate_req(clk->core, &req, rate);
 
 	ret = clk_core_round_rate_nolock(clk->core, &req);
 
@@ -2216,8 +2216,7 @@ static unsigned long clk_core_req_round_rate_nolock(struct clk_core *core,
 	if (cnt < 0)
 		return cnt;
 
-	clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
-	req.rate = req_rate;
+	clk_core_init_rate_req(core, &req, req_rate);
 
 	ret = clk_core_round_rate_nolock(core, &req);
 
-- 
2.35.1

