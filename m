Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C90ECAAD8
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 05:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbiIVFOJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 01:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbiIVFOG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 01:14:06 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B1779CCC3;
        Wed, 21 Sep 2022 22:14:05 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,335,1654527600"; 
   d="scan'208";a="135787710"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2022 14:14:04 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 21A1E400CF15;
        Thu, 22 Sep 2022 14:14:04 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3] clk: renesas: r8a779f0: Add Ethernet Switch clocks
Date:   Thu, 22 Sep 2022 14:13:58 +0900
Message-Id: <20220922051358.3442191-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes from v2:
 https://lore.kernel.org/all/20220921084745.3355107-2-yoshihiro.shimoda.uh@renesas.com/
 - Separate patcheas into each subsystem.
   (No change actual code from v2.)

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index 4baf355e26d8..304435613723 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -161,6 +161,8 @@ static const struct mssr_mod_clk r8a779f0_mod_clks[] __initconst = {
 	DEF_MOD("cmt3",		913,	R8A779F0_CLK_R),
 	DEF_MOD("pfc0",		915,	R8A779F0_CLK_CL16M),
 	DEF_MOD("tsc",		919,	R8A779F0_CLK_CL16M),
+	DEF_MOD("tsn",		1505,	R8A779F0_CLK_S0D2_HSC),
+	DEF_MOD("rsw",		1506,	R8A779F0_CLK_RSW2),
 	DEF_MOD("ufs",		1514,	R8A779F0_CLK_S0D4_HSC),
 };
 
-- 
2.25.1

