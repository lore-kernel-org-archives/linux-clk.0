Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC41EC4167B
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 23:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9066C2245C
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 23:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgLCXIn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 18:08:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:33930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbgLCXIn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Dec 2020 18:08:43 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Anson Huang <Anson.Huang@nxp.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: fix build failure on i.MX SCU clk
Date:   Fri,  4 Dec 2020 00:07:52 +0100
Message-Id: <20201203230756.1481397-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_MXC_CLK_SCU is enabled, but CONFIG_CLK_IMX8QXP is not,
the kernel fails to link with:

aarch64-linux-ld: no input files
make[5]: *** [scripts/Makefile.build:434: drivers/clk/imx/clk-imx-scu.o] Error 1
aarch64-linux-ld: no input files
make[5]: *** [scripts/Makefile.build:434: drivers/clk/imx/clk-imx-lpcg-scu.o] Error 1

The only sensible configuration at the moment is to have both mean
the same thing, so make hide the first one to avoid broken
configurations.

Fixes: e0d0d4d86c76 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
Reported-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/imx/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 3b393cb07295..47d9ec3abd2f 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -5,9 +5,7 @@ config MXC_CLK
 	depends on ARCH_MXC || COMPILE_TEST
 
 config MXC_CLK_SCU
-	tristate "IMX SCU clock"
-	depends on ARCH_MXC || COMPILE_TEST
-	depends on IMX_SCU && HAVE_ARM_SMCCC
+	tristate
 
 config CLK_IMX1
 	def_bool SOC_IMX1
-- 
2.27.0

