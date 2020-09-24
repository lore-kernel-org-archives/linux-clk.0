Return-Path: <SRS0=Q/QO=DB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815B2C4363D
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 11:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 445B42388A
	for <linux-clk@archiver.kernel.org>; Thu, 24 Sep 2020 11:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbgIXLSS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Sep 2020 07:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgIXLSP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Sep 2020 07:18:15 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F06C0613CE
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2020 04:18:14 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id XnJB2300m4C55Sk06nJBmW; Thu, 24 Sep 2020 13:18:12 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kLPGN-0006cT-SV; Thu, 24 Sep 2020 13:18:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kLPGN-00040R-QH; Thu, 24 Sep 2020 13:18:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_register() static
Date:   Thu, 24 Sep 2020 13:18:08 +0200
Message-Id: <20200924111808.15358-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When compiling with clang:

    drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:21: warning: no previous prototype for function 'rcar_r8a779a0_cpg_clk_register' [-Wmissing-prototypes]
    struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
			   ^
    drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
    ^
    static

Similarly, with sparse:

    drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:12: warning: symbol 'rcar_r8a779a0_cpg_clk_register' was not declared. Should it be static?

There are no users of rcar_r8a779a0_cpg_clk_register() outside this
file, so it should be static.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: c07439dea94050b6 ("clk: renesas: cpg-mssr: Add support for R-Car V3U")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
If you think this should be fast-tracked for v5.10, please take it
directly.  Else I will queue this in clk-renesas for v5.11.

Thanks!

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 17ebbac7ddfb4925..7e25b3b8945bd76b 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -153,7 +153,7 @@ static const struct rcar_r8a779a0_cpg_pll_config *cpg_pll_config __initdata;
 static unsigned int cpg_clk_extalr __initdata;
 static u32 cpg_mode __initdata;
 
-struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
+static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
 	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
 	struct clk **clks, void __iomem *base,
 	struct raw_notifier_head *notifiers)
-- 
2.17.1

