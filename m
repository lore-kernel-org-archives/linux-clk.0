Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783C8C6379F
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 15:44:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 164EF22256
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 15:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wgGnWjsk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728713AbgKSPnv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 10:43:51 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:51592 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbgKSPnu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 10:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605800630; x=1637336630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=FrCYjC2ukUCDH3p6+EqKIEI32HKV++foBRusYDNEF6Q=;
  b=wgGnWjsk+LqiaheCZiuLW3vDtHxLhgBFPNP4mn0TSZqQp0Ad4Z43uSRM
   UVz+P6gFPw3L+XxgaxVACdMh/2aISpbgC6UPX8WPKnyE1wCoHIxPv5zbh
   +wqQGtIhEj278PusIy//NGzp0E5DA6rpDuEK4iJRV9Si9Pkf8QtVAUZ7d
   mKdAYIDg6d6pS5+g1A5bT2a9am11QpZ4eOK1+D7YkjL2lXX9Oc1akAfBY
   oQVMVZoPdFvWi5Pm48G4AHEG5+aktBhCM3MUn3v5DaFje9bkWGEmfZpsE
   CwFPF0tGWBByb877LhwFsqYJ42iYXOfB7JQTeR9iMrx6d5ztFfTL9YjJz
   A==;
IronPort-SDR: RUBSJ8jxHPUF02fcRtRzXzNE5e6FBRYjGiBrMR+s6kbEZTbgoZfLPNH1YkJ0WRVuHsniPlh3lp
 6v9najUUA5gIJmmUkGVfAZjTEptQrFnsu763MtbcleDc6jROu/qZtOM1bpg9Ax3fF9t2OJeSWt
 oYh43s0B2NrSjcpNLwo6WvJ/sFRGlVabJXrWAuCnlTnCe97IFDiOpFVnh16OYK0EderUnaQp4+
 6GJTGaikRSJJD4jiFy/S5xNJx/x4K4MSaJwq3nSWpa3mayvfpGO0fa48+9nagHwpDd35RsoZ5e
 544=
X-IronPort-AV: E=Sophos;i="5.78,490,1599548400"; 
   d="scan'208";a="96942005"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Nov 2020 08:43:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 08:43:49 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 19 Nov 2020 08:43:46 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v6 04/11] clk: at91: clk-master: add 5th divisor for mck master
Date:   Thu, 19 Nov 2020 17:43:10 +0200
Message-ID: <1605800597-16720-5-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605800597-16720-1-git-send-email-claudiu.beznea@microchip.com>
References: <1605800597-16720-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

clk-master can have 5 divisors with a field width of 3 bits
on some products.

Change the mask and number of divisors accordingly.

Reported-by: Mihai Sain <mihai.sain@microchip.com>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/clk-master.c | 2 +-
 drivers/clk/at91/pmc.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index bd0d8a69a2cf..aafd003b30cf 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -15,7 +15,7 @@
 #define MASTER_PRES_MASK	0x7
 #define MASTER_PRES_MAX		MASTER_PRES_MASK
 #define MASTER_DIV_SHIFT	8
-#define MASTER_DIV_MASK		0x3
+#define MASTER_DIV_MASK		0x7
 
 #define PMC_MCR			0x30
 #define PMC_MCR_ID_MSK		GENMASK(3, 0)
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 7b86affc6d7c..0a9364bde339 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -48,7 +48,7 @@ extern const struct clk_master_layout at91sam9x5_master_layout;
 
 struct clk_master_characteristics {
 	struct clk_range output;
-	u32 divisors[4];
+	u32 divisors[5];
 	u8 have_div3_pres;
 };
 
-- 
2.7.4

