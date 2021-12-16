Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE22C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 09:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbhLPJlo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 04:41:44 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:19929 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbhLPJln (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 04:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639647703; x=1671183703;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z0W+KBO3HU/1B0LCvFB0wMhicWWaoh+mHHwivStiKB8=;
  b=VZ1MzwdqcNEgcRbZOej2vMI2gOvW0EY4+/zvXyUilD8iUTNmCkPe5jwi
   UalAPGoO1KIMU5szzLvtLU0sH0maDCSPcOXb29qpBjARml63CupUixgGV
   SieTZP9pfJt16uP80ku6kP2iy1s49KJfBKKcjnBzuCgbvnxx7+8ILAx+q
   9qhBxczUxfHbI2M6ZjbAeK0ldZDuYM0F4QNPqrNdbKnEHvWr11MGrbnzo
   2/HRQL9dtgnLEdySz74cxp3PtXoYH/JaLHU5qliJC1K28G1EBAKgZIamH
   r1CHEUPUh2dU48XNwd1TvcEYXRxHvioJindrmY6Zp/pXdqR6LP71bYvyF
   w==;
IronPort-SDR: 99hDCsqMvFLCmHwYASdgacuS7HoAICgU4ICFnsgB1+Y7HRASnc5wY6KzyiTpjAYn0QBMoqHtGf
 A3Pivwi//t8sndAV/E8kc+unA1hL8w2K4BnTk82BVWBOYvKh9m3roOcN6oFfdE2szgtmuyiv0j
 af4usE6RjiU4ZSKMmhabl9PXJLApc0KcptQ7OmdLunv8qDzxfsdW9YvDdRG6pbKK/PbI2SDPlv
 d0MsuxeyEsqqhNLHmzZoBcyIYc3CbDdCZXSyV7Z3iQOMwXxWqJUIJS26ICwhXu0TjPUX3PNuJN
 qMDvMnLtsLFFB9wehgJQ1lKH
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="142614241"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Dec 2021 02:41:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Dec 2021 02:41:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 16 Dec 2021 02:41:39 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v8 0/2] CLK: microchip: Add clkcfg driver for Microchip PolarFire SoC
Date:   Thu, 16 Dec 2021 09:43:02 +0000
Message-ID: <20211216094304.24461-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

This patchset adds support for the Microchip PolarFire clkcfg
hardware block.

Changes since v7:
* Dropped clock-output-names again (oops)

Changes since v6:
* Dropped clock-output-names *as a required property*
* Dropped if(lock) check on spinlocks, added spinlocks to all
  read-modify-write register access
* Removed kfree()s on non-dynamically allocated variables
* Use devm_clk_get to get the reference clock
* Account for reserved clock when calculating the size of num_clks

Changes since v5:
* Dropped clock-output-names property

Major changes since v4:
* Adjusted license for microchip,mpfs-clock.h to match microchip,mpfs.yaml
* Corrected the number of clocks to 33 from 32

Major changes since v3:
* Patch reformatted so microchip,mpfs-clock.h is part of device-tree patch

Major changes since v2:
* In mpfs_cfg_clk_set_rate, return immediately if divider_get_val
    returns <0 
* rebased to v5.12-rc1

Major changes since v1:
 * Dependency on SOC_MICROCHIP_POLARFIRE
 * All references to PFSOC/pfsoc changed to MPFS/mpfs
 * Cleaned error handling in _probe
 * Re-ordered code to place structs et al at top

Daire McNamara (2):
  dt-bindings: clk: microchip: Add Microchip PolarFire host binding
  clk: microchip: Add driver for Microchip PolarFire SoC

 .../bindings/clock/microchip,mpfs.yaml        |  58 +++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   2 +-
 drivers/clk/microchip/Kconfig                 |   7 +
 drivers/clk/microchip/Makefile                |   6 +-
 drivers/clk/microchip/clk-mpfs.c              | 447 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  45 ++
 7 files changed, 563 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h

-- 
2.33.1

