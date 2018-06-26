Return-Path: <dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com
Subject: [PATCH 2/2] clk: socfpga: stratix10: fix the sdmmc_free_clk mux
Date: Tue, 26 Jun 2018 08:28:10 -0500
Message-Id: <1530019690-32685-2-git-send-email-dinguyen@kernel.org>
In-Reply-To: <1530019690-32685-1-git-send-email-dinguyen@kernel.org>
References: <1530019690-32685-1-git-send-email-dinguyen@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

The first parent of the sdmmc_free_clk should be the main_sdmmc_clk.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-s10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index a15769f..5b238fc 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -28,7 +28,7 @@ static const char * const emaca_free_mux[] = {"peri_emaca_clk", "boot_clk"};
 static const char * const emacb_free_mux[] = {"peri_emacb_clk", "boot_clk"};
 static const char * const emac_ptp_free_mux[] = {"peri_emac_ptp_clk", "boot_clk"};
 static const char * const gpio_db_free_mux[] = {"peri_gpio_db_clk", "boot_clk"};
-static const char * const sdmmc_free_mux[] = {"peri_sdmmc_clk", "boot_clk"};
+static const char * const sdmmc_free_mux[] = {"main_sdmmc_clk", "boot_clk"};
 static const char * const s2f_usr1_free_mux[] = {"peri_s2f_usr1_clk", "boot_clk"};
 static const char * const psi_ref_free_mux[] = {"peri_psi_ref_clk", "boot_clk"};
 static const char * const mpu_mux[] = { "mpu_free_clk", "boot_clk",};
-- 
2.7.4
