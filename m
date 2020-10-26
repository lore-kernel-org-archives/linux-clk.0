Return-Path: <SRS0=xpy6=EB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F655C4363A
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 11:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B0B621BE5
	for <linux-clk@archiver.kernel.org>; Mon, 26 Oct 2020 11:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772263AbgJZLRb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Oct 2020 07:17:31 -0400
Received: from foss.arm.com ([217.140.110.172]:35782 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1771658AbgJZLR3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Oct 2020 07:17:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FA69101E;
        Mon, 26 Oct 2020 04:17:28 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CF623F719;
        Mon, 26 Oct 2020 04:17:27 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, zhangqing@rock-chips.com
Subject: [PATCH] clk: rockchip: Add appropriate arch dependencies
Date:   Mon, 26 Oct 2020 11:17:20 +0000
Message-Id: <72abb0f794b8ed77e274e8ee21c22e0bd3223dfd.1603710913.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There's no point offering support for 32-bit platforms to users
configuring a 64-bit kernel - and vice-versa - unless they are
explicitly interested in compile-testing.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/clk/rockchip/Kconfig | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 47cd6c5de837..effd05032e85 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -11,67 +11,77 @@ config COMMON_CLK_ROCKCHIP
 if COMMON_CLK_ROCKCHIP
 config CLK_PX30
 	bool "Rockchip PX30 clock controller support"
+	depends on (ARM64 || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for PX30 Clock Driver.
 
 config CLK_RV110X
 	bool "Rockchip RV110x clock controller support"
+	depends on (ARM || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RV110x Clock Driver.
 
 config CLK_RK3036
 	bool "Rockchip RK3036 clock controller support"
+	depends on (ARM || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK3036 Clock Driver.
 
 config CLK_RK312X
 	bool "Rockchip RK312x clock controller support"
+	depends on (ARM || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK312x Clock Driver.
 
 config CLK_RK3188
 	bool "Rockchip RK3188 clock controller support"
+	depends on (ARM || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK3188 Clock Driver.
 
 config CLK_RK322X
 	bool "Rockchip RK322x clock controller support"
+	depends on (ARM || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK322x Clock Driver.
 
 config CLK_RK3288
 	bool "Rockchip RK3288 clock controller support"
-	depends on ARM
+	depends on (ARM || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK3288 Clock Driver.
 
 config CLK_RK3308
 	bool "Rockchip RK3308 clock controller support"
+	depends on (ARM64 || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK3308 Clock Driver.
 
 config CLK_RK3328
 	bool "Rockchip RK3328 clock controller support"
+	depends on (ARM64 || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK3328 Clock Driver.
 
 config CLK_RK3368
 	bool "Rockchip RK3368 clock controller support"
+	depends on (ARM64 || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK3368 Clock Driver.
 
 config CLK_RK3399
 	tristate "Rockchip RK3399 clock controller support"
+	depends on (ARM64 || COMPILE_TEST)
 	default y
 	help
 	  Build the driver for RK3399 Clock Driver.
-- 
2.28.0.dirty

