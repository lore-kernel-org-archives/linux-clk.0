Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88936C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 18 Nov 2022 13:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiKRNJi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Nov 2022 08:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbiKRNJh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 08:09:37 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4C113CE1
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 05:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668776975; x=1700312975;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i9EU8CIuKhQcCrR6sA6bSZtoKR1G7JMKPiCVip/UEIQ=;
  b=qEWhOntIVeAw4oamTf4ZZlpgDvGuEasSvQmbrMmlXcck7w+jr0iK50Jv
   mkYwS4XLBje7/hY/ngJNDBFnLH/DmrgQxCFIGE/XOeW3k6F3xnw9WT1Mg
   icHJ6PFlh5MB/85z2sKOhYYPC7pXMA0yF+zzN1GUv0iF8efCjS/I2ZdQf
   4gFUzowwWl8Q0vYsG3DYFeo9dPjFdj2kh2orbZYY3lCmvhMHOWMolBSYw
   JVspPAz/wfTlZvAVmOjkJDX54ZGmibMF5kItIDPlH1Pdn+24ENM2x6VV4
   fl6BeIoZpLT78SMLuJrduGjJaix39MVJSBXUY+ZxuIa+wIBKIh25/2238
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; 
   d="scan'208";a="187637443"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2022 06:09:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 18 Nov 2022 06:09:24 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 18 Nov 2022 06:09:22 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>, <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock fixes for 6.1
Date:   Fri, 18 Nov 2022 15:14:14 +0200
Message-ID: <20221118131414.301703-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-fixes-6.1

for you to fetch changes up to 57976762428675f259339385d3324d28ee53ec02:

  ARM: at91: rm9200: fix usb device clock id (2022-11-17 15:35:52 +0200)

----------------------------------------------------------------
Microchip clock fixes for 6.1

It contains fixes for AT91 SoCs as follows:
- fix the clock ID for USB device port on RM9200 SoCs; along with it the
  device tree references to this clocks were fixed in this patch to ease the
  backporting and to avoid USB driver probe failure.

----------------------------------------------------------------
Michael Grzeschik (1):
      ARM: at91: rm9200: fix usb device clock id

 arch/arm/boot/dts/at91rm9200.dtsi | 2 +-
 drivers/clk/at91/at91rm9200.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
