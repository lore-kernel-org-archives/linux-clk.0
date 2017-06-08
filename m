Return-Path: <dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org,
	sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2] clk: socfpga: Fix the smplsel on Arria10 and Stratix10
Date: Thu,  8 Jun 2017 09:18:39 -0500
Message-Id: <1496931519-9685-1-git-send-email-dinguyen@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

The smplsel bits for the SDMMC clock on Arria10 and Stratix10 platforms are
offset by 1 additional bit.

Add a new macro SYSMGR_SDMMC_CTRL_SET_AS10 for usage on the Arria10 and
Stratix10 platforms.

Fixes: 5611a5ba8e54 ("clk: socfpga: update clk.h so for Arria10 platform to use")
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: Add a Fixes tag
---
 drivers/clk/socfpga/clk-gate-a10.c | 2 +-
 drivers/clk/socfpga/clk.h          | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index c2d5727..36376c5 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -86,7 +86,7 @@ static int socfpga_clk_prepare(struct clk_hw *hwclk)
 			}
 		}
 
-		hs_timing = SYSMGR_SDMMC_CTRL_SET(clk_phase[0], clk_phase[1]);
+		hs_timing = SYSMGR_SDMMC_CTRL_SET_AS10(clk_phase[0], clk_phase[1]);
 		if (!IS_ERR(socfpgaclk->sys_mgr_base_addr))
 			regmap_write(socfpgaclk->sys_mgr_base_addr,
 				     SYSMGR_SDMMCGRP_CTRL_OFFSET, hs_timing);
diff --git a/drivers/clk/socfpga/clk.h b/drivers/clk/socfpga/clk.h
index 814c724..9cf1230 100644
--- a/drivers/clk/socfpga/clk.h
+++ b/drivers/clk/socfpga/clk.h
@@ -32,6 +32,9 @@
 #define SYSMGR_SDMMC_CTRL_SET(smplsel, drvsel) \
 	((((smplsel) & 0x7) << 3) | (((drvsel) & 0x7) << 0))
 
+#define SYSMGR_SDMMC_CTRL_SET_AS10(smplsel, drvsel) \
+	((((smplsel) & 0x7) << 4) | (((drvsel) & 0x7) << 0))
+
 extern void __iomem *clk_mgr_base_addr;
 extern void __iomem *clk_mgr_a10_base_addr;
 
-- 
2.7.4
