Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F5AC6783C
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 12:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC2C720868
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 12:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC2C720868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbeJLUCF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Oct 2018 16:02:05 -0400
Received: from relmlor4.renesas.com ([210.160.252.174]:16285 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728131AbeJLUCF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Oct 2018 16:02:05 -0400
Received: from unknown (HELO relmlir2.idc.renesas.com) ([10.200.68.152])
  by relmlie3.idc.renesas.com with ESMTP; 12 Oct 2018 21:29:49 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir2.idc.renesas.com (Postfix) with ESMTP id 8A8E68ECB2;
        Fri, 12 Oct 2018 21:29:49 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,372,1534777200"; 
   d="scan'208";a="293392937"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii1.idc.renesas.com with ESMTP; 12 Oct 2018 21:29:48 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.43])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 8A0EA1C4;
        Fri, 12 Oct 2018 12:29:42 +0000 (UTC)
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
Subject: [PATCH v4 1/3] clk: renesas: r7s9210: Add SDHI clocks
Date:   Fri, 12 Oct 2018 07:29:22 -0500
Message-Id: <20181012122924.5543-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181012122924.5543-1-chris.brandt@renesas.com>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
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

