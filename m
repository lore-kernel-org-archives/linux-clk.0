Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAF1C18DF5
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 065B720685
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 065B720685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409182AbeKWU2Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 15:28:24 -0500
Received: from mail.bootlin.com ([62.4.15.54]:52879 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409177AbeKWU2X (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Nov 2018 15:28:23 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id B20CC207B0; Fri, 23 Nov 2018 10:44:51 +0100 (CET)
Received: from localhost.localdomain (aaubervilliers-681-1-94-205.w90-88.abo.wanadoo.fr [90.88.35.205])
        by mail.bootlin.com (Postfix) with ESMTPSA id 6519520741;
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
Subject: [PATCH 1/4] clk: mvebu: armada-37xx-periph: add PCIe gated clock
Date:   Fri, 23 Nov 2018 10:44:40 +0100
Message-Id: <20181123094444.27956-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PCIe clock is a gated clock which has the same source as GbE0
(both IPs share a set of registers). This source clock is called
'gbe_core' in the driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 1f1cff428d78..43198fb1efa4 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -302,6 +302,7 @@ PERIPH_CLK_GATE_DIV(gbe_bm, 12, DIV_SEL1, 0, clk_table1);
 PERIPH_CLK_FULL_DD(sdio, 11, 14, DIV_SEL0, DIV_SEL0, 3, 6);
 PERIPH_CLK_FULL_DD(usb32_usb2_sys, 16, 16, DIV_SEL0, DIV_SEL0, 9, 12);
 PERIPH_CLK_FULL_DD(usb32_ss_sys, 17, 18, DIV_SEL0, DIV_SEL0, 15, 18);
+static PERIPH_GATE(pcie, 14);
 
 static struct clk_periph_data data_sb[] = {
 	REF_CLK_MUX_DD(gbe_50),
@@ -317,6 +318,7 @@ static struct clk_periph_data data_sb[] = {
 	REF_CLK_FULL_DD(sdio),
 	REF_CLK_FULL_DD(usb32_usb2_sys),
 	REF_CLK_FULL_DD(usb32_ss_sys),
+	REF_CLK_GATE(pcie, "gbe_core"),
 	{ },
 };
 
-- 
2.19.1

