Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5D1C0502C
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 15:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiH2Pj2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 11:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiH2PjY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 11:39:24 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD10915C4
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 08:39:16 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A76C41F8CA;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1661787554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Uf16zSI5IN055iNDRYukRl26TjtcREO64gRxSGdlrpI=;
        b=LprNfFuqhg0vtx+uzObRkspWDHk0JadXSQy+b9LJjPg7BbWEpWqcH49CM1qapaO+6hQZ92
        yFZkjgHNsddcOHLWX9qcbiYSdNLVQj8PMASCq0BthHKdQ+e9w8741eImjHryMV/bXve2fp
        Cv3AgjxUZkrI8LUuMoTMXSsYq0ANr5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1661787554;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Uf16zSI5IN055iNDRYukRl26TjtcREO64gRxSGdlrpI=;
        b=TOXoYlLjfun4B5uFzJtnkxghBbOV/LgA4zhPPeb30Th7tB6AnoAZn3Vd2OBASrlPJ2hQS0
        8pVwIzWmvYOfKHDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FC2C1352A;
        Mon, 29 Aug 2022 15:39:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id XjjGIqLdDGPrDAAAMHmgww
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
        "Ivan T. Ivanov" <iivanov@suse.de>
Subject: [RESEND v4 0/3] clk: bcm: rpi: Add support for three more clocks
Date:   Mon, 29 Aug 2022 18:21:51 +0300
Message-Id: <20220829152154.147250-1-iivanov@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add missing clock required by RPiVid video decoder and provide more
reliable and accurate source for HDMI pixel and video encoder clocks.

Changes since v3
- Put back support for VEC clock, which was actually one of
  reasons for this patch-set [1]. I mixed "HEVC" vs. "VEC", sorry.

  [1] https://bugzilla.suse.com/show_bug.cgi?id=1198942

Changes since v2
- Added Acks from Maxime Ripard and Dave Stevenson

Changes since v1
- Drop RPI_FIRMWARE_VEC_CLK_ID clock it doesn't seems to be used.
- Rework downstream changes on top of recent Maxime changes.

Dom Cobley (1):
  clk: bcm: rpi: Add support for VEC clock

Ivan T. Ivanov (2):
  clk: bcm: rpi: Add support HEVC clock
  clk: bcm: rpi: Handle pixel clock in firmware

 drivers/clk/bcm/clk-raspberrypi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.35.3

