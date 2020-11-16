Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109AFC4742C
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:04:01 +0000 (UTC)
Received: from vger.kernel.org (unknown [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD3A52222E
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD3A52222E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgKPHzl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbgKPHzl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2020 02:55:41 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E718C0613D1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2020 23:55:40 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1keZMO-0007YN-0Y; Mon, 16 Nov 2020 08:55:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1keZMM-00GrbP-Tc; Mon, 16 Nov 2020 08:55:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Mon, 16 Nov 2020 08:55:22 +0100
Message-Id: <20201116075532.4019252-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116075532.4019252-1-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 02/12] clk: divider: fix initialization with parent_hw
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If a driver registers a divider clock with a parent_hw instead of the
parent_name, the parent_hw is ignored and the clock does not have a
parent.

Fix this by initializing the parents the same way they are initialized
for clock gates.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/clk/clk-divider.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 8de12cb0c43d..f32157cb4013 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -493,8 +493,13 @@ struct clk_hw *__clk_hw_register_divider(struct device *dev,
 	else
 		init.ops = &clk_divider_ops;
 	init.flags = flags;
-	init.parent_names = (parent_name ? &parent_name: NULL);
-	init.num_parents = (parent_name ? 1 : 0);
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
 
 	/* struct clk_divider assignments */
 	div->reg = reg;
-- 
2.20.1

