Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA92C10F05
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 279622075E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="go4HWrF6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfDDIMW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:12:22 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53002 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbfDDIMW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 04:12:22 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x348CJt4038576;
        Thu, 4 Apr 2019 03:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554365539;
        bh=c/jFE4H+RDbXA+RxZ0DS/oxFw6yjzvGOoogluh+TCZ8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=go4HWrF6kptP3w6JtTkQDukOcUSiTEKGWM4pJkhjpFcXU2/Xf3t4ocR7W65XS8Z//
         MnYX8Ehh+twdmHiJ43wyu0LCy9WEciOW9o4kkMd6guO3plrDDD/Sd+UGyell2O6K0a
         UhRNgOMauPzPKJF2IuhKpzoPbNelKclezmV1vxZk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x348CJQQ004684
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Apr 2019 03:12:19 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Apr
 2019 03:12:16 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Apr 2019 03:12:16 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x348C8GA093305;
        Thu, 4 Apr 2019 03:12:15 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>
Subject: [PATCH 3/6] clk: ti: dra7x: prevent non-existing clkctrl clocks from registering
Date:   Thu, 4 Apr 2019 11:11:04 +0300
Message-ID: <1554365467-1325-4-git-send-email-t-kristo@ti.com>
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

Certain clkctrl clocks (like the USB_OTG_SS4) do not exist on some
variants of the dra7x SoC. Append a flag for these clocks and skip
the registration in cases where the clocks do not exist.

Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-7xx-compat.c |  2 +-
 drivers/clk/ti/clk-7xx.c        |  2 +-
 drivers/clk/ti/clkctrl.c        | 14 ++++++++++++++
 drivers/clk/ti/clock.h          |  6 ++++++
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clk-7xx-compat.c b/drivers/clk/ti/clk-7xx-compat.c
index e3cb7f0..0d53bd0 100644
--- a/drivers/clk/ti/clk-7xx-compat.c
+++ b/drivers/clk/ti/clk-7xx-compat.c
@@ -362,7 +362,7 @@
 	{ DRA7_MMC2_CLKCTRL, dra7_mmc2_bit_data, CLKF_SW_SUP, "l3init_cm:clk:0010:25" },
 	{ DRA7_USB_OTG_SS2_CLKCTRL, dra7_usb_otg_ss2_bit_data, CLKF_HW_SUP, "dpll_core_h13x2_ck" },
 	{ DRA7_USB_OTG_SS3_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h13x2_ck" },
-	{ DRA7_USB_OTG_SS4_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h13x2_ck" },
+	{ DRA7_USB_OTG_SS4_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_DRA74 | CLKF_SOC_DRA76, "dpll_core_h13x2_ck" },
 	{ DRA7_SATA_CLKCTRL, dra7_sata_bit_data, CLKF_SW_SUP, "func_48m_fclk" },
 	{ DRA7_PCIE1_CLKCTRL, dra7_pcie1_bit_data, CLKF_SW_SUP, "l4_root_clk_div", "pcie_clkdm" },
 	{ DRA7_PCIE2_CLKCTRL, dra7_pcie2_bit_data, CLKF_SW_SUP, "l4_root_clk_div", "pcie_clkdm" },
diff --git a/drivers/clk/ti/clk-7xx.c b/drivers/clk/ti/clk-7xx.c
index 597fb4a..098c342 100644
--- a/drivers/clk/ti/clk-7xx.c
+++ b/drivers/clk/ti/clk-7xx.c
@@ -348,7 +348,7 @@
 	{ DRA7_L3INIT_MMC2_CLKCTRL, dra7_mmc2_bit_data, CLKF_SW_SUP, "l3init-clkctrl:0010:25" },
 	{ DRA7_L3INIT_USB_OTG_SS2_CLKCTRL, dra7_usb_otg_ss2_bit_data, CLKF_HW_SUP, "dpll_core_h13x2_ck" },
 	{ DRA7_L3INIT_USB_OTG_SS3_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h13x2_ck" },
-	{ DRA7_L3INIT_USB_OTG_SS4_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_core_h13x2_ck" },
+	{ DRA7_L3INIT_USB_OTG_SS4_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_SOC_DRA74 | CLKF_SOC_DRA76, "dpll_core_h13x2_ck" },
 	{ DRA7_L3INIT_SATA_CLKCTRL, dra7_sata_bit_data, CLKF_SW_SUP, "func_48m_fclk" },
 	{ DRA7_L3INIT_OCP2SCP1_CLKCTRL, NULL, CLKF_HW_SUP, "l4_root_clk_div" },
 	{ DRA7_L3INIT_OCP2SCP3_CLKCTRL, NULL, CLKF_HW_SUP, "l4_root_clk_div" },
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 639f515..4cdeb8d 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -446,6 +446,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	u32 addr;
 	int ret;
 	char *c;
+	u16 soc_mask = 0;
 
 	if (!(ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) &&
 	    of_node_name_eq(node, "clk"))
@@ -469,6 +470,13 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		else
 			data = dra7_clkctrl_data;
 	}
+
+	if (of_machine_is_compatible("ti,dra72"))
+		soc_mask = CLKF_SOC_DRA72;
+	if (of_machine_is_compatible("ti,dra74"))
+		soc_mask = CLKF_SOC_DRA74;
+	if (of_machine_is_compatible("ti,dra76"))
+		soc_mask = CLKF_SOC_DRA76;
 #endif
 #ifdef CONFIG_SOC_AM33XX
 	if (of_machine_is_compatible("ti,am33xx")) {
@@ -562,6 +570,12 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	reg_data = data->regs;
 
 	while (reg_data->parent) {
+		if ((reg_data->flags & CLKF_SOC_MASK) &&
+		    (reg_data->flags & soc_mask) == 0) {
+			reg_data++;
+			continue;
+		}
+
 		hw = kzalloc(sizeof(*hw), GFP_KERNEL);
 		if (!hw)
 			return;
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 4223a39..773e2c4 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -83,6 +83,12 @@ enum {
 #define CLKF_HW_SUP			BIT(6)
 #define CLKF_NO_IDLEST			BIT(7)
 
+#define CLKF_SOC_MASK			GENMASK(10, 8)
+
+#define CLKF_SOC_DRA72			BIT(8)
+#define CLKF_SOC_DRA74			BIT(9)
+#define CLKF_SOC_DRA76			BIT(10)
+
 #define CLK(dev, con, ck)		\
 	{				\
 		.lk = {			\
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
