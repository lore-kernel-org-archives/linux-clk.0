Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70967C43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 13:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33F2220685
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 13:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F2220685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbeIZTxS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 15:53:18 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:46751 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726938AbeIZTxS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 15:53:18 -0400
Received: from unknown (HELO relmlir3.idc.renesas.com) ([10.200.68.153])
  by relmlie2.idc.renesas.com with ESMTP; 26 Sep 2018 22:40:15 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir3.idc.renesas.com (Postfix) with ESMTP id B98596D9DB;
        Wed, 26 Sep 2018 22:40:15 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,306,1534777200"; 
   d="scan'208";a="291979563"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 26 Sep 2018 22:40:14 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.187])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id C0D58219;
        Wed, 26 Sep 2018 13:40:09 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] clk: renesas: r7s9210: Add SPI clocks
Date:   Wed, 26 Sep 2018 08:39:56 -0500
Message-Id: <20180926133956.79788-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926133956.nxy-8ZfzrM8skNAA66GqoKkzHPvDrM_Ao6DFfhjC6mQ@z>

Add RSPI clocks for RZ/A2.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index d8ff4cb0defc..5135f13ec628 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -95,6 +95,9 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 	DEF_MOD_STB("i2c1",	 86,	R7S9210_CLK_P1),
 	DEF_MOD_STB("i2c0",	 87,	R7S9210_CLK_P1),
 
+	DEF_MOD_STB("spi2",	 95,	R7S9210_CLK_P1),
+	DEF_MOD_STB("spi1",	 96,	R7S9210_CLK_P1),
+	DEF_MOD_STB("spi0",	 97,	R7S9210_CLK_P1),
 };
 
 /* The clock dividers in the table vary based on DT and register settings */
-- 
2.16.1

