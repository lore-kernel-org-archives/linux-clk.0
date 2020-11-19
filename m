Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489CBC64E69
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5F7C246EE
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 14:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wq+2ITby"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgKSOjN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 09:39:13 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:3226 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbgKSOjM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 09:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605796751; x=1637332751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=4ZwxjUQBBXtTsmCLYSQXtv2JDFLE5N+4iQm2djDoMQE=;
  b=wq+2ITbyMgdI6uQoOxwmQKMb+f9O4VBXlszKF0q3X2A65/POqO7yh5ft
   VfqujdgFcG03vy2q3WoDxldfEvlxfqhAl53Yay8vSdQT+SWG1yN/AxFqD
   1lBpmQoFfDGYn657PFQ64phqR/R94caOE+sGeZz68Gbubff14qdKKk9Ln
   t/9OyRxBfj1ueuxWzw704pqZoTHX94qRd9PMq3Tm2jPkWIsPfdGATIiac
   JsCxkUzZpGg/UWxvBla5B1TseYW7nkVf6A7UcwlVl4YOqYfxFiM5uAAfu
   R/6GO/vOuJhRByKiOf3PEOhIei5kjeMzEviWVClqMOhLqpp3S5Pehy8Eo
   w==;
IronPort-SDR: 8404A+5J6KYNMylknZdIU7yXItonR+6AjBipcbnWN4ErYU2LwIfx/YtSkOfwakX5wlfNzFsv8q
 Km3Aa4ciczsLHt1In7OD8MNLA2mSpE8Tx9Ssl9xKiYse7GbSY/MYyPQpD4v/wbzwrU+HqsCm9m
 zb+G96o+IBq/gn//Y2uYu4JrHqKx/SuHDQPZ1fiXOxyFwgyTRxkK//VNGhtZgKl7crk9aVeEF+
 44TzhvK/b18CmuXkLZ1PRxXn0TSaQyNN6QFZoZncdckbTtC9RaIvWGEQ4MNPHv2Zf/a8m1fx0y
 zzo=
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; 
   d="scan'208";a="96925445"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Nov 2020 07:39:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 07:39:11 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 19 Nov 2020 07:39:08 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v5 08/11] clk: at91: sama7g5: decrease lower limit for MCK0 rate
Date:   Thu, 19 Nov 2020 16:38:24 +0200
Message-ID: <1605796707-8378-9-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605796707-8378-1-git-send-email-claudiu.beznea@microchip.com>
References: <1605796707-8378-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SAMA7G5 CPU clock is changed at run-time by DVFS. Since MCK0 and
CPU clock shares the same parent clock (CPUPLL clock) the MCK0 is
also changed by DVFS to avoid over/under clocking of MCK0 consumers.
The lower limit is changed to be able to set MCK0 accordingly by
DVFS.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sama7g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 335e9c943c65..29d9781e6712 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -807,7 +807,7 @@ static const struct clk_pll_characteristics pll_characteristics = {
 
 /* MCK0 characteristics. */
 static const struct clk_master_characteristics mck0_characteristics = {
-	.output = { .min = 140000000, .max = 200000000 },
+	.output = { .min = 50000000, .max = 200000000 },
 	.divisors = { 1, 2, 4, 3, 5 },
 	.have_div3_pres = 1,
 };
-- 
2.7.4

