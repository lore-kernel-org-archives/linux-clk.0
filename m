Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D43C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241825AbiBYOg3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241819AbiBYOg2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:28 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3C41AE654
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:35:56 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 3ECAF5C0138;
        Fri, 25 Feb 2022 09:35:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 25 Feb 2022 09:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=xZ5tDfJaUnDK2zdKkFq1Tltv4rLSsG
        LP6zUbM5VRt6k=; b=AeA6WESdxlCOJrxrW1S4z4f75k6aO3Gf3TbhwR660PFu4y
        gpITCuYEFGTh42c39/AE2SkEgCTm/2LM5PcEYThBr8Guub0XscIjB7hPFbhf73Xi
        4cYyVXVW7WF6laLCrH2/Fte39AOg+CYw06N9awNH3ri1DbA7Jy52f+mV5EAEoboq
        7F75IE7p4VP9BblVdE4bdzInppIhV3KNgy5DHWIq6MvFvw389wWTZoDR4yfG76cS
        b8X6eIXi3hiOx1PvJiaYzv1J3WSl3vqIoiO+RS1z/aYogCgEKnTBBqUG9xGQ5EbF
        tScjKbkvZF4RnCu4pCuoj9kC2z+Je2S0Nq0O4H+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xZ5tDf
        JaUnDK2zdKkFq1Tltv4rLSsGLP6zUbM5VRt6k=; b=aiDV2OLTD1lL//JX87lnGX
        ptASzqCQOLkMImoEKzBJbQyJCt2tfNH6u/R9+UlivUd3up6f1M+H4DrnfYIBlrKv
        eHiqVBBZLaSBBrWsl/4UFz54XxCC8K7w2nBwIDDHa3UukqfxSkXpQGqIoEq3I6N3
        lqTWJ1jX4rJgBCfPo62Dm0jSsS/ID1O43F2+1HI/02Lg3Vaf8EHE4Rg+GYzLMCXy
        Bw3pE3pfhg+VVbaruxvYxBc29+JMOxfTEAOJ0D505H177Sr7e3R12XK9dMBli7ho
        x9k1bmGzjbXSG/sKW7b3O2CoeX5E++rmRIpOaC05YxXHjNM+XRKoB6YNGtpZjRRg
        ==
X-ME-Sender: <xms:S-kYYmHb2iuOk6IKkJgzfMzmA1TtPEHauXYYiGLw3QUDqw4IVCAddg>
    <xme:S-kYYnWqqvDB1MP-oxLG-BQPyBxm2vn3XF4nOMrWy9NpDAqQaYf2871Xb123kGYu8
    4lK3Gp2F1KnsO1LQTA>
X-ME-Received: <xmr:S-kYYgIKDF-xWrFTDppzFIr_WiRLzuWzb9cO1nYT1_hE461DY3Z3bjRafASLBSfku15eVw-cDip-4HwrHBX0cVPvNseZCcrltohllb4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TOkYYgF72YNVRBx9vAQjNhUuSaAJRZ0X6TkdlfxrvRKMjgus-XOiCw>
    <xmx:TOkYYsUJTAe87pcq-yTsR9pBwyqFsHNg2CC8hyS-lpThDsvWwzWIHQ>
    <xmx:TOkYYjPDqcSLwh15AQsL-Cc7Wi8PXJs8x9ifkIKpzuoCRkTcwTnTrA>
    <xmx:TOkYYvG7F4DsVkJkar8jXLebCz9MVKxmbzs_nE4XxBMf62alBMI1Pg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:55 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 10/12] clk: bcm: rpi: Run some clocks at the minimum rate allowed
Date:   Fri, 25 Feb 2022 15:35:32 +0100
Message-Id: <20220225143534.405820-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The core clock and M2MC clocks are shared between some devices (Unicam
controllers and the HVS, and the HDMI controllers, respectively) that
will have various, varying, requirements depending on their current work
load.

Since those loads can require a fairly high clock rate in extreme
conditions (up to ~600MHz), we can end up running those clocks at their
maximum frequency even though we no longer require such a high rate.

Fortunately, those devices don't require an exact rate but a minimum
rate, and all the drivers are using clk_set_min_rate. Thus, we can just
rely on the fact that the clk_request minimum (which is the aggregated
minimum of all the clock users) is what we want at all times.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 37 +++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index c879f2e9a4a7..9d09621549b9 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -77,6 +77,7 @@ struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
 	unsigned long	min_rate;
+	bool		minimize;
 };
 
 static struct raspberrypi_clk_variant
@@ -87,6 +88,18 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_CORE_CLK_ID] = {
 		.export = true,
+
+		/*
+		 * The clock is shared between the HVS and the CSI
+		 * controllers, on the BCM2711 and will change depending
+		 * on the pixels composited on the HVS and the capture
+		 * resolution on Unicam.
+		 *
+		 * Since the rate can get quite large, and we need to
+		 * coordinate between both driver instances, let's
+		 * always use the minimum the drivers will let us.
+		 */
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
@@ -102,6 +115,16 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * in this situation.
 		 */
 		.min_rate = 120000000,
+
+		/*
+		 * The clock is shared between the two HDMI controllers
+		 * on the BCM2711 and will change depending on the
+		 * resolution output on each. Since the rate can get
+		 * quite large, and we need to coordinate between both
+		 * driver instances, let's always use the minimum the
+		 * drivers will let us.
+		 */
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -206,12 +229,26 @@ static int raspberrypi_fw_set_rate(struct clk_hw *hw, unsigned long rate,
 static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 					      struct clk_rate_request *req)
 {
+	struct raspberrypi_clk_data *data =
+		container_of(hw, struct raspberrypi_clk_data, hw);
+	struct raspberrypi_clk_variant *variant = data->variant;
+
 	/*
 	 * The firmware will do the rounding but that isn't part of
 	 * the interface with the firmware, so we just do our best
 	 * here.
 	 */
+
 	req->rate = clamp(req->rate, req->min_rate, req->max_rate);
+
+	/*
+	 * We want to aggressively reduce the clock rate here, so let's
+	 * just ignore the requested rate and return the bare minimum
+	 * rate we can get away with.
+	 */
+	if (variant->minimize && req->min_rate > 0)
+		req->rate = req->min_rate;
+
 	return 0;
 }
 
-- 
2.35.1

