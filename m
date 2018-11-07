Return-Path: <SRS0=FPSA=NS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDFFECDE47
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B87D2086C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 17:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B87D2086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731468AbeKHDIX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Nov 2018 22:08:23 -0500
Received: from relmlor3.renesas.com ([210.160.252.173]:58195 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728121AbeKHDIW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Nov 2018 22:08:22 -0500
Received: from unknown (HELO relmlir4.idc.renesas.com) ([10.200.68.154])
  by relmlie2.idc.renesas.com with ESMTP; 08 Nov 2018 02:36:55 +0900
Received: from relmlii2.idc.renesas.com (relmlii2.idc.renesas.com [10.200.68.66])
        by relmlir4.idc.renesas.com (Postfix) with ESMTP id 3B66C3D896;
        Thu,  8 Nov 2018 02:36:55 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,476,1534777200"; 
   d="scan'208";a="297003245"
Received: from unknown (HELO rtamta01.rta.renesas.com) ([143.103.48.75])
  by relmlii2.idc.renesas.com with ESMTP; 08 Nov 2018 02:36:53 +0900
Received: from ubuntu.localdomain (unknown [143.103.58.108])
        by rtamta01.rta.renesas.com (Postfix) with ESMTP id 86E9A13C;
        Wed,  7 Nov 2018 17:36:48 +0000 (UTC)
From:   Chris Brandt <chris.brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/3] clk: renesas: r7s9210: Add USB clocks
Date:   Wed,  7 Nov 2018 12:35:56 -0500
Message-Id: <20181107173558.54481-2-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181107173558.54481-1-chris.brandt@renesas.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add USB clocks for RZ/A2

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 3922967ba811..efbbf56e6766 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -87,6 +87,8 @@ static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
 	DEF_MOD_STB("scif1",	 46,	R7S9210_CLK_P1C),
 	DEF_MOD_STB("scif0",	 47,	R7S9210_CLK_P1C),
 
+	DEF_MOD_STB("usb1",	 60,	R7S9210_CLK_B),
+	DEF_MOD_STB("usb0",	 61,	R7S9210_CLK_B),
 	DEF_MOD_STB("ether1",	 64,	R7S9210_CLK_B),
 	DEF_MOD_STB("ether0",	 65,	R7S9210_CLK_B),
 
-- 
2.16.1

