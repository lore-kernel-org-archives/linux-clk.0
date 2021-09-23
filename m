Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E246C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 13:21:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8657261164
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 13:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241307AbhIWNXC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Sep 2021 09:23:02 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:64407 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241308AbhIWNWy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Sep 2021 09:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1632403282; x=1663939282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S2pBzduVdLBand+IYegWgUWMNB29c7JB6jeWuWWNdV0=;
  b=ZFOymQpRgRo7zpj+gweuehxKyl+wcMvMnJBlyRMOZvYyfeucZmBlZhs3
   mheQ1J5uzgFb+o/Dk96vh4zI3sDKXVJNPvd1k7p7qyEJwoxGOXbPiKqWY
   NiRB6WLsQ2KW56qQCPa6+HLyJOefwsiKUvKArNKA/7cM9Xx69XAlwf0N3
   62tay28+5Dq1QR/4QlD19lxsxVyKPlPXwXwy/7SS73g5Ci+KBX0d2Sqyj
   kDy6AsHiRoy7cWTOitzcLOq4xB0BGJSfix3vlXceqbUXn/gnzEcAj84Gp
   9N+iHl70Ho4rfMMKR5dg/7ERbncdQLRjSMKuQAS6+4NPkrVennGYEPWxR
   Q==;
IronPort-SDR: MeMq844Z+1AL9vQAX+/l/4fhk+E2EMbP0lQfYIJvVF/eFI0UUgt2s97BjD5ygigJG/kQKsWYyn
 2D2/AkVxrXSBC2tAcjSX0PgAHOhDxRVCOVUYKhCvuq6f5qyRYDLlfeOqy9hx4A+dzvCCR48SBu
 h7N+5BUsWpGonKzMfa4tBFTkfwy5oJ8eHqQr1jFVwsXl3Nfjr9FzdozSWN8ERvyP0D4FpI9dvb
 2LLom9kFkH3ocvoe0wfCF/MblTDtGh3yXqF7DFnaQHGYpzcyJ73MqBcaR57FZC2BxwLoe/KrIw
 99EjZcYz3qHJ++CoaayZhf8Y
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
   d="scan'208";a="145305449"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Sep 2021 06:21:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 23 Sep 2021 06:21:21 -0700
Received: from rob-dk-mpu01.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 23 Sep 2021 06:21:19 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v4 08/17] clk: at91: clk-master: check if div or pres is zero
Date:   Thu, 23 Sep 2021 16:20:37 +0300
Message-ID: <20210923132046.1860549-9-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923132046.1860549-1-claudiu.beznea@microchip.com>
References: <20210923132046.1860549-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Check if div or pres is zero before using it as argument for ffs().
In case div is zero ffs() will return 0 and thus substracting from
zero will lead to invalid values to be setup in registers.

Fixes: 7a110b9107ed8 ("clk: at91: clk-master: re-factor master clock")
Fixes: 75c88143f3b87 ("clk: at91: clk-master: add master clock support for SAMA7G5")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/clk-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
index 9a2c8e64cacf..2093e13b5068 100644
--- a/drivers/clk/at91/clk-master.c
+++ b/drivers/clk/at91/clk-master.c
@@ -344,7 +344,7 @@ static int clk_master_pres_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	else if (pres == 3)
 		pres = MASTER_PRES_MAX;
-	else
+	else if (pres)
 		pres = ffs(pres) - 1;
 
 	spin_lock_irqsave(master->lock, flags);
@@ -757,7 +757,7 @@ static int clk_sama7g5_master_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (div == 3)
 		div = MASTER_PRES_MAX;
-	else
+	else if (div)
 		div = ffs(div) - 1;
 
 	spin_lock_irqsave(master->lock, flags);
-- 
2.25.1

