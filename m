Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D0FCCA480
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbiGOQDF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbiGOQCR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:02:17 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B648753A5
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:02:15 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id CF91C3200A14;
        Fri, 15 Jul 2022 12:02:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 15 Jul 2022 12:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900933; x=1657987333; bh=r3
        y1O6SDS/DPan2S5jSyYsN+hZszzDATKyRTZWWhzfQ=; b=UapuxjKATsfxDWGiCC
        ZBVNRwnFV5zxCTlG+cFt5QK+1arvslgLIwQqlBjUFEIRE75+sz7jljLcFknk+IPL
        5yR0cblhneSEtl49cYp/E8tLs0D930yNSTM9KwmJpVVhh/QsFV9R2ZOuMuw86FQN
        IEiNTBy5GE+tNnQTUPgXSvZAiZngK1k+Vc7KGJjbC/O7qCW/2yEfjQtxMlQloSHA
        Xh6U3EkbQFEmGmRr3Ykx7fvU2urAHYG7TVGgz8ygSAPCUFjhKGwe3bMDNLaqeaEu
        8Ik044TtgZMrbLiQI6sPN72zFlUrUbrCubeXX+ZLFaSy5gkJ6bPrrlwz3QKXhdoj
        QGSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900933; x=1657987333; bh=r3y1O6SDS/DPa
        n2S5jSyYsN+hZszzDATKyRTZWWhzfQ=; b=yBOJoPJjAvnL+eTj+1JrC/m7qQpp+
        Ym2pCR+eC98DkOqox//J/96T+0tRIGi9jLPqChcTC3hOd2jXoPi1BGxPsuQaF1Bo
        2rU/Ih3knB+F21Zc3XkDtIXb8vTCFlcSiokmZCpQ/0gakxrS/TgOVmrxKs0KRb9b
        jyd/dulH1u0+R2R/d0JhsbgRrwYrM7Hi1H4m8TVdaXCS0x4HFaLYNbxavXbpbw/+
        8pDsRYTx024OMuoujdbA/HI2fLXeI82Ogpf3Bhnwru6rrjS/Q9E4vcDMHEKlGKxw
        p6h/bIGbu+6Iz5DFjclNuxUO1X99dmX0C2u6z/Klr+3ghgZ7ZNImowLHw==
X-ME-Sender: <xms:hI_RYsQ5aLeu0f9YuwUFjDp_UCYTJ0TLG2iilNOAil_eyrVZBhi7Dg>
    <xme:hI_RYpzM7DvAI_a2mn7L-S8XDpvUuAuFK59JE57NN-pSuse8sfOmSs8EpjoE0XYYS
    -hsa9mJI31DWhssyHs>
X-ME-Received: <xmr:hI_RYp2e1yJ7A1JRQIyq3zCfLbMS5rfgYxZ25_nOmGHn6g9HwnmEkGs6TRrAgVzXwh0gL1vyodEDG3CMY2e_Mf8fNGWnKkcuQ-x4buc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hI_RYgAD7zH7dwOB7a17VWuq9V7_P_iJri1YA5eHGkQPiiOWtGw_OQ>
    <xmx:hI_RYlgLuv-nz4dpoOTko7QxHNrajJFk1bJAdXHExppd1Ehp90nKzA>
    <xmx:hI_RYsqAbk6EnqfqA5ulVt2VniK6RpiyQSmT1lnnLMXu1UmlfH2rUg>
    <xmx:hY_RYqYjmhau5AZE00D5bANQnB8JlDLA4Z6mTGzRNH0OSgrQklsVOg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:02:12 -0400 (EDT)
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
Subject: [PATCH v7 25/28] clk: Zero the clk_rate_request structure
Date:   Fri, 15 Jul 2022 18:00:11 +0200
Message-Id: <20220715160014.2623107-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to make sure we don't carry anything over from an already
existing clk_rate_request pointer we would pass to
clk_core_init_rate_req(), let's zero the entire structure before
initializing it.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 75865f07b5e5..77601f435f12 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1446,6 +1446,8 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	if (WARN_ON(!core || !req))
 		return;
 
+	memset(req, 0, sizeof(*req));
+
 	req->rate = rate;
 	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
 
-- 
2.36.1

