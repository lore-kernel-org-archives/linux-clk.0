Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30134C43610
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0213820861
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0213820861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502983AbeKWU2Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 15:28:25 -0500
Received: from mail.bootlin.com ([62.4.15.54]:52885 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409178AbeKWU2Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Nov 2018 15:28:24 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 0539A207BB; Fri, 23 Nov 2018 10:44:52 +0100 (CET)
Received: from localhost.localdomain (aaubervilliers-681-1-94-205.w90-88.abo.wanadoo.fr [90.88.35.205])
        by mail.bootlin.com (Postfix) with ESMTPSA id A900720711;
        Fri, 23 Nov 2018 10:44:51 +0100 (CET)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/4] clk: mvebu: armada-37xx-periph: change suspend/resume time
Date:   Fri, 23 Nov 2018 10:44:41 +0100
Message-Id: <20181123094444.27956-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Armada 3700 PCIe IP relies on the PCIe clock managed by this
driver. For reasons related to the PCI core's organization when
suspending/resuming, PCI host controller drivers must reconfigure
their register at suspend_noirq()/resume_noirq() which happens after
suspend()/suspend_late() and before resume_early()/resume().

Device link support in the clock framework enforce that the clock
driver's resume() callback will be called before the PCIe
driver's. But, any resume_noirq() callback will be called before all
the registered resume() callbacks.

The solution to support PCIe resume operation is to change the
"priority" of this clock driver PM callbacks to "_noirq()".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 43198fb1efa4..0b4be1ce6f8b 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -713,8 +713,8 @@ static int __maybe_unused armada_3700_periph_clock_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops armada_3700_periph_clock_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
-				armada_3700_periph_clock_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
+				      armada_3700_periph_clock_resume)
 };
 
 static int armada_3700_periph_clock_probe(struct platform_device *pdev)
-- 
2.19.1

