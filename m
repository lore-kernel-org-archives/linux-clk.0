Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6DAECAAD5
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 15:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiH2Pj3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 11:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiH2PjY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 11:39:24 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24748E4FA
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 08:39:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C449D2211F;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1661787554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hSx2RugW2hGO3Udg6o5omWweArbjd3LUOfNMZgn7SbE=;
        b=wVKFUWA5IVn5NFU5jeY2Tw9mWgQY4FWk7dWmrUMJFiiHJPcjHNEOBXKh+8lXMc1BihZ3Ni
        viobcC0d1iR2LaoMHzp0H07KpSMxJ73Rucpl26xmupWC8JjvtJ38NYcHETSeNSSo70CZRR
        z8D9bYeqRxj7fJ9mhl50owwb9x92SH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1661787554;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hSx2RugW2hGO3Udg6o5omWweArbjd3LUOfNMZgn7SbE=;
        b=0mlgITBmjXHzPtjD/4COkzzwfo8b3XC1KjeDdlQtRosPCkKZRHAIlM5yKL5Ni/G4MZx4Ia
        8CPampTwXJqYkfBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A404B139C4;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QPm8J6LdDGPrDAAAMHmgww
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
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Dom Cobley <popcornmix@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [RESEND v4 1/3] clk: bcm: rpi: Add support HEVC clock
Date:   Mon, 29 Aug 2022 18:21:52 +0300
Message-Id: <20220829152154.147250-2-iivanov@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220829152154.147250-1-iivanov@suse.de>
References: <20220829152154.147250-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Export clock required for RPiVid video decoder hardware.

Cc: Dom Cobley <popcornmix@gmail.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 73518009a0f2..8f560c6b602d 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -129,6 +129,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_HEVC_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},
-- 
2.35.3

