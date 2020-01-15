Return-Path: <SRS0=l8GQ=3E=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72021C32771
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 21:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46FA72081E
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jan 2020 21:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgAOVZh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jan 2020 16:25:37 -0500
Received: from mga09.intel.com ([134.134.136.24]:63375 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726501AbgAOVZg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 15 Jan 2020 16:25:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 13:25:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; 
   d="scan'208";a="213841148"
Received: from maru.jf.intel.com ([10.54.51.77])
  by orsmga007.jf.intel.com with ESMTP; 15 Jan 2020 13:25:36 -0800
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To:     Joel Stanley <joel@jms.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 2/2] clk: ast2600: add critical clock setting logic
Date:   Wed, 15 Jan 2020 13:26:39 -0800
Message-Id: <20200115212639.4998-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This commit adds critical clock setting logic that applies
CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
device tree.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/clk/clk-ast2600.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 392d01705b97..49d89ffdd4be 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -599,8 +599,11 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_g6_gates); i++) {
 		const struct aspeed_gate_data *gd = &aspeed_g6_gates[i];
+		unsigned long flags = gd->flags;
 		u32 gate_flags;
 
+		of_clk_detect_critical(pdev->dev.of_node, i, &flags);
+
 		/*
 		 * Special case: the USB port 1 clock (bit 14) is always
 		 * working the opposite way from the other ones.
@@ -609,7 +612,7 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		hw = aspeed_g6_clk_hw_register_gate(dev,
 				gd->name,
 				gd->parent_name,
-				gd->flags,
+				flags,
 				map,
 				gd->clock_idx,
 				gd->reset_idx,
-- 
2.17.1

