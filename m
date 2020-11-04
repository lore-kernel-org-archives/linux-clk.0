Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0992DC388F9
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 17:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B102720759
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 17:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="QRrLKIN9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731905AbgKDRpn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 12:45:43 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:18187 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731897AbgKDRpn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Nov 2020 12:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604511942; x=1636047942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QpD53wBg29UptUvVNqRf5JTCpttxxocLcDTpaKiBG1k=;
  b=QRrLKIN9F2nfkIYZZXxvhtnarRNVUYc5FaSvUKku+cJT4qGV13ju+Fwh
   /b1fgKZ0GJ3q0F4LtvIJ8i6kF9l6oEkNGVKF6OiFUsQ+z8qeyFgrR8qHO
   wB/IQ9lcUcCB/G5jM3PWtZMwaXYep6wKPGHV3a7HtsfNVQjRPvRjy8Jm+
   IGw2l7IYCAoIAkMI33lVLHwUH5/WH4TtepkoE37qcymfM5FDwm/6BaPaB
   m1l0gHIHn+pxmObh7CIJflS3a1QUPILRg+9180/xSXlmbXVkFLoeSyMl6
   mSHInj9R4/bn2L/ky2oZSyHIST5WUMkVFzq6K1Cvp+XYeabBJKqGwShP1
   g==;
IronPort-SDR: RHs+mEGmKoB6Jy+JeJRk3mrweSaB3yI2cwUheA0p0iA5DySGBlZwkRvSdEfW5MaikCHqJOeMq2
 sqPGvrXq0SnBaodpSbVaJhvplb9nYm+vQveW0QIrF7iQ9WlaMoJf1jf4MWClv36BUxlha1E4n4
 tkIdaeO+ZI9/Vxh23iFiINAQETczbqqOzTkoicZQMVV1PFA6zChrnIVQ0EyYjGg1Z0/pPcrxqO
 mad5oHquSVy70INrktEBnsXfWzpIM8AXqCu/uishqPQw5ByaDECi26i7dkVYDUOhdCwrd0dVqs
 Hf0=
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="97190163"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Nov 2020 10:45:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 4 Nov 2020 10:45:41 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 4 Nov 2020 10:45:37 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <eugen.hristev@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 1/8] clk: at91: sama7g5: fix compilation error
Date:   Wed, 4 Nov 2020 19:45:19 +0200
Message-ID: <1604511926-29516-2-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604511926-29516-1-git-send-email-claudiu.beznea@microchip.com>
References: <1604511926-29516-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

pmc_data_allocate() has been changed. pmc_data_free() was removed.
Adapt the code taking this into consideration. With this the programmable
clocks were also saved in sama7g5_pmc so that they could be later
referenced.

Fixes: cb783bbbcf54 ("clk: at91: sama7g5: add clock support for sama7g5")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sama7g5.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 0db2ab3eca14..a092a940baa4 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -838,7 +838,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	sama7g5_pmc = pmc_data_allocate(PMC_I2S1_MUX + 1,
 					nck(sama7g5_systemck),
 					nck(sama7g5_periphck),
-					nck(sama7g5_gck));
+					nck(sama7g5_gck), 8);
 	if (!sama7g5_pmc)
 		return;
 
@@ -980,6 +980,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						    sama7g5_prog_mux_table);
 		if (IS_ERR(hw))
 			goto err_free;
+
+		sama7g5_pmc->pchws[i] = hw;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(sama7g5_systemck); i++) {
@@ -1052,7 +1054,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		kfree(alloc_mem);
 	}
 
-	pmc_data_free(sama7g5_pmc);
+	kfree(sama7g5_pmc);
 }
 
 /* Some clks are used for a clocksource */
-- 
2.7.4

