Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEA9C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbiGOQAr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbiGOQAq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:46 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512386C12B
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:46 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id B16883200A2B;
        Fri, 15 Jul 2022 12:00:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900844; x=1657987244; bh=so
        6HKpUlMewzciF13H2vZ0D8j1IWM4nj6ohR8Mnh3rA=; b=h0v+uw26dKDB7qqlqo
        ZDxOwQ66afV6eoykFhVKQg0CFcFwWttJ5wKiwk6Jq6Yx37pKUCYnVsIcABC6HlFX
        +TilnaPSK8Y3c3lk9sZMhc49ARkGWW1qlsMKFwEAZLX17PD2fR2lThMYdWiKovBH
        GHTHXMYX6JgSH+grAHU6OTi7Cznm9LiMr1vX4AhPuFS+PDTFo/5Pk7rxCXHFKzeD
        IfwfHFTxiPZN6Giom4dlBMYNcVb53G1oLq5zAfJr8tpRGvoe75bfpdcxIpcKRmMb
        ygDEiLD/7iXZzIN3XAjoGKs0mYRHJbzdY0dJs7zgqYjXSdB1rw7jRoSTs1tXUMaU
        jKBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900844; x=1657987244; bh=so6HKpUlMewzc
        iF13H2vZ0D8j1IWM4nj6ohR8Mnh3rA=; b=CsBZcdtdyBluenMCiXzfJa/DAwaiG
        sHthUzzCmKHjv2Fp4XUC3SM0OkN+kdQ7GcL0ODM+7DNpwRShSS7qaidPHKaHIhsd
        9FZLj55fpljY+bv3U4AD34ywARTksU9XlIIe+GbHUOWgRhvzurMpibe6/EIfKzPH
        jkJ2NZt+aj64KxEBM8GNV5Z0RuuU5KbBcNfAJyDLeKF5kXa9oM39KdP7qEspxZie
        8gOjl9g0L97T/9btTk9xRy4iwKE7f8fN29GOyMJVixtDHTKkQW/c4/Geti35zMVd
        MF4Ofi/xjEI2HQ4tuyc15+P4EhwuxwV50indP7dx/Hjb0J2kXS/KomXPQ==
X-ME-Sender: <xms:LI_RYu8eBhKmVf60vXRs_3CS11LG1SKRTyp3UTi3aZV32QpNCWnQUw>
    <xme:LI_RYusBsDq_tCDe48rMqffHPm3HdysVnfl7Pzcjd3uwXa0-quqy2Vnfo8zqOFsM5
    SFNTQK_JoyZpDJaWeI>
X-ME-Received: <xmr:LI_RYkBLrqQZSwpvWbm8hPIYlEm-reJVfwzF7TgfEat_6E1mr78gvJsZMDB4WEHxHODzLexY_U5WOJq2l-VtM_stBttitk5S4_pD1nE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LI_RYmf2tNnt_kwAEszqrIzrFvUXQwCtsKbBnvdsiyM_V8c8dHPMdA>
    <xmx:LI_RYjM4pfyZXEju1fzEO5TCxz_cCgkdNmGd182KoXEk0D9lM_VIuA>
    <xmx:LI_RYglcwYylUW54tEG9PI5Cea-S89-9jzSs6lSK7GzgaGEtPGo1tw>
    <xmx:LI_RYkE95pfLMaH8zRO-VSxmWPdArz0VgRo5wHsV7DioMszw4CFnwA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:43 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 06/28] clk: Skip clamping when rounding if there's no boundaries
Date:   Fri, 15 Jul 2022 17:59:52 +0200
Message-Id: <20220715160014.2623107-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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

