Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75774C32751
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 577B3214C6
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfHEKD0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Aug 2019 06:03:26 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52765 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfHEKD0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 06:03:26 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CD5B860008;
        Mon,  5 Aug 2019 10:03:22 +0000 (UTC)
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
        Omri Itach <omrii@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 6/8] clk: mvebu: ap806: add AP-DCLK (hclk) to system controller driver
Date:   Mon,  5 Aug 2019 12:03:08 +0200
Message-Id: <20190805100310.29048-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Omri Itach <omrii@marvell.com>

Add dynamic AP-DCLK clock (hclk) to system controller driver. AP-DCLK
is half the rate of DDR clock, so its derrived from Sample At Reset
configuration. The clock frequency is required for AP806 AXI monitor
profiling feature.

Signed-off-by: Omri Itach <omrii@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 48 ++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 2cf874f01394..bc43adff02e0 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -21,7 +21,7 @@
 #define AP806_SAR_REG			0x400
 #define AP806_SAR_CLKFREQ_MODE_MASK	0x1f
 
-#define AP806_CLK_NUM			5
+#define AP806_CLK_NUM			6
 
 static struct clk *ap806_clks[AP806_CLK_NUM];
 
@@ -33,7 +33,7 @@ static struct clk_onecell_data ap806_clk_data = {
 static int ap806_syscon_common_probe(struct platform_device *pdev,
 				     struct device_node *syscon_node)
 {
-	unsigned int freq_mode, cpuclk_freq;
+	unsigned int freq_mode, cpuclk_freq, dclk_freq;
 	const char *name, *fixedclk_name;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -93,8 +93,42 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	/* Get DCLK frequency (DCLK = DDR_CLK / 2) */
+	switch (freq_mode) {
+	case 0x0:
+	case 0x6:
+		/* DDR_CLK = 1200Mhz */
+		dclk_freq = 600;
+		break;
+	case 0x1:
+	case 0x7:
+	case 0xD:
+		/* DDR_CLK = 1050Mhz */
+		dclk_freq = 525;
+		break;
+	case 0x13:
+	case 0x17:
+		/* DDR_CLK = 650Mhz */
+		dclk_freq = 325;
+		break;
+	case 0x4:
+	case 0x14:
+	case 0x19:
+	case 0x1A:
+	case 0x1B:
+	case 0x1C:
+	case 0x1D:
+		/* DDR_CLK = 800Mhz */
+		dclk_freq = 400;
+		break;
+	default:
+		dclk_freq = 0;
+		dev_err(dev, "invalid Sample at Reset value\n");
+	}
+
 	/* Convert to hertz */
 	cpuclk_freq *= 1000 * 1000;
+	dclk_freq *= 1000 * 1000;
 
 	/* CPU clocks depend on the Sample At Reset configuration */
 	name = ap_cp_unique_name(dev, syscon_node, "pll-cluster-0");
@@ -141,6 +175,14 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 		goto fail4;
 	}
 
+	/* AP-DCLK(HCLK) Clock is DDR clock divided by 2 */
+	name = ap_cp_unique_name(dev, syscon_node, "ap-dclk");
+	ap806_clks[5] = clk_register_fixed_rate(dev, name, NULL, 0, dclk_freq);
+	if (IS_ERR(ap806_clks[5])) {
+		ret = PTR_ERR(ap806_clks[5]);
+		goto fail5;
+	}
+
 	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &ap806_clk_data);
 	if (ret)
 		goto fail_clk_add;
@@ -148,6 +190,8 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	return 0;
 
 fail_clk_add:
+	clk_unregister_fixed_factor(ap806_clks[5]);
+fail5:
 	clk_unregister_fixed_factor(ap806_clks[4]);
 fail4:
 	clk_unregister_fixed_factor(ap806_clks[3]);
-- 
2.20.1

