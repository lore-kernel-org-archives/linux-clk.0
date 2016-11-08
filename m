Return-Path: <b49017@lvd4224.freescale.com>
From: Abhimanyu Saini <abhimanyu.saini@nxp.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>, <scott.wood@nxp.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Abhimanyu Saini <abhimanyu.saini@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>
Subject: [PATCH] drivers: clk: qoriq: Add ls2088a key to clk OF match table
Date: Tue, 8 Nov 2016 14:25:15 +0530
Message-ID: <1478595315-441-1-git-send-email-abhimanyu.saini@nxp.com>
Return-Path: b49017@lvd4224.freescale.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Priyanka Jain <priyanka.jain@nxp.com>
Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
Signed-off-by: Abhimanyu Saini <abhimanyu.saini@nxp.com>
---
 drivers/clk/clk-qoriq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 20b1055..472e146 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -500,6 +500,17 @@ static void __init t4240_init_periph(struct clockgen *cg)
 		.flags = CG_VER3 | CG_LITTLE_ENDIAN,
 	},
 	{
+		.compat = "fsl,ls2088a-clockgen",
+		.cmux_groups = {
+			&clockgen2_cmux_cga12, &clockgen2_cmux_cgb
+		},
+		.cmux_to_group = {
+			0, 0, 1, 1, -1
+		},
+		.pll_mask = 0x37,
+		.flags = CG_VER3 | CG_LITTLE_ENDIAN,
+	},
+	{
 		.compat = "fsl,p2041-clockgen",
 		.guts_compat = "fsl,qoriq-device-config-1.0",
 		.init_periph = p2041_init_periph,
@@ -1273,6 +1284,7 @@ static void __init clockgen_init(struct device_node *np)
 CLK_OF_DECLARE(qoriq_clockgen_ls1021a, "fsl,ls1021a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls1043a, "fsl,ls1043a-clockgen", clockgen_init);
 CLK_OF_DECLARE(qoriq_clockgen_ls2080a, "fsl,ls2080a-clockgen", clockgen_init);
+CLK_OF_DECLARE(qoriq_clockgen_ls2088a, "fsl,ls2088a-clockgen", clockgen_init);
 
 /* Legacy nodes */
 CLK_OF_DECLARE(qoriq_sysclk_1, "fsl,qoriq-sysclk-1.0", sysclk_init);
-- 
1.9.1
