Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57246C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 15:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DDBF61056
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 15:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbhJOPC6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 11:02:58 -0400
Received: from foss.arm.com ([217.140.110.172]:44408 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240636AbhJOPC5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Oct 2021 11:02:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A24FD6E;
        Fri, 15 Oct 2021 08:00:51 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 43B6F3F66F;
        Fri, 15 Oct 2021 08:00:50 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-clk@vger.kernel.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: Drop unused COMMON_CLK_STM32MP157_SCMI config
Date:   Fri, 15 Oct 2021 16:00:43 +0100
Message-Id: <20211015150043.140793-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 21e743300dd0 ("clk: stm32mp1: new compatible for secure RCC support")
introduced a new Kconfig option COMMON_CLK_STM32MP157_SCMI which is not
used anywhere.

Further, it looks like this Kconfig option is just to select bunch of other
options which doesn't sound correct to me. There is no need for another
SCMI firmware based clock driver and hence the same applies for the config
option too.

Let us just drop the unused COMMON_CLK_STM32MP157_SCMI before it gives
someone idea to write a specific clock driver for this SoC/platform.

Cc: Etienne Carriere <etienne.carriere@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/clk/Kconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c5b3dc97396a..b64058d1af2d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -339,16 +339,6 @@ config COMMON_CLK_STM32MP157
 	help
 	  Support for stm32mp157 SoC family clocks
 
-config COMMON_CLK_STM32MP157_SCMI
-	bool "stm32mp157 Clock driver with Trusted Firmware"
-	depends on COMMON_CLK_STM32MP157
-	select COMMON_CLK_SCMI
-	select ARM_SCMI_PROTOCOL
-	default y
-	help
-	  Support for stm32mp157 SoC family clocks with Trusted Firmware using
-	  SCMI protocol.
-
 config COMMON_CLK_STM32F
 	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
 	help
-- 
2.25.1

