Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD03C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 13:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbhLPN6k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 08:58:40 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:19505 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhLPN6j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Dec 2021 08:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639663120; x=1671199120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AkvKwgNcGxstZQfRVv9nbKHD/jbUctRsv6QZaybpyt4=;
  b=awRSIRYwvzd6hYLG0dMCZ/n052KYBvR2KxU2zpvZBjof80o7rQx0H4g0
   JZkbnSNCTVkyJAdt3Z0PWAstcNv8WkydPF9+SLxgztAi7PCrDJlfMn8/3
   vaqkOAikBpKlakOhlxMGDHqS9nZJ2ckTii2UT7NYOx9N0gxYGQ8UYp+mR
   DEXbSpSw68ssl25lIjQ1b5AFC9Tv0C7fsQ1zLGqeZS4XRD4JMoIQBg0GH
   yyayzI/kFTJ0eEViVV04DpmXdNE6uk7pLpjsPmzRM35JI1qRgyd7OEhDi
   YjtP1eE4IRrb2x1f+sJUa4vGp+sC/pm9C6LvhPaLFb8cSSb8YZdSQMedt
   w==;
IronPort-SDR: VeIXg2KDIpwSbIKCFAnVp/pyNpm0icuEo+isN4PQgLpEesYU5HA8xG8CpKwUr//FvAQ8eQ9mdE
 fYUWJ4xrgKSGYsgqHTTwkD4w8i24DwoEl5g4xVYyw2RTgS4OhZ5zTKOMo5vSMSVShxL6G5qXoi
 qgoHC/5w6nFHKi90wYuuQy/lJqAZHfyWBrUuux2VInEM1K/LRbv1nwaXlIzzR8FpWoyxwHeTCU
 Cuu7H4+ksIaCFv0NxoZ1bLoJPjLm+aa56b+gkVltVT4E2nMRXzA//9wGB2GifWqtNuZB9G38X4
 Vm8yHm4LNRj3ZFFgq7dhJniX
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="146891404"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Dec 2021 06:58:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Dec 2021 06:58:38 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 16 Dec 2021 06:58:36 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v9 0/2] Add clkcfg driver for Microchip PolarFire SoC
Date:   Thu, 16 Dec 2021 14:00:20 +0000
Message-ID: <20211216140022.16146-1-conor.dooley@microchip.com>
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

Changes since v8:
* Use devm_clk_hw_unregister directly
* Get parent clk in probe rather than register function

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
 drivers/clk/microchip/clk-mpfs.c              | 439 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  45 ++
 7 files changed, 555 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h

-- 
2.33.1

