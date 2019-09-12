Return-Path: <SRS0=F2l5=XH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0F7C4CEC7
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 13:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 627FE20CC7
	for <linux-clk@archiver.kernel.org>; Thu, 12 Sep 2019 13:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="btVwRm+W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732108AbfILN0f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Sep 2019 09:26:35 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41632 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732098AbfILN0f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Sep 2019 09:26:35 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQVNr049544;
        Thu, 12 Sep 2019 08:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568294791;
        bh=64fqodASKJfeJLGxH1nNhSTYa8joNo1U/kmhF3htzCY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=btVwRm+W6GNuXn4Cm6khmKzPRo/76ZIDAQMS7ilq8XaK3uMMczfBbATeJdAM72tr3
         iey4tVlBN4QG1PCpCsBdnmDWRn6WFJafKquzxIOrHG0/qaXCpu4GpDoH9QRJfWGf1Y
         cWa818w+bc9oicEQGpIYRb30Ipz8DubNLCa2nioo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQVxw071201;
        Thu, 12 Sep 2019 08:26:31 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 08:26:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 08:26:31 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CDQFvW130575;
        Thu, 12 Sep 2019 08:26:29 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>, <s-anna@ti.com>
Subject: [PATCHv3 07/10] clk: ti: omap4: Drop idlest polling from IPU & DSP clkctrl clocks
Date:   Thu, 12 Sep 2019 16:26:10 +0300
Message-ID: <20190912132613.28093-8-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912132613.28093-1-t-kristo@ti.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The IPU and DSP remote processor cores and their corresponding MMUs on
OMAP4 SoCs have hardreset lines associated with them and are controlled
by a PRCM reset line each. Any clkctrl enable/disable operations cannot
be checked for module enabled/disabled status independent of the reset
operation, and this causes some unwanted timeouts in the kernel and
unbalanced states for these clocks. These details should be handled by
the driver integration code itself.

Add the CLKF_NO_IDLEST flag to both the IPU and DSP clkctrl clocks so
that these module status checks are skipped.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/clk/ti/clk-44xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/clk-44xx.c b/drivers/clk/ti/clk-44xx.c
index b10ed0429091..2b4dab632318 100644
--- a/drivers/clk/ti/clk-44xx.c
+++ b/drivers/clk/ti/clk-44xx.c
@@ -37,7 +37,7 @@ static const struct omap_clkctrl_reg_data omap4_mpuss_clkctrl_regs[] __initconst
 };
 
 static const struct omap_clkctrl_reg_data omap4_tesla_clkctrl_regs[] __initconst = {
-	{ OMAP4_DSP_CLKCTRL, NULL, CLKF_HW_SUP, "dpll_iva_m4x2_ck" },
+	{ OMAP4_DSP_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLEST, "dpll_iva_m4x2_ck" },
 	{ 0 },
 };
 
@@ -219,7 +219,7 @@ static const struct omap_clkctrl_reg_data omap4_l3_2_clkctrl_regs[] __initconst
 };
 
 static const struct omap_clkctrl_reg_data omap4_ducati_clkctrl_regs[] __initconst = {
-	{ OMAP4_IPU_CLKCTRL, NULL, CLKF_HW_SUP, "ducati_clk_mux_ck" },
+	{ OMAP4_IPU_CLKCTRL, NULL, CLKF_HW_SUP | CLKF_NO_IDLEST, "ducati_clk_mux_ck" },
 	{ 0 },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
