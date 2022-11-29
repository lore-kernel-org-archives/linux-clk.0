Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB59C4167B
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 16:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbiK2Q76 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Nov 2022 11:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbiK2Q7k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Nov 2022 11:59:40 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFE16D965
        for <linux-clk@vger.kernel.org>; Tue, 29 Nov 2022 08:55:09 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id qGv72800b4C55Sk06Gv73G; Tue, 29 Nov 2022 17:55:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p03st-0023Tg-E6; Tue, 29 Nov 2022 17:55:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p03ss-003MFf-C6; Tue, 29 Nov 2022 17:55:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen4: Restore PLL enum sort order
Date:   Tue, 29 Nov 2022 17:54:58 +0100
Message-Id: <dbd61ed19f79e9ae751fbb533d6c946e810e4359.1669740824.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When CLK_TYPE_GEN4_PLL4 was added to the rcar_gen4_clk_types enum, it
was inserted at a random location.  Restore sort order of the clock
types referring to PLLs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v6.3.

 drivers/clk/renesas/rcar-gen4-cpg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rcar-gen4-cpg.h
index 0b15dcfdca7b5af7..0a0e3bdb3a664c10 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.h
+++ b/drivers/clk/renesas/rcar-gen4-cpg.h
@@ -15,8 +15,8 @@ enum rcar_gen4_clk_types {
 	CLK_TYPE_GEN4_PLL2,
 	CLK_TYPE_GEN4_PLL2X_3X,	/* r8a779a0 only */
 	CLK_TYPE_GEN4_PLL3,
-	CLK_TYPE_GEN4_PLL5,
 	CLK_TYPE_GEN4_PLL4,
+	CLK_TYPE_GEN4_PLL5,
 	CLK_TYPE_GEN4_PLL6,
 	CLK_TYPE_GEN4_SDSRC,
 	CLK_TYPE_GEN4_SDH,
-- 
2.25.1

