Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F744C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbiGKPZT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbiGKPZT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:19 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400372AC53
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:18 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 86D275C01B5;
        Mon, 11 Jul 2022 11:25:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 11 Jul 2022 11:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553117; x=1657639517; bh=ec
        ZxlGuyIz1nTEqbpwWfaKxOyLrDyGjRBtU8uddXVZY=; b=qCkHvNcrhzoctjl81d
        Lh2IstJw55/nWxLKAXMtbhcD9i4fGuzha67PTu+xGzhca3e+VJuCTDewf+8Nm7QR
        qCOXcEd2e3mi0WE7HX4LYoKCnmGA/FhRt22GCv4XC2FRidAoc80XHQWL8DAkHXr4
        n7zJ3QIq3UAKXAo8r8Qy/K+OCZ6r7VwIjU7qUc11QhQ+T2JjYK+7BeERedqyFKZn
        W3dgxWK91NZecg41oVSGdGQbPinOTETTZEldghV2ew7ANHsWGGvDzvXF3Vm/tGds
        EMiv/VDf6W++Kkz9uXrP3l3P5dgPbldIxDUa5dwAablT+vXUSveZK9bTfqRs60Kz
        do2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553117; x=1657639517; bh=ecZxlGuyIz1nT
        EqbpwWfaKxOyLrDyGjRBtU8uddXVZY=; b=r1KNdClHZkedL/1cWM+zRzrBJFpuc
        5nf3CJpXbRru0N7+bUbmBUiCAj6NImmeo6bbhiRKKuidHxy7qMsQcGbre+dPqt2W
        r08SGPGzN3iiKLD2jFe6Rilna2OaFwaX10ce/SHZvJaxS2myRH3bRcUR6UOIGx3r
        AQ5qOHhtBdPiRwXNV2mTq+Bs3n1+9eK5vpkrVJw4gkbul+tue5+FOySYrEHCQ3V5
        tvd1sUjJ4yxCrtawlkEFZptoKj+HbRSlbwQ85R7CNT3cTfOxr5fcwMs21XJhCEkC
        IEAibXxa7wXKhveYnO3d9Ai5awvs8l2ofRzMuuhnBzl7ADwGfQQTZ5kvg==
X-ME-Sender: <xms:3UDMYm_7R8LXSVkl8FeJ4GNjLkKa6TUlkaZISwYJo2v2NT6G_SEIOg>
    <xme:3UDMYmvk1bjs01g-6Tvpqava-8eGCnTs5YVjk4PxGGTGH0c6e2AvYYe0DGJX_d-o8
    uBCXH3aev4HcnsQn6c>
X-ME-Received: <xmr:3UDMYsC7TjJLET_v4rt_RO6XrJ7v93muI6nS-Iu5s3rDIkoeyt7BetGvSUQJ8tHrERS26gIpMJRvDE_oCSJQlxfDua10-XJDP4q5mfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3UDMYufcFwK6ct8FhneXqqjlrLJWIuhq2tUyPnk8qFPL62p5j_uCyg>
    <xmx:3UDMYrNc2IcPvADCY6-UCJg6_x-_mOaMR-51qULyF5s0aepYmDlLGA>
    <xmx:3UDMYonmUmoGQqwqj3EQR749okYQCOg-e-7TEKfPtrMLvd13-J2iKQ>
    <xmx:3UDMYsGBK-DX_i4jcMpEltofHgjwxAlz5EMj4uH77d4i-YZjyx7UhQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:16 -0400 (EDT)
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
Subject: [PATCH v6 27/28] clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d
Date:   Mon, 11 Jul 2022 17:24:23 +0200
Message-Id: <20220711152424.701311-28-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

