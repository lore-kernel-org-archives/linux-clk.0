Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F8EC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 19 Apr 2022 08:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344168AbiDSIo5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 04:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbiDSIo5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 04:44:57 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDFFDB0
        for <linux-clk@vger.kernel.org>; Tue, 19 Apr 2022 01:42:14 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A56182129B;
        Tue, 19 Apr 2022 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1650357733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=8A35fbJ1aXxS3Cy5VGlkYUBzaCwNnJPPmCylYMT0NOA=;
        b=PEXxIJVjEo69kptkwo9lgZ/BCDnAyiplvil+WZU/vA6swV54qbs8SdPtvLA0tx9NdBnddK
        ccHH9iMgorYSW56U2w3HX+ZePlw+wMQeUlboD7m3yPrDSgRiBMbVd86M/GQ9Wz3pahzjc/
        xLGug/kMoPRjfRVSRgCuXGNxpCO4WKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1650357733;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=8A35fbJ1aXxS3Cy5VGlkYUBzaCwNnJPPmCylYMT0NOA=;
        b=w4y02gQ0igmEe9Zsmw7zGQiSEwzPoEihXPByuNcUkosfwz+xPHmMn9MG3vbPnjdMyyBo1t
        gqBFUjFGdHjb72Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85AA3139BE;
        Tue, 19 Apr 2022 08:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 6xYtIOV1XmKpdAAAMHmgww
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
        "Ivan T. Ivanov" <iivanov@suse.de>
Subject: [PATCH v3 0/2] clk: bcm: rpi: Add support for two more clocks
Date:   Tue, 19 Apr 2022 11:40:56 +0300
Message-Id: <20220419084058.146509-1-iivanov@suse.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing clock required by RPiVid video decoder and make HDMI
pixel clock more reliable.

Changes since v2
- Added Acks from Maxime Ripard and Dave Stevenson

Changes since v1
- Drop RPI_FIRMWARE_VEC_CLK_ID clock it doesn't seems to be used.
- Rework downstream changes on top of recent Maxime changes.

Ivan T. Ivanov (2):
  clk: bcm: rpi: Add support HEVC clock
  clk: bcm: rpi: Handle pixel clock in firmware

 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.34.1

