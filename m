Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31EADC433B4
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 12:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4E786141E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Apr 2021 12:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236440AbhD1M2B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Apr 2021 08:28:01 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:35667 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhD1M2A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Apr 2021 08:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1619612836; x=1651148836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VoFsEu7IMLrs18H6cW8rTtXU3e6cDl6EGGrU3y282fA=;
  b=jsPWeBtgoCdZ07xZihHmLxkQUZBBRKYEYzIUzdGQRd5/sNiIbG8zbKkL
   ab5nOrWcFuTnucjd02wqXUNJ02lLlNVTABw34+B+t3Mt0+wgc93RUwlh4
   jCIY708ilapt1V2niaFZDn8mi4sPoJlVkoH4uNw/SdqZabK0q7OTuwc3F
   88aQg3rkKv4ylPbF5pso6nVD9eM2t7JpQBxxsphULeWfjCu8X/0WaNgV4
   GB7mVzmCFb1eAAOCiKwvcThyNUpjkR2DMxczG20ljohGeikmiRQ2B6/kk
   J3YxoIk5qvuvUUpxvPLsL9paWkV+R+9DOFYDgfeI5m5AT1J4oxDdSgo/A
   w==;
IronPort-SDR: litlxQYwX3iGcA4rS9fSUtmkzAZL4pvVt0OTsjDVAJ5XuU5Izg82HVsz77iWFs/4atNUdxzjiv
 PDLK3SKyJUmjLbRy6sgSymSPWfxoQc6B8zF7XEp/QQdRPvowdvAZcc3XIVkVTwjcfPTEIn5Alx
 DtIaJLIOkcFLwaX2zVi85yT8FwbL31s7KoG60OxaNQGO4Y9MV79VQHKZyLd3Qtf+UNOV2cSnhb
 H5NeI5ioNjLwnPKbYI4FSC0FnFdmKgg8ZzgXv2l/6/6744M8uVMZklZ4qrft7t8qEchHV0STG8
 Ecs=
X-IronPort-AV: E=Sophos;i="5.82,258,1613458800"; 
   d="scan'208";a="115190394"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Apr 2021 05:27:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 05:27:15 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 28 Apr 2021 05:27:12 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v4 0/2] CLK: microchip: Add clkcfg driver for Microchip PolarFire SoC
Date:   Wed, 28 Apr 2021 13:27:09 +0100
Message-ID: <20210428122711.2136467-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

This patchset adds support for the Microchip PolarFire clkcfg
hardware block.

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

 .../bindings/clock/microchip,mpfs.yaml        |  73 +++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   2 +-
 drivers/clk/microchip/Kconfig                 |   7 +
 drivers/clk/microchip/Makefile                |   6 +-
 drivers/clk/microchip/clk-mpfs.c              | 444 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  45 ++
 7 files changed, 575 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h


base-commit: 4a0225c3d208cfa6e4550f2210ffd9114a952a81
-- 
2.25.1

