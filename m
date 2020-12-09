Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052E9C4361B
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 19:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8102239D1
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 19:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388026AbgLITzB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Dec 2020 14:55:01 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:18917 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729685AbgLITzB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Dec 2020 14:55:01 -0500
X-Halon-ID: 531488a9-3a58-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 531488a9-3a58-11eb-a542-005056917a89;
        Wed, 09 Dec 2020 20:54:19 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/5] clk: renesas: r8a77995: Add TMU clocks
Date:   Wed,  9 Dec 2020 20:53:43 +0100
Message-Id: <20201209195343.803120-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds TMU{0,1,2,3,4} clocks.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 5b4691117b470556..9cfd00cf4e69aa45 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -111,6 +111,11 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a77995_mod_clks[] __initconst = {
+	DEF_MOD("tmu4",			 121,	R8A77995_CLK_S1D4C),
+	DEF_MOD("tmu3",			 122,	R8A77995_CLK_S3D2C),
+	DEF_MOD("tmu2",			 123,	R8A77995_CLK_S3D2C),
+	DEF_MOD("tmu1",			 124,	R8A77995_CLK_S3D2C),
+	DEF_MOD("tmu0",			 125,	R8A77995_CLK_CP),
 	DEF_MOD("scif5",		 202,	R8A77995_CLK_S3D4C),
 	DEF_MOD("scif4",		 203,	R8A77995_CLK_S3D4C),
 	DEF_MOD("scif3",		 204,	R8A77995_CLK_S3D4C),
-- 
2.29.2

