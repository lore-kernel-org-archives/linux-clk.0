Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48349C004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 11:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbjASLjU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjASLiz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 06:38:55 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDFB4CE56
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674128277; x=1705664277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gz4VLMDhrcBag9yEpBKB1xhapLAVprFlDszzs5U36fk=;
  b=SH10Nl5bxtsLdxWO1ziEyRTXhW2gMdIg4QzAcWvo8+j6XLLe1rEwOVuT
   9kJlHY9UC/O92rylt/4Cmdr6+3DDc7ZrKU/Uy4cIrbnvozyazdAxaCfkc
   ywHL/RazcZj8U6J2IfRLY+o9qE/sIGzsnJb1peC6VdFX+GXArYlmya3AJ
   sS9LpnjJVJCJjQdiQiE0jhb4IYGZnMd0zzR5uysQQOmNZx5bvTmEsfbTF
   rwHVhIAppLJqmGUjO95Is88GwWWfAcEh4jO0/nyMSkGcInVTfvQba3nJD
   rPsXjSwaBeNCvWYA2GnRfp9L/voJltmjwxZs5pN2j66SX4Mnw42sY1uHT
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669100400"; 
   d="scan'208";a="208444416"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2023 04:37:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:37:56 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 04:37:53 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>, <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock fixes for 6.2
Date:   Thu, 19 Jan 2023 13:35:51 +0200
Message-ID: <20230119113551.43887-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-fixes-6.2

for you to fetch changes up to 86d884f5287f4369c198811aaa4931a3a11f36d2:

  clk: microchip: mpfs-ccc: Use devm_kasprintf() for allocating formatted strings (2023-01-19 11:45:35 +0200)

----------------------------------------------------------------
Microchip clock fixes for 6.2:

Only one fix for Polarfire SoCs at this time as follows:
- replace devm_kzalloc() with devm_kasprintf(); this has been marked as
  fix to avoid having registered 2 clocks with the same or invalid name in
  case device tree node addresses will be longer such that clocks
  registered with name patern "ccc<node_address>_pll<N>" will exeed the
  allocated space.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: microchip: mpfs-ccc: Use devm_kasprintf() for allocating formatted strings

 drivers/clk/microchip/clk-mpfs-ccc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
