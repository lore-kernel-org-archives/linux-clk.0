Return-Path: <SRS0=UhmE=4G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC17EC34037
	for <linux-clk@archiver.kernel.org>; Tue, 18 Feb 2020 11:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDE5F2176D
	for <linux-clk@archiver.kernel.org>; Tue, 18 Feb 2020 11:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgBRLZ2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Feb 2020 06:25:28 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:42654 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgBRLZ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Feb 2020 06:25:28 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 4BRS2200G5USYZQ06BRS3E; Tue, 18 Feb 2020 12:25:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j410I-00043Y-73; Tue, 18 Feb 2020 12:25:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j410I-0001Wp-5P; Tue, 18 Feb 2020 12:25:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Remove use of ARCH_R8A7796
Date:   Tue, 18 Feb 2020 12:25:25 +0100
Message-Id: <20200218112525.5834-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas for v5.7.
---
 drivers/clk/renesas/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 250d8165167aa013..879d96ead06b62ff 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -20,7 +20,7 @@ config CLK_RENESAS
 	select CLK_R8A7791 if ARCH_R8A7791 || ARCH_R8A7793
 	select CLK_R8A7792 if ARCH_R8A7792
 	select CLK_R8A7794 if ARCH_R8A7794
-	select CLK_R8A7795 if ARCH_R8A77950 || ARCH_R8A77951 || ARCH_R8A7795
+	select CLK_R8A7795 if ARCH_R8A77950 || ARCH_R8A77951
 	select CLK_R8A77960 if ARCH_R8A77960
 	select CLK_R8A77961 if ARCH_R8A77961
 	select CLK_R8A77965 if ARCH_R8A77965
-- 
2.17.1

