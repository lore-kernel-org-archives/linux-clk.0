Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0948DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 12:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiBVMKF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 07:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbiBVMKE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 07:10:04 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC57119423;
        Tue, 22 Feb 2022 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1645531779; x=1677067779;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vepCoA3Wkbm6P+2Rx01IH5s26MKPVdtXE7u/5Qmw2Vc=;
  b=BXw+jBfe9pytY89rqvnzosG+8QsTs+Vk7oOenRANoU/RECK5pqDKvq1H
   P7O7DGQXgbyPwZhbuJysrm9vlsQc7gDdOIil/YxVDzaMDn5Hsh8FV0nQn
   6dwmTup00SOy8llgZoCZNIz8QcoMfizZYB4Z8WFuLWcRdt7/KLqn/KAVL
   md/J768CK7r5OSgoQGyIGjQAzLoOrnt85ZoKDJx/hd8/bMqzCgNdRKqZv
   erj/AQpbH1c/7mqVjlayicn23L8FB4hmCaUaI3f5V9x7ho7gshdR5ExRj
   X6cskWPcvcnpDlqZlDa2qIpdhph2Q9S8wHJ+DkSboo2NqwdZv1S0TDQYA
   w==;
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="154422193"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Feb 2022 05:09:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 22 Feb 2022 05:09:37 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 22 Feb 2022 05:09:35 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v12 0/1] Add clkcfg driver for Microchip PolarFire SoC
Date:   Tue, 22 Feb 2022 12:11:43 +0000
Message-ID: <20220222121143.3316880-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

This patch adds support for the clkcfg hardware block on the Microchip
PolarFire SoC

Change since v11:
* add newline at end of Kconfig

Change since v10:
* clks are not one based, don't use the CLK_DIVIDER_ONE_BASED flag

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
* dropped dt-binding (already in clk-next)

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
 drivers/clk/microchip/clk-mpfs.c | 381 +++++++++++++++++++++++++++++++
 5 files changed, 394 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c

-- 
2.35.1

