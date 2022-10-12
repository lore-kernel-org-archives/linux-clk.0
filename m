Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185A0C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 02:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiJLCqg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Oct 2022 22:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJLCqf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Oct 2022 22:46:35 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8972E7C1A9;
        Tue, 11 Oct 2022 19:46:33 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MnH3n34KHz1M8fd;
        Wed, 12 Oct 2022 10:41:57 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 10:46:31 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 10:46:30 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        <linux-clk@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v2] clk: at91: fix the build with binutils 2.27
Date:   Wed, 12 Oct 2022 11:06:35 +0800
Message-ID: <20221012030635.13140-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is an issue when build with older versions of binutils 2.27.0,

arch/arm/mach-at91/pm_suspend.S: Assembler messages:
arch/arm/mach-at91/pm_suspend.S:1086: Error: garbage following instruction -- `ldr tmp1,=0x00020010UL'

Use UL() macro to fix the issue in assembly file.

Fixes: 4fd36e458392 ("ARM: at91: pm: add plla disable/enable support for sam9x60")
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
v2: use linux/bits.h instead of vdso/bits.h

 include/linux/clk/at91_pmc.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk/at91_pmc.h b/include/linux/clk/at91_pmc.h
index 3484309b59bf..7af499bdbecb 100644
--- a/include/linux/clk/at91_pmc.h
+++ b/include/linux/clk/at91_pmc.h
@@ -12,6 +12,8 @@
 #ifndef AT91_PMC_H
 #define AT91_PMC_H
 
+#include <linux/bits.h>
+
 #define AT91_PMC_V1		(1)			/* PMC version 1 */
 #define AT91_PMC_V2		(2)			/* PMC version 2 [SAM9X60] */
 
@@ -45,8 +47,8 @@
 #define	AT91_PMC_PCSR		0x18			/* Peripheral Clock Status Register */
 
 #define AT91_PMC_PLL_ACR	0x18			/* PLL Analog Control Register [for SAM9X60] */
-#define		AT91_PMC_PLL_ACR_DEFAULT_UPLL	0x12020010UL	/* Default PLL ACR value for UPLL */
-#define		AT91_PMC_PLL_ACR_DEFAULT_PLLA	0x00020010UL	/* Default PLL ACR value for PLLA */
+#define		AT91_PMC_PLL_ACR_DEFAULT_UPLL	UL(0x12020010)	/* Default PLL ACR value for UPLL */
+#define		AT91_PMC_PLL_ACR_DEFAULT_PLLA	UL(0x00020010)	/* Default PLL ACR value for PLLA */
 #define		AT91_PMC_PLL_ACR_UTMIVR		(1 << 12)	/* UPLL Voltage regulator Control */
 #define		AT91_PMC_PLL_ACR_UTMIBG		(1 << 13)	/* UPLL Bandgap Control */
 
-- 
2.35.3

