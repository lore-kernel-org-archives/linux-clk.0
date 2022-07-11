Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9935C43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbiGKPYh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbiGKPYf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:35 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71161C104
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:34 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 539235C019D;
        Mon, 11 Jul 2022 11:24:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 11 Jul 2022 11:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553074; x=1657639474; bh=b7
        V9pOeMA8I1XC/Vwky3BaSr5cV9wMKBYVcM2SZN/y4=; b=jK5ocbqTJ7vio77tju
        2NiBnOqHXav9W/5MgfJMe3SrQzAhUnYlDkRBDbqBW6+7KLC9JQxZA3nKNeLAphwr
        8KCZI+hjOiibWrXxJkjVyoFDPTA5XyY7jXlOGMm4FYHRAMCOD3ICYFau76XQ7grb
        cCA/QTqvwCDngOqRPDh3nYp+xwsMhG8qxgnMkghyfPV1WAMDu1gf1sQwgVlIOBcC
        3TPSUkbSOK5Ci1NkGULANVqYRNAW3TbqUSA5bZo6O4EnBqN3ZsYrTP1eSgozoU4Q
        xXIwpj0VLscz1aOKn6BaJU9LQx97EUsAc3GBCaUbg7YpO8hS/xozMNz6M7B5ZWBk
        iX4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553074; x=1657639474; bh=b7V9pOeMA8I1X
        C/Vwky3BaSr5cV9wMKBYVcM2SZN/y4=; b=NlGJjfUthKvMZ3Qpw4sxQgu3C0utT
        ONx6/M1gJhxH+m+afvamYtqk2OHI03fQax02EMUOlzloX0qH2UaUA/nBpE7kDRAR
        ZIi2CFyqRHLYYxAv29eT+8AVqGa39n7pfheEYhcYoFLbiterxW4nJhw258cu4ep8
        FeVUCop2hiMthiTm4RDNI6GPsmEGp0gp0SXawpOD6NFed1FLDpQTDmrlUsp+CNpI
        utUlLrvQJGLfZC+CAtDOBCJR4+VMzK4jgsk0daDhnx6qieUqKY3yUyhZIz2AJzBt
        CeL3Zi+Cq5wd2sfdt/pv97AqwGcvt/im4eRTWeqOdcsXQAgr5v1Jh0Clg==
X-ME-Sender: <xms:skDMYudv0nk2DdOts1svolZzsowd47UqOd2xi000J8hFgT1m_TlSOw>
    <xme:skDMYoNLDbI9dDuSg2-OHZJ7ee1Rl1PfDZULxbD4LPdx_AwkG6OEpyF6SL2kx66tS
    dQpiXTDSa4duyTtQiY>
X-ME-Received: <xmr:skDMYvgwpe8XUdlWOEuTVHLkM2droZct7ZtPC4jE_ngLMR_ck8UiUTVHPPR7rfU3h7111Nzy4bFkZ9vgOUbpG7dSp4zv-8NApumDS3E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:skDMYr8V2Oyia_uSS7coXJ8Vcl6gz5OyXEP3osxC3hCSSNAnZD712g>
    <xmx:skDMYqug4uW6Syk0MQjrhMu1pCy01vklBZBTbl9T2m_trKtY30Z1Ug>
    <xmx:skDMYiGnYmbwfAoYjO_XFJBHeMRstN1CJlkmSIV6jrp5bYqbdA6L-w>
    <xmx:skDMYrmzrqFsGiPO0g-CwocfUYy0C4FxygN4KEB3s5cR0j8kzAEwug>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:33 -0400 (EDT)
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
Subject: [PATCH v6 03/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
Date:   Mon, 11 Jul 2022 17:23:59 +0200
Message-Id: <20220711152424.701311-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to support higher HDMI frequencies, users have to set the
hdmi_enable_4kp60 parameter in their config.txt file.

We were detecting this so far by calling clk_round_rate() on the core
clock with the frequency we're supposed to run at when one of those
modes is enabled. Whether or not the parameter was enabled could then be
inferred by the returned rate since the maximum clock rate reported by
the firmware was one of the side effect of setting that parameter.

However, the recent clock rework we did changed what clk_round_rate()
was returning to always return the minimum allowed, and thus this test
wasn't reliable anymore.

Let's use the new clk_get_max_rate() function to reliably determine the
maximum rate allowed on that clock and fix the 4k@60Hz output.

Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rate allowed")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1e5f68704d7d..3b75ac6fa0db 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -46,6 +46,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rational.h>
 #include <linux/reset.h>
+#include <soc/bcm2835/raspberrypi-clocks.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/hdmi-codec.h>
 #include <sound/pcm_drm_eld.h>
@@ -2966,7 +2967,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	if (variant->max_pixel_clock == 600000000) {
 		struct vc4_dev *vc4 = to_vc4_dev(drm);
-		long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
+		unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
 
 		if (max_rate < 550000000)
 			vc4_hdmi->disable_4kp60 = true;
-- 
2.36.1

