Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550ECC00A5A
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 11:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjASLlT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjASLkq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 06:40:46 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57F674E9C
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 03:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674128432; x=1705664432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZvPdwqurW1dvbyCe6JVYpZFdsO4i4djjDh4kBNjzzc8=;
  b=NQUB3vWZscR7O32Ym0Jwu3j4QK35bAaciyudboForNbd3vAkGDLLb/hv
   rsDEtAdyviPaky22AM9pCduezDNQVLFHcG2slLx3klKx7ovD3DorMd2Ol
   SOpdpx5iR69jIOWX8H9UZMJ7/L7L5TNOfx1utEobsqysn0qXmyixf0NGQ
   IB9/TqbLLy4qqTuXJYM4CvcYju2QpWznJW/W8jvA+jHCn2vWV5OnL7xpt
   nCvryPHPNHkblVGQzrnExwoCgZ995wuaTMFbuFMOkTkw6WN+WiJudjnWJ
   wyfnCRa1vWzKnwhoGqQkx89XN8walr4IYm4Gg6//Irkq/pKmz2JXJqZwv
   g==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669100400"; 
   d="scan'208";a="197445748"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2023 04:40:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:40:31 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 04:40:29 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>, <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock updates for 6.3
Date:   Thu, 19 Jan 2023 13:38:25 +0200
Message-ID: <20230119113825.44374-1-claudiu.beznea@microchip.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.3

for you to fetch changes up to 80519d8ccc6b65bfbc8571ea16992141d71510e9:

  clk: at91: do not compile dt-compat.c for sama7g5 and sam9x60 (2023-01-09 14:05:41 +0200)

----------------------------------------------------------------
Microchip clock updates for 6.3

Only updates for AT91 SoCs this time as follows:
- DDR clocks were marked as critical in the proper clock driver for each
  AT91 SoC such that drivers/memory/atmel-sdramc.c to be deleted
  in the next releases as it only does clock enablement;
- patch to avoid compiling dt-compat.o for all AT91 SoCs as only some of
  them may use it.

----------------------------------------------------------------
Claudiu Beznea (2):
      clk: at91: mark ddr clocks as critical
      clk: at91: do not compile dt-compat.c for sama7g5 and sam9x60

 drivers/clk/at91/Makefile         | 16 ++++++++--------
 drivers/clk/at91/at91rm9200.c     |  2 +-
 drivers/clk/at91/at91sam9260.c    |  2 +-
 drivers/clk/at91/at91sam9g45.c    | 10 ++++++++--
 drivers/clk/at91/at91sam9n12.c    | 12 +++++++++---
 drivers/clk/at91/at91sam9rl.c     |  2 +-
 drivers/clk/at91/at91sam9x5.c     | 17 ++++++++++++-----
 drivers/clk/at91/clk-peripheral.c |  8 ++++----
 drivers/clk/at91/clk-system.c     |  4 ++--
 drivers/clk/at91/dt-compat.c      | 25 +++++++++++++++++++++++--
 drivers/clk/at91/pmc.h            |  4 ++--
 drivers/clk/at91/sam9x60.c        | 20 ++++++++++++++++----
 drivers/clk/at91/sama5d2.c        | 22 +++++++++++++++++-----
 drivers/clk/at91/sama5d3.c        | 20 ++++++++++++++++----
 drivers/clk/at91/sama5d4.c        | 22 +++++++++++++++++-----
 drivers/clk/at91/sama7g5.c        |  4 ++--
 16 files changed, 139 insertions(+), 51 deletions(-)
