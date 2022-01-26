Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360FAC2BA4C
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jan 2022 15:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237788AbiAZPh1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jan 2022 10:37:27 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:61938 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242985AbiAZPh1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jan 2022 10:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1643211447; x=1674747447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W1b7TkRkbCKNd/5rVvPdT70W4PkXtpjlkj5YXOAfRk0=;
  b=LRsG/Cd4nRqRUz3qJ8JZ4NVV/iisdkRrZu9E8S2nO3WjreLDf5znAXjK
   00vwwXmK6gqnGmrwBrgvwwMrrDaomu5jBbCUzulVCY2Cw5uR/hQfh4xHJ
   RdZoK9VdnDmzLoGH5gwFQf0edjFs32Fxszt1hRE+Iot0DlI7qz2X3HASS
   jHYwgRe2KmLXqnLBJKCW6VhmTjF4LT0in3bbF2tgsY6CcqXEw+6aBHZWO
   5T+hmiit1U9dEq+AcUgVsIzBgg3aBaZR8y50p+Gs8xXn5iP5rphMPs9eg
   E9ZHhDVYIM8alxh7yzqndbu5teeTqu4ZFbYdnbtoZeXYio1wOjjjQToFE
   w==;
IronPort-SDR: c+8gOHED+StYuj3kGNODWNhELbGOz7E6KLqOkdD5Z0oIxgCstQ8LuLLEG9Gn4VaLl1vyxnd9v7
 okN/OP8gCvfLdXYw9y8g4WFFqdKv6rFdzMHgolk1m0/vMX7atA8LH+6FpjrMhY46Mz4y2jgfj5
 Tb0DFU824D9f9Pa7Hsw6E4KIs/X+YT8emtaUuiwgAIVnlUB00Cd9CjxSSe8AZc4U68b1Dkx0nM
 9JbPr9pZwmB78WZvGudJ/gtFj7mO6eEux2Otx/+ntIWVJgz0XcZ1sKCXd08V9MFBko1+LIJcaD
 vYch0IV76i/Bha7W49SHHHDF
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="83746086"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jan 2022 08:37:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 26 Jan 2022 08:37:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 26 Jan 2022 08:37:23 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v10 0/1] Add clkcfg driver for Microchip PolarFire SoC
Date:   Wed, 26 Jan 2022 15:40:03 +0000
Message-ID: <20220126154003.3797323-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

This patch adds support for the clkcfg hardware block on the Microchip
PolarFire SoC

Changes since v9:
* removed devm_clk_get, replaced by index 0 clk_parent_data
* moved CLK_HW_INIT_x out of register functions
* dropped no longer needed name/flags/parent struct members
* added CLK_DIVIDER_ONE_BASED flags
* added rationale for critical clocks
* use lock directly
* dropped mpfs_periph_clk_recalc_rate
* dropped manual devm_ _unregisters
* dropped goto err in probe function
* dropped dt-binding

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

Daire McNamara (1):
  clk: microchip: Add driver for Microchip PolarFire SoC

 drivers/clk/Kconfig              |   4 +-
 drivers/clk/Makefile             |   2 +-
 drivers/clk/microchip/Kconfig    |  10 +
 drivers/clk/microchip/Makefile   |   1 +
 drivers/clk/microchip/clk-mpfs.c | 382 +++++++++++++++++++++++++++++++
 5 files changed, 395 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c

-- 
2.32.0

