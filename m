Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2EAC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jun 2022 14:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385502AbiFMOzC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jun 2022 10:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386674AbiFMOyI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Jun 2022 10:54:08 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF65A2F66C;
        Mon, 13 Jun 2022 04:56:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,297,1647270000"; 
   d="scan'208";a="124235756"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jun 2022 20:56:35 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 13C8D4220BC9;
        Mon, 13 Jun 2022 20:56:35 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: renesas: r8a779f0: Add PCIe clocks
Date:   Mon, 13 Jun 2022 20:56:27 +0900
Message-Id: <20220613115627.2831257-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the module clocks used by the PCIe controllers on the Renesas
R-Car S4-8 (R8A779F0) SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index c17ebe6b5992..6bd2324ce073 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -124,6 +124,8 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("i2c3",		521,	R8A779F0_CLK_S0D6_PER),
 	DEF_MOD("i2c4",		522,	R8A779F0_CLK_S0D6_PER),
 	DEF_MOD("i2c5",		523,	R8A779F0_CLK_S0D6_PER),
+	DEF_MOD("pcie0",	624,	R8A779F0_CLK_S0D2),
+	DEF_MOD("pcie1",	625,	R8A779F0_CLK_S0D2),
 	DEF_MOD("scif0",	702,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif1",	703,	R8A779F0_CLK_S0D12_PER),
 	DEF_MOD("scif3",	704,	R8A779F0_CLK_S0D12_PER),
-- 
2.25.1

