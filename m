Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C76C0650F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45C4D20856
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfHEKD3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Aug 2019 06:03:29 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37909 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbfHEKD2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 06:03:28 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 38FD360019;
        Mon,  5 Aug 2019 10:03:25 +0000 (UTC)
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
Subject: [PATCH 7/8] clk: mvebu: ap806: Prepare the introduction of AP807 clock support
Date:   Mon,  5 Aug 2019 12:03:09 +0200
Message-Id: <20190805100310.29048-8-miquel.raynal@bootlin.com>
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

Factor out the code that is only useful to AP806 so it will be easier
to support AP807. No functional changes.

Signed-off-by: Ben Peled <bpeled@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 146 +++++++++++---------
 1 file changed, 80 insertions(+), 66 deletions(-)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index bc43adff02e0..c64e2cc4a3ba 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -30,6 +30,78 @@ static struct clk_onecell_data ap806_clk_data = {
 	.clk_num = AP806_CLK_NUM,
 };
 
+static int ap806_get_sar_clocks(unsigned int freq_mode,
+				unsigned int *cpuclk_freq,
+				unsigned int *dclk_freq)
+{
+	switch (freq_mode) {
+	case 0x0:
+		*cpuclk_freq = 2000;
+		*dclk_freq = 600;
+		break;
+	case 0x1:
+		*cpuclk_freq = 2000;
+		*dclk_freq = 525;
+		break;
+	case 0x6:
+		*cpuclk_freq = 1800;
+		*dclk_freq = 600;
+		break;
+	case 0x7:
+		*cpuclk_freq = 1800;
+		*dclk_freq = 525;
+		break;
+	case 0x4:
+		*cpuclk_freq = 1600;
+		*dclk_freq = 400;
+		break;
+	case 0xB:
+		*cpuclk_freq = 1600;
+		*dclk_freq = 450;
+		break;
+	case 0xD:
+		*cpuclk_freq = 1600;
+		*dclk_freq = 525;
+		break;
+	case 0x1a:
+		*cpuclk_freq = 1400;
+		*dclk_freq = 400;
+		break;
+	case 0x14:
+		*cpuclk_freq = 1300;
+		*dclk_freq = 400;
+		break;
+	case 0x17:
+		*cpuclk_freq = 1300;
+		*dclk_freq = 325;
+		break;
+	case 0x19:
+		*cpuclk_freq = 1200;
+		*dclk_freq = 400;
+		break;
+	case 0x13:
+		*cpuclk_freq = 1000;
+		*dclk_freq = 325;
+		break;
+	case 0x1d:
+		*cpuclk_freq = 1000;
+		*dclk_freq = 400;
+		break;
+	case 0x1c:
+		*cpuclk_freq = 800;
+		*dclk_freq = 400;
+		break;
+	case 0x1b:
+		*cpuclk_freq = 600;
+		*dclk_freq = 400;
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
@@ -54,76 +126,18 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	}
 
 	freq_mode = reg & AP806_SAR_CLKFREQ_MODE_MASK;
-	switch (freq_mode) {
-	case 0x0:
-	case 0x1:
-		cpuclk_freq = 2000;
-		break;
-	case 0x6:
-	case 0x7:
-		cpuclk_freq = 1800;
-		break;
-	case 0x4:
-	case 0xB:
-	case 0xD:
-		cpuclk_freq = 1600;
-		break;
-	case 0x1a:
-		cpuclk_freq = 1400;
-		break;
-	case 0x14:
-	case 0x17:
-		cpuclk_freq = 1300;
-		break;
-	case 0x19:
-		cpuclk_freq = 1200;
-		break;
-	case 0x13:
-	case 0x1d:
-		cpuclk_freq = 1000;
-		break;
-	case 0x1c:
-		cpuclk_freq = 800;
-		break;
-	case 0x1b:
-		cpuclk_freq = 600;
-		break;
-	default:
-		dev_err(dev, "invalid Sample at Reset value\n");
+
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "marvell,ap806-clock")) {
+		ret = ap806_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
+	} else {
+		dev_err(dev, "compatible not supported\n");
 		return -EINVAL;
 	}
 
-	/* Get DCLK frequency (DCLK = DDR_CLK / 2) */
-	switch (freq_mode) {
-	case 0x0:
-	case 0x6:
-		/* DDR_CLK = 1200Mhz */
-		dclk_freq = 600;
-		break;
-	case 0x1:
-	case 0x7:
-	case 0xD:
-		/* DDR_CLK = 1050Mhz */
-		dclk_freq = 525;
-		break;
-	case 0x13:
-	case 0x17:
-		/* DDR_CLK = 650Mhz */
-		dclk_freq = 325;
-		break;
-	case 0x4:
-	case 0x14:
-	case 0x19:
-	case 0x1A:
-	case 0x1B:
-	case 0x1C:
-	case 0x1D:
-		/* DDR_CLK = 800Mhz */
-		dclk_freq = 400;
-		break;
-	default:
-		dclk_freq = 0;
+	if (ret) {
 		dev_err(dev, "invalid Sample at Reset value\n");
+		return ret;
 	}
 
 	/* Convert to hertz */
-- 
2.20.1

