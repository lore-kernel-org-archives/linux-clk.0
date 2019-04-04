Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF47C4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 697C52075E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wNV8mdkL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbfDDIM0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:12:26 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45356 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfDDIM0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 04:12:26 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x348CMS0057230;
        Thu, 4 Apr 2019 03:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554365542;
        bh=GwjGrX+awpRwIvOKB/u2mBhh41tqKddpveT+XCA7POY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wNV8mdkL7qq6iteV9heV1oVmdwveu+RuSXlQANZvvu+oVWW3I3yLPCxNyEKRz7NcE
         AePiXM9ihSRSUeH3i6s4eabKNnqJQeh5lSW0l9T7zn2R2AEjp6tHFuW7dFtq0PQmQ5
         njL3svJRIUKNyerdiTMZbEBCBCZmmW7sI3nl6vdQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x348CLZ9052877
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Apr 2019 03:12:21 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Apr
 2019 03:12:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Apr 2019 03:12:20 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x348C8GB093305;
        Thu, 4 Apr 2019 03:12:17 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>
Subject: [PATCH 4/6] clk: ti: dra7: disable the RNG and TIMER12 clkctrl clocks on HS devices
Date:   Thu, 4 Apr 2019 11:11:05 +0300
Message-ID: <1554365467-1325-5-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

RNG and TIMER12 are reserved for secure side usage only on HS devices,
so disable their clkctrl clocks on HS SoCs also.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
Tested-by: Andrew F. Davis <afd@ti.com>
---
 arch/arm/mach-omap2/clock.c     | 3 +++
 drivers/clk/ti/clk-7xx-compat.c | 4 ++--
 drivers/clk/ti/clk-7xx.c        | 4 ++--
 drivers/clk/ti/clkctrl.c        | 3 +++
 drivers/clk/ti/clock.h          | 9 +++++----
 include/linux/clk/ti.h          | 1 +
 6 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-omap2/clock.c b/arch/arm/mach-omap2/clock.c
index 42881f2..3e0f09c 100644
--- a/arch/arm/mach-omap2/clock.c
+++ b/arch/arm/mach-omap2/clock.c
@@ -119,6 +119,9 @@ void __init ti_clk_init_features(void)
 	if (cpu_is_omap343x())
 		features.flags |= TI_CLK_DPLL_HAS_FREQSEL;
 
+	if (omap_type() == OMAP2_DEVICE_TYPE_GP)
+		features.flags |= TI_CLK_DEVICE_TYPE_GP;
+
 	/* Idlest value for interface clocks.
 	 * 24xx uses 0 to indicate not ready, and 1 to indicate ready.
 	 * 34xx reverses this, just to keep us on our toes
diff --git a/drivers/clk/ti/clk-7xx-compat.c b/drivers/clk/ti/clk-7xx-compat.c
index 0d53bd0..b3cd229 100644
--- a/drivers/clk/ti/clk-7xx-compat.c
+++ b/drivers/clk/ti/clk-7xx-compat.c
@@ -662,7 +662,7 @@
 	{ DRA7_AES1_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div", "l4sec_clkdm" },
 	{ DRA7_AES2_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div", "l4sec_clkdm" },
 	{ DRA7_DES_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div", "l4sec_clkdm" },
-	{ DRA7_RNG_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div", "l4sec_clkdm" },
+	{ DRA7_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "l3_iclk_div", "l4sec_clkdm" },
 	{ DRA7_SHAM_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div", "l4sec_clkdm" },
 	{ DRA7_UART7_CLKCTRL, dra7_uart7_bit_data, CLKF_SW_SUP, "l4per_cm:clk:01d0:24", "l4per2_clkdm" },
 	{ DRA7_UART8_CLKCTRL, dra7_uart8_bit_data, CLKF_SW_SUP, "l4per_cm:clk:01e0:24", "l4per2_clkdm" },
@@ -704,7 +704,7 @@
 	{ DRA7_WD_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "sys_32k_ck" },
 	{ DRA7_GPIO1_CLKCTRL, dra7_gpio1_bit_data, CLKF_HW_SUP, "wkupaon_iclk_mux" },
 	{ DRA7_TIMER1_CLKCTRL, dra7_timer1_bit_data, CLKF_SW_SUP, "wkupaon_cm:clk:0020:24" },
-	{ DRA7_TIMER12_CLKCTRL, NULL, 0, "secure_32k_clk_src_ck" },
+	{ DRA7_TIMER12_CLKCTRL, NULL, CLKF_SOC_NONSEC, "secure_32k_clk_src_ck" },
 	{ DRA7_COUNTER_32K_CLKCTRL, NULL, 0, "wkupaon_iclk_mux" },
 	{ DRA7_UART10_CLKCTRL, dra7_uart10_bit_data, CLKF_SW_SUP, "wkupaon_cm:clk:0060:24" },
 	{ DRA7_DCAN1_CLKCTRL, dra7_dcan1_bit_data, CLKF_SW_SUP, "wkupaon_cm:clk:0068:24" },
diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 098c342..79186b9 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -590,7 +590,7 @@
 	{ DRA7_L4SEC_AES1_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ DRA7_L4SEC_AES2_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ DRA7_L4SEC_DES_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
-	{ DRA7_L4SEC_RNG_CLKCTRL, NULL, CLKF_HW_SUP, "" },
+	{ DRA7_L4SEC_RNG_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_NONSEC, "" },
 	{ DRA7_L4SEC_SHAM_CLKCTRL, NULL, CLKF_HW_SUP, "l3_iclk_div" },
 	{ 0 },
 };
@@ -757,7 +757,7 @@
 	{ DRA7_WKUPAON_WD_TIMER2_CLKCTRL, NULL, CLKF_SW_SUP, "sys_32k_ck" },
 	{ DRA7_WKUPAON_GPIO1_CLKCTRL, dra7_gpio1_bit_data, CLKF_HW_SUP, "wkupaon_iclk_mux" },
 	{ DRA7_WKUPAON_TIMER1_CLKCTRL, dra7_timer1_bit_data, CLKF_SW_SUP, "wkupaon-clkctrl:0020:24" },
-	{ DRA7_WKUPAON_TIMER12_CLKCTRL, NULL, 0, "secure_32k_clk_src_ck" },
+	{ DRA7_WKUPAON_TIMER12_CLKCTRL, NULL, CLKF_SOC_NONSEC, "secure_32k_clk_src_ck" },
 	{ DRA7_WKUPAON_COUNTER_32K_CLKCTRL, NULL, 0, "wkupaon_iclk_mux" },
 	{ DRA7_WKUPAON_UART10_CLKCTRL, dra7_uart10_bit_data, CLKF_SW_SUP, "wkupaon-clkctrl:0060:24" },
 	{ DRA7_WKUPAON_DCAN1_CLKCTRL, dra7_dcan1_bit_data, CLKF_SW_SUP, "wkupaon-clkctrl:0068:24" },
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 4cdeb8d..96d65a1 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -509,6 +509,9 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		data = dm816_clkctrl_data;
 #endif
 
+	if (ti_clk_get_features()->flags & TI_CLK_DEVICE_TYPE_GP)
+		soc_mask |= CLKF_SOC_NONSEC;
+
 	while (data->addr) {
 		if (addr == data->addr)
 			break;
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 773e2c4..e4b8392 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -83,11 +83,12 @@ enum {
 #define CLKF_HW_SUP			BIT(6)
 #define CLKF_NO_IDLEST			BIT(7)
 
-#define CLKF_SOC_MASK			GENMASK(10, 8)
+#define CLKF_SOC_MASK			GENMASK(11, 8)
 
-#define CLKF_SOC_DRA72			BIT(8)
-#define CLKF_SOC_DRA74			BIT(9)
-#define CLKF_SOC_DRA76			BIT(10)
+#define CLKF_SOC_NONSEC			BIT(8)
+#define CLKF_SOC_DRA72			BIT(9)
+#define CLKF_SOC_DRA74			BIT(10)
+#define CLKF_SOC_DRA76			BIT(11)
 
 #define CLK(dev, con, ck)		\
 	{				\
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 2821f7c..1e8ef96 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -294,6 +294,7 @@ struct ti_clk_features {
 #define TI_CLK_DISABLE_CLKDM_CONTROL		BIT(2)
 #define TI_CLK_ERRATA_I810			BIT(3)
 #define TI_CLK_CLKCTRL_COMPAT			BIT(4)
+#define TI_CLK_DEVICE_TYPE_GP			BIT(5)
 
 void ti_clk_setup_features(struct ti_clk_features *features);
 const struct ti_clk_features *ti_clk_get_features(void);
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
