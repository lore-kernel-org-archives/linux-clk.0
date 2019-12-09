Return-Path: <SRS0=N9em=Z7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D4FC43603
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 20:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CD37206D5
	for <linux-clk@archiver.kernel.org>; Mon,  9 Dec 2019 20:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfLIU4d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Dec 2019 15:56:33 -0500
Received: from inva020.nxp.com ([92.121.34.13]:56716 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbfLIU4c (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 9 Dec 2019 15:56:32 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ECE971A07D6;
        Mon,  9 Dec 2019 21:56:30 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DF7FB1A0483;
        Mon,  9 Dec 2019 21:56:30 +0100 (CET)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 58578205D0;
        Mon,  9 Dec 2019 21:56:30 +0100 (CET)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: [PATCH] clk: imx8qxp-lpcg: Warn against devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 22:56:28 +0200
Message-Id: <329ac54993d5eb955249d037241a7213faff508f.1575924858.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On imx8 the LPCG nodes map entire subsystems and overlap peripherals,
this means that using devm_platform_ioremap_resource will cause many
devices to fail to probe including serial ports.

Well-meaning but boot-breaking patches were posted multiple times so add
a comment explaining this issue.

Suggested-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index c0aff7ca6374..04c8ee35e14c 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -171,10 +171,21 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 
 	ss_lpcg = of_device_get_match_data(dev);
 	if (!ss_lpcg)
 		return -ENODEV;
 
+	/*
+	 * Please don't replace this with devm_platform_ioremap_resource.
+	 *
+	 * devm_platform_ioremap_resource calls devm_ioremap_resource which
+	 * differs from devm_ioremap by also calling devm_request_mem_region
+	 * and preventing other mappings in the same area.
+	 *
+	 * On imx8 the LPCG nodes map entire subsystems and overlap
+	 * peripherals, this means that using devm_platform_ioremap_resource
+	 * will cause many devices to fail to probe including serial ports.
+	 */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -EINVAL;
 	base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!base)
-- 
2.17.1

