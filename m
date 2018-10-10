Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCE0C43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 12:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33BEB2087A
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 12:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BEB2087A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbeJJT7c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 15:59:32 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:37404 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726700AbeJJT7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 15:59:32 -0400
Received: from unknown (HELO relmlir1.idc.renesas.com) ([10.200.68.151])
  by relmlie2.idc.renesas.com with ESMTP; 10 Oct 2018 21:37:31 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir1.idc.renesas.com (Postfix) with ESMTP id 6952D8777B;
        Wed, 10 Oct 2018 21:37:31 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,364,1534777200"; 
   d="scan'208";a="294772602"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii2.idc.renesas.com with ESMTP; 10 Oct 2018 21:37:29 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.66])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id C9EFB1BF;
        Wed, 10 Oct 2018 12:37:25 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 1/3] clk: renesas: r7s9210: Add SDHI clocks
Date:   Wed, 10 Oct 2018 07:37:11 -0500
Message-Id: <20181010123713.67541-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181010123713.67541-1-chris.brandt@renesas.com>
References: <20181010123713.67541-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add SDHI clocks for RZ/A2

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 5135f13ec628..9056da15dc72 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -98,6 +98,11 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 	DEF_MOD_STB("spi2",	 95,	R7S9210_CLK_P1),
 	DEF_MOD_STB("spi1",	 96,	R7S9210_CLK_P1),
 	DEF_MOD_STB("spi0",	 97,	R7S9210_CLK_P1),
+
+	DEF_MOD_STB("sdhi11",	100,	R7S9210_CLK_B),
+	DEF_MOD_STB("sdhi10",	101,	R7S9210_CLK_B),
+	DEF_MOD_STB("sdhi01",	102,	R7S9210_CLK_B),
+	DEF_MOD_STB("sdhi00",	103,	R7S9210_CLK_B),
 };
 
 /* The clock dividers in the table vary based on DT and register settings */
-- 
2.16.1

