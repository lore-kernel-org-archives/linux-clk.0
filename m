Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADB6C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350242AbiD1QrE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbiD1QrD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:03 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0F56E8DF
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:43:48 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E14D15C0161;
        Thu, 28 Apr 2022 12:43:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 28 Apr 2022 12:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164227; x=1651250627; bh=iX
        hDvUk66JytbqhislT823ImdJar4KBkYjknKA58OHk=; b=waOXTphbRP3dpR2WfL
        A9QEKWZ8es+KTtxpRokTmTDs1agYavO+ahCrZsaTyPJCYgUiNpqy4wnnVYqeIokU
        WxdJZOqdFy/tVkCU20TYpdPzkuJcRRBPyqviEyfBZwxunqaRco9X1hWH2i7IAGXo
        g/GJIrYJ11DKyqmg4ZBdH7XvI1S0lJkH2b/OU0VILYJq/ta6HBEtsuqsrv4Daekq
        nk+dAmNhdOkrTnXIVXrM+C15lS07+YjgGcCeP9q6CBNRKS1BlraiZSq9bY4nzKjD
        jRgTfNtcZ2j1FgQv8zgkVS6tZUfV8/SwkoofzsDVKUdXnxBOPTwQoOM4RLO/Y8bi
        Y1ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164227; x=1651250627; bh=iXhDvUk66JytbqhislT823ImdJar4KBkYjk
        nKA58OHk=; b=V+30jQ/+AvjlmqWsamCdU5FSqUPfiqzLhDNB4cIKzw4IHGKK1Ki
        T6tGdUydwjOwitnQajv2eFtebUcoY83GmCSXyp401RhDB/Dzd8zoHlFP+8jfrTL9
        14pu+gwt0Br9V64Xx5NzqxD4+//4fWEZ62zGCrDpEWcM062+JyVlOmOrZvKFRG05
        JZ/0dFbUpnMjNy9nnhRoMUehuzkejO3ZWJFmhshFI+dXSacilVHATcVUxrkrNs58
        3HZa9kt9gcHVumHUZbq4OSTJdM1+cXOi/4qUFd2sNlCTIFccjFNwTQfGRMxQ1Kld
        VPPx6TGMIUCF/0dqTsxMvPsal6X9JsZ0v/Q==
X-ME-Sender: <xms:Q8RqYumi7_4MrlcLXQQTx0OANAv-JU6LdnBtRiyZQ9LUlyD0qgiTlQ>
    <xme:Q8RqYl3PJ11MU7SJwj_fdMr_omjXR5EZeX4VEqHbPl3JQWMDBaMr5WDMF2g8Gmb6D
    aY5wyPpTKEQCTJKSrQ>
X-ME-Received: <xmr:Q8RqYsowXTUefuAMQMphu93jheaVto8WSrgmpeVddWenX2CMAvBhh3_jdPVjJEOnCRX8IyV5UVy7xi5QmTJ8GmUFdyi9CPSBZ4hh774>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q8RqYimunt1buJIGJBeguh4dA2vUJk-xDFTAEJ6E5jTG-60Q2J8akQ>
    <xmx:Q8RqYs3BGEV44XRTwNkRHCJGW2YTzCdlv_M_sTB9miL7yoRWMyO_cw>
    <xmx:Q8RqYptOi5kKkpMuKE6D7ogFT8WHKhnPnCMRl3dwyMLu4ey-phqCZA>
    <xmx:Q8RqYlthF_7Ihk1E5lGOubrEI_xmP8BnXiKWHGJFz1R6fj9lsA19Hw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:47 -0400 (EDT)
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
Subject: [PATCH v2 02/28] clk: Skip clamping when rounding if there's no boundaries
Date:   Thu, 28 Apr 2022 18:43:12 +0200
Message-Id: <20220428164338.717443-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
2.35.1

