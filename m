Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846BBC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 07:01:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbiD1HEN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 03:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235345AbiD1HDy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 03:03:54 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5171768333
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 00:00:37 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id DD6351F37F;
        Thu, 28 Apr 2022 07:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1651129235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=SybrQbZxiv8XcvSt6fdIwr+ifZHD/mWKoCuY4F2vhfs=;
        b=C7Zf1mumsnZbMdSHpSbcgVBurZso83wOM6vLYJaf/OxJPgCAbKqxaZFHItFQO1XqOX7TXr
        YR3m54neFd1Nz0TYcZgcLLwBjIUPNH0m2qLkZLRNvrzufE/BNzGAdnh3bor+PWfQtjl/S8
        +cnyV6GP3t+Z6qhJLAsWYdr8bse6kpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1651129235;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=SybrQbZxiv8XcvSt6fdIwr+ifZHD/mWKoCuY4F2vhfs=;
        b=i4YKYSWhOqxs2hVIEZCtUXT4kiyutVHIFshwhfMeUAA8GDpV8QiHPf3NX2zqJLMAYmEChd
        xZdXb2eBxBJx3DDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BCAAD13A8C;
        Thu, 28 Apr 2022 07:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id B/zBLZM7amJ3XAAAMHmgww
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
        "Ivan T. Ivanov" <iivanov@suse.de>
Subject: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Date:   Thu, 28 Apr 2022 09:57:40 +0300
Message-Id: <20220428065743.94967-1-iivanov@suse.de>
X-Mailer: git-send-email 2.34.1
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
2.34.1

