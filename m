Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC54C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 08:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiBVIY6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 03:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiBVIY5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 03:24:57 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA99C156C5B;
        Tue, 22 Feb 2022 00:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1645518271; x=1677054271;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BmcoNaaaXaTPZppWjE0Q138HyVLxEI8C4NAO/ka5L7Y=;
  b=jlQ7+tASnLYG66jWDMGNx9oDlNvVhm5bB9vxBSmXTKhTANbz5iD1J9Fl
   G7CvbIvERyS48GLk6VIDcPJSIEM92MthgpGS54xl/TUvTNf3WXAInF21Q
   8IHZ3BI6YgqC9333MN+nLlJRjKqwk3AgichKKIelWSSV/9XSjjCd1jCV1
   woxDzFpdnM8cjOltdt3juUwgCOwDLIF3ZlSZIyqG2yDbNlv+yxCtkLBRb
   ZurOJD3Advv89z76a+sMtVqKb4qS3079C1JSCU6IqoZ5c8/Dx75hLK5k7
   ofti43g7iSZ4XlOzOwMw8VkXEQ/45lx+UuGhxfZ6rhg8whV7l0l+Wrnf9
   g==;
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="86553620"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Feb 2022 01:24:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 22 Feb 2022 01:24:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 22 Feb 2022 01:24:27 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v11 0/1]  Add clkcfg driver for Microchip PolarFire SoC
Date:   Tue, 22 Feb 2022 08:27:06 +0000
Message-ID: <20220222082706.3044572-1-conor.dooley@microchip.com>
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

