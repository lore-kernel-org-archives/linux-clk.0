Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE738EB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 06:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjGQG7K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 02:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjGQG7J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 02:59:09 -0400
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289B910D7;
        Sun, 16 Jul 2023 23:59:01 -0700 (PDT)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 Jul
 2023 14:59:01 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jul 2023 14:59:01 +0800
From:   Dylan Hung <dylan_hung@aspeedtech.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [PATCH v2] dt-bindings: clock: ast2600: Add I3C and MAC reset definitions
Date:   Mon, 17 Jul 2023 14:58:58 +0800
Message-ID: <20230717065858.1596404-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add reset definitions of AST2600 I3C and MAC controllers.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 include/dt-bindings/clock/ast2600-clock.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index e149eee61588..712782177c90 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -90,7 +90,19 @@
 /* Only list resets here that are not part of a clock gate + reset pair */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
+
+#define ASPEED_RESET_MAC4		53
+#define ASPEED_RESET_MAC3		52
+
+#define ASPEED_RESET_I3C5		45
+#define ASPEED_RESET_I3C4		44
+#define ASPEED_RESET_I3C3		43
+#define ASPEED_RESET_I3C2		42
+#define ASPEED_RESET_I3C1		41
+#define ASPEED_RESET_I3C0		40
+#define ASPEED_RESET_I3C		39
 #define ASPEED_RESET_I3C_DMA		39
+
 #define ASPEED_RESET_PWM		37
 #define ASPEED_RESET_PECI		36
 #define ASPEED_RESET_MII		35
-- 
2.25.1

