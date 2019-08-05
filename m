Return-Path: <SRS0=R3Mk=WB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA149C0650F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90D722147A
	for <linux-clk@archiver.kernel.org>; Mon,  5 Aug 2019 10:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfHEKDT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Aug 2019 06:03:19 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:57665 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKDT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Aug 2019 06:03:19 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6072C60005;
        Mon,  5 Aug 2019 10:03:16 +0000 (UTC)
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
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/8] dt-bindings: ap806: Document AP807 clock compatible
Date:   Mon,  5 Aug 2019 12:03:04 +0200
Message-Id: <20190805100310.29048-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add AP807 clock compatible to the bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/arm/marvell/ap806-system-controller.txt      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
index 59b6b992fbc9..26410fbb85be 100644
--- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
@@ -18,8 +18,8 @@ Clocks:
 -------
 
 
-The Device Tree node representing the AP806 system controller provides
-a number of clocks:
+The Device Tree node representing the AP806/AP807 system controller
+provides a number of clocks:
 
  - 0: reference clock of CPU cluster 0
  - 1: reference clock of CPU cluster 1
@@ -28,7 +28,9 @@ a number of clocks:
 
 Required properties:
 
- - compatible: must be: "marvell,ap806-clock"
+ - compatible: must be one of:
+   * "marvell,ap806-clock"
+   * "marvell,ap807-clock"
  - #clock-cells: must be set to 1
 
 Pinctrl:
-- 
2.20.1

