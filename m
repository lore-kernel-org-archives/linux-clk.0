Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37468CCA47B
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiGKPYn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbiGKPYl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:41 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538AB255B7
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:40 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id AEFB05C01A7;
        Mon, 11 Jul 2022 11:24:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 11:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553079; x=1657639479; bh=so
        6HKpUlMewzciF13H2vZ0D8j1IWM4nj6ohR8Mnh3rA=; b=V0o1K/9o3hWlruphfx
        MXHiJ55iFWflOiOFrYq0r0T4Dn/qSE8nPPvyPJukhpwKX/MTDsHPEZlgndhZahUn
        Uppgqscrv6vn9AVB9br3P54DP/N5887gvH3thZZPeCbZGX9z2/J06WFlT1ewHWOC
        lvHpdH+xOF2rmLNAoxrz+8ZGAtBx7ObugidcpFSpF1SmeibnHlVmqYO6I7uj+87T
        cIv1DiFd6DmzsRybjjoAdMRaXrKsnXmwWO24dL6vHY50VHilv3Bn2LNDg8xkB99c
        sJ0HeGjGuric3wD9GKhdxFZCAy5ARrzXE5UWUe0wVi1s2jQuBL3IOiiiS2VDt19G
        1jSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553079; x=1657639479; bh=so6HKpUlMewzc
        iF13H2vZ0D8j1IWM4nj6ohR8Mnh3rA=; b=oNbx5JOKST74LdNGdGir1+F/nV1AI
        UkIr05mlCELQ8xtSc50vv870zfb+I6HbNX29wpn/PhVASf8dr++U/164u8aUhLP0
        jrCcobgLEy7+L1HeM0zv7K0PyFttiOw0GmxAPb3EG98DjVnVVeQZKv8TNL+xTLAN
        H3m70uC7FZU6kWdjdaDXlnVdrGTYz5ncNkkVl17ysngzcS2LHh3ChNPRsK/jDkYF
        pGoFzlSXV4EWF7uMEaVPBBRNQJtglsxkTxl1IlrznWZLjyXn6m9Q3Z8wll20wKbt
        HiQdDgnRd0ozhrR+NhhylUyPGb87YeDTc5xiAIyM/BwnijNxLGZLckoOw==
X-ME-Sender: <xms:t0DMYlfmW7hu9IvvVElwHeBj7oukSfzdP4477bdh_yimMI7puxdqyg>
    <xme:t0DMYjNZPSL5eyxdkCZBkRhPjknDJltpwW0QwbGcBCFHoERv3krvs6PMx8_ba5wHL
    ndNDjpXXKHYB4f_2cc>
X-ME-Received: <xmr:t0DMYugkpx6-rSqQBGk-NizHEK5Pf9b6yoCB_7y7XgC6eBk6ba-2S6ohrNuhEY3BZ43VWJJ5mHjRCa5WKIEMF9rtVonsRscIB4sIMZs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:t0DMYu-SFrM-Z8MwTmwPpmI8qe1ZIvN-q5K-AkAHcFB6ceKA87IiDw>
    <xmx:t0DMYhsON3uoRT2-B_htME7f2jDgbX27QMHL5-azAI1fqS4v8pzeYw>
    <xmx:t0DMYtHf59hAox3yRzjOv7Ma2Posa7cDUzqB5tSyquBXKtFRR72fnw>
    <xmx:t0DMYilductCzJJ2QO-cXINCRS45LvAr_PFa_pJ_umKY0NZ8EI-EJQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:39 -0400 (EDT)
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
Subject: [PATCH v6 06/28] clk: Skip clamping when rounding if there's no boundaries
Date:   Mon, 11 Jul 2022 17:24:02 +0200
Message-Id: <20220711152424.701311-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
index a5e0ab8bd6be..9d63163244d4 100644
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

