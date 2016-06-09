Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH] clk: renesas: r8a7795: Provide FDP1 clocks
Date: Thu,  9 Jun 2016 17:12:26 +0100
Message-Id: <1465488747-26892-2-git-send-email-kieran@bingham.xyz>
In-Reply-To: <1465488747-26892-1-git-send-email-kieran@bingham.xyz>
References: <1465488747-26892-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-clk.vger.kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ca5519c583d4..f2b887502066 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -129,6 +129,9 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
+	DEF_MOD("fdp1-2",		 117,	R8A7795_CLK_S2D1),
+	DEF_MOD("fdp1-1",		 118,	R8A7795_CLK_S2D1),
+	DEF_MOD("fdp1-0",		 119,	R8A7795_CLK_S2D1),
 	DEF_MOD("scif5",		 202,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif3",		 204,	R8A7795_CLK_S3D4),
-- 
2.7.4
