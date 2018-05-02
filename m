Return-Path: <dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-clk@vger.kernel.org
Cc: dinguyen@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: socfpga: stratix10: suppress unbinding platform's clock driver
Date: Wed,  2 May 2018 09:28:33 -0500
Message-Id: <1525271313-24427-2-git-send-email-dinguyen@kernel.org>
In-Reply-To: <1525271313-24427-1-git-send-email-dinguyen@kernel.org>
References: <1525271313-24427-1-git-send-email-dinguyen@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

The Stratix10 clock driver is essential to system operation, so their
removal should never happen.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-s10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index c788997..3c953ca 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -329,6 +329,7 @@ static struct platform_driver stratix10_clkmgr_driver = {
 	.probe		= s10_clkmgr_probe,
 	.driver		= {
 		.name	= "stratix10-clkmgr",
+		.suppress_bind_attrs = true,
 		.of_match_table = stratix10_clkmgr_match_table,
 	},
 };
-- 
2.7.4
