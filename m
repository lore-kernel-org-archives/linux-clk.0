Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC995C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  4 Apr 2022 08:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242238AbiDDJBA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Apr 2022 05:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235945AbiDDJBA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Apr 2022 05:01:00 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF4725C53
        for <linux-clk@vger.kernel.org>; Mon,  4 Apr 2022 01:59:04 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2AFD1210F5;
        Mon,  4 Apr 2022 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1649062743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=kzl0YogUV15ZNu+Gdvf0m+yPGkbCIWbej2o9Y3VSOdc=;
        b=vLC7UcdLc3ZXqwkVSqEDgtOzlkIp/H6wJm0577gl1hcl6HOQ6vY9Iy2Byr103ZnSi4qeB4
        JChP/JLUNfQtDvhjFx87C2MMczCiXQXpDMfvSHo0KeDpqN9TRQOQbwukHpqVFQaVEQUTiG
        yGpGDn1/qVmWhKJdh1sfShrc3bpA1CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1649062743;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=kzl0YogUV15ZNu+Gdvf0m+yPGkbCIWbej2o9Y3VSOdc=;
        b=Rc/R+dxIeIUy3cVs8M3bzxbIqzpX6WBxi60o88EE6z2nS+GHUzUwQmN44GcF7DxfcEad5l
        BK8mpf6d/y27kXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 140BD13216;
        Mon,  4 Apr 2022 08:59:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +8uWBFezSmKNDwAAMHmgww
        (envelope-from <iivanov@suse.de>); Mon, 04 Apr 2022 08:59:03 +0000
From:   "Ivan T. Ivanov" <iivanov@suse.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Elwell <phil@raspberrypi.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "Ivan T. Ivanov" <iivanov@suse.de>
Subject: [PATCH] clk: bcm2835: Round UART input clock up
Date:   Mon,  4 Apr 2022 11:58:22 +0300
Message-Id: <20220404085822.84135-1-iivanov@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The UART clock is initialised to be as close to the requested
frequency as possible without exceeding it. Now that there is a
clock manager that returns the actual frequencies, an expected
48MHz clock is reported as 47999625. If the requested baudrate
== requested clock/16, there is no headroom and the slight
reduction in actual clock rate results in failure.

If increasing a clock by less than 0.1% changes it from ..999..
to ..000.., round it up.

This is reworked version of a downstream fix:
https://github.com/raspberrypi/linux/commit/ab3f1b39537f6d3825b8873006fbe2fc5ff057b7

Cc: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
---
 drivers/clk/bcm/clk-bcm2835.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 3ad20e75fd23..f293cde427b7 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -502,6 +502,8 @@ struct bcm2835_clock_data {
 	bool low_jitter;
 
 	u32 tcnt_mux;
+
+	bool round_up;
 };
 
 struct bcm2835_gate_data {
@@ -992,12 +994,30 @@ static long bcm2835_clock_rate_from_divisor(struct bcm2835_clock *clock,
 	return temp;
 }
 
+unsigned long bcm2835_clock_round(unsigned long clk)
+{
+	unsigned long scaler;
+
+	/*
+	 * If increasing a clock by less than 0.1% changes it
+	 * from ..999.. to ..000.., round up.
+	 */
+	scaler = 1;
+	while (scaler * 100000 < clk)
+		scaler *= 10;
+	if ((clk + scaler - 1) / scaler % 1000 == 0)
+		clk = (clk / scaler + 1) * scaler;
+
+	return clk;
+}
+
 static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
 					    unsigned long parent_rate)
 {
 	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
 	struct bcm2835_cprman *cprman = clock->cprman;
 	const struct bcm2835_clock_data *data = clock->data;
+	unsigned long rate;
 	u32 div;
 
 	if (data->int_bits == 0 && data->frac_bits == 0)
@@ -1005,7 +1025,12 @@ static unsigned long bcm2835_clock_get_rate(struct clk_hw *hw,
 
 	div = cprman_read(cprman, data->div_reg);
 
-	return bcm2835_clock_rate_from_divisor(clock, parent_rate, div);
+	rate = bcm2835_clock_rate_from_divisor(clock, parent_rate, div);
+
+	if (data->round_up)
+		rate = bcm2835_clock_round(rate);
+
+	return rate;
 }
 
 static void bcm2835_clock_wait_busy(struct bcm2835_clock *clock)
@@ -2142,7 +2167,8 @@ static const struct bcm2835_clk_desc clk_desc_array[] = {
 		.div_reg = CM_UARTDIV,
 		.int_bits = 10,
 		.frac_bits = 12,
-		.tcnt_mux = 28),
+		.tcnt_mux = 28,
+		.round_up = true),
 
 	/* TV encoder clock.  Only operating frequency is 108Mhz.  */
 	[BCM2835_CLOCK_VEC]	= REGISTER_PER_CLK(
-- 
2.26.2

