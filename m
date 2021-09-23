Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4740BC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 13:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F4A761090
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 13:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241403AbhIWNXY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Sep 2021 09:23:24 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:7781 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241369AbhIWNXJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Sep 2021 09:23:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1632403297; x=1663939297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RusdYrZLESoncLe3TEsjpmisjj7q2vbuzL1nryePEes=;
  b=QjsoUDtB+5iTKqznlEJ1y5KSxfSX4ssN5Fm0jYBBFa8GAdtV1Pgzn5gL
   k7S8kC+yuz2UpZXbJrdJ1E6HQ2lkfdzqK+GXtyQE4fs6wMmwnfk/E3k7U
   PpodVKT5l6rSY660gmu6nAdnQYlDsMktrPnyh6ToYC8RQtchAlxh5gGnC
   cYthSp/Kd3emmwAh83Cel9ghp4tSrGZx4FoxUD7aEVIHdUVVWsux95E3X
   ofSTJB6X15F8nVDTqpmrKQnVUs/Evs7jfn8gDrsIcSrnacTohqmZ62xOn
   wrGUj6+z1/P/y1gdObTcuhY/lj4v21+gvJ2myfG5vfx73gRsouUI77Vio
   Q==;
IronPort-SDR: F4dFaDTDuKuz3swH/YeixtG1v+zSAc3a7cixjbr/YutU43xRyH/GKL0gB0JzIPAcmFAb+B/WEU
 b24zsx88EHZiX+lWfSTPZs6nWaQ+OW/NyxYmkXIsl/Li8j+WQJOdBpd4D5/K7LAbkiInFq2LkD
 kOJrgLaR4s7c3hWJfDh3MZ8pY/WVZ3mDPzX1tjxoSqRGBCQUmhPyjSjnZD5ipFpVbrPQRzjRtK
 BGY7dBNlsnVIhTd/ayQ+vBnNMNcZrMRGy+nWlz3xWVmW8yATn4gr1mlEyEyWrmuHG72qya2qPT
 r5x/DEDswHGca6atJ3l9Ulv5
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
   d="scan'208";a="70327432"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Sep 2021 06:21:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 23 Sep 2021 06:21:36 -0700
Received: from rob-dk-mpu01.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 23 Sep 2021 06:21:34 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v4 14/17] clk: at91: sama7g5: set low limit for mck0 at 32KHz
Date:   Thu, 23 Sep 2021 16:20:43 +0300
Message-ID: <20210923132046.1860549-15-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923132046.1860549-1-claudiu.beznea@microchip.com>
References: <20210923132046.1860549-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MCK0 could go as low as 32KHz. Set this limit.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sama7g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index fd9d17eabf54..369dfafabbca 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -850,7 +850,7 @@ static const struct {
 
 /* MCK0 characteristics. */
 static const struct clk_master_characteristics mck0_characteristics = {
-	.output = { .min = 50000000, .max = 200000000 },
+	.output = { .min = 32768, .max = 200000000 },
 	.divisors = { 1, 2, 4, 3, 5 },
 	.have_div3_pres = 1,
 };
-- 
2.25.1

