Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37718EB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jun 2023 09:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbjFUJl7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Jun 2023 05:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232049AbjFUJlY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2023 05:41:24 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66477170C
        for <linux-clk@vger.kernel.org>; Wed, 21 Jun 2023 02:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687340476; x=1718876476;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n2QvkbDXJwVEcvdZIRT3TS2zHvMHwS0+dUrWcdjVevc=;
  b=YJwnQKqcKtp/TBQUY+jN8RZbXiE/v7qmIqFpSDJsBrWXIsxlBajGObGs
   +hi7WhaPzz7aeJSHIDAe4CMq50y7cHSgtcnN5+H+Tc5ZoQfwkpdkcZc+K
   qpOlOkrqwAByjB3hR60inYcn9Rua/lKNpLoeHAxs57gW1lOzbL8EEk6K+
   GQmbMKtJe/ngFPxgui/RyJ58wsUwjaWqjlrVe8S4rFvtHrPbpdRO2mEhq
   OrOU6/RL1PNWCvJJWvinyDvGl57SjqxgowQ2HuBOItJw0sjBTxpb+uKDG
   qXJSU+XokDhVPDUHQ3bOZx9SFWYzW0md7MjxMIob/6FUheqjdYzWai4vT
   g==;
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="157905988"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2023 02:41:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 02:41:13 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 21 Jun 2023 02:41:11 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>
CC:     <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock updates for 6.5 #2
Date:   Wed, 21 Jun 2023 12:41:06 +0300
Message-ID: <20230621094106.1575553-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Stephen,

Please pull in case it is not too late.

Thank you,
Claudiu

The following changes since commit 9a7b010116a430d74dc30a214ea55a58a2863d71:

  dt-bindings: clocks: at91sam9x5-sckc: convert to yaml (2023-05-22 15:59:49 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.5-2

for you to fetch changes up to 5619c2ddaf3ff77ce393716a6fed3267cb906344:

  clk: at91: sama7g5: s/ep_chg_chg_id/ep_chg_id (2023-06-21 10:42:48 +0300)

----------------------------------------------------------------
Microchip clock updates for 6.5 #2

It contains support for parent_data, parent_hw in AT91 clock drivers
used by SAMA7G5 SoC (e.g. main, master, generic, peripheral, programmable,
system, utmi, slow clocks) and also the update of SAMA7G5 to use
this new support.

----------------------------------------------------------------
Claudiu Beznea (11):
      clk: at91: clk-main: add support for parent_data/parent_hw
      clk: at91: clk-generated: add support for parent_hw
      clk: at91: clk-master: add support for parent_hw
      clk: at91: clk-peripheral: add support for parent_hw
      clk: at91: clk-programmable: add support for parent_hw
      clk: at91: clk-system: add support for parent_hw
      clk: at91: clk-utmi: add support for parent_hw
      clk: at91: clk-sam9x60-pll: add support for parent_hw
      clk: at91: sckc: switch to parent_data/parent_hw
      clk: at91: sama7g5: switch to parent_hw and parent_data
      clk: at91: sama7g5: s/ep_chg_chg_id/ep_chg_id

 drivers/clk/at91/at91rm9200.c       |  14 +-
 drivers/clk/at91/at91sam9260.c      |  14 +-
 drivers/clk/at91/at91sam9g45.c      |  16 +-
 drivers/clk/at91/at91sam9n12.c      |  14 +-
 drivers/clk/at91/at91sam9rl.c       |  14 +-
 drivers/clk/at91/at91sam9x5.c       |  20 +-
 drivers/clk/at91/clk-generated.c    |  11 +-
 drivers/clk/at91/clk-main.c         |  32 +-
 drivers/clk/at91/clk-master.c       |  28 +-
 drivers/clk/at91/clk-peripheral.c   |  22 +-
 drivers/clk/at91/clk-programmable.c |  11 +-
 drivers/clk/at91/clk-sam9x60-pll.c  |  17 +-
 drivers/clk/at91/clk-system.c       |  12 +-
 drivers/clk/at91/clk-utmi.c         |  24 +-
 drivers/clk/at91/dt-compat.c        |  23 +-
 drivers/clk/at91/pmc.h              |  36 +-
 drivers/clk/at91/sam9x60.c          |  20 +-
 drivers/clk/at91/sama5d2.c          |  20 +-
 drivers/clk/at91/sama5d3.c          |  16 +-
 drivers/clk/at91/sama5d4.c          |  18 +-
 drivers/clk/at91/sama7g5.c          | 796 ++++++++++++++++++++----------------
 drivers/clk/at91/sckc.c             |  75 ++--
 22 files changed, 730 insertions(+), 523 deletions(-)
