Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BB7C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 07:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244696AbiD1HEQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 03:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244762AbiD1HEJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 03:04:09 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49136D1A4
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 00:00:55 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 62E961F37F;
        Thu, 28 Apr 2022 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1651129254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DIGiUnkyxHNS0uD6OrT7smx8n4IaG1rFE68rlCC4b8A=;
        b=PusB2URtH5dyrVl7zGBybD4Yzf+K3YgN+YdRDHMA/XJN24GiwB2Zt+PxoIXABELk3iSOZf
        5xOOTJk1sE1JAX8r0a6DfOkIN0WdR8biRSF+2/VPbWV7C6vwJL0Eyf6P2BZJhQwoK1vVKS
        P/TD0Z7eZ6648iueNJKtm7BR4gc/fsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1651129254;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DIGiUnkyxHNS0uD6OrT7smx8n4IaG1rFE68rlCC4b8A=;
        b=r5uIT3hgFRE83pNn3OuVjBGPUzSPZIubBsDvIERo/Bfogn+XQ5J91ijmjIs1YqJteamOoi
        mreqlSVhgQavr1BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0828013AFE;
        Thu, 28 Apr 2022 07:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uP2iAZQ7amJ3XAAAMHmgww
        (envelope-from <iivanov@suse.de>); Thu, 28 Apr 2022 07:00:36 +0000
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Guillaume GARDET <guillaume.gardet@arm.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Dom Cobley <popcornmix@gmail.com>,
        "Ivan T . Ivanov" <iivanov@suse.de>
Subject: [PATCH v4 3/3] clk: bcm: rpi: Add support for VEC clock
Date:   Thu, 28 Apr 2022 09:57:43 +0300
Message-Id: <20220428065743.94967-4-iivanov@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428065743.94967-1-iivanov@suse.de>
References: <20220428065743.94967-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Dom Cobley <popcornmix@gmail.com>

Platform driver clk-bcm2835 gets an inaccurate clock for VEC (107MHz).
Export VEC clock trough clk-raspberrypi which uses the right PLL to
get an accurate 108MHz.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
[iivanov: Adapted on top of v5.17-rc6]
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 drivers/clk/bcm/clk-raspberrypi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 530820d13104..d1dd01580573 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -33,6 +33,7 @@ enum rpi_firmware_clk_id {
 	RPI_FIRMWARE_EMMC2_CLK_ID,
 	RPI_FIRMWARE_M2MC_CLK_ID,
 	RPI_FIRMWARE_PIXEL_BVB_CLK_ID,
+	RPI_FIRMWARE_VEC_CLK_ID,
 	RPI_FIRMWARE_NUM_CLK_ID,
 };
 
@@ -51,6 +52,7 @@ static char *rpi_firmware_clk_names[] = {
 	[RPI_FIRMWARE_EMMC2_CLK_ID]	= "emmc2",
 	[RPI_FIRMWARE_M2MC_CLK_ID]	= "m2mc",
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID]	= "pixel-bvb",
+	[RPI_FIRMWARE_VEC_CLK_ID]	= "vec",
 };
 
 #define RPI_FIRMWARE_STATE_ENABLE_BIT	BIT(0)
@@ -138,6 +140,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_VEC_CLK_ID] = {
+		.export = true,
+	},
 };
 
 /*
-- 
2.34.1

