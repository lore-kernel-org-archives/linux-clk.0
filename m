Return-Path: <SRS0=Qq/y=WT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EFFC3A5A2
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 10:03:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3304722CE3
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 10:03:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391688AbfHWKDY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Aug 2019 06:03:24 -0400
Received: from mail.thorsis.com ([92.198.35.195]:35305 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729716AbfHWKDY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Aug 2019 06:03:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 9CA55F6B
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2019 12:04:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MQTGVtlaHhww for <linux-clk@vger.kernel.org>;
        Fri, 23 Aug 2019 12:04:21 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 62B444965; Fri, 23 Aug 2019 12:04:21 +0200 (CEST)
Received: from adahl by ada.ifak-system.com with local (Exim 4.89)
        (envelope-from <ada@thorsis.com>)
        id 1i16Pb-0000ZN-VJ; Fri, 23 Aug 2019 12:03:15 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, kernel@pengutronix.de,
        linux-clk@vger.kernel.org
Subject: [PATCH v2] dt-bindings: clk: Make example a bit clearer
Date:   Fri, 23 Aug 2019 12:03:15 +0200
Message-Id: <20190823100315.2148-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Previously the example used <&pll 2> in two places which made it harder
than necessary to understand why this clock gets the parent of
<&clkcon 0>. Also describe why <&pll 2> isn't reparented and <&clkcon 0>
gets no rate assigned.

Co-authored-by: Alexander Dahl <ada@thorsis.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
        Add additional explaining text to following paragraph and strip mail
        headers from commit message.

 .../devicetree/bindings/clock/clock-bindings.txt     | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index b646bbcf7f92..1d4942380918 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not followed by any non-zero entry.
         compatible = "fsl,imx-uart";
         reg = <0xa000 0x1000>;
         ...
-        clocks = <&osc 0>, <&pll 1>;
-        clock-names = "baud", "register";
+        clocks = ...
+        clock-names = ...
 
         assigned-clocks = <&clkcon 0>, <&pll 2>;
-        assigned-clock-parents = <&pll 2>;
+        assigned-clock-parents = <&pll 1>;
         assigned-clock-rates = <0>, <460800>;
     };
 
-In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> and
-the <&pll 2> clock is assigned a frequency value of 460800 Hz.
+In this example the <&pll 1> clock is set as parent of clock <&clkcon 0> and
+the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A parent
+setting for <&pll 2> is omitted (end of list) and rate setting for <&clkcon 0>
+is skipped because set to <0>.
 
 Configuring a clock's parent and rate through the device node that consumes
 the clock can be done only for clocks that have a single user. Specifying
-- 
2.20.1

