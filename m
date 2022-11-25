Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B22C4167B
	for <linux-clk@archiver.kernel.org>; Fri, 25 Nov 2022 09:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiKYJai (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Nov 2022 04:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiKYJaS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Nov 2022 04:30:18 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9AC3D93F
        for <linux-clk@vger.kernel.org>; Fri, 25 Nov 2022 01:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669368588; x=1700904588;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DmOIhQNShqVstDmw8jjF8aUmwctmfk2eJPdFQFAmLGw=;
  b=kuBTRgPNFvNR8PPCd4mKSASeFTHoPUPS/a8g91n6fSRwM/5yecdKiK1N
   A/2ZZMI6fjjdsFHul9Wp4n+m6+xBaxH16YVLsHo1AuDJuCu85kU1NQyhr
   bALepH0ofDj2JwNVzWJNC0kd05r/tXk4gT9hgqeBPCZ5gWQaJlt802gB5
   PuKbHOBJI2rJnaXiZWyNAkepBxR7z2Ojt0MFj3UzxSjz9ac8QO5sXCDtd
   pGPeCZS7ZUNuz1x5lkxkGYV4tTBXTaZafCjpHwIDop+1DcFjr0Axkw9FL
   W9yMkCaDk3LF00A6ukAd+PyEIWjq2kN86EQ90u2ZA6H7UB7tjonvZgocy
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="190515176"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 02:29:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 02:29:44 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 25 Nov 2022 02:29:42 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>, <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock fixes for 6.1 #2
Date:   Fri, 25 Nov 2022 11:34:33 +0200
Message-ID: <20221125093433.382072-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Stephen,

I've added one more fix for Polarfire clocks. Please pull in case it
is not too late.

Thank you,
Claudiu Beznea

The following changes since commit 57976762428675f259339385d3324d28ee53ec02:

  ARM: at91: rm9200: fix usb device clock id (2022-11-17 15:35:52 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-fixes-6.1-2

for you to fetch changes up to e2e6a217a84d09785848a82599729c9a41566e3a:

  clk: microchip: check for null return of devm_kzalloc() (2022-11-24 12:44:13 +0200)

----------------------------------------------------------------
Microchip clock fixes for 6.1 #2

It contains a fix for Microchip Polarfire clocks; the fix consist in checking
the return value of devm_kzalloc() in mpfs_ccc_register_outputs() to
avoid possible null pointer dereference.

----------------------------------------------------------------
Hui Tang (1):
      clk: microchip: check for null return of devm_kzalloc()

 drivers/clk/microchip/clk-mpfs-ccc.c | 6 ++++++
 1 file changed, 6 insertions(+)
