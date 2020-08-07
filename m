Return-Path: <SRS0=RyVB=BR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94826C433E0
	for <linux-clk@archiver.kernel.org>; Fri,  7 Aug 2020 09:43:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7800622C9F
	for <linux-clk@archiver.kernel.org>; Fri,  7 Aug 2020 09:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgHGJn6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Aug 2020 05:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgHGJn5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Aug 2020 05:43:57 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61458C061574
        for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2020 02:43:57 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id CZjt230014C55Sk01ZjtGB; Fri, 07 Aug 2020 11:43:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k3yum-0006Bb-V6; Fri, 07 Aug 2020 11:43:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k3yum-0000RZ-SR; Fri, 07 Aug 2020 11:43:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Restrict CLK_HSDK to ARC_SOC_HSDK
Date:   Fri,  7 Aug 2020 11:43:51 +0200
Message-Id: <20200807094351.1046-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The HSDK PLL driver is only useful when building for an ARC HSDK
platform.
As ARC selects OF, the dependency on OF can just be replaced by a
dependency on ARC_SOC_HSDK.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index da2904ab6e5ad475..2b3efcb8d5b7821f 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -49,7 +49,7 @@ source "drivers/clk/versatile/Kconfig"
 
 config CLK_HSDK
 	bool "PLL Driver for HSDK platform"
-	depends on OF || COMPILE_TEST
+	depends on ARC_SOC_HSDK || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This driver supports the HSDK core, system, ddr, tunnel and hdmi PLLs
-- 
2.17.1

