Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E3DEB64D7
	for <linux-clk@archiver.kernel.org>; Wed, 21 Jun 2023 09:51:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbjFUJvN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Jun 2023 05:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbjFUJux (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2023 05:50:53 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 21 Jun 2023 02:49:04 PDT
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297121FC9;
        Wed, 21 Jun 2023 02:49:04 -0700 (PDT)
Received: from DylanHung-PC.aspeed.com (192.168.2.216) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 21 Jun
 2023 17:45:54 +0800
From:   Dylan Hung <dylan_hung@aspeedtech.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <BMC-SW@aspeedtech.com>
Subject: [PATCH] dt-bindings: clock: ast2600: Add I3C and MAC reset definitions
Date:   Wed, 21 Jun 2023 17:45:45 +0800
Message-ID: <20230621094545.707-1-dylan_hung@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.216]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add reset definitions of AST2600 I3C and MAC controllers.

Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
---
 include/dt-bindings/clock/ast2600-clock.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index e149eee61588..07377589f8f4 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -90,7 +90,18 @@
 /* Only list resets here that are not part of a clock gate + reset pair */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
-#define ASPEED_RESET_I3C_DMA		39
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
+
 #define ASPEED_RESET_PWM		37
 #define ASPEED_RESET_PECI		36
 #define ASPEED_RESET_MII		35
-- 
2.25.1

