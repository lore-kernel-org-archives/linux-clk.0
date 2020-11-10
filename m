Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C9DC388F7
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 15:47:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A93420795
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 15:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730853AbgKJPrx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Nov 2020 10:47:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730299AbgKJPrx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Nov 2020 10:47:53 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C20C0613D1
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2020 07:47:53 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id qfnr2300Z4C55Sk06fnru7; Tue, 10 Nov 2020 16:47:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcVs7-001DPN-G8; Tue, 10 Nov 2020 16:47:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kcVs7-00DmhG-38; Tue, 10 Nov 2020 16:47:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] clk: qoriq: Add platform dependencies
Date:   Tue, 10 Nov 2020 16:47:50 +0100
Message-Id: <20201110154750.3285411-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Freescale QorIQ clock controller is only present on Freescale E500MC
and Layerscape SoCs.  Add platform dependencies to the CLK_QORIQ config
symbol, to avoid asking the user about it when configuring a kernel
without E500MC or Layerscape support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Li Yang <leoyang.li@nxp.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
v2:
  - Add Acked-by.
---
 drivers/clk/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 07a30a7b90b1eeb8..e902f2de027ca041 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -246,7 +246,8 @@ config COMMON_CLK_AXI_CLKGEN
 
 config CLK_QORIQ
 	bool "Clock driver for Freescale QorIQ platforms"
-	depends on (PPC_E500MC || ARM || ARM64 || COMPILE_TEST) && OF
+	depends on OF
+	depends on PPC_E500MC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
 	help
 	  This adds the clock driver support for Freescale QorIQ platforms
 	  using common clock framework.
-- 
2.25.1

