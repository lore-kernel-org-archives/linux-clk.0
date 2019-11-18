Return-Path: <SRS0=lcQO=ZK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A182DC432C0
	for <linux-clk@archiver.kernel.org>; Mon, 18 Nov 2019 22:28:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76DB622309
	for <linux-clk@archiver.kernel.org>; Mon, 18 Nov 2019 22:28:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfKRW2X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Nov 2019 17:28:23 -0500
Received: from inva020.nxp.com ([92.121.34.13]:44784 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbfKRW2X (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Nov 2019 17:28:23 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CBC011A03CE;
        Mon, 18 Nov 2019 23:28:20 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BED411A012D;
        Mon, 18 Nov 2019 23:28:20 +0100 (CET)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 3F13F20396;
        Mon, 18 Nov 2019 23:28:20 +0100 (CET)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH] clk: imx8m: Suppress bind attrs
Date:   Tue, 19 Nov 2019 00:28:16 +0200
Message-Id: <9f2ac65bab203a943de947465d6534980585e144.1574116045.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock drivers on imx8m series are registered as platform devices and
this opens the possibility of reloading the driver at runtime:

This doesn't actually work: clocks are never removed and attempting to
bind again results in registration errors and a crash.

Fix this by explicitly suppressing bind attrs like several other
drivers.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

---
No cc: stable because because there are likely many other opportunities
to crash the system by echoing random stuff in sysfs as root.

 drivers/clk/imx/clk-imx8mm.c | 1 +
 drivers/clk/imx/clk-imx8mn.c | 1 +
 drivers/clk/imx/clk-imx8mq.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 9246e89bb5fd..3cb75ad4270d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -619,9 +619,10 @@ MODULE_DEVICE_TABLE(of, imx8mm_clk_of_match);
 
 static struct platform_driver imx8mm_clk_driver = {
 	.probe = imx8mm_clocks_probe,
 	.driver = {
 		.name = "imx8mm-ccm",
+		.suppress_bind_attrs = true,
 		.of_match_table = of_match_ptr(imx8mm_clk_of_match),
 	},
 };
 module_platform_driver(imx8mm_clk_driver);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 4749beab9fc8..d16530430ac2 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -576,9 +576,10 @@ MODULE_DEVICE_TABLE(of, imx8mn_clk_of_match);
 
 static struct platform_driver imx8mn_clk_driver = {
 	.probe = imx8mn_clocks_probe,
 	.driver = {
 		.name = "imx8mn-ccm",
+		.suppress_bind_attrs = true,
 		.of_match_table = of_match_ptr(imx8mn_clk_of_match),
 	},
 };
 module_platform_driver(imx8mn_clk_driver);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index c8ab86fcba7c..0e0f69e881bd 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -611,9 +611,10 @@ MODULE_DEVICE_TABLE(of, imx8mq_clk_of_match);
 
 static struct platform_driver imx8mq_clk_driver = {
 	.probe = imx8mq_clocks_probe,
 	.driver = {
 		.name = "imx8mq-ccm",
+		.suppress_bind_attrs = true,
 		.of_match_table = of_match_ptr(imx8mq_clk_of_match),
 	},
 };
 module_platform_driver(imx8mq_clk_driver);
-- 
2.17.1

