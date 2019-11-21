Return-Path: <SRS0=UbEh=ZN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51E7C432C0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Nov 2019 13:52:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8876420679
	for <linux-clk@archiver.kernel.org>; Thu, 21 Nov 2019 13:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUNwX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Nov 2019 08:52:23 -0500
Received: from inva020.nxp.com ([92.121.34.13]:39132 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbfKUNwX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Nov 2019 08:52:23 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5C05D1A061D;
        Thu, 21 Nov 2019 14:52:20 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F6841A0615;
        Thu, 21 Nov 2019 14:52:20 +0100 (CET)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id B9BF3203C8;
        Thu, 21 Nov 2019 14:52:19 +0100 (CET)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacky Bai <ping.bai@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx8m: Suppress bind attrs
Date:   Thu, 21 Nov 2019 15:52:17 +0200
Message-Id: <ce34606bb3876f7506f483db7623fcba6da04810.1574344160.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock drivers on imx8m series are registered as platform devices and
this opens the possibility of reloading the driver at runtime.

This doesn't actually work: clocks are never removed and attempting to
bind again results in registration errors and a crash. Almost all
devices depend on clocks anyway so rebinding is unlikely to ever be
useful

Fix this by explicitly suppressing bind attrs like several other
clock drivers.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---
No cc: stable because because there are likely many other opportunities
to crash the system by echoing random stuff in sysfs as root.

Changes since v1:
* Add source comments as well
Link to v1: https://patchwork.kernel.org/patch/11250389/

 drivers/clk/imx/clk-imx8mm.c | 5 +++++
 drivers/clk/imx/clk-imx8mn.c | 5 +++++
 drivers/clk/imx/clk-imx8mq.c | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 030b15d7c0ce..ed3ce492151c 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -614,9 +614,14 @@ MODULE_DEVICE_TABLE(of, imx8mm_clk_of_match);
 
 static struct platform_driver imx8mm_clk_driver = {
 	.probe = imx8mm_clocks_probe,
 	.driver = {
 		.name = "imx8mm-ccm",
+		/*
+		 * Disable bind attributes: clocks are not removed and
+		 * reloading the driver will crash or break devices.
+		 */
+		.suppress_bind_attrs = true,
 		.of_match_table = of_match_ptr(imx8mm_clk_of_match),
 	},
 };
 module_platform_driver(imx8mm_clk_driver);
diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 9f5a5a56b45e..d95e282ff1fb 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -570,9 +570,14 @@ MODULE_DEVICE_TABLE(of, imx8mn_clk_of_match);
 
 static struct platform_driver imx8mn_clk_driver = {
 	.probe = imx8mn_clocks_probe,
 	.driver = {
 		.name = "imx8mn-ccm",
+		/*
+		 * Disable bind attributes: clocks are not removed and
+		 * reloading the driver will crash or break devices.
+		 */
+		.suppress_bind_attrs = true,
 		.of_match_table = of_match_ptr(imx8mn_clk_of_match),
 	},
 };
 module_platform_driver(imx8mn_clk_driver);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index 5f10a606d836..2168fe6cf7e4 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -607,9 +607,14 @@ MODULE_DEVICE_TABLE(of, imx8mq_clk_of_match);
 
 static struct platform_driver imx8mq_clk_driver = {
 	.probe = imx8mq_clocks_probe,
 	.driver = {
 		.name = "imx8mq-ccm",
+		/*
+		 * Disable bind attributes: clocks are not removed and
+		 * reloading the driver will crash or break devices.
+		 */
+		.suppress_bind_attrs = true,
 		.of_match_table = of_match_ptr(imx8mq_clk_of_match),
 	},
 };
 module_platform_driver(imx8mq_clk_driver);
-- 
2.17.1

