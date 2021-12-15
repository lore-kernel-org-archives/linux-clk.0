Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F080C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 08:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhLOI24 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 03:28:56 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:11970 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240809AbhLOI2z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 03:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639556935; x=1671092935;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TO4VsffB4nRVgSGQ1EANC3QB3+awSEtN8OJYwX+VVRY=;
  b=EGjG2Ddjz+Qp9AkWobHegIzefzjNUMtVc3m+uS9zoS/wQ5cDPnNvGJpV
   HmdWisPgfyBOWneoLRXBL8/EybHHuRP/wkwd+/1g0ohYjiP3OehwUg+ut
   +CbdUqrm56OLLOyBaSb8HMzyvQiOe8ikBpxrp3Segp1QVKlDj0qn+Z3m2
   E96LVGZZ51Kv6P0IeZ9L1/EfGP/lgjeXcfoUIQCGwc7QRPnVeoWi8VKYV
   gJwKVJEvzaIMIxnXw1Cj8eTolpRqo82sJBBDnVC2RuFgW1VW+4nCh0j5p
   4W18Vy5lfkRx9XiHWOZplxG4z9b46RVNy9qopYCE889EfutumPpGWAKOj
   Q==;
IronPort-SDR: X8DM+lVFi5bvayoI2SipJAuZLKvYDv6qqIm1pNVwW8L+a9fh+3uleuyiChHX/h0kc3m/coEdda
 Po1X3nkblJPqlCp9dwvIdOQbb2XcFq3vnJfnktZG63PBO+eUq42zeFC5ghr8NPbPllPS2WUCAX
 kjoe+3cmhDXry3oxRxtHwoO2ScJQLDtY5KNmFVOrR5AdNJne+dQXJGSGC3vuoplKx4SI+04qjc
 e0wA4GWFUbE6B2F0M0AXjZsCKRZwk4NYa2+4Qa/H+HljEDZTO3tDHmNXDMGmzAViW+5xi4w/Hf
 /f0TZox2vF/L6WAUofE5VB88
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="155546371"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Dec 2021 01:28:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Dec 2021 01:28:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Dec 2021 01:28:51 -0700
From:   <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
        <david.abdurachmanov@gmail.com>, <palmer@dabbelt.com>,
        <daire.mcnamara@microchip.com>, <cyril.jean@microchip.com>,
        <conor.dooley@microchip.com>
Subject: [PATCH v7 0/2] CLK: microchip: Add clkcfg driver for Microchip PolarFire SoC
Date:   Wed, 15 Dec 2021 08:30:00 +0000
Message-ID: <20211215083002.1353-1-conor.dooley@microchip.com>
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

 .../bindings/clock/microchip,mpfs.yaml        |  61 +++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   2 +-
 drivers/clk/microchip/Kconfig                 |   7 +
 drivers/clk/microchip/Makefile                |   6 +-
 drivers/clk/microchip/clk-mpfs.c              | 447 ++++++++++++++++++
 .../dt-bindings/clock/microchip,mpfs-clock.h  |  45 ++
 7 files changed, 566 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
 create mode 100644 drivers/clk/microchip/Kconfig
 create mode 100644 drivers/clk/microchip/clk-mpfs.c
 create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h

-- 
2.33.1

