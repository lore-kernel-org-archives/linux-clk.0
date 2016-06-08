Return-Path: <aisheng.dong@nxp.com>
From: Dong Aisheng <aisheng.dong@nxp.com>
To: <linux-clk@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <sboyd@codeaurora.org>,
	<mturquette@baylibre.com>, <shawnguo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <aisheng.dong@nxp.com>,
	<anson.huang@nxp.com>
Subject: [PATCH 03/11] clk: imx7d: correct dram root clk parent select
Date: Wed, 8 Jun 2016 22:33:32 +0800
Message-ID: <1465396420-27064-3-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
References: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
Return-Path: aisheng.dong@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Anson Huang <b20788@freescale.com>

DRAM root clk should be either from pll dram main clk
or dram alt root clk.

Signed-off-by: Anson Huang <b20788@freescale.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-imx7d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 3be2e9371491..1cb866773fc0 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -65,7 +65,7 @@ static const char *dram_phym_sel[] = { "pll_dram_main_clk",
 	"dram_phym_alt_clk", };
 
 static const char *dram_sel[] = { "pll_dram_main_clk",
-	"dram_alt_clk", };
+	"dram_alt_root_clk", };
 
 static const char *dram_phym_alt_sel[] = { "osc", "pll_dram_533m_clk",
 	"pll_sys_main_clk", "pll_enet_500m_clk",
-- 
1.9.1
