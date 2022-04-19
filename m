Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A548C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 19 Apr 2022 08:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbiDSIo6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 04:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344162AbiDSIo5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 04:44:57 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189526367
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 01:42:15 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C64102112B;
        Tue, 19 Apr 2022 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1650357733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ptrAeXeHfHhMhWiRihLbsWQdqcONURLXN9p0YahQp4k=;
        b=bQZ6ysE4KkkI2muKQV7NZf+6kfESlmxhMfyz90hvI8jcjIwpC4ZeTKVWI46OriAiS3aqEL
        1o52tNj8t4zkgEQnnT5fEkjAlAD2bRNUmdbvWYFcW8lUOmtG+IZwRxdwZIjtaXiIx9tzph
        pchMYJAd2Bwr6crzXUhKjTKXrIVq3aw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1650357733;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ptrAeXeHfHhMhWiRihLbsWQdqcONURLXN9p0YahQp4k=;
        b=auyZhLCIA1L1zkgbWhq4ME9QEPX5oupifv6IgfYk1UDA3jZbrCGtaMUu94nI5fs3aWQds0
        WoFPNmTFlSH+CNAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3E9213AE0;
        Tue, 19 Apr 2022 08:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CMG5J+V1XmKpdAAAMHmgww
        (envelope-from <iivanov@suse.de>); Tue, 19 Apr 2022 08:42:13 +0000
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH v3 1/2] clk: bcm: rpi: Add support HEVC clock
Date:   Tue, 19 Apr 2022 11:40:57 +0300
Message-Id: <20220419084058.146509-2-iivanov@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220419084058.146509-1-iivanov@suse.de>
References: <20220419084058.146509-1-iivanov@suse.de>
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
index 9d09621549b9..2e2491d85835 100644
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
2.34.1

