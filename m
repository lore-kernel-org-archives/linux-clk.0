Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9F9C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 11:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F7264E61
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 11:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhCOLZd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Mar 2021 07:25:33 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33738 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229536AbhCOLZR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 15 Mar 2021 07:25:17 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lLlLT-0007LD-Md; Mon, 15 Mar 2021 12:25:11 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, zhangqing@rock-chips.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 1/2] clk: rockchip: drop parenthesis from ARM || COMPILE_TEST depends
Date:   Mon, 15 Mar 2021 12:25:01 +0100
Message-Id: <20210315112502.343699-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As suggested by Stephen in the series adding the rk3568 clock controller
the depends works just as well without the parenthesis around the depends.

So to make everything look the same, drop them from existing entries too.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index effd05032e85..067aacec96db 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -11,77 +11,77 @@ config COMMON_CLK_ROCKCHIP
 if COMMON_CLK_ROCKCHIP
 config CLK_PX30
 	bool "Rockchip PX30 clock controller support"
-	depends on (ARM64 || COMPILE_TEST)
+	depends on ARM64 || COMPILE_TEST
 	default y
 	help
 	  Build the driver for PX30 Clock Driver.
 
 config CLK_RV110X
 	bool "Rockchip RV110x clock controller support"
-	depends on (ARM || COMPILE_TEST)
+	depends on ARM || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RV110x Clock Driver.
 
 config CLK_RK3036
 	bool "Rockchip RK3036 clock controller support"
-	depends on (ARM || COMPILE_TEST)
+	depends on ARM || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3036 Clock Driver.
 
 config CLK_RK312X
 	bool "Rockchip RK312x clock controller support"
-	depends on (ARM || COMPILE_TEST)
+	depends on ARM || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK312x Clock Driver.
 
 config CLK_RK3188
 	bool "Rockchip RK3188 clock controller support"
-	depends on (ARM || COMPILE_TEST)
+	depends on ARM || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3188 Clock Driver.
 
 config CLK_RK322X
 	bool "Rockchip RK322x clock controller support"
-	depends on (ARM || COMPILE_TEST)
+	depends on ARM || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK322x Clock Driver.
 
 config CLK_RK3288
 	bool "Rockchip RK3288 clock controller support"
-	depends on (ARM || COMPILE_TEST)
+	depends on ARM || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3288 Clock Driver.
 
 config CLK_RK3308
 	bool "Rockchip RK3308 clock controller support"
-	depends on (ARM64 || COMPILE_TEST)
+	depends on ARM64 || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3308 Clock Driver.
 
 config CLK_RK3328
 	bool "Rockchip RK3328 clock controller support"
-	depends on (ARM64 || COMPILE_TEST)
+	depends on ARM64 || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3328 Clock Driver.
 
 config CLK_RK3368
 	bool "Rockchip RK3368 clock controller support"
-	depends on (ARM64 || COMPILE_TEST)
+	depends on ARM64 || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3368 Clock Driver.
 
 config CLK_RK3399
 	tristate "Rockchip RK3399 clock controller support"
-	depends on (ARM64 || COMPILE_TEST)
+	depends on ARM64 || COMPILE_TEST
 	default y
 	help
 	  Build the driver for RK3399 Clock Driver.
-- 
2.29.2

