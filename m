Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8000FC6369E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C38024698
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="WO9fI3uQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgKSOi5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:38:57 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:55701 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKSOi5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 09:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605796737; x=1637332737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=FrCYjC2ukUCDH3p6+EqKIEI32HKV++foBRusYDNEF6Q=;
  b=WO9fI3uQvYAJXrWx3F76Rr4EGmZvhQ/JrRiVLJYdZ3pHoh4nZawEYNQ5
   mAf9FBGcYnRMnUTDmf2kR+/Eo44WyPZp6IUl0eVrjbPIcStOKGnbtMYLp
   E13SmZxbUzZYB7K4/ZDYB7SlJocSgI99WZO/Y8QgMtTSH1GGucAAsi5mP
   n60eWJPHo0Rn3ZEOiCfErzm+B2TCf/ocPbIatzw/0H84ZIpBijiPYnIt2
   M9C+29mWJ2XHTqBHO+0zMfGD00HIdC23bDnDV2uy8/Ev2eJ246AR8RiC9
   QDiyy5V4ks+k0wNLdvYCgRbeufmkqxpH8ZMWZQckSFK7+RFO/l8A64nMe
   A==;
IronPort-SDR: Kv9FnD3GN/cfdsWximKMbqqrH+K41urvEGXmLS/GUr4wGQkdjyi9U3Xo6muzcAnfZb91kSZVKx
 7Zhsr/V+/MbXhJKizcuhwJykV0Qr0J7ztvHyPdhFPUIE++3BRuWDIVMHoYL+8th36NW1amoezz
 k4gT0M2fGjw/2M1nDhBSiDXgyo7yKTJkaMXjdRKi4WRch6uIMCVfnAE00SBv1A3bLYJc9sgaox
 ef3StGE0I8EUfnAIG+YQu4Gnscxvxpgs9fVUf9vEjUSE3mSgFmUUXaGO8uEGR68NWM+ebW7MK0
 nZg=
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="34299540"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Nov 2020 07:38:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 07:38:56 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 19 Nov 2020 07:38:50 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v5 04/11] clk: at91: clk-master: add 5th divisor for mck master
Date:   Thu, 19 Nov 2020 16:38:20 +0200
Message-ID: <1605796707-8378-5-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605796707-8378-1-git-send-email-claudiu.beznea@microchip.com>
References: <1605796707-8378-1-git-send-email-claudiu.beznea@microchip.com>
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

