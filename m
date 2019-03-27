Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B37DC4360F
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7267621734
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbfC0Mlo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:41:44 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:39764 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729338AbfC0Mlo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 08:41:44 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id t0hh1z00B3XaVaC060hh9L; Wed, 27 Mar 2019 13:41:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97sD-00012g-BP; Wed, 27 Mar 2019 13:41:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97sD-0002Iv-AW; Wed, 27 Mar 2019 13:41:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] clk: renesas: rcar-gen3: Correct parent clock of SYS-DMAC
Date:   Wed, 27 Mar 2019 13:41:38 +0100
Message-Id: <20190327124140.8800-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327124140.8800-1-geert+renesas@glider.be>
References: <20190327124140.8800-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The clock sources of the AXI BUS clock (266.66 MHz) used for SYS-DMAC
DMA transfers are:

    Channel      R-Car H3    R-Car M3-W    R-Car M3-N
    -------------------------------------------------
    SYS-DMAC0    S0D3        S0D3          S0D3
    SYS-DMAC1    S3D1        S3D1          S3D1
    SYS-DMAC2    S3D1        S3D1          S3D1

As a result, change the parent clocks of the SYS-DMAC{1,2} module clocks
on R-Car H3, R-Car M3-W, and R-Car M3-N to S3D1.

NOTE: This information will be reflected in a future revision of the
      R-Car Gen3 Hardware Manual.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Update RZ/G2M]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 4 ++--
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 4 ++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 4 ++--
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 676e6a1120900b17..13bf7260204f5078 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -123,8 +123,8 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 	DEF_MOD("msiof2",		 209,	R8A774A1_CLK_MSO),
 	DEF_MOD("msiof1",		 210,	R8A774A1_CLK_MSO),
 	DEF_MOD("msiof0",		 211,	R8A774A1_CLK_MSO),
-	DEF_MOD("sys-dmac2",		 217,	R8A774A1_CLK_S0D3),
-	DEF_MOD("sys-dmac1",		 218,	R8A774A1_CLK_S0D3),
+	DEF_MOD("sys-dmac2",		 217,	R8A774A1_CLK_S3D1),
+	DEF_MOD("sys-dmac1",		 218,	R8A774A1_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A774A1_CLK_S0D3),
 	DEF_MOD("cmt3",			 300,	R8A774A1_CLK_R),
 	DEF_MOD("cmt2",			 301,	R8A774A1_CLK_R),
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 5b658b0861180268..a576a42f104442ff 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -130,8 +130,8 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("msiof2",		 209,	R8A7795_CLK_MSO),
 	DEF_MOD("msiof1",		 210,	R8A7795_CLK_MSO),
 	DEF_MOD("msiof0",		 211,	R8A7795_CLK_MSO),
-	DEF_MOD("sys-dmac2",		 217,	R8A7795_CLK_S0D3),
-	DEF_MOD("sys-dmac1",		 218,	R8A7795_CLK_S0D3),
+	DEF_MOD("sys-dmac2",		 217,	R8A7795_CLK_S3D1),
+	DEF_MOD("sys-dmac1",		 218,	R8A7795_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A7795_CLK_S0D3),
 	DEF_MOD("sceg-pub",		 229,	R8A7795_CLK_CR),
 	DEF_MOD("cmt3",			 300,	R8A7795_CLK_R),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index fa1c1ac14d5caa1c..369092e8d893255f 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -127,8 +127,8 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("msiof2",		 209,	R8A7796_CLK_MSO),
 	DEF_MOD("msiof1",		 210,	R8A7796_CLK_MSO),
 	DEF_MOD("msiof0",		 211,	R8A7796_CLK_MSO),
-	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S0D3),
-	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S0D3),
+	DEF_MOD("sys-dmac2",		 217,	R8A7796_CLK_S3D1),
+	DEF_MOD("sys-dmac1",		 218,	R8A7796_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		 219,	R8A7796_CLK_S0D3),
 	DEF_MOD("cmt3",			 300,	R8A7796_CLK_R),
 	DEF_MOD("cmt2",			 301,	R8A7796_CLK_R),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 48a9add7d4db8975..623bbda2d24ec112 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -123,8 +123,8 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("msiof2",		209,	R8A77965_CLK_MSO),
 	DEF_MOD("msiof1",		210,	R8A77965_CLK_MSO),
 	DEF_MOD("msiof0",		211,	R8A77965_CLK_MSO),
-	DEF_MOD("sys-dmac2",		217,	R8A77965_CLK_S0D3),
-	DEF_MOD("sys-dmac1",		218,	R8A77965_CLK_S0D3),
+	DEF_MOD("sys-dmac2",		217,	R8A77965_CLK_S3D1),
+	DEF_MOD("sys-dmac1",		218,	R8A77965_CLK_S3D1),
 	DEF_MOD("sys-dmac0",		219,	R8A77965_CLK_S0D3),
 
 	DEF_MOD("cmt3",			300,	R8A77965_CLK_R),
-- 
2.17.1

