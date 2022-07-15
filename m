Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FFFC43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233498AbiGOQDM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbiGOQCX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:02:23 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D61753AE
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:02:23 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9A78332009D7;
        Fri, 15 Jul 2022 12:02:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 15 Jul 2022 12:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900941; x=1657987341; bh=ec
        ZxlGuyIz1nTEqbpwWfaKxOyLrDyGjRBtU8uddXVZY=; b=G9FqSDT9KoHp8hc4Xp
        jiGvjpe0vk460QXPygEkfNmMdnfhxGE4ywc66l3yBCqXLlrLq9IARbSQZpSU43r9
        ZHJSLx0p8YCmXN1QJfRJHObthlILOfRqyRdKk1USLslMtFHTIFBIpOHNeMvshxxP
        4ZEnffhWyRLZ6PRHJCqKGhX6412cQRAT5UXE+nIet2VH2KGMckfcmFjChel8cBBk
        3FUS+H+MqSHQUCcsEpoGHfH7qQB3mzjUMx64TdkXUZSxVYYLg01ciA1nq96jGgjT
        HzafqWayFZoDKEY2MlmNq/z0clG1ns1OxWg3TWbe7INOAzUl2I+/I3xOZuMHObwp
        KpIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900941; x=1657987341; bh=ecZxlGuyIz1nT
        EqbpwWfaKxOyLrDyGjRBtU8uddXVZY=; b=kdcUWOwm1wIClpO88dfQYOdvHptZr
        q86GY+FClZ5dyyKOxgfEmnEujoKIJgG4P/bjsQX1umH6tBB8KYIwCNS+n2rpeUR0
        1+RhVFQqVxoJO1XOXNONjuOo3V3v5x9YT1ADYCioppYvlsZo0KH3jAh95y+ATcn0
        hM/vbkU7Lgp7bXa0VRvv70orP1wzpNviYkCYP60imazRhzc9NtAVVzg0JfAGi6sk
        lB/lCibus5W/Q3+0wx0sU+q7sNcAlQ+oXdgnOdvUCd5nTzDn7G7PW6nHlTnlIQZt
        6ZUAFonmyw94V//7RhQlfvTyNUoqq7kmUEXVyuQMGpiDnFdjcjBTSHHoQ==
X-ME-Sender: <xms:jI_RYlN1becQ0va4qiYzxuckAIbZtv5un52fqhGZ6QxQLF-iN-oQgQ>
    <xme:jI_RYn-ifUucVxE_NFGPx5ixG6tp2LAyWzXz1pjvT6PGOGZT6YEQpgxxL7r5lF5Tz
    _2TK6C85_eca_DywBg>
X-ME-Received: <xmr:jI_RYkSi8Oo-lL8kJegazgNxTRoqVXp4FxzuIsZwSrSqTOg1g07KmkRaXyxfKFb_qZ0j8Rmb7NTyFJcgcq5Oqvbe9gk5jum3Jwwmew8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jI_RYhub0Q0onfaZ2hjb-5O6hsSSf5VJnLd-papYLGDzIN_zcLXFIQ>
    <xmx:jI_RYtcQwdYZ8XHbomiilY2vtMP671_DptyLDhkaQGn53SwNW3m8qg>
    <xmx:jI_RYt3xb16Zp0_4g_-dJALEoQQUGO4h2rFFlk1siW2QUpKIeWjkEw>
    <xmx:jY_RYuWG-dqAglc_uyIgRftZSzFqITh4h2-pGVGHfCQYV2nDOTWk_A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:02:20 -0400 (EDT)
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
Subject: [PATCH v7 27/28] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Fri, 15 Jul 2022 18:00:13 +0200
Message-Id: <20220715160014.2623107-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gfx3d clock is hand-crafting its own clk_rate_request in
clk_gfx3d_determine_rate to pass to the parent of that clock.

However, since the clk_rate_request is zero'd at creation, it will have
a max_rate of 0 which will break any code depending on the clock
boundaries.

That includes the recent commit 948fb0969eae ("clk: Always clamp the
rounded rate") which will clamp the rate given to clk_round_rate() to
the current clock boundaries.

For the gfx3d clock, it means that since both the min_rate and max_rate
fields are set at zero, clk_round_rate() now always return 0.

Let's initialize the min_rate and max_rate fields properly for that
clock.

Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/qcom/clk-rcg2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 28019edd2a50..ee536b457952 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -908,6 +908,15 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 		req->best_parent_hw = p2;
 	}
 
+	clk_hw_get_rate_range(req->best_parent_hw,
+			      &parent_req.min_rate, &parent_req.max_rate);
+
+	if (req->min_rate > parent_req.min_rate)
+		parent_req.min_rate = req->min_rate;
+
+	if (req->max_rate < parent_req.max_rate)
+		parent_req.max_rate = req->max_rate;
+
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;
-- 
2.36.1

