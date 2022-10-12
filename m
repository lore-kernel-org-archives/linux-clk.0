Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67114C43217
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 07:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiJLHCo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Oct 2022 03:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiJLHCn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 03:02:43 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A7567CA2
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 00:02:39 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3da6:62e6:8ab0:ff90])
        by xavier.telenet-ops.be with bizsmtp
        id Wv2c2800M32x5mf01v2cex; Wed, 12 Oct 2022 09:02:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVlE-001Lph-BT; Wed, 12 Oct 2022 09:02:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oiVlD-006BjK-QQ; Wed, 12 Oct 2022 09:02:35 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] clk: renesas: r8a779f0: Fix SD0H clock name
Date:   Wed, 12 Oct 2022 09:02:33 +0200
Message-Id: <1f682d338f133608f138ae87323707436ad8c748.1665558014.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665558014.git.geert+renesas@glider.be>
References: <cover.1665558014.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Correct the misspelled textual name of the SD0H clock.

Fixes: 9b5dd1ff705c6854 ("clk: renesas: r8a779f0: Add SDH0 clock")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 304435613723c0a3..8e7b9180ec67bbf6 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -113,7 +113,7 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_FIXED("sasyncperd2", R8A779F0_CLK_SASYNCPERD2, R8A779F0_CLK_SASYNCPERD1, 2, 1),
 	DEF_FIXED("sasyncperd4", R8A779F0_CLK_SASYNCPERD4, R8A779F0_CLK_SASYNCPERD1, 4, 1),
 
-	DEF_GEN4_SDH("sdh0",	R8A779F0_CLK_SD0H,	CLK_SDSRC,	   0x870),
+	DEF_GEN4_SDH("sd0h",	R8A779F0_CLK_SD0H,	CLK_SDSRC,	   0x870),
 	DEF_GEN4_SD("sd0",	R8A779F0_CLK_SD0,	R8A779F0_CLK_SD0H, 0x870),
 
 	DEF_BASE("rpc",		R8A779F0_CLK_RPC,	CLK_TYPE_GEN4_RPC, CLK_RPCSRC),
-- 
2.25.1

