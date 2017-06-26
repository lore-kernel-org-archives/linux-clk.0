Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56779 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750860AbdFZR0y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2017 13:26:54 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Subject: [PATCH] clk: renesas: r8a7796: Add PWM clock
Date: Mon, 26 Jun 2017 20:26:52 +0300
Message-Id: <20170626172652.28018-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 1d8c5c2b6174..30583cdc1350 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -152,6 +152,7 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("hscif1",		 519,	R8A7796_CLK_S3D1),
 	DEF_MOD("hscif0",		 520,	R8A7796_CLK_S3D1),
 	DEF_MOD("thermal",		 522,	R8A7796_CLK_CP),
+	DEF_MOD("pwm",			 523,	R8A7796_CLK_S0D12),
 	DEF_MOD("fcpvd2",		 601,	R8A7796_CLK_S0D2),
 	DEF_MOD("fcpvd1",		 602,	R8A7796_CLK_S0D2),
 	DEF_MOD("fcpvd0",		 603,	R8A7796_CLK_S0D2),
-- 
Regards,

Laurent Pinchart

