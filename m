Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1437FC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 13:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbiDHNiW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 09:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiDHNiW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 09:38:22 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFFA1C7BAE
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649424978; x=1680960978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m7Q9iuSfmYsfFoilGURKa9oNj4A9f56Xqh7ewQcurjA=;
  b=zOVn7XXLv8we7JcRHDR1gG4IFCF69+8pSOAxURJoBHHNblCwDJTgBOT3
   qRPK7AbhZ7rit3+7KeGV0qEKsbm/+qxAYJwFyAUvjYUZ+zMiPxtrZq+0T
   PS8mwPIlcEg0yAFr4y4Tesksnh126CgFHcwLHmL9iPobxd05EIgFsTbAj
   OPcgnfDqtNwcoFwbpi++TFXMysw0IqzVWGoy6SNstx4gKk6nea21+YIDO
   XFAo2bJ6ETMmfDGwVeLCDtIob3+1jJQgg8gP++vqgCx9Inv55ly/4RsFc
   7Kc2/n3/OI8YaxaX70qakrcvVQn8d7MrJNAuAvaGYA2RZVrMtkZEZJTS4
   w==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; 
   d="scan'208";a="168956543"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Apr 2022 06:36:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:36:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 8 Apr 2022 06:36:15 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
        <palmer@rivosinc.com>
CC:     <daire.mcnamara@microchip.com>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 0/3] More PolarFire SoC Fixes for 5.18
Date:   Fri, 8 Apr 2022 13:35:41 +0000
Message-ID: <20220408133543.3537118-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hey,
After the clock driver for the PolarFire SoC was accepted I started work
on the onboard RTC & found out that the reference clock for the rtc was
actually missing from the clock driver.

While restructuring the clock driver to add support for the rtc
reference, I noticed that there were some problems with how the FIC
clocks were being used. The FIC clocks are the cpu side inputs to the
AXI fabric interconnections & are not the clocks for any peripherals.

This series fixes the problems I noticed:
- the fic clocks incorrectly had the AHB clock as their parents
- the last fic, named differently to the others, had not been set as
  a critical clock
- some peripherals on the fabric side were incorrectly using the cpu
  side fic clocks, resulting in incorrect rates.

I added fixes tags to these patches in the hope that they will make it
into 5.18. I kept series separate from [0] as that fixes something that
is broken, while these are only wrong.

Thanks,
Conor.

[0] https://lore.kernel.org/linux-riscv/20220408131352.3421559-1-conor.dooley@microchip.com/T/#u

Conor Dooley (3):
  clk: microchip: mpfs: fix parents for FIC clocks
  clk: microchip: mpfs: mark CLK_ATHENA as critical
  riscv: dts: microchip: fix usage of fic clocks on mpfs

 .../dts/microchip/microchip-mpfs-fabric.dtsi     | 16 ++++++++++++++--
 .../riscv/boot/dts/microchip/microchip-mpfs.dtsi |  2 +-
 drivers/clk/microchip/clk-mpfs.c                 | 16 +++++++++-------
 3 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.35.1

