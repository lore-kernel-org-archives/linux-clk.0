Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC356C432BE
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 14:11:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3BEF61076
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 14:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238670AbhHROLy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 10:11:54 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:10804 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237685AbhHROLv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Aug 2021 10:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1629295877; x=1660831877;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4VmM9ZNVHVnJYp/t04FpAX6jOEInODFD5vbJTml5Jyk=;
  b=SnaBoBiqOeltLUFmYQSyE982+7PnnFLikxF5lmKrP4h3ACfxDhCQH+A7
   XDzXoaw83W8czXN2V80A0IRMPyOeim8b2BWZ7JogrWPiRnCd+vyUSDmRM
   L1gkOEltEC+IzhEW/hRiciG1Di2LV444jYhDIFtmJ6IQcv0YvObBSK8me
   vmm9QfUo1+GSjES+WWkpeHIR4D11TLUL24JtztMCX5bXcYYd0+lA7Owxy
   5CioSLhlro2A3g/sFy9pKJxsFRRBl9UDdGOHx+LmBdiiZI6bYbC9qeMYE
   FE6xBM02iahx/JRl3AgpSv1xC2BIN2xVAybGozScdw1cXIk4hYGJasAo0
   A==;
IronPort-SDR: RnkTIISZZHYz3I4T5HPtI7gLHwAk7SOsTI4Md0EuAFXY0qCc0mUumggh18y5dOYnSftpoaVfA+
 ATSJ8Kfnj0ZZelPTxmzRouDyCNzAunHmhpgNmaYo/Udxq2F8oiqxTklxYm1LckLaWI+wmWElMX
 ZcDevNxDYi4OyZmXsKWcUpiP1L54wsE27MBO+gDu1sxOlinMZMHfdzPzl3on6EE5wGegk+m2BY
 RX4+XpZijvLX3ih43yw9FZAuIXzYKDjagPjyTULuW11J+bVdyrbny3msXm7TGJyvzladst4dX+
 3LZpd2G0DxAN1Jzqm7k0ciS/
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="132736037"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Aug 2021 07:11:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 07:11:15 -0700
Received: from daire-X570.school.villiers.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 07:11:13 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <cyril.jean@microchip.com>, <conor.dooley@microchip.com>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v5 0/2 resend] CLK: microchip: Add clkcfg driver for Microchip PolarFire SoC
Date:   Wed, 18 Aug 2021 15:11:00 +0100
Message-ID: <20210818141102.36655-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Daire McNamara <daire.mcnamara@microchip.com>

Not too sure what happened here.  Just resending to get things moving
again.

This patchset adds support for the Microchip PolarFire clkcfg
hardware block.

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

 .../bindings/clock/microchip,mpfs.yaml        |  67 +++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   2 +-
 drivers/clk/microchip/Kconfig                 |   7 +
 drivers/clk/microchip/Makefile                |   6 +-
 drivers/clk/microchip/clk-mpfs.c              | 444 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  45 ++
 7 files changed, 569 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h


base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
prerequisite-patch-id: 6f7f70120adfa8e938b97517f0c664e43e8745a0
prerequisite-patch-id: 4ea37008d23838aa2e0658811fe15462f6cdbd87
-- 
2.25.1

