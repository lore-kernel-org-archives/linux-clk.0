Return-Path: <SRS0=TP+b=D2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972EFC5517B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 12:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4202222276
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 12:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgJSMGV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Oct 2020 08:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgJSMGU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Oct 2020 08:06:20 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F86C0613DA
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2020 05:06:19 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id ho6G2300V4C55Sk01o6GBs; Mon, 19 Oct 2020 14:06:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0000WP-LV; Mon, 19 Oct 2020 14:06:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0005mD-Kj; Mon, 19 Oct 2020 14:06:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/6] clk: renesas: r8a779a0: Add PFC/GPIO clocks
Date:   Mon, 19 Oct 2020 14:06:11 +0200
Message-Id: <20201019120614.22149-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019120614.22149-1-geert+renesas@glider.be>
References: <20201019120614.22149-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the module clocks used by the Pin Function Controller (PFC) and
General Purpose Input/Output (GPIO) blocks, and their parent clock CP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested on actual hardware.

Note that the BSP uses MAIN instead of EXTAL, just like for the CBFUSA
clock.  However, according to Figure 8.1.1 ("Block Diagram of CPG (R-Car
V3U-AD)") in the R-Car V3U Series User's Manual Rev. 0.5, the parent of
the CP clock is EXTAL, which matches earlier R-Car Gen3 SoCs.
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 968be8206a480015..9d414ad9dd4469d2 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -130,6 +130,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED("icud2",	R8A779A0_CLK_ICUD2,	CLK_PLL5_DIV4,	4, 1),
 	DEF_FIXED("vcbus",	R8A779A0_CLK_VCBUS,	CLK_PLL5_DIV4,	1, 1),
 	DEF_FIXED("cbfusa",	R8A779A0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
+	DEF_FIXED("cp",		R8A779A0_CLK_CP,	CLK_EXTAL,	2, 1),
 
 	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
@@ -180,6 +181,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),
+	DEF_MOD("pfc0",		915,	R8A779A0_CLK_CP),
+	DEF_MOD("pfc1",		916,	R8A779A0_CLK_CP),
+	DEF_MOD("pfc2",		917,	R8A779A0_CLK_CP),
+	DEF_MOD("pfc3",		918,	R8A779A0_CLK_CP),
 };
 
 static spinlock_t cpg_lock;
-- 
2.17.1

