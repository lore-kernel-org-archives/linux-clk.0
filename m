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
Subject: [PATCH 1/3] clk: shmobile: r8a7795: Add CAN peripheral clock
Date: Thu, 25 Feb 2016 17:05:24 +0000
Message-Id: <1456419926-8732-2-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
In-Reply-To: <1456419926-8732-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1456419926-8732-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 drivers/clk/shmobile/r8a7795-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
index 1f4b21a..b2b9880 100644
--- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
+++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
@@ -176,6 +176,8 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("gpio2",		 910,	R8A7795_CLK_CP),
 	DEF_MOD("gpio1",		 911,	R8A7795_CLK_CP),
 	DEF_MOD("gpio0",		 912,	R8A7795_CLK_CP),
+	DEF_MOD("can-if1",		 915,	R8A7795_CLK_S3D4),
+	DEF_MOD("can-if0",		 916,	R8A7795_CLK_S3D4),
 	DEF_MOD("i2c6",			 918,	R8A7795_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A7795_CLK_S3D2),
 	DEF_MOD("i2c4",			 927,	R8A7795_CLK_S3D2),
-- 
1.9.1
