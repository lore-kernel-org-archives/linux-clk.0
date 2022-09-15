Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1D9ECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 15 Sep 2022 09:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiIOJ1L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Sep 2022 05:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiIOJ1K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Sep 2022 05:27:10 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C058036D
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 02:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663234030; x=1694770030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rs7cDElhZGBQj71SmgtFEEpCFfRiNED774xMnF1+kJU=;
  b=RVEG3ipF9lmwqIdVcADwr1zlieDjEETD87E2ApPPC9WPlMn+L7D7TjW+
   j54rKbbbOts1fheiiUjBT/+T7+6yq/VmUUj3IucfS7AtfOw1VbI+hz0nx
   qRYj2mD8+5193wbKFI/BkW/E+vwmMVRohNPEHDS5lYst8hZncw1q4R7lg
   v6aX4RdiMucABwIRMbk0X/CjmHfZnVdzGwUxyjCP2CFdMec7e3j1uBydF
   3obF/Gv0BwGuG4o5gqThl2odBAC3yisIbyn/93X9N2ydRSGPlojb/up2v
   3BSgbC42rOz7JGMYSkc02VL0YfEweQvmZlv/ySSDLWZ95j7HPukXgdihs
   g==;
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="180490717"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 02:27:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 02:27:08 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 02:27:06 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>
CC:     <linux-clk@vger.kernel.org>
Subject: [GIT PULL] Microchip clock updates for 6.1
Date:   Thu, 15 Sep 2022 12:29:27 +0300
Message-ID: <20220915092927.4158755-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, Stephen, Michael,

On Microchip we decided to send a single clock pull request for both
AT91 and Polarfire architectures. Let us know if you would prefer otherwise.

Please note that this PR is based on Microchip clock fixes PR.

Thank you,
Claudiu Beznea

The following changes since commit 05d27090b6dc88bce71a608d1271536e582b73d1:

  clk: microchip: mpfs: make the rtc's ahb clock critical (2022-09-14 10:45:52 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.1

for you to fetch changes up to 935edf0c145596c26e7c6825918acde27ff94ff6:

  clk: at91: sama5d2: Add Generic Clocks for UART/USART (2022-09-15 11:01:37 +0300)

----------------------------------------------------------------
Microchip clock update for 6.1

Microchip AT91:
- add generic clocks for U(S)ART available on SAMA5D2 SoCs

Microchip Polarfire:
- reset controller support for Polarfire clocks
- .round_rate and .set rate support for clk-mpfs
- code cleanup for clk-mpfs
- PLL support for PolarFire SoC's Clock Conditioning Circuitry

----------------------------------------------------------------
Conor Dooley (15):
      dt-bindings: clk: microchip: mpfs: add reset controller support
      clk: microchip: mpfs: add reset controller
      reset: add polarfire soc reset support
      MAINTAINERS: add polarfire soc reset controller
      clk: microchip: mpfs: add MSS pll's set & round rate
      clk: microchip: mpfs: move id & offset out of clock structs
      clk: microchip: mpfs: simplify control reg access
      clk: microchip: mpfs: delete 2 line mpfs_clk_register_foo()
      clk: microchip: mpfs: convert cfg_clk to clk_divider
      clk: microchip: mpfs: convert periph_clk to clk_gate
      clk: microchip: mpfs: update module authorship & licencing
      dt-bindings: clk: rename mpfs-clkcfg binding
      dt-bindings: clk: document PolarFire SoC fabric clocks
      dt-bindings: clk: add PolarFire SoC fabric clock ids
      clk: microchip: add PolarFire SoC fabric clock support

Sergiu Moga (1):
      clk: at91: sama5d2: Add Generic Clocks for UART/USART

 .../bindings/clock/microchip,mpfs-ccc.yaml         |  80 +++++
 ...rochip,mpfs.yaml => microchip,mpfs-clkcfg.yaml} |  19 +-
 MAINTAINERS                                        |   1 +
 drivers/clk/at91/sama5d2.c                         |  10 +
 drivers/clk/microchip/Kconfig                      |   1 +
 drivers/clk/microchip/Makefile                     |   1 +
 drivers/clk/microchip/clk-mpfs-ccc.c               | 290 ++++++++++++++++
 drivers/clk/microchip/clk-mpfs.c                   | 375 ++++++++++-----------
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/reset-mpfs.c                         | 157 +++++++++
 include/dt-bindings/clock/microchip,mpfs-clock.h   |  23 ++
 include/soc/microchip/mpfs.h                       |   8 +
 13 files changed, 780 insertions(+), 194 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
 rename Documentation/devicetree/bindings/clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml} (73%)
 create mode 100644 drivers/clk/microchip/clk-mpfs-ccc.c
 create mode 100644 drivers/reset/reset-mpfs.c
