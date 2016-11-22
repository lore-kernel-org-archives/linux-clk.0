Return-Path: <chris.paterson2@renesas.com>
From: Chris Paterson <chris.paterson2@renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	ramesh.shanmugasundaram@bp.renesas.com,
	Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 1/3] clk: renesas: r8a7796: Add CAN peripheral clock
Date: Tue, 22 Nov 2016 13:46:00 +0000
Message-Id: <1479822362-4749-2-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
References: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 7d298c5..99b19ce 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -181,6 +181,8 @@ enum clk_ids {
 	DEF_MOD("gpio2",		 910,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio1",		 911,	R8A7796_CLK_S3D4),
 	DEF_MOD("gpio0",		 912,	R8A7796_CLK_S3D4),
+	DEF_MOD("can-if1",		 915,	R8A7796_CLK_S3D4),
+	DEF_MOD("can-if0",		 916,	R8A7796_CLK_S3D4),
 	DEF_MOD("i2c6",			 918,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A7796_CLK_S0D6),
 	DEF_MOD("i2c4",			 927,	R8A7796_CLK_S0D6),
-- 
1.9.1
