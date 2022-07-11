Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA129CCA480
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbiGKPZQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbiGKPZP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:15 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D583275C0
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:14 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id F147F5C01AD;
        Mon, 11 Jul 2022 11:25:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 11 Jul 2022 11:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553113; x=1657639513; bh=r3
        y1O6SDS/DPan2S5jSyYsN+hZszzDATKyRTZWWhzfQ=; b=q3d4nSZ5yKteyl50cl
        IQRnQQgbyNEpb1bC+FGasGoViOgNaWgOmsf0XKnvDJNHXIza1aLbRYgXv5xrZNss
        5XKnOCaVe1lI3istonWXlU25RivN7MgDPbl4xysx563jryrarcGv3P7HdFBHgHZN
        e6/oplRW3vAN1EzjOblAVT8zuryNF1Yt3X/bfnDhZSwIjaBTn4WkXGrkkAXKr19O
        Ihb69RL3Pr1C74z3VGS/A8r54wcd2amIanxQ1dGxTUQ/Zz7Soqv8CaFlqYAtsUuo
        IEH7ELykeG534wSe2v3NJOgUdH50H/4Ivx1pIApgsJxfNsL5vZ2vFPcik6pyUl5I
        TdkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553113; x=1657639513; bh=r3y1O6SDS/DPa
        n2S5jSyYsN+hZszzDATKyRTZWWhzfQ=; b=VAPiG/Cv9C3grV+01P/5maK381+VG
        uof3kIxjdQtG0Om3paedNFBb6s5q/LLBf1e5wHWq0vRcbjPG5PmDPUaS/j982zJ7
        9UfVnku34XlHlzC6lQ7IGHfxzKCRsU7dCOgaCp8U3y0hNIQMhG3zKNj2B+VvJGDL
        vjJsGa3QkJz3j8gYGAILE65X5a/yAsq+pUmwxbSI5GBuFErXfAb5gw3c7iRIyH0c
        nh0m27hVboWiZGi82NSHAgqB2yjPkCiajbmEvBcSVklCkR6X0KjVYEeJyETCcShd
        6Y3py+rc5uwGVwCAnEBl00v15RTXFrrT8Ya6a6W1EgqHHgT2NPZ8s427w==
X-ME-Sender: <xms:2UDMYsUOFX7TtHZ1YGb94OAbHR2s1fVFnsJLsLX9T-ik9IAuJwJdqw>
    <xme:2UDMYglkzlWv1hEjFK99I9shPDpR5sA8kWcQAE34ORR-G34vjnVavXrmTz4k-YuYj
    JhL7HGo7KFr4KvyhpU>
X-ME-Received: <xmr:2UDMYgYGbfQh_iQebPMT4ydUlyPo4t5lN0g0wtT6SAb7x-1DYVE1NWwpflhXXMgi5PvI0AqYOiIgFKUVW-mFRvkU2pDwUTAV11d4sYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2UDMYrVgQAzfwmnVf5wrt9yn_4BWyxf1u0D-ekaSY6foKhr4XkAnYg>
    <xmx:2UDMYmmPa2fNo_wLPLFzZzn8aHYv1ABpusVIjupNvV1nsPtkSTQefw>
    <xmx:2UDMYgcCV2-Uzpdg2NSqPEAKRkrFrYol3Bchqig6gpoRydXv4UKdlw>
    <xmx:2UDMYvfNaAVusVMwKX9tkUZzSgpVe6dnDRBHNodnmlN7QRpc2ECRoA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:13 -0400 (EDT)
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
Subject: [PATCH v6 25/28] clk: Zero the clk_rate_request structure
Date:   Mon, 11 Jul 2022 17:24:21 +0200
Message-Id: <20220711152424.701311-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

