Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp-3.sys.kth.se ([130.237.48.192]:37755 "EHLO
        smtp-3.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754367AbcKAUPO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Nov 2016 16:15:14 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] clk: renesas: r8a7796: Add VIN clocks
Date: Tue,  1 Nov 2016 21:12:25 +0100
Message-Id: <20161101201225.14810-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20161101201225.14810-1-niklas.soderlund+renesas@ragnatech.se>
References: <20161101201225.14810-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index ade75e7..bfef976 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -125,6 +125,14 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("thermal",		 522,	R8A7796_CLK_CP),
 	DEF_MOD("csi20",		 714,	R8A7796_CLK_CSI0),
 	DEF_MOD("csi40",		 716,	R8A7796_CLK_CSI0),
+	DEF_MOD("vin7",			 804,	R8A7796_CLK_S0D2),
+	DEF_MOD("vin6",			 805,	R8A7796_CLK_S0D2),
+	DEF_MOD("vin5",			 806,	R8A7796_CLK_S0D2),
+	DEF_MOD("vin4",			 807,	R8A7796_CLK_S0D2),
+	DEF_MOD("vin3",			 808,	R8A7796_CLK_S0D2),
+	DEF_MOD("vin2",			 809,	R8A7796_CLK_S0D2),
+	DEF_MOD("vin1",			 810,	R8A7796_CLK_S0D2),
+	DEF_MOD("vin0",			 811,	R8A7796_CLK_S0D2),
 	DEF_MOD("etheravb",		 812,	R8A7796_CLK_S0D6),
 	DEF_MOD("gpio7",		 905,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio6",		 906,	R8A7796_CLK_S3D4),
-- 
2.10.2

