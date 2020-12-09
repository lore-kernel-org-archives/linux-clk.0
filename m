Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589EDC4167B
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 19:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A50A23A1D
	for <linux-clk@archiver.kernel.org>; Wed,  9 Dec 2020 19:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgLITyz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Dec 2020 14:54:55 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:25994 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbgLITyz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Dec 2020 14:54:55 -0500
X-Halon-ID: 4fbaad70-3a58-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 4fbaad70-3a58-11eb-a542-005056917a89;
        Wed, 09 Dec 2020 20:54:14 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/5] clk: renesas: r8a7795: Add TMU clocks
Date:   Wed,  9 Dec 2020 20:53:39 +0100
Message-Id: <20201209195343.803120-2-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 068018ae3c6e2254..a2102106fad2d01a 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -128,6 +128,11 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("fdp1-2",		 117,	R8A7795_CLK_S2D1), /* ES1.x */
 	DEF_MOD("fdp1-1",		 118,	R8A7795_CLK_S0D1),
 	DEF_MOD("fdp1-0",		 119,	R8A7795_CLK_S0D1),
+	DEF_MOD("tmu4",			 121,	R8A7795_CLK_S0D6),
+	DEF_MOD("tmu3",			 122,	R8A7795_CLK_S3D2),
+	DEF_MOD("tmu2",			 123,	R8A7795_CLK_S3D2),
+	DEF_MOD("tmu1",			 124,	R8A7795_CLK_S3D2),
+	DEF_MOD("tmu0",			 125,	R8A7795_CLK_CP),
 	DEF_MOD("scif5",		 202,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif3",		 204,	R8A7795_CLK_S3D4),
-- 
2.29.2

