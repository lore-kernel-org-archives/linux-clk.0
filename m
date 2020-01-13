Return-Path: <SRS0=xcQL=3C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FB7C33CA9
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 21:33:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40B1321569
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jan 2020 21:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgAMVdt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jan 2020 16:33:49 -0500
Received: from mga02.intel.com ([134.134.136.20]:59623 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728809AbgAMVds (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Jan 2020 16:33:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 13:33:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; 
   d="scan'208";a="225019993"
Received: from maru.jf.intel.com ([10.54.51.77])
  by orsmga003.jf.intel.com with ESMTP; 13 Jan 2020 13:33:48 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH] clk: ast2600: enable BCLK for PCI/PCIe bus always
Date:   Mon, 13 Jan 2020 13:34:53 -0800
Message-Id: <20200113213453.27108-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

BCLK for PCI/PCIe bus should be enabled always with having the
CLK_IS_CRITICAL flag otherwise it will be disabled at kernel late
initcall phase as an unused clock, and eventually it causes
unexpected behavior on BMC features that are connected to the host
through PCI/PCIe bus.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/clk/clk-ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 392d01705b97..42bfdc16bf7a 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -64,7 +64,7 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	[ASPEED_CLK_GATE_GCLK]		= {  2,  7, "gclk-gate",	NULL,	 0 },	/* 2D engine */
 	/* vclk parent - dclk/d1clk/hclk/mclk */
 	[ASPEED_CLK_GATE_VCLK]		= {  3,  6, "vclk-gate",	NULL,	 0 },	/* Video Capture */
-	[ASPEED_CLK_GATE_BCLK]		= {  4,  8, "bclk-gate",	"bclk",	 0 }, /* PCIe/PCI */
+	[ASPEED_CLK_GATE_BCLK]		= {  4,  8, "bclk-gate",	"bclk",	 CLK_IS_CRITICAL }, /* PCIe/PCI */
 	/* From dpll */
 	[ASPEED_CLK_GATE_DCLK]		= {  5, -1, "dclk-gate",	NULL,	 CLK_IS_CRITICAL }, /* DAC */
 	[ASPEED_CLK_GATE_REF0CLK]	= {  6, -1, "ref0clk-gate",	"clkin", CLK_IS_CRITICAL },
-- 
2.17.1

