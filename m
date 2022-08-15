Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23965C00140
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiHOPmg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbiHOPmZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:25 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FFB17065
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:25 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 862303200902;
        Mon, 15 Aug 2022 11:42:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 11:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578143; x=1660664543; bh=pF
        xYRZyB0FRERX7hanRyYPuks1o944pCOBiLlgMNcr8=; b=ewEfCX2A/axoD5TCOe
        Ahuogzrr1wSHun50KfjcC91yTBt8eR8Mjf0TW66C9oWxwtUx/l5uLGKmnf17k3HB
        mgV+27PlQ3F+6OTXXVkNCAYBSiuYJ9SF9+oXhE+QY/7DlWhmC3T2vRO9fWHORWjx
        2OkeYT3BbPXHjINhuM0zjMRf+BK/6KKPPScAgSEP2nb5Rzh9tMPpKU8cZKRzUbSo
        KyACRpTXbRfeFa7qelptv/xF4SwxYvt0a2XjxmKHQHz9BOPWIZWhOPWDrxDYXe51
        jay3j+G7GtIia6u/lam1qiW2Bv6xqfCq1Zzl+TzE81KXGFfre5yY6zREJ5nmv7Lz
        2PQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578143; x=1660664543; bh=pFxYRZyB0FRER
        X7hanRyYPuks1o944pCOBiLlgMNcr8=; b=aK8VoBy5nSNTWsDLAYL9Ipatj7DWI
        pqAYAlQAU5ex6cT6XXjWBCh7Oyg9Klivy+C1fhT4yhFHWtYcBlgMqlgd/Ke/mEv7
        dC/YTXdN/FmwP+m0Tw7wXQZu6XBLs/YMbkod1gU+wateWzdqYCoQ4E3FsRjneCfh
        SsSq8GLKTcKjgB31u5zw9/iJzdmyvEtLWqEl0epc8goJz7pidMBkXkjbEYq6F+ea
        f7SiF5lSynmtF3W7N2FDnh41DNQjiXgnlo6DjeikvuGEGg0S2Mm3mOM5qFzZr2xn
        TSGDAwr8d4TFrelWjLDemwhGaFyei6gtKZm05UUMlgxD4y1ZkrLORBWVg==
X-ME-Sender: <xms:Xmn6Yn3kQmL4KZ5VDki37Qfnk1EJtXOEO5GF1BMfbqla0yslWS8RMA>
    <xme:Xmn6YmGz9UDFU5W4QYvkRSTo5x4k_5CGhdgNRtZR30IxuVJKWx8sSdwG5tNYw3sks
    XwIfzkFp4bRGdpri34>
X-ME-Received: <xmr:Xmn6Yn7ektpT0QPgHdUo-aMdCHXud6uDq8wyxdwVwSxWHLSJ2rI32lg_zapH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeehleetfeejteeivdetveegtdetgeffffdvkeeuheejuedvjeefvdekffel
    gfefieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:Xmn6Ys1beanfAec-MlnibMWpQ91DZOHyBc7svFHzY0ZuPu3_pNY2-g>
    <xmx:Xmn6YqEIZtS8BghU98S88mot11FBPK2u0Wm481PI0e2zNW2GPIMuzQ>
    <xmx:Xmn6Yt_uhC6mhV2W3Xga1hcx_e-0i7cbMb6kMTtoQHMQvaWh9zUq1w>
    <xmx:X2n6Yi8FVJPpo3rfz8t7A32gPLXKJ_9ECBEgLuXlcvhKpwOyl3Pb5A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:21 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 07/25] clk: tests: Add reference to the orphan mux bug report
Date:   Mon, 15 Aug 2022 17:41:29 +0200
Message-Id: <20220815154147.1631441-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some more context might be useful for unit-tests covering a previously
reported bug, so let's add a link to the discussion for that bug.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1a7cb482ec58..b8e32406a6e4 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -322,6 +322,9 @@ static void clk_orphan_transparent_single_parent_mux_test_exit(struct kunit *tes
 /*
  * Test that a mux-only clock, with an initial rate within a range,
  * will still have the same rate after the range has been enforced.
+ *
+ * See:
+ * https://lore.kernel.org/linux-clk/7720158d-10a7-a17b-73a4-a8615c9c6d5c@collabora.com/
  */
 static void clk_test_orphan_transparent_parent_mux_set_range(struct kunit *test)
 {
-- 
2.37.1

