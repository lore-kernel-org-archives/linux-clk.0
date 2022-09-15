Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCBBECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 15 Sep 2022 09:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbiIOJY4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Sep 2022 05:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIOJYz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Sep 2022 05:24:55 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B6D2653
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663233893; x=1694769893;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zCPYWjFwVtG8hSnAfoTVUSXlAecrb1LRiOi7L7wwCLk=;
  b=LUcAc6587hS2Ul0KoKVQ7UPzHKpnNp9wQrV2i66USH6HFRTdGNyIWVXV
   Jv8DhoxusQPOxUKT5DoU9IcGQyqVKRlXed/LPBSl2xGuMUui4l2buygBd
   ogybbQXI06a+gYRm118wJSpPs7wRBBZ6ZrIh6237mnzoX+ff1OIzuZuje
   7npJ2B1Yiz6YCAFIQE2lZeRboSbu0bRagm5aNCaX69scTMvJdlR0Sl/x3
   hiV6vzfbE69bJPacBUjjWsJXW1PZjg6PSyMZipPG05Dd/XE8vgjhqucAg
   IFrjjczz8H0BXlqnzgULBhIVsalOSjZm+jKLQ+orhxzESJnerfuG8LC/B
   w==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="113801741"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 02:24:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 02:24:52 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 02:24:51 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>
CC:     <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock fixes for 6.0
Date:   Thu, 15 Sep 2022 12:27:11 +0300
Message-ID: <20220915092711.4158723-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Stephen, Micheal,

On Microchip we decided to send a single clock pull request for both
AT91 and Polarfire architectures. Let us know if you would prefer otherwise.

Thank you,
Claudiu Beznea

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-fixes-6.0

for you to fetch changes up to 05d27090b6dc88bce71a608d1271536e582b73d1:

  clk: microchip: mpfs: make the rtc's ahb clock critical (2022-09-14 10:45:52 +0300)

----------------------------------------------------------------
Microchip clock fixes for 6.0

It contains fixes for Polarire SoCs:
- fix panic at boot in clock initialization when building with clang-15
- make RTC's AHB clock critical as rtc will stop if the AHB
  interface clock is disabled

----------------------------------------------------------------
Conor Dooley (2):
      clk: microchip: mpfs: fix clk_cfg array bounds violation
      clk: microchip: mpfs: make the rtc's ahb clock critical

 drivers/clk/microchip/clk-mpfs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
