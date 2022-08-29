Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8776ECAAD2
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 15:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiH2Pj1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 11:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiH2PjX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 11:39:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49625956B8
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 08:39:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id DC1201F8EC;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1661787554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y3RYH38w0+cy1s7oBuiOAQr7S3GAFYYj32f7Seo0dPE=;
        b=lYP9JHQgK2eaGGZxmZLcLMphLbtx5lz3eNQ09RLETk+5/tyZhXtDvUm/GW6PLx9t7DEQK/
        xVwJPxs2vo7uA5F+U1Qys0Z8r4YRpduK4enLb+7rO9IaHQOYDe2UdeLDjGc+cSM3kF30/8
        UVrWWVDava4mLYFXnYp4EUKWb3cRYR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1661787554;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y3RYH38w0+cy1s7oBuiOAQr7S3GAFYYj32f7Seo0dPE=;
        b=f/Q7j7xKpsVzNXI8rI1mDGWh3BpgC6DI8aT8S24KW0upA8dTq+kLQNslTeroT0yfrUjrdY
        kAWXgRiW//Oq7wBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2DFD1352A;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EPJQL6LdDGPrDAAAMHmgww
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
        Maxime Ripard <maxime@cerno.tech>
Subject: [RESEND v4 2/3] clk: bcm: rpi: Handle pixel clock in firmware
Date:   Mon, 29 Aug 2022 18:21:53 +0300
Message-Id: <20220829152154.147250-3-iivanov@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220829152154.147250-1-iivanov@suse.de>
References: <20220829152154.147250-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk-bcm2835 handling of the pixel clock does not function
correctly when the HDMI power domain is disabled.

The firmware supports it correctly, so add it to the
firmware clock driver.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 8f560c6b602d..1248c0d64eae 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -129,6 +129,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
-- 
2.35.3

