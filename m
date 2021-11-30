Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDABC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 30 Nov 2021 14:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241978AbhK3OJe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Nov 2021 09:09:34 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:51641 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbhK3OJe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Nov 2021 09:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1638281176; x=1669817176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ciQNeOSqmIU7OH/IA+ThrDoT2rarbLr6/AZdOfHuXDw=;
  b=g4fBtn7/bn6+yGgPryuOEfhG1Vye+66Yn2+T+i/1vsmHbRoJL9MzZIVW
   2Od4P1xkmdZeCwTskYUxFEEtV9pcSUsCIom2N16Z4ZmBHlIxlASMUmAeb
   rsCTMzxIKvSTmkqZU9T5CyLmEF+N8GTORqya4gTQ1Vo+g3JIfpkzVYQNT
   unYD1cnPsdJMa48bcxrsCr6CkhwP+AXvIWueDDfCgZ0CQvLxdl1h0X1Lf
   DzurjQAeZU5OZGCYcw27ZJGc6YUXY2oXGzHQnhUNqpfhrjGWKtNPtq+Yg
   VtQQWc/xK/ld6EzJuw9mW5WJM5yJ09H84aDYUvcz1JOFKZ0UqCHaEkkub
   w==;
IronPort-SDR: wg5mQ/kCgf+6zaQHlV6UsfQmYHHZIpoBKqnrRgZP2Mj0O2eUhmeR87qTds3m+mMVGWC9gJ24Hz
 bzy8BgQQtYzIwzOeifwTi7T6UEuhLPtuEHJ287g/LgD2ehtaLEh2ChynOYwIpQqCOiI7Av/idX
 nfEcSHhSY9Oc45fnPYcKXN6QndZcXwKxsy23FuU9Z6thC5UHuVB1i6a6RFXpI1cx58TlbgxvW6
 o44zn1cUsX5YlGTOJHVdbyfFtToBEnA4qj1RfHYqjKDsl0EeYmcZwdjcnAhHC7jNGwWvoETEji
 qOVHVJ9j6QgG70S0MkSeBaYv
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; 
   d="scan'208";a="140716090"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Nov 2021 07:06:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 30 Nov 2021 07:06:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 30 Nov 2021 07:06:12 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v6 0/2] CLK: microchip: Add clkcfg driver for Microchip PolarFire SoC
Date:   Tue, 30 Nov 2021 14:07:22 +0000
Message-ID: <20211130140724.10750-1-conor.dooley@microchip.com>
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
 drivers/clk/microchip/clk-mpfs.c              | 444 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  45 ++
 7 files changed, 560 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h

-- 
2.33.1

