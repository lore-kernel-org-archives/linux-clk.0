Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304ABC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 12:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DCDC60187
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 12:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344133AbhIQMI3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Sep 2021 08:08:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:65121 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344034AbhIQMI0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Sep 2021 08:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1631880424; x=1663416424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bbgvOX8odhhcgQRbsWErZdBKALu82PPpkMqqT+eQSGM=;
  b=N4Mqc0F7vpJm5LHLUA2MP8minlNIo1JGrxy4Te4d8vkbcaHneDsY+t76
   sW7emTiB11fwKydqha7bthqh3bxMn7IV+lGyUOR2lMxoCqnsW3zird4l8
   j5u5mbnrXZbD+0OKjscwr4lx8pcZP6adw6oxFsdAqXHCKVqHiom06Cv83
   AMmg98PmcBo4jGrE8ebQxhGxBtftHjGzBVBQsrR22qtmALUfn7+VOgHk6
   +7jHi+wBEPTi/GJ/dxvtz1z/x/y9/BVVFgDf8W5wjMkUVki4MndIoqf17
   HLiDCqjuzolSH9fwThTZIDuKgjH/b+POEw5M+ZfYepLVtkbLrFzcO+rMg
   A==;
IronPort-SDR: YCdtSnmOwuhP8Y32yRoWgLZ64YYCrnADNP7WIVXTO9HttaZqgZLWIp4r8yqyyerJJRPbX7BDiW
 wV6xX+PTP68T893q+yv5r9lOyAUGhbss9dVf5WKlvKgKY/YgUawGJefhwGlNzGN6LfauCGaH/F
 WXJMlmhKIlxa42iTq9q+3j0a1lPdXHD4ws2ZbRyUNBCO1yAP6p/Yl28MmHL8x75w1VK/Im3rXr
 KMjapveUpFA1LFbDdZJ+3gSYFLRUHMqX0aTJ5Q5Kgp5mGVo7UpyHcUWCEL1xv4qCJeaeJwwHrf
 vd9NOd9HY4hnd0U3/V2YNDYf
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; 
   d="scan'208";a="144535328"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Sep 2021 05:07:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 17 Sep 2021 05:07:02 -0700
Received: from rob-dk-mpu01.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 17 Sep 2021 05:07:00 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v3 07/17] clk: at91: sam9x60-pll: use DIV_ROUND_CLOSEST_ULL
Date:   Fri, 17 Sep 2021 15:06:32 +0300
Message-ID: <20210917120642.8993-8-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210917120642.8993-1-claudiu.beznea@microchip.com>
References: <20210917120642.8993-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use DIV_ROUND_CLOSEST_ULL() to avoid any inconsistency b/w the rate
computed in sam9x60_frac_pll_recalc_rate() and the one computed in
sam9x60_frac_pll_compute_mul_frac().

Fixes: 43b1bb4a9b3e1 ("clk: at91: clk-sam9x60-pll: re-factor to support plls with multiple outputs")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clk/at91/clk-sam9x60-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
index 7020d3bf6e13..a73d7c96ce1d 100644
--- a/drivers/clk/at91/clk-sam9x60-pll.c
+++ b/drivers/clk/at91/clk-sam9x60-pll.c
@@ -73,8 +73,8 @@ static unsigned long sam9x60_frac_pll_recalc_rate(struct clk_hw *hw,
 	struct sam9x60_pll_core *core = to_sam9x60_pll_core(hw);
 	struct sam9x60_frac *frac = to_sam9x60_frac(core);
 
-	return (parent_rate * (frac->mul + 1) +
-		((u64)parent_rate * frac->frac >> 22));
+	return parent_rate * (frac->mul + 1) +
+		DIV_ROUND_CLOSEST_ULL((u64)parent_rate * frac->frac, (1 << 22));
 }
 
 static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
-- 
2.25.1

