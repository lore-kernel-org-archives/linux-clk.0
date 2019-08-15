Return-Path: <SRS0=fX0Q=WL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32000C41514
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 07:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 081462084D
	for <linux-clk@archiver.kernel.org>; Thu, 15 Aug 2019 07:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbfHOHqU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Aug 2019 03:46:20 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52613 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfHOHqU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Aug 2019 03:46:20 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hyASf-000129-5D; Thu, 15 Aug 2019 09:46:17 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hyASe-0008Ey-Fd; Thu, 15 Aug 2019 09:46:16 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, kernel@pengutronix.de,
        linux-clk@vger.kernel.org,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] dt-bindings: clk: Make example a bit clearer
Date:   Thu, 15 Aug 2019 09:46:04 +0200
Message-Id: <20190815074604.5416-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Previously the example used <&pll 2> in two places which made it harder
than necessary to understand why this clock gets the parent of
<&clkcon 0>.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 Documentation/devicetree/bindings/clock/clock-bindings.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index b646bbcf7f92..30aa63a2eecb 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -154,11 +154,11 @@ set to 0, or can be omitted if it is not followed by any non-zero entry.
         clock-names = "baud", "register";
 
         assigned-clocks = <&clkcon 0>, <&pll 2>;
-        assigned-clock-parents = <&pll 2>;
+        assigned-clock-parents = <&pll 1>;
         assigned-clock-rates = <0>, <460800>;
     };
 
-In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> and
+In this example the <&pll 1> clock is set as parent of clock <&clkcon 0> and
 the <&pll 2> clock is assigned a frequency value of 460800 Hz.
 
 Configuring a clock's parent and rate through the device node that consumes
-- 
2.20.1

