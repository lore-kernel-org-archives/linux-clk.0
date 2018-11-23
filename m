Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F63C04EBC
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE07B20865
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE07B20865
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394498AbeKWU2Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 15:28:25 -0500
Received: from mail.bootlin.com ([62.4.15.54]:52891 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409179AbeKWU2Z (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Nov 2018 15:28:25 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 48DA920D29; Fri, 23 Nov 2018 10:44:52 +0100 (CET)
Received: from localhost.localdomain (aaubervilliers-681-1-94-205.w90-88.abo.wanadoo.fr [90.88.35.205])
        by mail.bootlin.com (Postfix) with ESMTPSA id EC66420741;
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
Subject: [PATCH 3/4] dt-bindings: clk: armada3700: fix typo in SoC name
Date:   Fri, 23 Nov 2018 10:44:42 +0100
Message-Id: <20181123094444.27956-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This documentation is about Armada 3700 SoCs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/clock/armada3700-periph-clock.txt     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
index 1e3370ba189f..85972715e593 100644
--- a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
+++ b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
@@ -9,7 +9,7 @@ bridge.
 The peripheral clock consumer should specify the desired clock by
 having the clock ID in its "clocks" phandle cell.
 
-The following is a list of provided IDs for Armada 370 North bridge clocks:
+The following is a list of provided IDs for Armada 3700 North bridge clocks:
 ID	Clock name	Description
 -----------------------------------
 0	mmc		MMC controller
@@ -30,7 +30,7 @@ ID	Clock name	Description
 15	eip97		EIP 97
 16	cpu		CPU
 
-The following is a list of provided IDs for Armada 370 South bridge clocks:
+The following is a list of provided IDs for Armada 3700 South bridge clocks:
 ID	Clock name	Description
 -----------------------------------
 0	gbe-50		50 MHz parent clock for Gigabit Ethernet
-- 
2.19.1

