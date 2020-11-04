Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3134BC55178
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 09:40:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD517221F9
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 09:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JpLIfCB2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgKDJkq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 04:40:46 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:12983 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgKDJkp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Nov 2020 04:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1604482844; x=1636018844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=+vrfCR+DWe1MfMvTTp1Sgvs+/UaW2a2bnjIs4K9g5Pc=;
  b=JpLIfCB2kF0+9zYmtSBeTVpXNeal+F0VZBsDU5eogK8d3/O8rS8MRLuc
   Ke2/GIGLRb5YoJU16URTUFHHITs1wAnk46c7LSnSv3odm8GGLVe7O36SQ
   9pB9DqJ0uPGFvR4DNVKoVSJdwLH3bVI18oj2lGDPVJLmlZrkwl2TuZT4f
   CA1lzgGCN2a/DT3HTZw9gs+/XPjbc+E+D5KVWB8JG1cTpX6t/bmQTGC+x
   S165XONAzcmPMW49/DgZezcMTEX5C6lGw9n4Af98FmqgBFr3auDrh0zAl
   EPSnkJejQkbwjz2JiuePqs/wAjaA92B/ybS48oPfPcm1xqqEFj1J+aQod
   Q==;
IronPort-SDR: 84tU4O0V1XYX7Gmt9wBpnyqazRmfFstIlPFoN+1xzyAPsB83a8hJutPf8/b4fvrxRoM0AEkwJ1
 3Atcll1BDEohrYcxpzZcAZlESW6I/tJQWdne0tJMI3f3EOCwE+I/3VD7xPFs9Jv5FOftpDxaz8
 FcEPRbxPd3rXaAKkZ4iNGJ9XR0IqoCm5Mnew2Wl2l+xhnQBs7UVqgGOZjhZLu3fWzeBcrUi3K6
 QjnkhxssxgHitjTdIwAii04TrYGkAVF0V8DeP1m6bKMDnSDBPwE6t6/m82/QwMIYWqBQ8CRJsx
 ses=
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; 
   d="scan'208";a="97718049"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Nov 2020 02:40:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 4 Nov 2020 02:40:43 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 4 Nov 2020 02:40:39 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 6/8] clk: at91: sama7g5: decrease lower limit for MCK0 rate
Date:   Wed, 4 Nov 2020 11:40:00 +0200
Message-ID: <1604482802-1647-7-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604482802-1647-1-git-send-email-claudiu.beznea@microchip.com>
References: <1604482802-1647-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SAMA7G5 CPU clock is changed at run-time by DVFS. Since MCK0 and
CPU clock shares the same parent clock (CPUPLL clock) the MCK0 is
also changed by DVFS to avoid its over/under clocking.
The lower limit is changed to be able to set MCK0 accordingly by
DVFS.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/sama7g5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index b8d666f3e431..7d65fd9ceb50 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -788,7 +788,7 @@ static const struct clk_pll_characteristics pll_characteristics = {
 
 /* MCK0 characteristics. */
 static const struct clk_master_characteristics mck0_characteristics = {
-	.output = { .min = 140000000, .max = 200000000 },
+	.output = { .min = 50000000, .max = 200000000 },
 	.divisors = { 1, 2, 4, 3 },
 	.have_div3_pres = 1,
 };
-- 
2.7.4

