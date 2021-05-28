Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5923C2B9F7
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 13:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97AF1613B6
	for <linux-clk@archiver.kernel.org>; Fri, 28 May 2021 13:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233783AbhE1Now (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 May 2021 09:44:52 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:58746 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhE1Nov (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 May 2021 09:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1622209397; x=1653745397;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nbclZhKOwhOOcPa9cyi1CWYDYYD8TkbVMmuKc9toado=;
  b=mxEGnjexDWCoR3tZHW0ztRHFwoXrYyccwndck9Lfza/7N7jFQdeK9eBE
   bnUbV1FSuWBuVA1wRKvfXvRX9G3CUh5hH1435dOP8VpH3u7GB8xztNhGd
   qwKqInLQ6wYhL6hnR04vCjPj38AllWK4r3HleNOYHQ3Wu23flfPyoOif1
   Q1mHgUxHcdahYdI1aEspmR+uajTvkCEiPsOIJvu65Ms1g1OYCUQbBsb0B
   J3xcFj3ptdG/JG4tHa+g/t8KDVaSOmsl2Jj8zANPD5UyrkOD6M/UsPsuc
   5hlpXvc2uz4Y5Eqe3nMHqky9R0rauib6YeC906Cg9+EW2hCJ+6viMKw13
   g==;
IronPort-SDR: jBIrbhRM4GrRmvwRdrqahmYqwJPv55HXkFPYfyLoodXedaRFI+AyVBFB1HW1rFfBzaSm+h4dbz
 WDZCBXq+U8ALDOkWMaGu/ZceRNqVUVl7kKdoGEk3oWoGkYqkYDX6UelF5m3sSVGOqFTDol1QiW
 96y379Umpx5aznycb2S1Wvz7HCBFjNRdw2bcN2x1w48Zd+StiXHr1J9eJIRqy0iDDBPerVyYAq
 1QTKABY4iQcyYjyUJnxqf9n1K1rsXcf6maK0FtzEHM55WP2ECVEyndHZwRuMO6LH5gTdDhjqIt
 E0o=
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; 
   d="scan'208";a="116945654"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 May 2021 06:43:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 28 May 2021 06:43:16 -0700
Received: from daire-ubuntu.school.villiers.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 28 May 2021 06:43:09 -0700
From:   <daire.mcnamara@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <palmer@dabbelt.com>, <cyril.jean@microchip.com>,
        <padmarao.begari@microchip.com>, <lewis.hanly@microchip.com>,
        <conor.dooley@microchip.com>, <david.abdurachmanov@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v5 0/2] CLK: microchip: Add clkcfg driver for Microchip PolarFire SoC
Date:   Fri, 28 May 2021 14:43:06 +0100
Message-ID: <20210528134308.649769-1-daire.mcnamara@microchip.com>
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

Resending v5

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

