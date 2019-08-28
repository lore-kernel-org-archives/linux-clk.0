Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31057C3A5A6
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 06:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A86B22CF5
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 06:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h+koDJRC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbfH1G7t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 02:59:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49222 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfH1G7t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 02:59:49 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xkkv106203;
        Wed, 28 Aug 2019 01:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566975586;
        bh=+wJjCWfQrTgNasnwgKOhFijISSbGmcAqlzAKHLVv0jA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=h+koDJRCikkqPJGfoPC0LxnTZ7x+gvhUI6YXYbvPJK4LU+vSraWmihVNGodUlqznr
         VbDWiUzE2274KEgI9/nKsc3OOddXdKZ25rhoBfd+cis0hahQXEF3VcyaaqBO5bRvdQ
         2spQwV5yrTU1EJBwUE4shFyhdWXUz4+KANjE2bbw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S6xkVT052425
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 01:59:46 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 01:59:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 01:59:46 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S6xXVG074399;
        Wed, 28 Aug 2019 01:59:45 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv2 6/6] clk: ti: omap5: add IVA subsystem clkctrl data
Date:   Wed, 28 Aug 2019 09:59:29 +0300
Message-ID: <20190828065929.32150-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828065929.32150-1-t-kristo@ti.com>
References: <20190828065929.32150-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clkctrl data for the IVA subsystem (Image and Video Accelerator.)

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk-54xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/ti/clk-54xx.c b/drivers/clk/ti/clk-54xx.c
index dafef7e70ba8..f63871dac600 100644
--- a/drivers/clk/ti/clk-54xx.c
+++ b/drivers/clk/ti/clk-54xx.c
@@ -286,6 +286,12 @@ static const struct omap_clkctrl_reg_data omap5_l4per_clkctrl_regs[] __initconst
 	{ 0 },
 };
 
+static const struct omap_clkctrl_reg_data omap5_iva_clkctrl_regs[] __initconst = {
+	{ OMAP5_IVA_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_h12x2_ck" },
+	{ OMAP5_SL2IF_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_h12x2_ck" },
+	{ 0 },
+};
+
 static const char * const omap5_dss_dss_clk_parents[] __initconst = {
 	"dpll_per_h12x2_ck",
 	NULL,
@@ -469,6 +475,7 @@ const struct omap_clkctrl_data omap5_clkctrl_data[] __initconst = {
 	{ 0x4a008d20, omap5_l4cfg_clkctrl_regs },
 	{ 0x4a008e20, omap5_l3instr_clkctrl_regs },
 	{ 0x4a009020, omap5_l4per_clkctrl_regs },
+	{ 0x4a009220, omap5_iva_clkctrl_regs },
 	{ 0x4a009420, omap5_dss_clkctrl_regs },
 	{ 0x4a009620, omap5_l3init_clkctrl_regs },
 	{ 0x4ae07920, omap5_wkupaon_clkctrl_regs },
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
