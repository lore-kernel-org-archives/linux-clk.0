Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44D5C433FE
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 15:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbiKDPLq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 11:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbiKDPLq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 11:11:46 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24321A823
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=o5G6ywjK5WyZvQ4BfSwOiLBQCQf
        hfFENRq90gGGsW1U=; b=RFpHpNkJZdo1d/D5zg6SJjOdBqNbwaS1LYXD3EfdRmV
        McOmylIvZRudVfu6VB0A+eCny+ZBer245WOD6YOLJO7Rr8dOUJuMLTZ6hFedMij5
        XfxPvKAvjzdnbzNNoJCztIiNAX6UVWRo73+H9arqnFbq5XKHm6i8gPt3Zfke8nm4
        =
Received: (qmail 3148145 invoked from network); 4 Nov 2022 16:11:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2022 16:11:42 +0100
X-UD-Smtp-Session: l3s3148p1@vQ/Dfabs6A5ZD+8G
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] r8a779g0: add TMU support
Date:   Fri,  4 Nov 2022 16:11:32 +0100
Message-Id: <20221104151135.4706-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Here are the clk and DTS changes to enable CMT timers on the R-Car V4H
based WhiteHawk board. Tested with the 'clocksource-switch' selftest.
Nothing special, very similar to S4-8. That means the "cannot clear
CMCNT" error is also present like on every Gen4 SoC so far. Fixing this
is a seperate thing and the next step for CMT. Thanks and happy hacking!


Thanh Quan (1):
  arm64: dts: renesas: r8a779g0: Add CMT node

Wolfram Sang (2):
  clk: renesas: r8a779g0: Add CMT clocks
  TEST: arm64: dts: renesas: white-hawk-cpu: Enable CMT

 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 16 +++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 70 +++++++++++++++++++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       |  4 ++
 3 files changed, 90 insertions(+)

-- 
2.35.1

