Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EF2C4363F
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 18:09:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3214A6112E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 18:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236970AbhDASI6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234781AbhDASD1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 14:03:27 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4467C05BD2C
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 06:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by baptiste.telenet-ops.be with bizsmtp
        id nR1g2400G4A7w6i01R1ga1; Thu, 01 Apr 2021 15:01:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwxA-00CBkD-2C; Thu, 01 Apr 2021 15:01:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwx9-003mtB-Jh; Thu, 01 Apr 2021 15:01:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] clk: renesas: div6: Use clamp() instead of clamp_t()
Date:   Thu,  1 Apr 2021 15:01:34 +0200
Message-Id: <2670c1e3c82a245666578cbbd1fb20d37932fd8e.1617281699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281699.git.geert+renesas@glider.be>
References: <cover.1617281699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As "div" is already "unsigned int", adding "U" suffixes to the constants
"1" and "64" allows us to replace the call to clamp_t() by a call to
clamp().  This removes hidden casts, and thus helps the compiler doing a
better job at type-checking.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index 8fb68e703a6bab8c..a3c4fbeb7b0d2ec0 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -99,7 +99,7 @@ static unsigned int cpg_div6_clock_calc_div(unsigned long rate,
 		rate = 1;
 
 	div = DIV_ROUND_CLOSEST(parent_rate, rate);
-	return clamp_t(unsigned int, div, 1, 64);
+	return clamp(div, 1U, 64U);
 }
 
 static long cpg_div6_clock_round_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.25.1

