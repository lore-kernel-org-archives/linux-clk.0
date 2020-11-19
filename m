Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55922C64E90
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00DEC24698
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="rnWqg6tv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgKSOj0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:39:26 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:41650 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728155AbgKSOjY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 09:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605796764; x=1637332764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=h/XRQsr7glEa2g/r6SVO2kTjj0kdJnjJ6hTe5rBjWKs=;
  b=rnWqg6tv2K21WDh8XLZIbFB7obcVbT4atwlIVMzojOKxG2vFy3cSekjA
   F557X934h4s2c6SWndCE6M2/NdwVr+4/oH+JNib8JP0LtNuX5J8QMTuwY
   TgpN4IBrBKA/oBKjbZXA2/VV7fpPpSfOp+ciQQt23kCIRufEjrV7CG6lL
   vA6Z7JmBXnktHtMDBO5/UGRixmTdT5fq1rR0hJxJiD1dI/88Eavsl4vNA
   cqONtxALvCWeXOj+TjiM+0O0LIh8A4oiaqZ0dET86cg0HZvVFBHMG0wR7
   mgMohJmmTufPxOFpyqSYG3TrvjAOZWRpJF2RnZ6h/JwY6pyzpO4TVAgHT
   w==;
IronPort-SDR: Pg28csdAmG+y2YdnZMckNF25qJuOttZZgdP2Z0TaaC69QrUwNXQUZSHOy7rat3dnKibUMwba0z
 g0UjwVMLSSGPr77ZYNOtO6dga5Euk5rCtzERnFbGURlwRlbf4iLq1uRpCQ3/INXsuELedQuoLA
 SPfzSCz93m443Y7TcBVGyulRmPqmy0OiHjq90/1g+5D/JSNgVQhFdrQQpou9ldBJRlvkVRVCpf
 Y015Rpa59C4lC2mrVnFz5T6luOrMGm21+2ZlkAY4CCLoR24bBQ+6GujTkFs65WPCfbJwV61/1i
 9GM=
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="94238056"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Nov 2020 07:39:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 07:39:23 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 19 Nov 2020 07:39:20 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v5 11/11] clk: at91: sama7g5: register cpu clock
Date:   Thu, 19 Nov 2020 16:38:27 +0200
Message-ID: <1605796707-8378-12-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605796707-8378-1-git-send-email-claudiu.beznea@microchip.com>
References: <1605796707-8378-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Register CPU clock as being the master clock prescaler. This would
be used by DVFS. The block schema of SAMA7G5's PMC contains also a divider
between master clock prescaler and CPU (PMC_CPU_RATIO.RATIO) but the
frequencies supported by SAMA7G5 could be directly received from
CPUPLL + master clock prescaler and the extra divider would do no work in
case it would be enabled.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sama7g5.c       | 13 ++++++-------
 include/dt-bindings/clock/at91.h |  1 +
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 927eb3b2b126..a6e20b35960e 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -904,7 +904,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama7g5_pmc = pmc_data_allocate(PMC_ETHPLL + 1,
+	sama7g5_pmc = pmc_data_allocate(PMC_CPU + 1,
 					nck(sama7g5_systemck),
 					nck(sama7g5_periphck),
 					nck(sama7g5_gck), 8);
@@ -981,18 +981,17 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		}
 	}
 
-	parent_names[0] = md_slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "cpupll_divpmcck";
-	parent_names[3] = "syspll_divpmcck";
-	hw = at91_clk_register_master_pres(regmap, "mck0_pres", 4, parent_names,
+	parent_names[0] = "cpupll_divpmcck";
+	hw = at91_clk_register_master_pres(regmap, "cpuck", 1, parent_names,
 					   &mck0_layout, &mck0_characteristics,
 					   &pmc_mck0_lock,
 					   CLK_SET_RATE_PARENT, 0);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_master_div(regmap, "mck0_div", "mck0_pres",
+	sama7g5_pmc->chws[PMC_CPU] = hw;
+
+	hw = at91_clk_register_master_div(regmap, "mck0", "cpuck",
 					  &mck0_layout, &mck0_characteristics,
 					  &pmc_mck0_lock, 0);
 	if (IS_ERR(hw))
diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index fab313f62e8f..98e1b2ab6403 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -34,6 +34,7 @@
 #define PMC_AUDIOPMCPLL		(PMC_MAIN + 6)
 #define PMC_AUDIOIOPLL		(PMC_MAIN + 7)
 #define PMC_ETHPLL		(PMC_MAIN + 8)
+#define PMC_CPU			(PMC_MAIN + 9)
 
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
-- 
2.7.4

