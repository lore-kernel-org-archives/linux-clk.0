Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:58756 "EHLO
	smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754432AbcDYLsK (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2016 07:48:10 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: linux-clk@vger.kernel.org, geert+renesas@glider.be,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] clk: shmobile: r8a7795: Add VIN clocks
Date: Mon, 25 Apr 2016 13:39:20 +0200
Message-Id: <1461584360-32547-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <1461584360-32547-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1461584360-32547-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 005b323..9382df3 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -188,6 +188,14 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("lvds",			 727,	R8A7795_CLK_S2D1),
 	DEF_MOD("hdmi1",		 728,	R8A7795_CLK_HDMI),
 	DEF_MOD("hdmi0",		 729,	R8A7795_CLK_HDMI),
+	DEF_MOD("vin7",			 804,	R8A7795_CLK_S2D1),
+	DEF_MOD("vin6",			 805,	R8A7795_CLK_S2D1),
+	DEF_MOD("vin5",			 806,	R8A7795_CLK_S2D1),
+	DEF_MOD("vin4",			 807,	R8A7795_CLK_S2D1),
+	DEF_MOD("vin3",			 808,	R8A7795_CLK_S2D1),
+	DEF_MOD("vin2",			 809,	R8A7795_CLK_S2D1),
+	DEF_MOD("vin1",			 810,	R8A7795_CLK_S2D1),
+	DEF_MOD("vin0",			 811,	R8A7795_CLK_S2D1),
 	DEF_MOD("etheravb",		 812,	R8A7795_CLK_S3D2),
 	DEF_MOD("sata0",		 815,	R8A7795_CLK_S3D2),
 	DEF_MOD("gpio7",		 905,	R8A7795_CLK_CP),
-- 
2.7.4

