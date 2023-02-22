Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D56C61DA4
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 12:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjBVMrV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 07:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjBVMrU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 07:47:20 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D49E3403E
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 04:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677070039; x=1708606039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bz2YGtVOM/rE8m1sy9aAUJspjtnfkVan+svdZyu3YfQ=;
  b=xRyaxH0TrJjjY43Z7VVLyH9qjvgrEf5GRkevEpRZtEA04v3TPRLHWZbl
   MlQJnVmL5p11oM9OfuomeTZiK8mbLXlwsjdbvdP7IjUSiW2wkccV4Gfjn
   Pmq3Os/tqda0G5ryKwex4kFcr7zSZJjvg8PQM2m1rldPUtsHBw+nmCfHh
   59vZwgpudBm5S28NG1w7ai1931R36ze1Saxr+55A17hG0M11ndOr5QzR1
   cpZk8kR5wQYHgd8mGfyZcsQ5FglyKEWuPnEMnf/4KPh1iPlUNxuJ+9XMd
   sBH1/90JG8jTtyH+QVLp4PgenM6MMCgsGD9dKOL/sL3lIN7wv40Qr0SQg
   w==;
X-IronPort-AV: E=Sophos;i="5.97,318,1669100400"; 
   d="scan'208";a="201759967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Feb 2023 05:47:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 05:47:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 22 Feb 2023 05:47:17 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Conor Dooley <conor@kernel.org>, <sboyd@kernel.org>
CC:     Conor Dooley <conor.dooley@microchip.com>,
        <linux-clk@vger.kernel.org>, <daire.mcnamara@microchip.com>,
        <linux-riscv@lists.infradead.org>
Subject: [PATCH] MAINTAINERS: add missing clock driver coverage for Microchip FPGAs
Date:   Wed, 22 Feb 2023 12:46:11 +0000
Message-ID: <20230222124610.257101-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=conor.dooley@microchip.com; h=from:subject; bh=bz2YGtVOM/rE8m1sy9aAUJspjtnfkVan+svdZyu3YfQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnf+Cb9NMhzeeVuyHiwd/ey8LjvDp8u6lzVD1e5laPwUuBI tuqJjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk0TeGn4y1/ydmh0hrO809w/C463 rLpQtFbfcSfUJ9ZA0Klp1MV2FkaLJp+nK5YdFyI/3XNhf19SQjY9Mtl0/6waL+cUPCxfd23AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When the CCC support was added, the clock binding coverage was
converted to a regex in commit 71c8517e004b ("MAINTAINERS: update
polarfire soc clock binding"), but the coverage for the clock drivers
themselves was not updated. Rectify that now.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Stephen, if you could take this via clk that'd be great, thanks.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abf3589423b..df3d195c1507 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17992,7 +17992,7 @@ F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
-F:	drivers/clk/microchip/clk-mpfs.c
+F:	drivers/clk/microchip/clk-mpfs*.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
-- 
2.39.0

