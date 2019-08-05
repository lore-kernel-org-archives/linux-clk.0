Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BDFC0650F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F59E20856
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfHEKDa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Aug 2019 06:03:30 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44065 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbfHEKD3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 06:03:29 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BBCC36000C;
        Mon,  5 Aug 2019 10:03:26 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Ben Peled <bpeled@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 8/8] clk: mvebu: ap80x: add AP807 clock support
Date:   Mon,  5 Aug 2019 12:03:10 +0200
Message-Id: <20190805100310.29048-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Ben Peled <bpeled@marvell.com>

Add driver support for AP807 clock.

Signed-off-by: Ben Peled <bpeled@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index c64e2cc4a3ba..948bd1e71aea 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -102,6 +102,30 @@ static int ap806_get_sar_clocks(unsigned int freq_mode,
 	return 0;
 }
 
+static int ap807_get_sar_clocks(unsigned int freq_mode,
+				unsigned int *cpuclk_freq,
+				unsigned int *dclk_freq)
+{
+	switch (freq_mode) {
+	case 0x0:
+		*cpuclk_freq = 2000;
+		*dclk_freq = 1200;
+		break;
+	case 0x6:
+		*cpuclk_freq = 2200;
+		*dclk_freq = 1200;
+		break;
+	case 0xD:
+		*cpuclk_freq = 1600;
+		*dclk_freq = 1200;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ap806_syscon_common_probe(struct platform_device *pdev,
 				     struct device_node *syscon_node)
 {
@@ -130,6 +154,9 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "marvell,ap806-clock")) {
 		ret = ap806_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
+	} else if (of_device_is_compatible(pdev->dev.of_node,
+					   "marvell,ap807-clock")) {
+		ret = ap807_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
 	} else {
 		dev_err(dev, "compatible not supported\n");
 		return -EINVAL;
@@ -252,6 +279,7 @@ builtin_platform_driver(ap806_syscon_legacy_driver);
 
 static const struct of_device_id ap806_clock_of_match[] = {
 	{ .compatible = "marvell,ap806-clock", },
+	{ .compatible = "marvell,ap807-clock", },
 	{ }
 };
 
-- 
2.20.1

