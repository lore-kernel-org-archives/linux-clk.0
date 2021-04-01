Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983C5C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 18:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 686D6610C7
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 18:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237091AbhDASDW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:03:22 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64963 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237494AbhDASAI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 14:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300009; x=1648836009;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1gbYsP2wdU79Eo+67NSj21KZcKxsPiSxBTPycBjQZlE=;
  b=CSxaIZliDEFpruCPsNAWMM5IYDCsYJKzGkRuqBqXICV/e6NzGPfphVa1
   rZ0XnWhjTzDnlB9fpucD/KhusMAjdWFC8BOFDLA468DVP6EfVe0Ceqi2G
   c0RozdobOYuVfOLT1EA4w3dVw97zEIkBau7Ke6HEn0+lHPwegv8ljcAO4
   e6+Q50JbY8S5LnmiWKeiaiBWceB9RNu/CngpJ/gZrmIQTu/mgJiO59vll
   GHPNJb7OwSPyAdHe/tAj26UL8WGWb5dKe3eB9+fXgtEO+4iHvWE4gn1uX
   YzAC+aepRsa29bKo4a7VFdhmHOSMX9DGEmZqT4Rq4E+cfZEPn3QZhQ6T/
   A==;
IronPort-SDR: zhUnO31ksvTXKc+1uADU7PtWJfrCmlUl0STBK8tyA1EfONg2CibpjEpcheDW9djnQieB7LM0wi
 WGPc8MR8ZuXuPy1noNxbpOlMyWwnH7HZkO+TPzRvxcASSbpxhifQuhSCMrA6M8u/jDAvKGnAO5
 CJ0a0JZ2Uc4AAP99BD6t+3M9yY1J/YhCSMGvW8aR7XfKjxSYFADiCKvTVyGwmKvHDgoj6R/tjS
 lXj0st7973FUZ8VNMM3TFQVAOicpjVBc2cg9wEQKzpTZbZieSgAtn9NIwPbiYyDWPwoePTQb7s
 kx0=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49676190"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 05:27:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 05:27:31 -0700
Received: from rob-dk-mpu01.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 05:27:29 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <viresh.kumar@linaro.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 0/6] clk: at91: updates for power management and dvfs
Date:   Thu, 1 Apr 2021 15:27:20 +0300
Message-ID: <20210401122726.28528-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This series addresses the power management for SAMA7G5 and also updates
the master clock prescaller and master clock divider drivers to accommodate
the requests at [1].

The power management part is implemented by adding
save_context()/restore_context() on each clock driver (patch 1/6). Since
the PM part is necessary only for backup mode (supported on SAMA5D2 and
SAMA7G5) the pmc.c has been adapted to call the
save_context()/restore_context() only on switches to/from backup mode
(patch 2/6).

Patch 3/6 adds the securam clock on SAMA7G5. This is necessary for
backup mode of SAMA7G5.

Patch 4/6 adds registers definitions for the new master clocks (MCK1..4) of
SAMA7G5 and adapt the clk-master.c. The defines exported in
include/linux/clk/at91_pmc.h will be also used by platform specific PM
code.

Patch 5/6 adpat the master clock divider and master clock prescaller
to address the requests at [1].

Patch 6/6 clean up a bit the code in clk-master as suggested by Nicolas.

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/lkml/20210105104426.4tmgc2l3vyicwedd@vireshk-i7/

Changes in v2:
- addressed code review comments
- collected tags

Claudiu Beznea (6):
  clk: at91: re-factor clocks suspend/resume
  clk: at91: pmc: execute suspend/resume only for backup mode
  clk: at91: sama7g5: add securam's peripheral clock
  clk: at91: clk-master: add register definition for sama7g5's master
    clock
  clk: at91: clk-master: update for dvfs
  clk: at91: clk-master: improve readability by using local variables

 drivers/clk/at91/at91rm9200.c       |   2 +-
 drivers/clk/at91/at91sam9260.c      |   2 +-
 drivers/clk/at91/at91sam9g45.c      |   2 +-
 drivers/clk/at91/at91sam9n12.c      |   2 +-
 drivers/clk/at91/at91sam9rl.c       |   2 +-
 drivers/clk/at91/at91sam9x5.c       |   2 +-
 drivers/clk/at91/clk-generated.c    |  46 +++-
 drivers/clk/at91/clk-main.c         |  66 +++++
 drivers/clk/at91/clk-master.c       | 396 +++++++++++++++++++++-------
 drivers/clk/at91/clk-peripheral.c   |  40 ++-
 drivers/clk/at91/clk-pll.c          |  37 +++
 drivers/clk/at91/clk-programmable.c |  29 +-
 drivers/clk/at91/clk-sam9x60-pll.c  |  68 ++++-
 drivers/clk/at91/clk-system.c       |  20 ++
 drivers/clk/at91/clk-usb.c          |  27 ++
 drivers/clk/at91/clk-utmi.c         |  47 +++-
 drivers/clk/at91/dt-compat.c        |   2 +-
 drivers/clk/at91/pmc.c              | 175 +++---------
 drivers/clk/at91/pmc.h              |  27 +-
 drivers/clk/at91/sam9x60.c          |   2 +-
 drivers/clk/at91/sama5d2.c          |   2 +-
 drivers/clk/at91/sama5d3.c          |   2 +-
 drivers/clk/at91/sama5d4.c          |   2 +-
 drivers/clk/at91/sama7g5.c          |   3 +-
 include/linux/clk/at91_pmc.h        |  26 ++
 25 files changed, 752 insertions(+), 277 deletions(-)

-- 
2.25.1

