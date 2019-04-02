Return-Path: <SRS0=qU15=SE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01171C4360F
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 12:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC760206B8
	for <linux-clk@archiver.kernel.org>; Tue,  2 Apr 2019 12:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbfDBMlE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Apr 2019 08:41:04 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:49485 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730317AbfDBMk0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Apr 2019 08:40:26 -0400
Received: from localhost (alyon-652-1-60-19.w109-213.abo.wanadoo.fr [109.213.83.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0B69D100012;
        Tue,  2 Apr 2019 12:40:23 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] dt-bindings: clk: at91: add bindings for SAM9X60's slow clock controller
Date:   Tue,  2 Apr 2019 14:40:09 +0200
Message-Id: <20190402124016.20558-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190402124016.20558-1-alexandre.belloni@bootlin.com>
References: <20190402124016.20558-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add bindings for SAM9X60's slow clock controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/clock/at91-clock.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
index e9f70fcdfe80..ce1d21102428 100644
--- a/Documentation/devicetree/bindings/clock/at91-clock.txt
+++ b/Documentation/devicetree/bindings/clock/at91-clock.txt
@@ -9,7 +9,8 @@ Slow Clock controller:
 Required properties:
 - compatible : shall be one of the following:
 	"atmel,at91sam9x5-sckc" or
-	"atmel,sama5d4-sckc":
+	"atmel,sama5d4-sckc" or
+	"microchip,sam9x60-sckc":
 		at91 SCKC (Slow Clock Controller)
 		This node contains the slow clock definitions.
 
-- 
2.20.1

