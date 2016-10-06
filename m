Return-Path: <>
Return-Path: <>
From: radek <radoslaw.pietrzyk@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
Subject: [PATCH] Reorganize STM32 clocks in order to prepare them for PLLI2S and PLLSAI
Date: Thu,  6 Oct 2016 22:01:34 +0000
Message-Id: <1475791294-5804-1-git-send-email-user@localhost>
List-ID: <linux-clk.vger.kernel.org>

From: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>

Signed-off-by: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
---
 drivers/clk/clk-stm32f4.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index 02d6810..1fd3eac 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -245,9 +245,10 @@ static void stm32f4_rcc_register_pll(const char *hse_clk, const char *hsi_clk)
 	const char   *pllsrc = pllcfgr & BIT(22) ? hse_clk : hsi_clk;
 	unsigned long pllq   = (pllcfgr >> 24) & 0xf;
 
-	clk_register_fixed_factor(NULL, "vco", pllsrc, 0, plln, pllm);
-	clk_register_fixed_factor(NULL, "pll", "vco", 0, 1, pllp);
-	clk_register_fixed_factor(NULL, "pll48", "vco", 0, 1, pllq);
+	clk_register_fixed_factor(NULL, "vco-div", pllsrc, 0, 1, pllm);
+	clk_register_fixed_factor(NULL, "vco-mul", "vco-div", 0, plln, 1);
+	clk_register_fixed_factor(NULL, "pll", "vco-mul", 0, 1, pllp);
+	clk_register_fixed_factor(NULL, "pll48", "vco-mul", 0, 1, pllq);
 }
 
 /*
-- 
1.9.1
