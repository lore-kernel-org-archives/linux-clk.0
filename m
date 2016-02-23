Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55696 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756615AbcBWA5k (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 22 Feb 2016 19:57:40 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] clk: shmobile: Remove ARCH_SHMOBILE_MULTI
Date: Tue, 23 Feb 2016 09:57:31 +0900
Message-Id: <1456189051-519-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

As of 9b5ba0df4ea4 ("ARM: shmobile: Introduce ARCH_RENESAS") all platforms
that use Renesas clock drivers now select ARCH_RENESAS. As it is present in
drivers/clk/Makefile ARCH_SHMOBILE_MULTI may now be removed.

This is part of an ongoing process to migrate from ARCH_SHMOBILE to
ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/clk/Makefile | 1 -
 1 file changed, 1 deletion(-)

 Based on clk-next

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index bae4be6501df..b19af449d2f3 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -70,7 +70,6 @@ obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
-obj-$(CONFIG_ARCH_SHMOBILE_MULTI)	+= shmobile/
 obj-$(CONFIG_ARCH_RENESAS)		+= shmobile/
 obj-$(CONFIG_ARCH_SIRF)			+= sirf/
 obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
-- 
2.1.4

