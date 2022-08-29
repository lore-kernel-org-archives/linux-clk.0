Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C327EC0502E
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 15:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiH2Pj3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 11:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiH2PjY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 11:39:24 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4135956A1
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 08:39:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id EDEB71F8F4;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1661787554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ueNs86UFTJjj7RHZjMtBbl+FZzSEy2RU3fTLV1g4LWQ=;
        b=1qqKObPR5uXbaLX9jU1Tfys9jf1NjWdo23ibzfp458QNFJ7ej+X5cjot7IjL27SjMlI3+p
        NJ7lueh2RZQJ3kDQel9l1ideNxWEZUp/zjCegPDPtSLab7y/LRFKDVA3dHM0up8F16NwID
        hiTXtWjP7Q+BMcdxCqd3uaIcT8SzJa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1661787554;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ueNs86UFTJjj7RHZjMtBbl+FZzSEy2RU3fTLV1g4LWQ=;
        b=69y+U27EYL0AWFZsx/cFkhdzguhMVPY2aUGt6S69NwJO6CB72A7wSQ5cJ+ScOIKTyIr4th
        tZM45L8EJ1vTBwDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8AAB139C4;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8Hm2NKLdDGPrDAAAMHmgww
        (envelope-from <iivanov@suse.de>); Mon, 29 Aug 2022 15:39:14 +0000
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Dom Cobley <popcornmix@gmail.com>,
        "Ivan T . Ivanov" <iivanov@suse.de>
Subject: [RESEND v4 3/3] clk: bcm: rpi: Add support for VEC clock
Date:   Mon, 29 Aug 2022 18:21:54 +0300
Message-Id: <20220829152154.147250-4-iivanov@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220829152154.147250-1-iivanov@suse.de>
References: <20220829152154.147250-1-iivanov@suse.de>
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
index 1248c0d64eae..d70bb9283af7 100644
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
2.35.3

