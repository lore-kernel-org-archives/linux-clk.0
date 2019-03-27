Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4D6C10F06
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:41:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05FCE20449
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbfC0Mlq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:41:46 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:45486 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729362AbfC0Mlp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 08:41:45 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id t0hh1z00L3XaVaC010hh28; Wed, 27 Mar 2019 13:41:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97sD-00012l-D0; Wed, 27 Mar 2019 13:41:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97sD-0002J1-C2; Wed, 27 Mar 2019 13:41:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] clk: renesas: rcar-gen3: Rename DRIF clocks
Date:   Wed, 27 Mar 2019 13:41:40 +0100
Message-Id: <20190327124140.8800-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327124140.8800-1-geert+renesas@glider.be>
References: <20190327124140.8800-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev. 1.50 of Feb
12, 2019, the DRIF clocks have been renamed as follows:

    DRIF0 to DRIF00
    DRIF1 to DRIF01
    DRIF2 to DRIF10
    DRIF3 to DRIF11
    DRIF4 to DRIF20
    DRIF5 to DRIF21
    DRIF6 to DRIF30
    DRIF7 to DRIF31

Therefore, this patch renames the DRIF clock names from DRIFn to DRIFmm.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 18 +++++++++---------
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 16 ++++++++--------
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 17 +++++++++--------
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 18 +++++++++---------
 4 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index e5fa9f6c1ec4b9cb..9e9a6f2c31e808eb 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -3,7 +3,7 @@
  * r8a7795 Clock Pulse Generator / Module Standby and Software Reset
  *
  * Copyright (C) 2015 Glider bvba
- * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018-2019 Renesas Electronics Corp.
  *
  * Based on clk-rcar-gen3.c
  *
@@ -156,14 +156,14 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S0D3),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S1D2),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S1D2),
-	DEF_MOD("drif7",		 508,	R8A7795_CLK_S3D2),
-	DEF_MOD("drif6",		 509,	R8A7795_CLK_S3D2),
-	DEF_MOD("drif5",		 510,	R8A7795_CLK_S3D2),
-	DEF_MOD("drif4",		 511,	R8A7795_CLK_S3D2),
-	DEF_MOD("drif3",		 512,	R8A7795_CLK_S3D2),
-	DEF_MOD("drif2",		 513,	R8A7795_CLK_S3D2),
-	DEF_MOD("drif1",		 514,	R8A7795_CLK_S3D2),
-	DEF_MOD("drif0",		 515,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif31",		 508,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif30",		 509,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif21",		 510,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif20",		 511,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif11",		 512,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif10",		 513,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif01",		 514,	R8A7795_CLK_S3D2),
+	DEF_MOD("drif00",		 515,	R8A7795_CLK_S3D2),
 	DEF_MOD("hscif4",		 516,	R8A7795_CLK_S3D1),
 	DEF_MOD("hscif3",		 517,	R8A7795_CLK_S3D1),
 	DEF_MOD("hscif2",		 518,	R8A7795_CLK_S3D1),
diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 73c69152c77b02ed..d8e9af5d9ae9cf6e 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -149,14 +149,14 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("intc-ap",		 408,	R8A7796_CLK_S0D3),
 	DEF_MOD("audmac1",		 501,	R8A7796_CLK_S1D2),
 	DEF_MOD("audmac0",		 502,	R8A7796_CLK_S1D2),
-	DEF_MOD("drif7",		 508,	R8A7796_CLK_S3D2),
-	DEF_MOD("drif6",		 509,	R8A7796_CLK_S3D2),
-	DEF_MOD("drif5",		 510,	R8A7796_CLK_S3D2),
-	DEF_MOD("drif4",		 511,	R8A7796_CLK_S3D2),
-	DEF_MOD("drif3",		 512,	R8A7796_CLK_S3D2),
-	DEF_MOD("drif2",		 513,	R8A7796_CLK_S3D2),
-	DEF_MOD("drif1",		 514,	R8A7796_CLK_S3D2),
-	DEF_MOD("drif0",		 515,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif31",		 508,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif30",		 509,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif21",		 510,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif20",		 511,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif11",		 512,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif10",		 513,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif01",		 514,	R8A7796_CLK_S3D2),
+	DEF_MOD("drif00",		 515,	R8A7796_CLK_S3D2),
 	DEF_MOD("hscif4",		 516,	R8A7796_CLK_S3D1),
 	DEF_MOD("hscif3",		 517,	R8A7796_CLK_S3D1),
 	DEF_MOD("hscif2",		 518,	R8A7796_CLK_S3D1),
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index a0ce2ecb656d3d48..8f87e314d9490498 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -3,6 +3,7 @@
  * r8a77965 Clock Pulse Generator / Module Standby and Software Reset
  *
  * Copyright (C) 2018 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ * Copyright (C) 2019 Renesas Electronics Corp.
  *
  * Based on r8a7795-cpg-mssr.c
  *
@@ -148,14 +149,14 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 
 	DEF_MOD("audmac1",		501,	R8A77965_CLK_S1D2),
 	DEF_MOD("audmac0",		502,	R8A77965_CLK_S1D2),
-	DEF_MOD("drif7",		508,	R8A77965_CLK_S3D2),
-	DEF_MOD("drif6",		509,	R8A77965_CLK_S3D2),
-	DEF_MOD("drif5",		510,	R8A77965_CLK_S3D2),
-	DEF_MOD("drif4",		511,	R8A77965_CLK_S3D2),
-	DEF_MOD("drif3",		512,	R8A77965_CLK_S3D2),
-	DEF_MOD("drif2",		513,	R8A77965_CLK_S3D2),
-	DEF_MOD("drif1",		514,	R8A77965_CLK_S3D2),
-	DEF_MOD("drif0",		515,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif31",		508,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif30",		509,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif21",		510,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif20",		511,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif11",		512,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif10",		513,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif01",		514,	R8A77965_CLK_S3D2),
+	DEF_MOD("drif00",		515,	R8A77965_CLK_S3D2),
 	DEF_MOD("hscif4",		516,	R8A77965_CLK_S3D1),
 	DEF_MOD("hscif3",		517,	R8A77965_CLK_S3D1),
 	DEF_MOD("hscif2",		518,	R8A77965_CLK_S3D1),
diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 53973201a9f576ad..9570404baa583a8f 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -2,7 +2,7 @@
 /*
  * r8a77990 Clock Pulse Generator / Module Standby and Software Reset
  *
- * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018-2019 Renesas Electronics Corp.
  *
  * Based on r8a7795-cpg-mssr.c
  *
@@ -154,14 +154,14 @@ static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
 	DEF_MOD("intc-ap",		 408,	R8A77990_CLK_S0D3),
 
 	DEF_MOD("audmac0",		 502,	R8A77990_CLK_S1D2),
-	DEF_MOD("drif7",		 508,	R8A77990_CLK_S3D2),
-	DEF_MOD("drif6",		 509,	R8A77990_CLK_S3D2),
-	DEF_MOD("drif5",		 510,	R8A77990_CLK_S3D2),
-	DEF_MOD("drif4",		 511,	R8A77990_CLK_S3D2),
-	DEF_MOD("drif3",		 512,	R8A77990_CLK_S3D2),
-	DEF_MOD("drif2",		 513,	R8A77990_CLK_S3D2),
-	DEF_MOD("drif1",		 514,	R8A77990_CLK_S3D2),
-	DEF_MOD("drif0",		 515,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif31",		 508,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif30",		 509,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif21",		 510,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif20",		 511,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif11",		 512,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif10",		 513,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif01",		 514,	R8A77990_CLK_S3D2),
+	DEF_MOD("drif00",		 515,	R8A77990_CLK_S3D2),
 	DEF_MOD("hscif4",		 516,	R8A77990_CLK_S3D1C),
 	DEF_MOD("hscif3",		 517,	R8A77990_CLK_S3D1C),
 	DEF_MOD("hscif2",		 518,	R8A77990_CLK_S3D1C),
-- 
2.17.1

