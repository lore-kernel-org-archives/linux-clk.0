Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D53C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 10:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239697AbiBWK4y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239722AbiBWK4w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:52 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F4D8D6BF
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:24 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 36BFF5C0227;
        Wed, 23 Feb 2022 05:56:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 23 Feb 2022 05:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=QlOq15mubNZxvpuMRZ3gIcykADRMVQ
        WEqEwOiGentj0=; b=p+/+ZM93M0bFIBNU8uZZRvk3YTHe+ulDlA+N8wucBrpaDX
        P83MsTu3YQSAbpJcZXagaGnzk1XxJF12/mOxTQCCT4tLOd4WTvuevcU6mMSnA8uE
        lti0Mx8HoHmUEy9DuCVVDMNgnBhx5tfmiqYkeWjlk6j17lybPBvieZv8sgIoSu3F
        +TfuDs7/ejf4IM+FjyLDfHGG5bELB3+mSqWbYDrTCoHMfY9r2AssB7CPEBWpNn/j
        if7XU7hrAYL9KOrGh1qvR9qgJd5bTzsF7CSAoQgnc85YLJ2cTvGJRb2RqzuGoH8K
        mbMz9lRr+//EZ67wxCmZr23Ca2Rfncv8W1/+K+Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QlOq15
        mubNZxvpuMRZ3gIcykADRMVQWEqEwOiGentj0=; b=BUNHjwlVNEPTmq10mEdTAe
        tf/YNrgJok9/YH7nbJ6hO5P2WkYZz0gmOT6B99PDxhyfALzwhE3AyXGYaxrspFm+
        rk/rikoCRG0qBmE3zzx93ylzXOJkWEjnX7qEsNeEHYx+6Fj+AnIZYpzWssnSxi8c
        11YmFk7dEuVsx2qAj8dkxoLGw9bNMyQpX2WrqylafrcbPoyGSxeDtk+N1tirtvkX
        eptS6IMj70D/87gCDAiefgxbwUpAo++m2Ebtf5SUUMfMhwh85n57991Uj7wIEi4k
        mqYJv7sWaRINwOsl72UQF4zqgw7ztD9znusVSlp2cnWQNDfzvCckPiImyFLyYZRg
        ==
X-ME-Sender: <xms:2BIWYqs8ok_8ZtVASx-Jfq-vG6pzTvAjZWo70UzMsffbmwCotuuqsw>
    <xme:2BIWYveSLyqTf9g8PdchYvec-B7ktj1W4VdbRaS_4czLESr7rHUP-ymQn4lfa4IxI
    CpFRZh2VFsv6KfCmLg>
X-ME-Received: <xmr:2BIWYlzVX1mH5LVqVLB3yIJqFiykThLRzezCmbgGBIoehFv89oZH47l4u2zsJE_Z2esdZp_ySGBWM-Dc0EhJAnJYvlULvFRH_bKZhsE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2BIWYlPsMeVFVO4DepBXAwJokMALt0D77wNfoPlZI5G_1dW10fCqig>
    <xmx:2BIWYq_1W4NcIy0CfKXC8G5hL1WTsx9c-Wkbn7cUp7wHJdqIWij37g>
    <xmx:2BIWYtVxHU0wObZc27nJmXyM-ef-nviUwgpKyY1mtbNEVHsOsu1jig>
    <xmx:2BIWYvPIjz95ubYGM8yeBW-AQMREmXSL2l1SNbNvdgI6JhVqoDWFtg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:23 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 09/12] clk: bcm: rpi: Set a default minimum rate
Date:   Wed, 23 Feb 2022 11:55:57 +0100
Message-Id: <20220223105600.1132593-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The M2MC clock provides the state machine clock for both HDMI
controllers.

However, if no HDMI monitor is plugged in at boot, its clock rate will
be left at 0 by the firmware and will make any register access end up in
a CPU stall, even though the clock was enabled.

We had some code in the HDMI controller to deal with this before, but it
makes more sense to have it in the clock driver. Move it there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/bcm/clk-raspberrypi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index f7185d421085..c879f2e9a4a7 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -76,6 +76,7 @@ struct raspberrypi_clk_data {
 struct raspberrypi_clk_variant {
 	bool		export;
 	char		*clkdev;
+	unsigned long	min_rate;
 };
 
 static struct raspberrypi_clk_variant
@@ -89,6 +90,18 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
+
+		/*
+		 * If we boot without any cable connected to any of the
+		 * HDMI connector, the firmware will skip the HSM
+		 * initialization and leave it with a rate of 0,
+		 * resulting in a bus lockup when we're accessing the
+		 * registers even if it's enabled.
+		 *
+		 * Let's put a sensible default so that we don't end up
+		 * in this situation.
+		 */
+		.min_rate = 120000000,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -267,6 +280,19 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
+	if (variant->min_rate) {
+		unsigned long rate;
+
+		clk_hw_set_rate_range(&data->hw, variant->min_rate, max_rate);
+
+		rate = raspberrypi_fw_get_rate(&data->hw, 0);
+		if (rate < variant->min_rate) {
+			ret = raspberrypi_fw_set_rate(&data->hw, variant->min_rate, 0);
+			if (ret)
+				return ERR_PTR(ret);
+		}
+	}
+
 	return &data->hw;
 }
 
-- 
2.35.1

