Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBF3C433DB
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 16:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B240C6522A
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 16:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhCIQ4K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Mar 2021 11:56:10 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:21850 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230492AbhCIQ4J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 11:56:09 -0500
X-Halon-ID: 4981f5a6-80f8-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 4981f5a6-80f8-11eb-a542-005056917a89;
        Tue, 09 Mar 2021 17:56:07 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3] clk: renesas: r8a779a0: Add TSC clock
Date:   Tue,  9 Mar 2021 17:55:38 +0100
Message-Id: <20210309165538.2682268-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement support for the TSC clock on V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Reuse R8A779A0_CLK_CL16MCK instead of introducing R8A779A0_CLK_CL16M.
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 33e44621a33a4e50..12607a79314322fe 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -237,6 +237,7 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("pfc1",		916,	R8A779A0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779A0_CLK_CP),
 	DEF_MOD("pfc3",		918,	R8A779A0_CLK_CP),
+	DEF_MOD("tsc",		919,	R8A779A0_CLK_CL16MCK),
 	DEF_MOD("vspx0",	1028,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vspx1",	1029,	R8A779A0_CLK_S1D1),
 	DEF_MOD("vspx2",	1030,	R8A779A0_CLK_S1D1),
-- 
2.30.1

