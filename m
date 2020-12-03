Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7900BC433FE
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 22:27:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BB3422285
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 22:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgLCW1x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 17:27:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:53580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726405AbgLCW1w (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Dec 2020 17:27:52 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jian Hu <jian.hu@amlogic.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: g12a: select COMMON_CLK_MESON_VID_PLL_DIV
Date:   Thu,  3 Dec 2020 23:26:58 +0100
Message-Id: <20201203222706.992440-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Without this, a g12a-only config produces a link error:

aarch64-linux-ld: drivers/clk/meson/g12a.o:(.data+0xcb68): undefined reference to `meson_vid_pll_div_ro_ops'

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 034da203e8e0..9a8a548d839d 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -110,6 +110,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_AO_CLKC
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
+	select COMMON_CLK_MESON_VID_PLL_DIV
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
-- 
2.27.0

