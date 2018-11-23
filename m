Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665E5C04EBA
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2EAF920863
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 09:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EAF920863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502602AbeKWU2Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 15:28:25 -0500
Received: from mail.bootlin.com ([62.4.15.54]:52897 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409180AbeKWU2Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Nov 2018 15:28:24 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 8BF9D20747; Fri, 23 Nov 2018 10:44:52 +0100 (CET)
Received: from localhost.localdomain (aaubervilliers-681-1-94-205.w90-88.abo.wanadoo.fr [90.88.35.205])
        by mail.bootlin.com (Postfix) with ESMTPSA id 3FDD720711;
        Fri, 23 Nov 2018 10:44:52 +0100 (CET)
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
Subject: [PATCH 4/4] dt-bindings: clk: armada3700: document the PCIe clock
Date:   Fri, 23 Nov 2018 10:44:43 +0100
Message-Id: <20181123094444.27956-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a reference to the missing PCIe clock managed by this IP. The
clock resides in the south bridge.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/clock/armada3700-periph-clock.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
index 85972715e593..fbf58c443c04 100644
--- a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
+++ b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
@@ -46,6 +46,7 @@ ID	Clock name	Description
 10	sdio		SDIO
 11	usb32-sub2-sys	USB 2 clock
 12	usb32-ss-sys	USB 3 clock
+13	pcie		PCIe controller
 
 Required properties:
 
-- 
2.19.1

