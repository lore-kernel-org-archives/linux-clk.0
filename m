Return-Path: <ramesh.shanmugasundaram@bp.renesas.com>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: geert+renesas@glider.be,
	laurent.pinchart@ideasonboard.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chris.paterson2@renesas.com,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 2/3] clk: shmobile: r8a7795: Add CANFD clock
Date: Thu, 25 Feb 2016 17:05:25 +0000
Message-Id: <1456419926-8732-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
In-Reply-To: <1456419926-8732-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1456419926-8732-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 drivers/clk/shmobile/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
index b2b9880..9961405 100644
--- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
+++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
@@ -112,6 +112,7 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
 
 	DEF_DIV6P1("mso",       R8A7795_CLK_MSO,   CLK_PLL1_DIV4, 0x014),
 	DEF_DIV6P1("hdmi",      R8A7795_CLK_HDMI,  CLK_PLL1_DIV2, 0x250),
+	DEF_DIV6P1("canfd",     R8A7795_CLK_CANFD, CLK_PLL1_DIV4, 0x244),
 };
 
 static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
-- 
1.9.1
