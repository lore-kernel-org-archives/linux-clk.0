Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0DFC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 07:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244693AbiD1HEP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 03:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244763AbiD1HEJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 03:04:09 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB27F6D1B5
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 00:00:55 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6DA091F380;
        Thu, 28 Apr 2022 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1651129254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ptrAeXeHfHhMhWiRihLbsWQdqcONURLXN9p0YahQp4k=;
        b=aoOhw7AnJhHOuF1JCVJmQ9GU9xB2Q8mnaiYaVO2KLzi3Vl6h8z76zogr6yu3477/a/c433
        Iw+Cu83U0tdaPxsMcpJJnjjfGGnWAv4IJYC8C+mGuf/gH1q3pwewuHRcxS0q8josDcKLUx
        rh+yUVsCZ05/YLWEjwvCh6xrA+Em2u8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1651129254;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ptrAeXeHfHhMhWiRihLbsWQdqcONURLXN9p0YahQp4k=;
        b=R4qg+zqq4PhLVOIaEsVZSqMsY2EMq5z7C3c683fkrvYsz8/99ppJC0IZ69FWf7TBVKk9Ml
        G6g4RLRZ3UGb3HDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE93E13AF9;
        Thu, 28 Apr 2022 07:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WEAwMpM7amJ3XAAAMHmgww
        (envelope-from <iivanov@suse.de>); Thu, 28 Apr 2022 07:00:35 +0000
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
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Dom Cobley <popcornmix@gmail.com>
Subject: [PATCH v4 1/3] clk: bcm: rpi: Add support HEVC clock
Date:   Thu, 28 Apr 2022 09:57:41 +0300
Message-Id: <20220428065743.94967-2-iivanov@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428065743.94967-1-iivanov@suse.de>
References: <20220428065743.94967-1-iivanov@suse.de>
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

